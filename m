Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DB0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:18:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7835260F6D
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7835260F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 440BA40401;
	Wed,  6 Oct 2021 15:18:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKpVR3eGY88p; Wed,  6 Oct 2021 15:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BE2D403B1;
	Wed,  6 Oct 2021 15:18:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB2B1BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0961E406A3
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzBvVtyYNoyC for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:18:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEA9F407B2
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:18:14 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 34B661BF218;
 Wed,  6 Oct 2021 15:18:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mY8gN-0001Ks-FV; Wed, 06 Oct 2021 17:18:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210924124525.168298-1-james.hilliard1@gmail.com>
 <20211003201527.GX1504958@scaer>
Date: Wed, 06 Oct 2021 17:18:11 +0200
In-Reply-To: <20211003201527.GX1504958@scaer> (Yann E. MORIN's message of
 "Sun, 3 Oct 2021 22:15:27 +0200")
Message-ID: <87bl425gi4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: remove
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Philippe Normand <philn@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > James, All,
 > On 2021-09-24 06:45 -0600, James Hilliard spake thusly:
 >> This is only a runtime dependency not a build dependency.
 >> 
 >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 > Applied to master, thanks.

 > Regards,
 > Yann E. MORIN.

 >> ---
 >> package/wpewebkit/wpewebkit.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)
 >> 
 >> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
 >> index 5c5e6625f8..50714b4366 100644
 >> --- a/package/wpewebkit/wpewebkit.mk
 >> +++ b/package/wpewebkit/wpewebkit.mk
 >> @@ -39,7 +39,7 @@ ifeq ($(BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA),y)
 >> WPEWEBKIT_CONF_OPTS += \
 >> -DENABLE_VIDEO=ON \
 >> -DENABLE_WEB_AUDIO=ON
 >> -WPEWEBKIT_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
 >> +WPEWEBKIT_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base

NIT: we normally add a # runtime comment to the select line in Config.in
then to make it clear why it isn't listed in _DEPENDENCIES.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
