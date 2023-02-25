Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A654C7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DB4D408F8;
	Sat, 25 Feb 2023 09:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB4D408F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oe3MVPlzaUJU; Sat, 25 Feb 2023 09:49:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 493534070F;
	Sat, 25 Feb 2023 09:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 493534070F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4431BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E81A5409DB
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E81A5409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNdmkqxYAWB7 for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:49:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E148409A4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E148409A4
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:49:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EED54E0006;
 Sat, 25 Feb 2023 09:49:26 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:49:26 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225104926.28b9bb48@windsurf>
In-Reply-To: <20230224105148.1780818-1-fontaine.fabrice@gmail.com>
References: <20230224105148.1780818-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NgPN0T61mTRqzBHxJLN1XWIOY0f1qX4jPoFLVts5uWk=;
 b=KVJ9RsH+AltezG0LZiZbokkLJgg0XUf3o7pKh+fYPcrMCfkpj3NVoGDYqRIRmkEbRU3A3I
 NNTVYdCqhWaBAsXgzyoT6Vwamnuws24KqEWyemxsGtl3z3/xjqKXiab30A0zuF+vmQ/ot8
 nB2knNzUDwDEyNkE7roZuNZ5vxriXeyZBpBfN/+MPuVjdjWnwUUYym2hmL6wjAPaaIeqpA
 KLvZCoNGdq+ke+BuZhbAdyVHt4kB338dJld+ZkXy1JHWtVgFwA4QZKPt7SN7CpEUbu/gvm
 80M9Wutua/tBuHqgxcqrslL/V/IOkym4BEkfR5ABg34Az6OSyeZE5Rh+mZaD6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KVJ9RsH+
Subject: Re: [Buildroot] [PATCH 1/1] package/ntpsec: fix build without
 stack-protector
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 24 Feb 2023 11:51:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without stack-protector raised since the
> addition of the package in commit
> 27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:
> 
> Checking for library ssp                 : not found
> Checking for library ssp_nonshared       : not found
> Checking if C compiler supports -fstack-protector-all : yes
> 
> [...]
> 
> The configuration failed
> (complete log in /home/autobuild/autobuild/instance-2/output-1/build/ntpsec-1_2_2/build/config.log)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f38abc6b7f8464836231192cfe078a5b27319a8a
>  - http://autobuild.buildroot.org/results/62be818e2f2eac07b4a2de6f4a8898cc4cc05b1f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...pt-fix-build-without-stack-protector.patch | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch

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
