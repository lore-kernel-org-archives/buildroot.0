Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03511C64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 07:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2C8341850;
	Tue, 28 Feb 2023 07:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2C8341850
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9vA9JVohAQ9P; Tue, 28 Feb 2023 07:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92AC14184D;
	Tue, 28 Feb 2023 07:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92AC14184D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0E111BF3DC
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B955041848
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B955041848
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVhXIsvjTkhz for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 07:55:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6AFF4184D
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6AFF4184D
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 07:55:26 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 3364B5C3A65;
 Tue, 28 Feb 2023 08:55:23 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 28 Feb 2023 08:55:23 +0100
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
In-Reply-To: <893660729815cb737418892a77d27ba089a6cbde.1677568448.git.stefan@agner.ch>
References: <893660729815cb737418892a77d27ba089a6cbde.1677568448.git.stefan@agner.ch>
Message-ID: <1186bf5ba2b8379429686a77858c683f@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1677570923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FLyk2Uf09wdMsxG9ORznNeYEt2Ow/iMlz6E1XGTpaU=;
 b=ixPSZvUZUaAau8TNPmgJlB3KguH1slzPm+1ODtzcxNd1IuzXzqQUcO5J8lR9C2a/H5Glhi
 LcNIsk5ZJ/P4Uk9l1z1FP+tvVbiDujvjBot9RypFjOrq+UyjxsDUXMg0pMwdpIsnDN5jfZ
 tHyolCqW/qpydSjBrQTfnEt7WkstadE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=ixPSZvUZ
Subject: Re: [Buildroot] [PATCH] rtl8812au-aircrack-ng: bump to latest rev
 d98018
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-02-28 08:15, Stefan Agner wrote:
> Fixes build against kernel 6.1.x.

Please ignore this patch, the same change got merged two weeks ago.

--
Stefan

> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> index bc3a926314..cdf5f3b4e2 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 
> eed4888da9cfdc0f83ad3335beaf73af33ce0796b0a2637aeec102d47e1eb8f0 
> rtl8812au-aircrack-ng-e7a4a390ccbdd768411e1b2a8922c47837f76b47.tar.gz
> +sha256 
> 69891a35724a6c30fcb29d9eba783879e0bee3f5f7847341fce06101a7542f5f 
> rtl8812au-aircrack-ng-d98018d038a5db96066e79f26ed4a72f2fe1774e.tar.gz
>  sha256 
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 
> LICENSE
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> index 45a6ce5729..ab3ebe2077 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> @@ -4,7 +4,7 @@
>  #
>
> ################################################################################
>  
> -RTL8812AU_AIRCRACK_NG_VERSION = e7a4a390ccbdd768411e1b2a8922c47837f76b47
> +RTL8812AU_AIRCRACK_NG_VERSION = d98018d038a5db96066e79f26ed4a72f2fe1774e
>  RTL8812AU_AIRCRACK_NG_SITE = $(call
> github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
>  RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
>  RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
