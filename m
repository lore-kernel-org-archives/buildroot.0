Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A2DF33809
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 07:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B4661469;
	Tue, 17 Mar 2026 07:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TObjZxBVm5zH; Tue, 17 Mar 2026 07:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10B2C6146B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773734345;
	bh=S7+o+CqhN8z9JFH+8ViXse2fUYy4ny1qt58Ra084Dbs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LPK5uV8FRstVjR44uDLGIyeYrgRd4B4x98FaBVQHivVzNO+obpOk6tuQ0es0abGkF
	 Xi5mqnGiNqI6hHFpuywRLQNYcT1GhWdvUrtKMdcS1gbEjAeJBUF6tNXgMbUpPapPK5
	 XH2YxBnwnFHfAIpsp00B9JVfileijcYgxnBa/bu9xjy8bFhAX0UdeIfJQhz+USnYQl
	 Zvmnp4LBGgEkKzQ96cuHPbOchhLqZ0ZiFFoxUF5Fox5JEPosd6sPAjYucY4ZcQAEGm
	 FqbcJktKQt3qqL7xY/UmtVNtbEN2VyIRK6TkD8y7pl3k2+XSM5IdyWxUEAUUaKc2HA
	 00I3dujxeG8cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10B2C6146B;
	Tue, 17 Mar 2026 07:59:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 437DA1B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 07:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2938040BAE
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 07:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3q_31L2_vqw for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 07:59:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 315A44004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 315A44004D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 315A44004D
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 07:59:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4B6614E42629;
 Tue, 17 Mar 2026 07:59:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1B0175FC9A;
 Tue, 17 Mar 2026 07:59:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F11E310450421; Tue, 17 Mar 2026 08:58:57 +0100 (CET)
Date: Tue, 17 Mar 2026 08:58:57 +0100
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <abkJYg9QXlB-Lrii@windsurf>
References: <20260317074923.981623-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260317074923.981623-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1773734339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Qbm23N/z3gqHnNC0LbfZv2twt/0XNflDlCu2094gNXc=;
 b=WvsVNaSDS7vneKpJ78u+QDUEbnpPQRpgwBSd/PgSZoLsqpy/BG+VGmja//aDdfIfXbaZFP
 MbNXnbiB7tJhx1Ox4rL4KWYbkJ1EzsgnW2y4rKGWvPVQS2z+tatR79RblEMjY9OQQ0B42t
 PVUrT4vfRRd1Acdayr6OY8D04gPzDkjmaROsYosqcHlSkt5f82LYUNEK50guQY24yB/Sgq
 vtwufcha2p9pdQwDeTGO70NTFWFLi5P+LqwIerYU4OtkBY1scqcNj6QdXYPVVsjbeFNliY
 4eX2wHMbo9Z9CtJe+HZirOOpLx6U19Av93ET3FVcS7LJVwp5nKgOPin1KEAS+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WvsVNaSD
Subject: Re: [Buildroot] [PATCH] package/pkg-generic: add support for
 uninstalling packages
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

Hello,

On Tue, Mar 17, 2026 at 01:19:19PM +0530, Shubham Chakraborty wrote:
> Buildroot currently does not track which files are installed by each
> package in output/staging, output/target, output/host, and
> output/images directories. This makes it impossible to cleanly remove
> a package without performing a full rebuild.
> 
> This commit adds:
> 
> 1. A new Python script (support/scripts/pkg-uninstall.py) that reads
>    manifest files (.files-list*.txt) tracking package file installations
>    and removes all files belonging to a specified package from a given
>    directory.

Thanks for your patch. Unfortunately there's a reason why this hasn't
been implemented, because it simply doesn't work. Think about the
following scenario:

1. Make a build with BR2_PACKAGE_NTP=y, BR2_PACKAGE_OPENSSL=y

2. Run "make openssl-uninstall"

3. ntp is now broken on the target, because the ntp binary is linked
   against libopenssl.so, but libopenssl.so is no longer on the target

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
