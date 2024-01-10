Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5D1C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 19:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A197C43677;
	Wed, 10 Jan 2024 19:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A197C43677
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BFxweRGcMu2J; Wed, 10 Jan 2024 19:37:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C84E43731;
	Wed, 10 Jan 2024 19:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C84E43731
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40E631BF296
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14D6743731
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 19:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14D6743731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bvTw2mFBVSGF for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 19:37:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7CA843677
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 19:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7CA843677
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDEB160003;
 Wed, 10 Jan 2024 19:37:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNeOU-008kGy-2y;
 Wed, 10 Jan 2024 20:37:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20231228203217.4C7EC81840@busybox.osuosl.org>
Date: Wed, 10 Jan 2024 20:37:42 +0100
In-Reply-To: <20231228203217.4C7EC81840@busybox.osuosl.org> (Yann E. MORIN's
 message of "Thu, 28 Dec 2023 21:31:42 +0100")
Message-ID: <87edepasjd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/qt6base: remove
 $(TARGET_DIR)/usr/mkspecs in target-finalize
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=e29fcde4ba70ce2259824b3b7dd807b2195baefa
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > qt6base installs things in /usr/mkspecs, but also the soon to be added
 > qt6core5compat, and the existing package qwt as well.

 > So let's move the removal of /usr/mkspecs in target-finalize, where we
 > already remove lots of development-related directories, using a
 > target-finalize hook in the qt6base package.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > [yann.morin.1998@free.fr: make it a qt6base target-finalize hook]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 >  package/qt6/qt6base/qt6base.mk | 5 +++++
 >  package/qwt/qwt.mk             | 1 -
 >  2 files changed, 5 insertions(+), 1 deletion(-)

 > diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
 > index c32089f551..67c705fb93 100644
 > --- a/package/qt6/qt6base/qt6base.mk
 > +++ b/package/qt6/qt6base/qt6base.mk
 > @@ -366,5 +366,10 @@ else
 >  QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
 >  endif
 
 > +define QT6BASE_RM_USR_MKSPECS
 > +	$(Q)rm -rf $(TARGET_DIR)/usr/mkspecs
 > +endef
 > +QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
 > +
 >  $(eval $(cmake-package))
 >  $(eval $(host-cmake-package))
 > diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
 > index 9f0b78655f..f344ca4e3a 100644
 > --- a/package/qwt/qwt.mk
 > +++ b/package/qwt/qwt.mk
 > @@ -58,7 +58,6 @@ endef
 
 >  define QWT_INSTALL_TARGET_CMDS
 >  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
 > -	rm -Rf $(TARGET_DIR)/usr/mkspecs

Hmm, qwt is a qt5 package, so this looks odd?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
