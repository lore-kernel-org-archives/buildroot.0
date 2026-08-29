Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B191C61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59ED760622;
	Sat, 29 Aug 2026 21:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLg_KbnQ_vCN; Sat, 29 Aug 2026 21:12:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788037967;
	bh=czJNj5PeJAMHLmGwM0/7cSf5wxOWmy0wOkedDsBZjA4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h767CCYPLu2EZdB4RH1YfRguwer6vcselZrs3TIYbVZAaYzdxAJwwq+BZCiM5TknX
	 FIv8pS510rtoc3XPVFL0jUnZMMSNvy0PtYTLKcBkJeX1sqth+aDliPC/+cMnLU9GCn
	 RuwQqw673eCdMw9l4MPt9Yiy2+sXcr78Ny3NE5Dj45Sgzr4uvSzeNLlxzyUWZkziPv
	 mWxMhKx0XyHJ73qPBdmQUG3ZM6KzZYGrHUBGtqal3ePftda9pwyVfXyQCed25v57Oy
	 mNExPRSTWj25vsvsvJeB9GgXlT2YywxOv8d46JTORk290ySxbT8qTiJL2dtdN972Yy
	 2zzfQN2HblEEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DA23605EE;
	Sat, 29 Aug 2026 21:12:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98C5E9D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A847605EE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1BFKH6WoLsp for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:12:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8621C605D0
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:12:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EB0C01A1868
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:12:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B4F3A6053C;
 Sat, 29 Aug 2026 21:12:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C9C5611C7843A; 
 Sat, 29 Aug 2026 23:12:35 +0200 (CEST)
Date: Sat, 29 Aug 2026 23:12:35 +0200
To: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Cc: buildroot@buildroot.org, Christopher Obbard <obbardc@gmail.com>
Message-ID: <apNK8wHXKqXUz1n7@windsurf>
References: <20260829-wip-obbardc-package-dtui-fix-armv5-v1-1-1dfdc176385d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260829-wip-obbardc-package-dtui-fix-armv5-v1-1-1dfdc176385d@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/dtui: require 64-bit atomic support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christopher,

On Sat, Aug 29, 2026 at 12:01:02PM +0100, Christopher Obbard via buildroot wrote:

> As a follow-up it could be worth adding a
> BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_64 symbol to
> package/rustc/Config.in.host, defaulting to y everywhere except the three
> target combinations listed above. Packages could then express this
> constraint as a single dependency and it would stay correct as rust
> gains new targets.

Yes, please add this. It will be much more explicit and logical. Maybe:

config BR2_PACKAGE_HOST_RUSTC_ARCH_HAS_ATOMIC_U64

Could you prepare a v2 with this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
