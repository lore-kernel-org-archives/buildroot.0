Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0582CC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA3FE40948;
	Tue,  2 Jan 2024 20:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA3FE40948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TR5-Ge3XOptP; Tue,  2 Jan 2024 20:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADF6240AAF;
	Tue,  2 Jan 2024 20:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADF6240AAF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DE911BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B93E40ABE
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B93E40ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUlnOTcNeeOC for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:21:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5F2840A9A
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5F2840A9A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7065C1BF203;
 Tue,  2 Jan 2024 20:21:54 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:21:53 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102212153.067edb42@windsurf>
In-Reply-To: <20240102114643.1060232-1-fontaine.fabrice@gmail.com>
References: <20240102114643.1060232-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACL0rJdMrWy63OAGWNguOlZNjr6be4whEcTayFZ7/LU=;
 b=YY62zVSJq/rNPC2o6iizwUhNU3odqtnkqQjEUMD/mvyFkWBrUt+OmF5MVXt+/xzPFWxSHU
 4un/xrRXqNB7KzPreV7yCobpzrW2eoPMekDNvaaLj+8PUQSymrZCMn/8HADNklak62KK2T
 14BQFUghGQ4WM/xjOUwWuq4vdoqEWYs4mkGI9bnwdzHpFN0krZg9rEpjC26NY0A/X+Z5sc
 uhsL8DyKSZHY2K+FVpeOWYT7Pzb2s2USitEF0xhHjcxxiKS1ze0ZfL71vf+aEmBvq//Fl+
 Bpb9Orh2QlG6sDiyt9Tyg6diNRrO1cZ4SVA/PQ2pm2KAMebMPE1nW2RwBgyD0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YY62zVSJ
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/gdal: giflib and qhull are mandatory
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Tue,  2 Jan 2024 12:46:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> giflib and qhull are mandatory since the addition of the package in
> commit 1e64fa2956171cdc9d6e6c8896b4b589ce573513 and
> https://github.com/OSGeo/gdal/commit/cb136fc051341ab99579daae3c8d8246fe918a76
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for the patch, but this needs a bit more explanation. If these
dependencies are mandatory, how did we not notice since the package was
added in 1e64fa2956171cdc9d6e6c8896b4b589ce573513 1.5 years ago?

Is it that gdal has a bundled version that gets used? If not, do we
have autobuilder failures for this issue?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
