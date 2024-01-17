Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E7DC47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 12:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F13A34361F;
	Wed, 17 Jan 2024 12:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F13A34361F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBUfX9GXkOBi; Wed, 17 Jan 2024 12:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0B4B405CD;
	Wed, 17 Jan 2024 12:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B4B405CD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EBFF1BF95D
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 12:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37F586145F
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 12:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37F586145F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GNgV-as5JcTE for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 12:50:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24AF660745
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 12:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24AF660745
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5474820009;
 Wed, 17 Jan 2024 12:50:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rQ5NJ-00FtSW-1p;
 Wed, 17 Jan 2024 13:50:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Petr Vorel <petr.vorel@gmail.com>
References: <20240115214137.2350453-1-petr.vorel@gmail.com>
 <20240115214137.2350453-4-petr.vorel@gmail.com>
Date: Wed, 17 Jan 2024 13:50:33 +0100
In-Reply-To: <20240115214137.2350453-4-petr.vorel@gmail.com> (Petr Vorel's
 message of "Mon, 15 Jan 2024 22:41:37 +0100")
Message-ID: <87ttnci0o6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/3] linux: bump 5.10 CIP kernel versions
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Angelo Compagnucci <angelo@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Bump CIP to 5.10.205-cip42, CIP RT to 5.10.201-cip41-rt17.
 > Use sha256sums.asc from kernel.org.

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 > ---
 >  linux/Config.in  | 4 ++--
 >  linux/linux.hash | 6 +++---
 >  2 files changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/linux/Config.in b/linux/Config.in
 > index 4528d8eacc..36649d3391 100644
 > --- a/linux/Config.in
 > +++ b/linux/Config.in
 > @@ -32,7 +32,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 >  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 >  config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 > -	bool "Latest CIP SLTS version (5.10.162-cip24)"
 > +	bool "Latest CIP SLTS version (5.10.205-cip42)"
 >  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 >  	help
 >  	  CIP launched in the spring of 2016 to address the needs of
 > @@ -52,7 +52,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 >  	  https://www.cip-project.org
 
 >  config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 > -	bool "Latest CIP RT SLTS version (5.10.162-cip24-rt10)"
 > +	bool "Latest CIP RT SLTS version (5.10.201-cip41-rt17)"
 >  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 >  	help
 >  	  Same as the CIP version, but this is the PREEMPT_RT realtime
 > diff --git a/linux/linux.hash b/linux/linux.hash
 > index efd0dac4cf..6e75e017d3 100644
 > --- a/linux/linux.hash
 > +++ b/linux/linux.hash
 > @@ -7,9 +7,9 @@ sha256  9025147a09547f28ec8f496c12efc30bd2fc03b2824a668e8636b2ca0ef1fb6e  linux-
 >  sha256  42d28def2cc1502251edbfeaca3b25ee764ad1e471b6c703ccb2267f38471c43  linux-5.4.267.tar.xz
 >  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 >  sha256  da82425c7410623dfb2405915347ee9617fc0e33a63ca821c33aeed160cddae8  linux-4.19.305.tar.xz
 > -# Locally computed
 > -sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 > -sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
 > +# From https://www.kernel.org/pub/linux/kernel/projects/cip/5.10/sha256sums.asc
 > +sha256  b4734a7a22a30f3c20f9437c366bde0dd584bebe836d1ef622d4c1d7205e6f54  linux-cip-5.10.205-cip42.tar.xz
 > +sha256  b1dc1779a9b8e05c1b547c2b3f2b19c5829504431f09c1a82e24b98d1395c4a8  linux-cip-5.10.201-cip41-rt17.tar.xz

This cannot work without updating the strings in
BR2_LINUX_KERNEL_VERSION?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
