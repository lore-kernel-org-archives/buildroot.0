Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1998C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 11:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A9524029B;
	Sun, 13 Nov 2022 11:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A9524029B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rkPSWK43IgrJ; Sun, 13 Nov 2022 11:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EB5A40165;
	Sun, 13 Nov 2022 11:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EB5A40165
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28FC71BF42E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 11:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03825819F3
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 11:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03825819F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jB8i4QdPQzH for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 11:56:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A32F5819ED
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A32F5819ED
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 11:56:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 019AC1814B9; Sun, 13 Nov 2022 12:56:33 +0100 (CET)
In-Reply-To: <20221112213244.161b83fe@windsurf>
Date: Sun, 13 Nov 2022 12:56:33 +0100
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <6cff8-6370db80-5-75c4db80@248833567>
User-Agent: SOGoMail 5.7.1
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1668340594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=6qzvZu4/TiyraOOSBXg7MS0BXab1p9wQPJ+Ner1qCrI=;
 b=t8ehnZ5+E3OcrAVTvI16d1d7BAdRobJS5nEAxjsY6Zn0enZFtFLkzQ7zUPlMmvXXiie3RP
 ThX+m+dXf+LvnhgBWkBSjDmYwVGD9Gj/eottmQDoFiwgcnSmdJ4j5rV5+hbpRWnX1PDh8x
 dKjqQ1yPnLRyBXIE3QvhT6/ycEcXZBI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=t8ehnZ5+
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_v2=5D_package/swupdate=3A__add_li?=
 =?utf-8?q?bubootenv_as_dependency?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Saturday, November 12, 2022 21:32 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Michael,
> 
> On Thu, 10 Nov 2022 11:23:12 +0100
> Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:
> 
> > when using BR2_PER_PACKAGE_DIRECTORIES and configuring swupdate to
> > use uboot the build fails because libubootenv is not a dependency.
> > 
> > Fixes:
> > bootloader/uboot.c:23:10: fatal error: libuboot.h: No such file or directory
> >    23 | #include <libuboot.h>
> > 
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> Could you provide a bit more details? Your change is only making sure
> libubootenv is built before swupdate *if* libubootenv is eanbled in the
> Buildroot configuration. This would mean libubootenv is an optional
> dependency of swupdate.
> 
> But your commit log seems to imply otherwise.

(I just noticed this is also broken when building without PPD if libubootenv is not accidentially built before swupdate)

swupdate has many optional dependencies like libgpiod, libcurl, zstd, zlib (see it's Config.in description).
All off them are not configurable from the buildroot kconfig but from the swupdate config
(see make swupdate-menuconfig). So for all other mentioned optional dependencies there is already
the "if available depend on it" switch set but not for libubootenv.

(Interestingly most of the other dependencies also have a "HAVE_*" configure flag when building swupdate.
For libubootenv I didn't see one.)

To reproduce you just need to add 

CONFIG_UBOOT=y
CONFIG_BOOTLOADER_DEFAULT_NONE=y

to package/swupdate/swupdate.config an try to build swupdate.

> 
> We are not seeing any build errors on swupdate in our autobuilders.
> Could you provide an example Buildroot configuration that exhibits the
> issue?

Are the autobuilders trying different swupdate-defconfigs? Then this should turn up...

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
