Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634A9C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 20:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB1BD4015A;
	Wed, 20 Jul 2022 20:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB1BD4015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DOmh3e8Gmw7o; Wed, 20 Jul 2022 20:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 133C8403CA;
	Wed, 20 Jul 2022 20:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 133C8403CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9FF81BF473
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C137F403CA
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C137F403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E4Fj82dkmuOF for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 20:38:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 974354015A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 974354015A
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 20:38:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4041A20007;
 Wed, 20 Jul 2022 20:38:19 +0000 (UTC)
Date: Wed, 20 Jul 2022 22:38:18 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220720223818.1854d156@windsurf>
In-Reply-To: <20220615201622.25057-1-fontaine.fabrice@gmail.com>
References: <20220615201622.25057-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658349499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vaJgykfdPxVRuDIZFhhdKvSw7DSstCmXZPr9Op5Yy2A=;
 b=m4WVT+gWc28JBYgbGvMqvcxShCyOM5qd+WQsP8+vMqmj2HP3hchweXGkiRUTuEHQ9glIxM
 NfOsGHtbr/Ev2liXcUwboCk9dX5KD2xnGbrExzjNGNimV04EeHmGKjD61ksXHZGNwJqjCg
 9aMpwV9vPoFEpzT4ceouQoXrKBnd3C8RTfguJ4oGv8wBYOfh79qG6oUMLPZ5smnIFntFih
 2DUvVVRleUFOwpQG8oUiBH3EAlp7dsfrYHYjfoCjekyiS5kM/wPTIRoTNvvgkW4ZJXsL5f
 qdrVacMiaKM21u4P6MEfSkJGZdKOD7Xw1YZlvFFFRB95n0xUswHUkTce0sEx5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m4WVT+gW
Subject: Re: [Buildroot] [PATCH 1/1] package/wine: needs NPTL
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
Cc: =?UTF-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 15 Jun 2022 22:16:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> wine unconditionally uses pthread_attr_setstack resulting in the
> following build failure without NPTL:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/i586-buildroot-linux-uclibc/11.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: dlls/ntdll/unix/thread.o: in function `NtCreateThreadEx':
> thread.c:(.text+0x61b): undefined reference to `pthread_attr_setstack'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a866d65cda97845a8c829acad2c057bab00cde08
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wine/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

The pthread_attr_setstack() has been around for a while in Wine, so I
was wondering why we're only seeing this issue now. Turns out that Wine
depends on BR2_i386, and until the relatively recent move to fully
random configurations, we never tested an i386 toolchain that has
linuxthreads suport instead of NPTL.

Therefore: applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
