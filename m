Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9752CC4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5193441E1F;
	Sat,  3 Feb 2024 18:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5193441E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6VxyouRlY0S; Sat,  3 Feb 2024 18:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA7741B77;
	Sat,  3 Feb 2024 18:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA7741B77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE3971BF5B5
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA52C40104
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lRYXp6xTUiw for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A73D2400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A73D2400E4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A73D2400E4
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:09:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CD15E0005;
 Sat,  3 Feb 2024 12:09:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWEpn-009Obs-2N;
 Sat, 03 Feb 2024 13:09:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
 <20240117225049.28443-9-adam.duskett@amarulasolutions.com>
 <Zaw_PDsLArK-KQj-@landeda>
Date: Sat, 03 Feb 2024 13:09:23 +0100
In-Reply-To: <Zaw_PDsLArK-KQj-@landeda> (Yann E. MORIN's message of "Sat, 20
 Jan 2024 22:46:36 +0100")
Message-ID: <87wmrlsqa4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 08/10] package/flutter-gallery: add a
 configure step
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Adam, All,
 > On 2024-01-17 15:50 -0700, Adam Duskett spake thusly:
 >> To make the next patch easier to understand, add a configure step to the
 >> flutter-gallery.mk file. The `$(HOST_FLUTTER_SDK_BIN_FLUTTER) build bundle`
 >> command is placed in the configure step because it generates several files
 >> needed for the flutter_gen_snapshot tool to generate the target .so file.
 >> 
 >> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 >> ---
 >> package/flutter-gallery/flutter-gallery.mk | 11 ++++++++---
 >> 1 file changed, 8 insertions(+), 3 deletions(-)
 >> 
 >> diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
 >> index 57a476b1ab..50ddd9ffba 100644
 >> --- a/package/flutter-gallery/flutter-gallery.mk
 >> +++ b/package/flutter-gallery/flutter-gallery.mk
 >> @@ -14,12 +14,17 @@ FLUTTER_GALLERY_DEPENDENCIES = \
 >> 
 >> FLUTTER_GALLERY_INSTALL_DIR = $(TARGET_DIR)/usr/share/flutter/gallery/$(FLUTTER_ENGINE_RUNTIME_MODE)
 >> 
 >> -define FLUTTER_GALLERY_BUILD_CMDS
 >> +define FLUTTER_GALLERY_CONFIGURE_CMDS
 >> cd $(@D) && \
 >> FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
 >> $(HOST_FLUTTER_SDK_BIN_FLUTTER) clean && \
 >> -		$(HOST_FLUTTER_SDK_BIN_FLUTTER) packages get && \
 >> +		$(HOST_FLUTTER_SDK_BIN_FLUTTER) pub get && \

 > As disucssed on IRC< that belonged to a spearate patch, so I split this
 > patch int two, and applied to master, thanks.

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
