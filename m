Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C174C47258
	for <buildroot@archiver.kernel.org>; Thu, 25 Jan 2024 21:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BDF14ED26;
	Thu, 25 Jan 2024 21:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BDF14ED26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mhu7JvVK1XbJ; Thu, 25 Jan 2024 21:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4931B42E93;
	Thu, 25 Jan 2024 21:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4931B42E93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A0DE1BF5DA
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 21:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81E0E4B3D5
 for <buildroot@lists.busybox.net>; Thu, 25 Jan 2024 21:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81E0E4B3D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXcOlHlj-ila for <buildroot@lists.busybox.net>;
 Thu, 25 Jan 2024 21:13:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DB0A42C6C
 for <buildroot@buildroot.org>; Thu, 25 Jan 2024 21:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DB0A42C6C
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2AF740002;
 Thu, 25 Jan 2024 21:11:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rT70d-006HsO-0G;
 Thu, 25 Jan 2024 22:11:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20240125144121.1534299-1-aperez@igalia.com>
Date: Thu, 25 Jan 2024 22:11:39 +0100
In-Reply-To: <20240125144121.1534299-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Thu, 25 Jan 2024 16:41:17 +0200")
Message-ID: <8734ul6ruc.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libwpe: switch back to version
 1.14.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > The versioning scheme for libwpe uses the middle version number to
 > indicate stability: an even number for stable releases, odd for
 > development preview releases. As such, Buildroot should be using
 > version 1.14.2, which is the most recent of the stable releases.
 > While at it, add a note in the .mk file about the versioning scheme.

Hmm, this was bumped back in July before 2023.08-rc1. Is there no 1.16.x
version coming?

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 > ---
 >  package/libwpe/libwpe.hash | 6 +++---
 >  package/libwpe/libwpe.mk   | 3 ++-
 >  2 files changed, 5 insertions(+), 4 deletions(-)

 > diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
 > index 226b4f3295..554b1f2b0e 100644
 > --- a/package/libwpe/libwpe.hash
 > +++ b/package/libwpe/libwpe.hash
 > @@ -1,6 +1,6 @@
 > -# From https://wpewebkit.org/releases/libwpe-1.15.1.tar.xz.sums
 > -sha1  0082ceb475175bfecd1172f2c0b292824d31561b  libwpe-1.15.1.tar.xz
 > -sha256  14d36a93a05ab7ada9bec581720b8057336fe681bbbe59bda7d50cb8f3eba3a6  libwpe-1.15.1.tar.xz
 > +# From https://wpewebkit.org/releases/libwpe-1.14.2.tar.xz.sums
 > +sha1  70a2b894af2b50d7082260158a89524974a480f3  libwpe-1.14.2.tar.xz
 > +sha256  8ae38022c50cb340c96fdbee1217f1e46ab57fbc1c8ba98142565abbedbe22ef  libwpe-1.14.2.tar.xz
 
 >  # Hashes for license files:
 >  sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
 > diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
 > index f8c6b0fc76..1fbdd5fcc3 100644
 > --- a/package/libwpe/libwpe.mk
 > +++ b/package/libwpe/libwpe.mk
 > @@ -4,7 +4,8 @@
 >  #
 >  ################################################################################
 
 > -LIBWPE_VERSION = 1.15.1
 > +# The middle number is even for stable releases, odd for development ones.
 > +LIBWPE_VERSION = 1.14.2
 >  LIBWPE_SITE = https://wpewebkit.org/releases
 >  LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 >  LIBWPE_INSTALL_STAGING = YES
 > -- 

 > 2.43.0

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
