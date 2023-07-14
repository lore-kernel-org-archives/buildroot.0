Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE17EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E458F4052F;
	Fri, 14 Jul 2023 21:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E458F4052F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6dxtwvDe3MMf; Fri, 14 Jul 2023 21:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AA5940327;
	Fri, 14 Jul 2023 21:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AA5940327
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 436B11BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E1F3418FE
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E1F3418FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eVCs-S3OWaUd for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:25:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B50A0418FC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B50A0418FC
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:25:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 842641BF203;
 Fri, 14 Jul 2023 21:25:19 +0000 (UTC)
Date: Fri, 14 Jul 2023 23:25:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230714232518.6ed70c07@windsurf>
In-Reply-To: <20230714162339.1907504-1-bernd@kuhls.net>
References: <20230714162339.1907504-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689369920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCKhZGhRNpMs5b6RfMj4Ro3p2fO1OYNpEstnEoQeWGU=;
 b=Yn1+PphpRDj95yc7rqnwxQOJ+K/FA28EeBvSnZa01+8Wu0AGaw5e7A20rzlUM6L0CYC57k
 2z9932Xa7oTd2BMbKk3899Qv0BZMFUjzRRLDvva+hgHPbt7/bl56Ebs7ypXv2pTuHGZ+GJ
 rK266jRHalKX6aD20s9z9IYJxdrOhAatDZItW6auCebbACtlFx+QHcV+/X8LzpomVjUQn3
 0HX9okUM3jamaPjHXPQdiTDBMIzWGfIUsXc99mVvugH1iGPyAIyYFUkzxo65Y+C+kSmWRc
 0HrIRxHnqjvwSQgH9yKR8ipSoJJk30pj30mij9bb8suir8+P3AcDWE2NTtZFFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yn1+Pphp
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: bump version to
 3.0.9
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
Cc: Danny Wood <danny@rotronics.co.uk>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 14 Jul 2023 18:23:39 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Danny Wood <danny@rotronics.co.uk>
> 
> Rebase patches onto new version
> 
> Remove 0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch,
> 0006-Add-support-for-io_pgetevents_time64-syscall.patch, and
> 0007-Fixup-support-for-io_pgetevents_time64-syscall.patch as these are
> already applied upstream
> 
> Downloaded from
> https://lists.buildroot.org/pipermail/buildroot/2023-June/669230.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

How much build testing was done with this version bump? I know OpenSSL
3.x breaks a few APIs compared to OpenSSL 1.x.

Could you do a test build with a significant number of packages using
OpenSSL in Buildroot, to assess the damage caused by this version bump,
and provide the defconfig used for this verification?

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
