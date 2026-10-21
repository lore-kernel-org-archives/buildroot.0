Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8219606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gr35RkPQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96D02614AD;
	Wed, 21 Oct 2026 19:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id osaDpP8wEG0p; Wed, 21 Oct 2026 19:28:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD5F461045
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610929;
	b=isBJDiL+P0NH+4/nyHw0cXhpEMeT/x6p1m7mdGNt/UfrM4R4CpfGRfUCuj6T7ohB54b7
	 U9zfhpTy6QSZ2OcAvPH/5PiO8AQKGgq2ssx9n6SAQVhkGVcATDSoDgdKFlJHrMCEeeP6E
	 +5A56Gd1dfxsXUUqNfjgLjz5a6INkQLFuQcJNKS8xNdm/Ms5kQ4ZnCd5lGHEtdohpINOs
	 pjWgsBM1yEiId6SlcNio4y/ORiZIFlAwaXzaVCchbkbkXvNBZdxwiKGDv6RuaOECi+oxd
	 CTm83lHd5y8DDH5PORDsenm6f+fTD14VNZaluDaSgOHKeBrZC1Tut6/XZDVCnr4B/vQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610929;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=aQV/WFw6ArLbKcRzlAsRcfoElNP9GrddlJp06QUFi1E=;
	b=fVfIx3iz6fLmLoEuA7phmRGOBrfXBcud7hq9sMqRFBdaUsqolmaVgvRX9cQXBpOd77Km
	 yOdNjycyLY7S3cqD1QRJk05vyqimhEH90KupN8iG/zOM9Xw85oeInEcuBjXw4nH4zpO30
	 OM9usfkcUDMTJvMlQD2P72lGqV9knXPRnHgXtvzNviUUJKVhEKXK+E58PKh9HIqlUmCXb
	 jJX2ar5m13vpGw211wh/RA7u/6ab4gNSDjIDT6jl568ZW98BoyicYOkk08piVdN3KbqdF
	 TIqg1+2Fp4LFiS+GYSR8IvzMcupaSWo+3lEdVbxpdaJFnYiAxO16DrC+MKaE1ACA2Qg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610929;
	bh=aQV/WFw6ArLbKcRzlAsRcfoElNP9GrddlJp06QUFi1E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gr35RkPQSWrudKtmx6vOAOf121YzxP89aFvlJd5zR9iZA6ZBoADXsz4kNBTWb1gjN
	 FYsC5In4FerM41WuL3q4EtJcOXu7BN9BEAxZLbV+qsSHtLSgLQ/BZ92IPSHowSBgWJ
	 Ox9cFCJsJSOEpB7lHJxuNnAOYYJ9I7cRH7dmDLphOkVy5nqBAh4oF+3ADPbtK8mv7I
	 59j4ttRY5wSo8A2ztahgTpu3UHoIgV85eASTJsoRzkBgVDCTYhVbXV1IrkVWlV9HCD
	 4Xk6hzapBGm2mB+MDcofpy4MRZ2zCTQdrkVpOtgdkUsnLTt+TWTXUKDyx9HSjAoROs
	 LvZIF4OBK7Law==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD5F461045;
	Wed, 21 Oct 2026 19:28:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F6063C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71497403C3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBgrw2ki8_h9 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:28:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4CA2840087
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610927;
 b=Ajq+87M2A2Iv5fxRV6Yoi+Y4Bdyp0tKjM7uYqJrg+vRmKz9mkBzfkvPHknKu4C5bk9F/
 6omdlXket08uhokNCxitQTn2FRY7oJlHUHO2OjraYOEBwB9qyeUXB+60HXrX7If8SoUrk
 Mj5UI//5agY3lu48jW8tGGY4Sx4C/69BOkKcimhH12twOImg1SNJYbIU/KC0I12l++tmc
 ZW/vfgF4hLoNWPaD3dM2eYk04Jcj7cbjpsZ/HcdxuELheRhJSJ86SzezYg3ZYF+tMq159
 FtrJkqlfJruUItwduc25AaxsHxCt7Ei5ldqhRWIoFpcG7M+ZCspJr5uffhitOe56NeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610927;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=86z39KkFIZAvfYtTnkY9y/1QwK79vdft9sUpAOocuO0=;
 b=Zd+8CA3v1TzHMNmGjOFF0B9ByRcm5Uq5YkkTxinL+5wN6ALqxcXZT1z7s2VWXivesjxr
 UZznpju4xlzLzH6mjAlbN9FUwWjmGW8arbhVvfBMmZBX+0YbPUZerjzskCogMlEWpChHB
 76Ux4xFqewuuUBKWq0Sw/RfdqsM39+5OuJfRCUgnzP3Z+1aza8pgw1zr14OngHebJReoO
 /q5LvlNyw8yLAmJRZRXgz25MwY4VOwclsYxO32iaCOqU6U30mZqM4+Y+U1UUeRraUArBQ
 ByTIsKeXbe0ole0IGldEvPZ9ZV09GQFC1IHKfC0JmwkkaB0oQd7h//NKv/y0XZw0f2w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Bp+NnfMz; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CA2840087
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:28:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 66B0978071B;
 Wed, 21 Oct 2026 21:28:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 21 Oct 2026 21:28:43 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 21:28:43 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
In-Reply-To: <atkIH64LJ8KOg8sZ@windsurf>
References: <20261021184139.1135207-1-bernd@kuhls.net>
 <20261021184139.1135207-2-bernd@kuhls.net> <atkIH64LJ8KOg8sZ@windsurf>
User-Agent: Webmail Free/1.6.20
Message-ID: <eb71be4a052714bf1ef447349b3b7dc7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 2/3] package/xxhash: fix prefix in
 libxxhash.pc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,

On 21/10/2026 20:46, Thomas Petazzoni via buildroot wrote:
> Hello Bernd,
> 
> Wow, the timing is crazy, I sent the same patch at:
> 
> Date: Wed, 21 Oct 2026 20:35:32 +0200
> 
> Just a few minutes before you did!
> 
> On Wed, Oct 21, 2026 at 08:41:38PM +0200, Bernd Kuhls wrote:
>> PREFIX defaults to /usr/local according to
>> https://github.com/Cyan4973/xxHash/blob/v0.8.3/Makefile#L549
>> 
>> libxxhash.pc contains "prefix=/usr/local" without this patch causing a
>> build error with libplacebo when xxhash was built before libplacebo:
>> 
>> Run-time dependency libxxhash found: YES 0.8.3
>> Configuring config.h using configuration
>> Configuring config_internal.h using configuration
>> 
>> ../output-1/build/libplacebo-v7.360.1/src/meson.build:247:6: ERROR:
>>  Include dir
>>  
>> /home/thomas/autobuild/instance-0/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/local/include
>>  does not exist.
>> 
>> Fixes:
>> https://autobuild.buildroot.net/results/344/344af8504a77ae96e4009d76a77572180cf49b14/
>> 
>> No changes were made in upstream libplacebo to src/meson.build since 
>> its
>> addition with commit 006aab8d64d2179d77df9a696b3fd8636f541640 so a
>> backport to LTS branches should be considered.
> 
> libplacebo doesn't matter here, what matters is xxhash, placebo
> failing is just one illustration of the libxxhash.pc issue. So the
> research on since when the problem exists should have focused on
> xxhash, not libplacebo.

I applied your proposal
https://lore.kernel.org/buildroot/20261021183533.2649298-1-thomas.petazzoni@bootlin.com/T/#u

instead of this patch. I also applied the rest of this series.

> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
