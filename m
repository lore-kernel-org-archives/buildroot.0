Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66556C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 16:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFC3040BF9;
	Tue,  8 Aug 2023 16:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFC3040BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CINNWJM230UD; Tue,  8 Aug 2023 16:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 425A540C23;
	Tue,  8 Aug 2023 16:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 425A540C23
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC4701BF5A5
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC11E40295
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC11E40295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_7sPGZFnMpT for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 16:43:14 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E1334092F
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 16:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E1334092F
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7F7B240009;
 Tue,  8 Aug 2023 16:43:10 +0000 (UTC)
Date: Tue, 8 Aug 2023 18:43:09 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230808184309.379b5996@windsurf>
In-Reply-To: <ZNJZ7Huyn6K+Pgwy@waldemar-brodkorb.de>
References: <ZNJZ7Huyn6K+Pgwy@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691512991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtovCTsoVwUgOXt9ML+WajExs9JtlVYYLIcLinr/4zo=;
 b=KfmTGpBEvTGYl2JSq+bXtWUgMMhJaigKipaTl7zrRG2bBsGFDjveLhZHOpdIHP0VeNUaOb
 snIgrhbrT/O313GNWn3TUiUXAy3Rx9iKPXSvxQpefkRoyFIsaux+ugAX/YlwKEpKHbrJlj
 WvbPkWj/67r0ydv3qyJH/UOtoSvpC0v5wBJyiKdVaNxhqx0WLh1oBz4kAM2BRnd7wsphEO
 i2kjzcAWcgvCn5cH0SnrXQXIe1BgsannNtg3xGCsUDpWnZaBjvUw3H5N+FasbzL4i5FKBi
 E0rq2hufCNbzhB/KiWYtJgDHc2F4HHd4to8P/1yV4QVSJV/cCWS7MwrUBh9BuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KfmTGpBE
Subject: Re: [Buildroot] [PATCH v3] package/uclibc: update to 1.0.44
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

On Tue, 8 Aug 2023 17:06:20 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> - mostly stability improvements
> - patch is included so remove it
> - add a hotfix for aarch64 missing hwcap header
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/823/823aac32b0ff365ebb3d99073f34276362a2c530
>  - http://autobuild.buildroot.net/results/0eb/0eb921e07a3d13bd76e76ab6bafad3a13632f8bf
>  - http://autobuild.buildroot.net/results/f4f/f4f37179a732d1bd4a31c929608a963f291e21a2
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:                                                                                                                                                                                                           
>  - add Fixes for haveged and stress-ng
> v2 -> v3:
>  - add a patch to fix glorytun compile when using aarch64
> ---
>  .../0001-aarch64-add-hwcap-header-file.patch  | 163 ++++++++++++++++++
>  .../0001-gettimeofday-fix-static-build.patch  |  29 ----
>  package/uclibc/uclibc.hash                    |   4 +-
>  package/uclibc/uclibc.mk                      |   2 +-
>  4 files changed, 166 insertions(+), 32 deletions(-)
>  create mode 100644 package/uclibc/0001-aarch64-add-hwcap-header-file.patch
>  delete mode 100644 package/uclibc/0001-gettimeofday-fix-static-build.patch

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
