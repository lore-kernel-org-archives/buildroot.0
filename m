Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5645FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85A84845BE;
	Thu, 26 May 2022 08:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-0XzioIIgaH; Thu, 26 May 2022 08:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F2DA84592;
	Thu, 26 May 2022 08:16:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AC0B1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09E39845BC
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_-32kDHIlBJ for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:16:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DD4D82422
 for <buildroot@busybox.net>; Thu, 26 May 2022 08:16:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B4DBE1BF208;
 Thu, 26 May 2022 08:16:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nu8fG-00HIDT-QH; Thu, 26 May 2022 10:16:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20220420072609.3422227-1-francois.perrad@gadz.org>
Date: Thu, 26 May 2022 10:16:14 +0200
In-Reply-To: <20220420072609.3422227-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Wed, 20 Apr 2022 09:26:09 +0200")
Message-ID: <87ilpsso8h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libarchive: bump to version 3.6.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

This fixes security issues, so it should have been marked as a security
bump. From the release notes:

Libarchive 3.6.1 is a bugfix and security release.

Security fixes:

    7zip reader: fix PPMD read beyond boundary (#1671)
    ZIP reader: fix possible out of bounds read (OSS-Fuzz 38766 #1672)
    ISO reader: fix possible heap buffer overflow in read_children() (OSS-Fuzz 38764, #1685)
    RARv4 redaer: fix multiple issues in RARv4 filter code (introduced in libarchive 3.6.0)
        fix heap use after free in archive_read_format_rar_read_data() (OSS-Fuzz 44547, 52efa50)
        fix null dereference in read_data_compressed() (OSS-Fuzz 44843, 1271f77)
        fix heap user after free in run_filters() (OSS-Fuzz 46279, #1715)

https://github.com/libarchive/libarchive/releases/tag/v3.6.1

Committed to 2022.02.x with that fixed, thanks.

> ---
 >  package/libarchive/libarchive.hash | 2 +-
 >  package/libarchive/libarchive.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
 > index 5dd8e5c16..ca580b497 100644
 > --- a/package/libarchive/libarchive.hash
 > +++ b/package/libarchive/libarchive.hash
 > @@ -1,4 +1,4 @@
 >  # From https://www.libarchive.de/downloads/sha256sums
 > -sha256  5cac725dd4be31c4a10b65d30f29dc957ea29ef3d758df6e46e8ae90a996a19a  libarchive-3.5.3.tar.xz
 > +sha256  5a411aceb978f43e626f0c2d1812ddd8807b645ed892453acabd532376c148e6  libarchive-3.6.1.tar.xz
 >  # Locally computed:
 >  sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
 > diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
 > index cf16c27e6..865f605e2 100644
 > --- a/package/libarchive/libarchive.mk
 > +++ b/package/libarchive/libarchive.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LIBARCHIVE_VERSION = 3.5.3
 > +LIBARCHIVE_VERSION = 3.6.1
 >  LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 >  LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 >  LIBARCHIVE_INSTALL_STAGING = YES
 > -- 

 > 2.32.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
