Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3F5C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:04:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB5B61038
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BB5B61038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E342440338;
	Fri, 13 Aug 2021 13:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zY6N90xFq6Ft; Fri, 13 Aug 2021 13:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69BB7400A6;
	Fri, 13 Aug 2021 13:04:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B37741BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3ADF60640
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yugDIhSixhN5 for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:04:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3B3D6060B
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:04:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 90BBB200003;
 Fri, 13 Aug 2021 13:04:17 +0000 (UTC)
Date: Fri, 13 Aug 2021 15:04:16 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20210813150416.021d688a@windsurf>
In-Reply-To: <20210813073634.389426-1-asafka7@gmail.com>
References: <20210813073634.389426-1-asafka7@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymupdf: depend on
 python3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Fri, 13 Aug 2021 10:36:34 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> According to the package documentation, python 3.6 or newer
> is needed.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/f857986b8c9b6d4a843f3694cae8527760540ed0/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pymupdf/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
> index 54714eb3bf..64a81895ea 100644
> --- a/package/python-pymupdf/Config.in
> +++ b/package/python-pymupdf/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # mupdf -> harfbuzz
>  	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_PYTHON3

This dependency should have been propagated to the two Config.in
comments in that file, so that they don't appear if Python3 is not
used. I fixed that up and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
