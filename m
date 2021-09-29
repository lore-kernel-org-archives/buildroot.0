Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EC3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 15:05:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C53613A6
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 15:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0C53613A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A74794071B;
	Wed, 29 Sep 2021 15:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pv2WI_N3Enm2; Wed, 29 Sep 2021 15:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAADD40709;
	Wed, 29 Sep 2021 15:05:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D02D01BF21A
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 15:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCA9C80F3A
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 15:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id at99gRIc9_E3 for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 15:05:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A70D380F38
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 15:05:23 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id DE0BD60004;
 Wed, 29 Sep 2021 15:05:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mVb95-0000yo-0d; Wed, 29 Sep 2021 17:05:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210913210412.24042-1-ps.report@gmx.net>
 <20210918160034.GE1053080@scaer>
Date: Wed, 29 Sep 2021 17:05:18 +0200
In-Reply-To: <20210918160034.GE1053080@scaer> (Yann E. MORIN's message of
 "Sat, 18 Sep 2021 18:00:34 +0200")
Message-ID: <87y27fmngx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 00/13] GStreamer 1.18.5 stable bug fix
 release
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2021-09-13 23:03 +0200, Peter Seiderer spake thusly:
 >> GStreamer 1.18.5 stable bug fix release
 >> 
 >> For details see [1].
 >> 
 >> [1] https://gstreamer.freedesktop.org/releases/1.18/#1.18.5
 >> 
 >> Peter Seiderer (13):
 >> package/gstreamer1: bump version to 1.18.5
 >> package/gst1-plugins-base: bump version to 1.18.5
 >> package/gst1-plugins-good: bump version to 1.18.5
 >> package/gst1-plugins-bad: bump version to 1.18.5
 >> package/gst1-plugins-ugly: bump version to 1.18.5
 >> package/gst1-devtools: bump version to 1.18.5
 >> package/gst1-libav: bump version to 1.18.5
 >> package/gst1-vaapi: bump version to 1.18.5
 >> package/gst1-rtsp-server: bump version to 1.18.5
 >> package/gstreamer1-editing-services: bump version to 1.18.5
 >> package/gst-omx: bump version to 1.18.5
 >> package/gst1-python: bump version to 1.18.5
 >> package/gst1-interpipe: bump version to 1.1.5

 > Whole series applied to master, thanks.

Committed series to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
