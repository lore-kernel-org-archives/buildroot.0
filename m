Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8539C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:18:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0954560F41
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0954560F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C79407A6;
	Wed,  6 Oct 2021 15:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id carpngT7bZLo; Wed,  6 Oct 2021 15:18:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4477B406A3;
	Wed,  6 Oct 2021 15:18:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AA721BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A4F483F94
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xzuGyNmGoj-D for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:18:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C41783F8F
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:18:07 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5819224000E;
 Wed,  6 Oct 2021 15:18:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mY8gD-0001KR-Gx; Wed, 06 Oct 2021 17:18:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20211001103417.1078082-1-aperez@igalia.com>
Date: Wed, 06 Oct 2021 17:18:01 +0200
In-Reply-To: <20211001103417.1078082-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Fri, 1 Oct 2021 13:34:17 +0300")
Message-ID: <87fste5gie.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: remove
 gst1-plugins-good from dependencies
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

 > This is only a runtime dependency, not a build dependency.
 > Based on a similar patch by James Hilliard for the wpewebkit
 > package.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 > ---
 >  package/webkitgtk/webkitgtk.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
 > index 6687d7f61b..87aeffea45 100644
 > --- a/package/webkitgtk/webkitgtk.mk
 > +++ b/package/webkitgtk/webkitgtk.mk
 > @@ -46,7 +46,7 @@ ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
 >  WEBKITGTK_CONF_OPTS += \
 >  	-DENABLE_VIDEO=ON \
 >  	-DENABLE_WEB_AUDIO=ON
 > -WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
 > +WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base

NIT: we normally add a # runtime comment to the select line in Config.in
then to make it clear why it isn't listed in _DEPENDENCIES.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
