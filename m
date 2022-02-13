Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99917C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EAD260706;
	Sun, 13 Feb 2022 11:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4sKdSHsRGzs8; Sun, 13 Feb 2022 11:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52D3E60671;
	Sun, 13 Feb 2022 11:43:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF9EF1BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE8DA605A6
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ka7PRv6hgWaj for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:43:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C603160597
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:43:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E5165C0002;
 Sun, 13 Feb 2022 11:43:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nJDI9-0004hJ-QT; Sun, 13 Feb 2022 12:43:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
Date: Sun, 13 Feb 2022 12:43:45 +0100
In-Reply-To: <20220205201837.3324085-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sat, 5 Feb 2022 13:18:30 -0700")
Message-ID: <87wnhzkn4e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v6 1/8] package/webp: enable host build
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>,
 =?utf-8?Q?Ga=C3=ABl?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > This will be needed by qt5webengine.
 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 >  package/webp/webp.mk | 5 +++++
 >  1 file changed, 5 insertions(+)

 > diff --git a/package/webp/webp.mk b/package/webp/webp.mk
 > index d1462426c6..7c2625df23 100644
 > --- a/package/webp/webp.mk
 > +++ b/package/webp/webp.mk
 > @@ -19,6 +19,10 @@ WEBP_CONF_OPTS += \
 >  	--with-tiffincludedir=$(STAGING_DIR)/usr/include \
 >  	--with-tifflibdir=$(STAGING_DIR)/usr/lib
 
 > +HOST_WEBP_CONF_OPTS += \
 > +	--enable-libwebpdemux \
 > +	--enable-libwebpmux

What about the other configure options? It should also explicitly
disable gif/gl/png/jpeg/tiff support (unless you need it?)

Committed with that fixed, thanks. I also pushed a cleanup patch to use
--enable/--disable for png/jpeg/tiff for the target build.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
