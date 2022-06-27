Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258C2C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 20:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1EC960E4B;
	Mon, 27 Jun 2022 20:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1EC960E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvmwECw4kmVH; Mon, 27 Jun 2022 20:53:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB6260D6E;
	Mon, 27 Jun 2022 20:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCB6260D6E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B33E1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3596A60D6E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3596A60D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kMhstd1nkTj for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 20:53:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E524B605A2
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E524B605A2
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 20:53:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BD001200004;
 Mon, 27 Jun 2022 20:53:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o5vju-00D1eo-Rc; Mon, 27 Jun 2022 22:53:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
 <20220627053422.618280-3-james.hilliard1@gmail.com>
Date: Mon, 27 Jun 2022 22:53:46 +0200
In-Reply-To: <20220627053422.618280-3-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sun, 26 Jun 2022 23:34:13 -0600")
Message-ID: <87pmitygit.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 03/12] package/gst1-plugins-good: bump
 version to 1.20.3
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

The changelog clearly lists a number of security fixes, so I have
extended the commit message and marked this as a security fix:

https://gstreamer.freedesktop.org/releases/1.20/#1.20.3

> ---
 >  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 >  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
 > index cccd07dd2d..81da41388f 100644
 > --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
 > +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
 > @@ -1,3 +1,3 @@
 > -# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.1.tar.xz.sha256sum
 > -sha256  3c66876f821d507bcdbebffb08b4f31a322727d6753f65a0f02c905ecb7084aa  gst-plugins-good-1.20.1.tar.xz
 > +# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.3.tar.xz.sha256sum
 > +sha256  f8f3c206bf5cdabc00953920b47b3575af0ef15e9f871c0b6966f6d0aa5868b7  gst-plugins-good-1.20.3.tar.xz
 >  sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
 > diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
 > index 2b6cf769aa..61ffc7b989 100644
 > --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
 > +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -GST1_PLUGINS_GOOD_VERSION = 1.20.1
 > +GST1_PLUGINS_GOOD_VERSION = 1.20.3
 >  GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 >  GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 >  GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
 > -- 

 > 2.34.1

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
