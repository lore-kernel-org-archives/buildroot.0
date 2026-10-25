Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB82B606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g9Q1rN1P
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BBE6605E0;
	Sun, 25 Oct 2026 20:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpONmylA6dev; Sun, 25 Oct 2026 20:53:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A2AE760612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961602;
	b=bLaXhEzxE60MRyzWqEJ/qCs7xTz94RILxxnZpklNNo+9ihC30hveScfWQVFEnBAGuV6H
	 s4rNrTDmRQ3WA7Gg/d03nn+zy1yLaeF4Fj4xSK7L/y8xXUonw5DOxYjFIUlLUsTVuaitu
	 IPEpbcZB8RzwsGcRFQTZbvTDlEIzeF0TA2e3fA91nSsx20H5GAps6qgf8Xd6e9kt7Ud8A
	 0b6pj/roDbukM0owGtPf6qsc7ZDXJkKDIjdDz76XSC+ODqx/Dq18+gpjQphf/3RIAw7JP
	 l4Qa70crGQb8rPh7LHFiBqJvIw13XJoMh7GQ/ET0YBTQFVxVFLb3rI6rEXBSi1i3bcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961602;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aRnbH/JDJC842JiITsbwMyGDBPuw33UVwL/79USPsMA=;
	b=E5gDgbj2qRFt2Qu/axAi/+daCnRe5g8dVmwHowA5XwPFbwbR2oXJIYQNVkOtdcSbabfS
	 IsJ3l0VwE1tGUNEdC9+j1ec6TJ0/jzkJFNLqgUFXJbVR94dlhmcRrhPg7D488wFWsZsBF
	 i6sMk/+AePtMyQ/bpxEX6mbuUIB0GDAEpH/hukE8qRQhjqQqAtu6xga6RdBWk1AU1E+ex
	 REy+5hqNBTOu+bpS3rNbW95rJqc0ETk/cUyBOd6O+p5984eb/2Q3ZTwWJ7EChq9tLDcYp
	 w1toGQ33QFT61wgDNuLFbsGWmDLSiKYapUWNzmj+9tC9H2+6ef2TlbjejJWOVmnnY+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961602;
	bh=aRnbH/JDJC842JiITsbwMyGDBPuw33UVwL/79USPsMA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g9Q1rN1PWNxpzBPwXYKKJWh1yspr8Px8TyjpPNNsB1vS9XRqVYE0VADgDzfXX6InK
	 iL8rIHZmrER7DX4hJ9vvPruOBHAX0a/KcUIsRAOmYl+DdZaBG31aeTntWihmyYZYrR
	 hJkVFohpXEhtff3/fXTymFlCIcMOcvrhEkaxw/75Xid9zGoTPMrPuMkKb+Gu8kGFS/
	 l4E5vQ2QAD0yH1dD8m6sj9gtQqKYKIZZ/qVv5Wy9aRRfFre2U4Q3yMEMZ9HYNq2OXx
	 /YjqehJ1iVW6Ih1IixspzP6N6kBXMazCTEwz6NBzmaNWWsEoZX304WzvhL2EyHR00f
	 QYoZDVLvotk/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2AE760612;
	Sun, 25 Oct 2026 20:53:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A8B6356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CB7B40070
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6IGqhNzj8jL for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:53:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2055740057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961600;
 b=tYUyiXVSL1G0xCc/BBiukP1Vn1uggH8J5U0UqHWSjjdYU/pKAQznS13tfP6hccQBxrwm
 sQhWUYRx+vkb7wHVA1YwOlk9Qwf6gUuYQUWm0uqVDvAX4almzyg4hgz3nke98jdGVokH/
 HQuYa949ZVo9h3xiT9aa6kA5T/oOWeTTY/zjK2yrOxGGxROBn0D6WMYC0FroBX4lZw50P
 ai01CxoyoLltEY/6akykocKLJcxeCBILeCLzxm+J3q8WMdKWKdEDeV2MGpu+Qqy77F4uh
 FrjRCk5Ri1IuATUc9PEXr7CVMMQNaq+TVGYcKUkl13TVBgP1VLJisK9nOlMBzp635/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961600;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=vhWYg7tIIcJAWw9ipOKQ/L5RoxrcxgH/aiuVuJPxC+0=;
 b=E+tzcme7gjBwKn14gx+uUWF17oDQXoMT/MTw8AFw27TfF8zOqygwDBydyeHTtq+VZDtv
 3nOsmbF2aD4E9maDA9lqu0VnP3qTIee7UwaLO+Zh6juvHfxzSnLAOmmbwBXoJfTSY/STw
 yObCjqJCOGQBQ0EP8dNIBOfs34QFRPdBD/YEAVLBQ35InUL1tnejrXacw3L4uuIYPoWIk
 OKcIIDfiMGCqfUvezr14iTKMv7mzkXO0q24rFy7W7aXrpsgtlvbnujt/L8XfHs14LgYns
 bmvlazFhYL6WVZwLwZQXz34QbCH2dwbh20Q3YFZKKihEPK7SizWmoqiucdufgIBRUoQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EMz5j9QY; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2055740057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:53:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A3F104E41308
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:53:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7192A60740;
 Sun, 25 Oct 2026 20:53:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A42D91032902C; Sun, 25 Oct 2026 21:53:16 +0100 (CET)
Date: Sun, 25 Oct 2026 21:53:16 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <at5sKfzIK4Xu8D8r@windsurf>
References: <20261024161704.4144810-1-yegorslists@googlemail.com>
 <at0gCbhfnKkq6NtS@windsurf>
 <20261024220900.1594745-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024220900.1594745-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/ebtables: fix arm64 build with
 kernel headers >= 7.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 12:09:00AM +0200, Yegor Yefremov via buildroot wrote:
> Hi Thomas,
> 
> On Sat, Oct 24, 2026 at 11:16:38PM +0200, Thomas Petazzoni wrote:
> > And is the "opposite" still working, i.e building with really old
> > kernel headers? Maybe they lack something that the bundled copy had,
> > and it was the reason for this bundled copy in the first place?
> 
> Yes, it still builds. I tested ebtables with this patch against the
> oldest kernel headers Buildroot can use:
> 
> - x86_64, uClibc-ng, kernel headers 3.0.101
> - x86_64, glibc, kernel headers 3.2.102 (the minimum for glibc)
> 
> Both build fine without the bundled linux/types.h.

Thanks a lot for the additional thorough testing, and quick feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
