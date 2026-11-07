Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF621606A32D
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Mxfwz7Gf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84BCC81281;
	Sat,  7 Nov 2026 18:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2o-7AGXFfZlq; Sat,  7 Nov 2026 18:26:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 84CAD81271
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794075962;
	b=rDK3Fia9f7D2PiX7uMDYjwmx2p7y8/T435kj1dyYci9FjkPrlQydSelbymcLQ5XhzqpG
	 IJ2oDErBRUyh+jp1lpWAhO1TOPZJOhydgkcVPex3XOEGFjHQBvqng793/GAecQy74IZ3T
	 hy3FBnnBpWcXzN2Hkp1aToQcS5JbtluaYDk66CX83lUKEXrcXIS+7F/XMjiF8i2peMR65
	 3ppDH5h9nMZmyzyxIptLnSTSnbqtcNqTP28YV43BZlI5u/8NhhiOW3isnC5/e00cJacrY
	 oDHYBAJhS4IXOK8v2DeaLKiwjn5291IMaLLK4u+QqL12kySLtyRMlmEbKcta7RixUog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794075962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=CWRgMV+eXroFKacLxzfVNr7Ykau+CJA7p5icgp4/xJc=;
	b=kgAQIBsUDt8uz3BO9AnSDGDLrDrXdeDj1NbRyv4iFwdOn8qupn4dIqgQbXpkYkWsd/rw
	 HzSon9vhCHA2YpQNrGdAGl18pYB9DTCOzKBhfBbhxcrsOCUq24q8MhGTngguQiUfQp2js
	 ryxvLfIaU5Ol7TcHGHj4Lcnw5mLUzUN1PHwugk/R9xrFNvK9giZL63n3wS5Rc6IMgK4qj
	 2ux572RxPc4TXV4H5PQsqLpj97wCculeTZ07wlrs1Mch8+8Ajd/dlY6+9hr2MWmH1u7WW
	 YkJzSDleCpFz7KUdLAwog8J2CyyR+zV8EFt56jbzuDC8kuCVpt0JmA6cKpayy77zTqQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794075962;
	bh=CWRgMV+eXroFKacLxzfVNr7Ykau+CJA7p5icgp4/xJc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mxfwz7Gfm79muIkHjni8EgB/FoIakjQxDfWDgtqCyeOmSww5IUTHxpQnWrZuSK0YZ
	 4sYRpVsekD0DX9Z+4z9F8eVpokTSJf2UkQeKnXkZTsSnEMr1tEVh1OIvbXRoyasEEe
	 nWlK5kUtvcHdi5YEuM7LoWLDsHC5XYEFyGODi4rq+tbV77MYaVV9qLwgHgrJL21UX+
	 +UIHc8EniA0tASwoOZEKcUehF7QV59fZrdvxn1pA8ZRpureAvMLW+lRrYxhik/HVI5
	 S1RL2npKEBy8CxIhR7fgAYTyPMx/KQBJdtsdbYuk7IM1rhBZfT/uzImM6Nqi8/QRbh
	 jQnn8TOX0oG8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84CAD81271;
	Sat,  7 Nov 2026 18:26:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F966211
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4538D60661
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HgcCExFWzsG for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 18:25:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4387460669
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4387460669
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 18:25:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 710A95FFAA;
 Sat,  7 Nov 2026 19:25:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 19:25:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 19:25:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20261026191003.2809788-1-bernd@kuhls.net>
References: <20261026191003.2809788-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <bf0d429fc6890d9f1639d9dd86b08f23@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/piglit: bump version to git
 commit 37b7926902
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 20:10, Bernd Kuhls wrote:
> Added patch 0001 to fix build errors introduced by the bump of python3
> to version 3.14.9 caused buildroot commit
> 1af96e786ef1d420bdb66c285a77d18df97db689 which is not part of any LTS
> branches. No autobuilder errors were recorded.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
