Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048FFC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63D92402F2;
	Sun,  4 Feb 2024 21:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63D92402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhONU2V6RQzH; Sun,  4 Feb 2024 21:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E63840420;
	Sun,  4 Feb 2024 21:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E63840420
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 679671BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47F9540420
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47F9540420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysKqAgRxC6hQ for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:32:32 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AE4B402F2
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AE4B402F2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76F1020003;
 Sun,  4 Feb 2024 21:32:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWk6H-00A5Dp-1f;
 Sun, 04 Feb 2024 22:32:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
 <20240123190035.904936-2-adam.duskett@amarulasolutions.com>
Date: Sun, 04 Feb 2024 22:32:29 +0100
In-Reply-To: <20240123190035.904936-2-adam.duskett@amarulasolutions.com> (Adam
 Duskett's message of "Tue, 23 Jan 2024 12:00:33 -0700")
Message-ID: <875xz3x6du.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/3] package/flutter-pi: remove libgles
 requirement for gstreamer audio plugin
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

>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:

 > package/flutter-pi: remove libgles requirement for gstreamer audio plugin
 > I erroneously added the dependency BR2_PACKAGE_HAS_LIBGLES for the gstreamer
 > audio player plugin, and the CMakeLists.txt file does not check for gles2 when
 > the plugin is selected. This error was likely due to a copy/paste mistake.
 > Remove the requirement.

 > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
