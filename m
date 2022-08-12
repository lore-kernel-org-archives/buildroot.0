Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14191C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 15:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AEC760B04;
	Fri, 12 Aug 2022 15:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AEC760B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jNfTxwbVAhRP; Fri, 12 Aug 2022 15:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4AB0607D1;
	Fri, 12 Aug 2022 15:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4AB0607D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8BF1BF40A
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDE2B607D1
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDE2B607D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TABhDlpXv2nS for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 15:05:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AED86605EA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AED86605EA
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 15:05:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 845E824000C;
 Fri, 12 Aug 2022 15:05:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oMWDv-0005XE-Hu; Fri, 12 Aug 2022 17:05:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexandru Ardelean <ardeleanalex@gmail.com>
References: <20220721144939.1265027-1-ardeleanalex@gmail.com>
 <20220722070150.40715-1-ardeleanalex@gmail.com>
Date: Fri, 12 Aug 2022 17:05:19 +0200
In-Reply-To: <20220722070150.40715-1-ardeleanalex@gmail.com> (Alexandru
 Ardelean's message of "Fri, 22 Jul 2022 10:01:50 +0300")
Message-ID: <87k07dijtc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/cog: add libgbm as dependency
 when building with DRM support
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
Cc: aperez@igalia.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Alexandru" == Alexandru Ardelean <ardeleanalex@gmail.com> writes:

 > When building with the DRM support, it can happen that the libgbm library
 > is not yet built by the provider of this lib (specified by
 > BR2_PACKAGE_PROVIDES_LIBGBM).

 > The docs in cog `docs/platform-drm.md` specify this dep-list:
 > - **WPEBackend-fdo**:
 > - **Wayland**:
 > - **libdrm**:
 > - **libgbm**:
 > - **libinput**:
 > - **libudev**:

 > libgbm needs to be added.
 > Adding libegl as well.

 > Updated package/cog/Config.in to define the dependencies (for DRM)
 > according to libegl & libgbm.

 > Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
