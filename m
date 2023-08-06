Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034C5C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 13:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97FB840997;
	Sun,  6 Aug 2023 13:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97FB840997
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uf9l9jy7ox9Z; Sun,  6 Aug 2023 13:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032E64043D;
	Sun,  6 Aug 2023 13:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032E64043D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 222131BF3C0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DBBB4031F
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DBBB4031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Cf4CTYZnqQp for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 13:45:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06C1340908
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 13:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C1340908
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA5DF60003;
 Sun,  6 Aug 2023 13:45:27 +0000 (UTC)
Date: Sun, 6 Aug 2023 15:45:26 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230806154526.5aa530a9@windsurf>
In-Reply-To: <20230806102554.46261-1-thomas.petazzoni@bootlin.com>
References: <20230806102554.46261-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691329528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AdrQa4Se6yTvLYr1MMLUzqRJ2UTiTh6do4Y9n91hCEg=;
 b=MDzUBSP+lAKXuCXiakqLJB5j7o6oucv+63JnzRDpBeiA7trA6MhaTURWJAVC0CrjQ8S2iX
 8kc1CyvKtZ6yui5aLUorYJ885B9kfXVZh606ayHsSkI0WBxW6D+pfLWUudTtBzA8bhPKHj
 1px+MqeqYuNkGE+CyZWje5AjUMSXjPOcLOJ+A86dmI+3DN9ZUTwKVIvaklEtmSdRYJ7Syp
 gJH7HsvDtt3dV5OObFqUP+N01VhBRG2vYnrHYWpEgUllOpX7xh5JBJPYWTw7le3CsjXpZv
 nKs1fwBl2QAfrdnYuTxwGeZ+9ioZ5hexpUcoENS3PmjyaIIX451wGnUAHntcFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MDzUBSP+
Subject: Re: [Buildroot] [PATCH 1/3] package/elf2flt: refresh patches
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Aug 2023 12:25:51 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Some patches had some fuzz, and patch 0004 was no longer applicable
> using "git am". Patch 0006 is renamed so that it matches the commit
> log title, as generated automatically by git format-patch.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .checkpackageignore                           |  2 +-
>  .../0001-elf2flt-handle-binutils-2.34.patch   |  4 ++--
>  ...tate-32-byte-alignment-for-.data-sec.patch |  4 ++--
>  ...03-elf2flt-add-riscv-64-bits-support.patch |  8 ++++----
>  ...2flt-create-a-common-helper-function.patch | 20 +++++++++----------
>  ...l-error-regression-on-m68k-xtensa-ri.patch |  8 ++++----
>  ...=> 0006-xtensa-fix-text-relocations.patch} | 10 +++++-----  
>  7 files changed, 28 insertions(+), 28 deletions(-)
>  rename package/elf2flt/{0006-elf2flt-xtensa-fix-text-relocations.patch => 0006-xtensa-fix-text-relocations.patch} (88%)

Series applied to master, with the Tested-by from Waldemar.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
