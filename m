Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5563EFA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D34E406B0;
	Fri,  2 Jan 2026 22:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9SRbN5RP-4L; Fri,  2 Jan 2026 22:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6937D403C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391532;
	bh=wnXqcS+0O/I3YpTAGYHSjxtMbek5O1WBnDbJQ8EXYV4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bVk+sIjZ/O3LFLOF+MWm0pvo2tYqchuhDx6K8NVKoG2VxT3wmGVSB8Ji0nShioHeJ
	 VVBq/eMcCbvDqnu8UNo4MJlGJNrNlCh+TtoRVkIWRpQPuGF3IPtrvJCMqpId3/qTyN
	 dCXn8UbbBOXyqQ08WRsZTEcLMaMyYfQ6Sn/sYJp5XS0jQJ+cpkUjZnqN43/unRO6I8
	 LSvwZATBJiS3U8AcJhCV3AvxraPP9Ux/VMFXjGIKIAwIJaspP6LGpmkIspN44xlX4l
	 Nz6kvE+DPIoaF/qX1cp+KrGVZk/IgV25hRiFxzyopHz19R5PJwigHI/htK1zcfl379
	 d9hoIfuukSg0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6937D403C3;
	Fri,  2 Jan 2026 22:05:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81E8F19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67DE46063B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQSq-W-WTMi6 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7CD3E60639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD3E60639
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CD3E60639
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:05:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D34784E41EEA;
 Fri,  2 Jan 2026 22:05:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A96B4606C7;
 Fri,  2 Jan 2026 22:05:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E6AC3113B023D; Fri,  2 Jan 2026 23:05:25 +0100 (CET)
Date: Fri, 2 Jan 2026 23:05:25 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260102230525.79b9f5ed@windsurf>
In-Reply-To: <20260102205746.36186-1-james.hilliard1@gmail.com>
References: <20260102205746.36186-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767391526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ubdah3+SOgTwYncm8xZmPNLaD5d8EHHCklUZwzkdIgA=;
 b=0RTbyJuTHc0SiO4228IWRR75GEs9XFiuMtkCmxtAn7ruCcDafnn6Xg1Yx634R8jGD2MBlc
 zJFAGdjny9Hn8/3iCVYTD8BNPOrB1r++pvn82LzNbkkHwT8+BXJHb0juzM5eFk7jJaKSUL
 cFXD25CZdBoUEWzNs0aGC87C46baB4PJqZ0C/JNp8m3WH3RqAOs9hAbtRNe1PiFymxWl0t
 +zboYfdydONUjEbjK0lqpxXuNdLzcAMV6RKSqJMyvTHTIZ7VI19ybk+JO4fYbo/Keotloz
 nWfm72smwPN8I36S+7R8gM4d2tQWtoS8jP0wLKI/D1yVFf1gg865OJ52rRjDkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=0RTbyJuT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-path: bump to version
 17.1.1
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

On Fri,  2 Jan 2026 13:57:46 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to move to license file autogeneration:
> https://github.com/jaraco/path/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
> https://github.com/jaraco/path/commit/d2b8d7750f78e870def98c4e04053af4acc86e29
> 
> Add new python-coherent-licensed build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-path/python-path.hash | 6 +++---
>  package/python-path/python-path.mk   | 8 +++++---
>  2 files changed, 8 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
