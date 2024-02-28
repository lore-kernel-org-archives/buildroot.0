Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A72C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D8C60E3F;
	Wed, 28 Feb 2024 16:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3JmvcyjDfCLj; Wed, 28 Feb 2024 16:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F9A60E76
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F9A60E76;
	Wed, 28 Feb 2024 16:19:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 542921BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E93C40994
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIc_Kl_wcbT5 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:19:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3602A40809
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3602A40809
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3602A40809
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:19:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE1A960009;
 Wed, 28 Feb 2024 16:19:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfMeO-001jD9-0G;
 Wed, 28 Feb 2024 17:19:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20231001165218.1960930-3-thomas.devoogdt@barco.com>
 <20231110164617.569602-1-thomas@devoogdt.com>
 <20231110164617.569602-2-thomas@devoogdt.com>
 <20231114150725.GD1974649@igalia.com>
Date: Wed, 28 Feb 2024 17:19:20 +0100
In-Reply-To: <20231114150725.GD1974649@igalia.com> (Adrian Perez de Castro's
 message of "Tue, 14 Nov 2023 15:07:25 +0200")
Message-ID: <87o7c0pnnb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v5 2/3] package/webkitgtk: select
 wpebackend-fdo if wayland target is enabled
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > On Fri, 10 Nov 2023 17:46:16 +0100 Thomas Devoogdt <thomas@devoogdt.com> wrote:
 >> libwep & wpebackend-fdo are mandatory if ENABLE_WAYLAND_TARGET and EGL_FOUND
 >> https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L388-L400
 >> 
 >> egl is mandatory if ENABLE_WAYLAND_TARGET
 >> https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L462-L473
 >> 
 >> So wpebackend-fdo (-> libwpe) has to be selected if BR2_PACKAGE_LIBGTK3_WAYLAND.
 >> 
 >> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

 > Tested-By: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
