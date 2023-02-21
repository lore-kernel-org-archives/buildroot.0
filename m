Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0731C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 14:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 419CA41596;
	Tue, 21 Feb 2023 14:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 419CA41596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id trNMz20YIQa3; Tue, 21 Feb 2023 14:01:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63730401CA;
	Tue, 21 Feb 2023 14:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63730401CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6A41BF280
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 173AD6106F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 173AD6106F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSXfnTW_OwZG for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 14:01:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5DC561035
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5DC561035
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 14:01:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77903240003;
 Tue, 21 Feb 2023 14:01:23 +0000 (UTC)
Date: Tue, 21 Feb 2023 15:01:22 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230221150122.63e353f7@windsurf>
In-Reply-To: <20230221112911.177963-1-fontaine.fabrice@gmail.com>
References: <20230221112911.177963-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676988083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoI9EejNQC0sWNv6RPAuY0/TYevz+e1F2Y23L4yUZTU=;
 b=K66k+2Z3zgj3CQf0QgzAiyJn3rG8jZ6x7dLIKDSbhppiaYkPYLSsuAYoVjJuewbKBEq6hI
 Q1cBCZjgdAZawwQGNQMnGP8daK4OyMQ+U51JMteYHN2fte7aRn36hb5lNZ6mB2WIrxMl0m
 rzMAUAEJOk8WmouAcyrIu/re4fxWRtbj/zJo97dPWvEh/xE7f6DXrMtl0Llv5arnYJCuqf
 azD3tngM+PdJmL6yUkQbLV/2uap8bIKTAQ04zEj7bq4KuRljLhTIBooUo0+DdsZUkgoe8r
 j0yPHNBmp1iXOiZT+YpW79u8bzi6fjsDaXH5swbTfR4OCiIQ99CaZfwMRC5Jwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K66k+2Z3
Subject: Re: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: drop locale
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Feb 2023 12:29:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> locale is not enabled resulting in the following libcpprestsdk build
> failure:
> 
> In file included from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/json.h:18,
>                  from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/pch/stdafx.h:88,
>                  from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/http/client/http_client_msg.cpp:13:
> /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/asyncrt_utils.h:317:13: error: 'locale_t' does not name a type
>   317 |     typedef locale_t xplat_locale;
>       |             ^~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e6778e60cc1ea455f5b4511d5824f04d8040f67b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

The thing is that the toolchain claims to have locale support:

$ grep LOCALE output/host/opt/ext-toolchain/arc-snps-linux-uclibc/sysroot/usr/include/bits/uClibc_config.h 
#define __UCLIBC_HAS_LOCALE__ 1
#define __UCLIBC_BUILD_MINIMAL_LOCALE__ 1
#undef __UCLIBC_BUILD_ALL_LOCALE__
#define __UCLIBC_BUILD_MINIMAL_LOCALES__ "en_US"
#undef __UCLIBC_HAS_XLOCALE__

Are you sure your commit doesn't break the build? Indeed normally for
external toolchains, we verify that the Buildroot configuration matches
the toolchain, and abort the build if not. So if the toolchain supports
locale (which it does here according to __UCLIBC_HAS_LOCALE__) but your
Buildroot configuration doesn't say so, the build should normally abort
with:

XYZ available in C library, please enable ABC

See in toolchains/helpers.mk:

check_uclibc_feature = \
        IS_IN_LIBC=`grep -q "\#define $(1) 1" $(3) && echo y` ; \
        if [ -z "$(2)" ] ; then \
                if [ "$${IS_IN_LIBC}" != "y" ] ; then \
                        echo "$(4) not available in C library, toolchain unsuitable for Buildroot" ; \
                        exit 1 ; \
                fi ; \
        else \
                if [ "$($(2))" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \
                        echo "$(4) available in C library, please enable $(2)" ; \
                        exit 1 ; \
                fi ; \
                if [ "$($(2))" = "y" -a "$${IS_IN_LIBC}" != "y" ] ; then \
                        echo "$(4) not available in C library, please disable $(2)" ; \
                        exit 1 ; \
                fi ; \
        fi

check_uclibc = \
	[...]
        $(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
