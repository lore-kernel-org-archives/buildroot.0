Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CAFECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D80EA40438;
	Sun, 30 Oct 2022 14:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D80EA40438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNKwBNZqTpan; Sun, 30 Oct 2022 14:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF76C4056A;
	Sun, 30 Oct 2022 14:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF76C4056A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F44A1BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED40C4021D
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED40C4021D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R6V4YmcBBIv0 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:09:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D46D401E3
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D46D401E3
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:09:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B3943C0002;
 Sun, 30 Oct 2022 14:09:22 +0000 (UTC)
Date: Sun, 30 Oct 2022 15:09:21 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221030150921.3058ea4f@windsurf>
In-Reply-To: <20221017203828.1327130-1-giulio.benetti@benettiengineering.com>
References: <20221017203828.1327130-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667138963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xNQl5f8Zbp8FLVBv6so9zxoqP58s8LM1Q/+YVHmcm+4=;
 b=c03uYM93di11vhmecZaZe4YG2WJLbpb+Jc4vre4I1R8ZI4mo/dXkn3+uWGFamo/y27p587
 Jr9ynEwTAg9HHhtjQfScPm8FS5d7FTXkc9Vjhb3bI/cfGeb1FkFu0lGuNwmluM4mfT6YCT
 zfv1S04GJB4g8BeasWKeQy+UrvFBvuAK/J/jdoaT2+bg3cjEx/ynKk8Id9QxU+2gVBR8zB
 vkNKMdPxvcRGjzsFDcGbSxg9WubLz8bCBJkLGsuA2V8IDhk6Op3dgLXYZ2x/NSMUUj4YkX
 Z3lJem9hsoeAsTYl3JgLDwiJnDSw9SckyzKTdu2v6xx1bCsihyVjk4g0AWlbHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c03uYM93
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: bump to latest version
 to fix build failure with linux >= 6.0.0
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Oct 2022 22:38:28 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Let's also drop local patch in favor of the upstream pending patch we
> already use for package rtl8189es to deal with endianness.
> 
> Fixes:
> http://autobuild.buildroot.net/results/841cf9da4b07ae4bdc14d049f2585b09a95a92f5/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 +++++++++++++++++++
>  ...1-Makefile-remove-default-endianness.patch | 30 --------------
>  package/rtl8189fs/rtl8189fs.hash              |  2 +-
>  package/rtl8189fs/rtl8189fs.mk                |  9 ++++-
>  4 files changed, 48 insertions(+), 33 deletions(-)
>  create mode 100644 package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
>  delete mode 100644 package/rtl8189fs/0001-Makefile-remove-default-endianness.patch

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
