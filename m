Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742DF606A31B
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tBuuIFcy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54EE940EBB;
	Wed, 21 Oct 2026 19:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEk87ytymfEK; Wed, 21 Oct 2026 19:24:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4BF2440952
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610681;
	b=SRyjoPBCXqqoQIrC6V5KYaZzWjx3aWNw1lGtLoaR4Y9HT2hMr6ryIqL8v0UEAn10aB6p
	 siOtJhExBvPfZL5j7DSs7adqii0fmMZ1vY/nwW5CDLKH0FZaZhsDRkU+VzeYesX8BISKL
	 +KSvMcos5PhUFrQXhZE8YHDefjku+oMfgCS9kMb4FgmtwZumG/W0egrxGU7rGjuf5hnH6
	 jsEW1NXqHG7lFa7bgf9IDcORGPBhR9dALDxEr6hzgaIaludFyFLKlrFxpUCKw4IvbrlXT
	 Ch0+LSo7tp342r+iD8XrcFrcUHsNwtwGzBguwbsUiB7nktATFmAPNQwvm4WUIWd2raA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610681;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=f7FGqb5Rt83oal5yLxDlX4CAAGEQReBluKWsgqqR1gw=;
	b=CWNd7+m1VLFsWRm+Lz/NDZLq3udYTuo1BBzQotcOAIXL12op8C+dO/D8XDlR0CSKfq/v
	 0jLqs9QSidgSvxULKNoUEZen6XGEeKpVY4J93+rPa0oEq0maJ3GN2zF9f4JIxG0KQ4eSc
	 adU41WpgJGmHoQtrGcRgWSimmF5QoGCuER+v+kXZ5NokhQh1z/PG0QaSZv2r46rEpGH9h
	 R7xQuzPoO4NWzbwHSYN+kJqOBziJP0Js0KmVyc0DXThFnT9ex+a/oW3ltgIVlDreIYSP+
	 oz4RtkBlO/xnBvu9uom9h72URmxD6DyFsNggVupM+eNY6d3lQ4MFCTSkZWMviTq9Ncg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610681;
	bh=f7FGqb5Rt83oal5yLxDlX4CAAGEQReBluKWsgqqR1gw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tBuuIFcy8+glm50ReJzXIcWY/I56zpik3K2+IcKnBcOB8dPcHO/Vb+k1RhEhKybT0
	 4xWBSdDJfOtyW7Eiqu3hj50Z2QtkOTQnI1dkQevyALI3tmJl4dhCRaNKpjyAtyATvb
	 LZkd5GiyCdghFX/qlPHatRp7mYO3Q7UKlufDra7i1WTNs5kXKKRx9gBMoWUnjtBiZ9
	 d+I+1qemqog4SWsz6a9eHc+sfg82OHKjxXW0ihnYEgWgfikU5b5MfMm6suhnB6JRPX
	 T4v+OFLls8RnRMyhyLqx8UHbw+fJGqHf6fzc7kdaDv0MLvLa97pxr0axckCUXvr4Kj
	 2kmaG5vglwlOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BF2440952;
	Wed, 21 Oct 2026 19:24:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 676303A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D3864040A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLTMA06cr5kd for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:24:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1BB2640087
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610678;
 b=nP5vAnyhf/8lA297PWhtZ9GimYSWCrmEKkgKs91BevIe05NWotkd0qx4WEZse9sVKaY5
 hpd9veCm1/iFiC0n0MP0CD9Tim7dZxWqik5exsZXAylndzrodSyn64DG0vv6R02ZlDI6H
 AJrlZcnTY/23zdlQY3po6xOlR5wQchhKzNwo/pomeGm6cU+oa6Zo7pdlF8JHbxert+Ner
 vE3qIebcWOn22AKsOfZO/APU2VCzlddelC9vpkmTYzmhMOqlMls0KzTjvJ+ljmVsH5fZD
 J3L1UziDEeOEHA0Jw0e4lje/6A/icLGQT4q9DyClG0DsNY6p7mVVcyOPXRv5f36pWGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610678;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=0LVWDumW4a0BqDk/JqEmtKJ7uHuqy/wP2G8Pi5pjX2A=;
 b=rW0Bq1/cjaavWRwdyO7jBn3SCOkzzwhHCyBUrN1E1zM2v1tZbdWHaZR7xAmNl6NRB69e
 8YPZAhUc8cEBAAuZq/KezMdznxvHLutp6g/kFhuJV3o56ZHFkA4uaYbTefQcpsrxY06e+
 F/DviojuPwLvnTJOttNoLwtoBJeEnET7dj4OzK7JPl0GDJmytzuNxTu58YPT+rzpzIrcW
 C0MOIdMQqfpIAIOQVoL2wPGSy5P2s71xfy4e4QLhpp4sscfGFg/mqQgBAQzilzS2KeBib
 3nbZVBXB9hA9mMecQywm/WofNG99b9edhYNK/rYxK0Gbb6tfA2IPHaQmkZYrFx1ZezQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="q/TBh35b"; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BB2640087
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:24:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0FCBE78063C;
 Wed, 21 Oct 2026 21:24:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 21 Oct 2026 21:24:33 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 21:24:33 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261021183533.2649298-1-thomas.petazzoni@bootlin.com>
References: <20261021183533.2649298-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <f60a599557cb994ca6a61fa66b383ce7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/xxhash: make sure installed .pc
 file is correct
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21/10/2026 20:35, Thomas Petazzoni via buildroot wrote:
> The libxxhash.pc installed by our xxhash package is incorrect as it
> contains:
> 
> prefix=/usr/local
> 
> while the library is installed in /usr. This causes for example a
> build failure of libplacebo when xxhash is built before:
> 
> output/build/libplacebo-v7.360.1/src/meson.build:247:6: ERROR: Include 
> dir 
> /home/thomas/projets/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/local/include 
> does not exist.
> 
> The problem comes from the fact that the .pc file is generated during
> the build step from .pc.in template, and we don't pass PREFIX=/usr at
> the build step. To fix, we pass PREFIX=/usr during the build step, not
> just during the install step.
> 
> The problem has probably existed since we started installing the
> libxxhash library in commit
> cc0c90aa83821d817ae2cbe01ad2c8d22ea30ba8 ("package/xxhash: install in
> staging"), but we tested in 2025.02.x, and the problem exists so this
> patch should be backported to 2025.02.x.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/344af8504a77ae96e4009d76a77572180cf49b14/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
