Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590ACC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 18:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B5B8607AF;
	Sat, 15 Jun 2024 18:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7czf-lob5F0o; Sat, 15 Jun 2024 18:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C699607C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C699607C6;
	Sat, 15 Jun 2024 18:36:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BA041BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56DD1834D5
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1LbrjOX3GRV for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 18:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79D2C8347D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79D2C8347D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79D2C8347D
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 18:36:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30D4FC0002;
 Sat, 15 Jun 2024 18:36:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sIYG4-000ikj-1m;
 Sat, 15 Jun 2024 20:36:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240510073213.806802-1-roy.kollen.svendsen@akersolutions.com>
 <8da659ac-9fc1-4c27-9e78-c6e6d4171177@mind.be>
Date: Sat, 15 Jun 2024 20:36:12 +0200
In-Reply-To: <8da659ac-9fc1-4c27-9e78-c6e6d4171177@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Thu, 6 Jun 2024 20:56:09
 +0200")
Message-ID: <87le36qcir.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/qt6base: avoid enabling both
 desktop and es2 opengl
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 10/05/2024 09:32, Roy Kollen Svendsen wrote:
 >> Fixes the following error:
 >> ERROR: Feature "opengles2": Forcing to "ON" breaks its condition:
 >> NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_opengl_desktop AND GLESv2_FOUND
 >> Condition values dump:
 >> WIN32 = ""
 >> WATCHOS = "0"
 >> QT_FEATURE_opengl_desktop = "ON"
 >> GLESv2_FOUND = "TRUE"
 >> CMake Error at cmake/QtBuildInformation.cmake:209 (message):
 >> Check the configuration messages for an error that has occurred.
 >> Call Stack (most recent call first):
 >> cmake/QtBuildInformation.cmake:39 (qt_configure_print_summary)
 >> cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summary)
 >> CMakeLists.txt:208 (qt_build_repo_end)
 >> To recreate the error, use the following defconfig (based on
 >> freescale_imx8mmevk_defconfig):
 >> 

 > [snip]

 >  You could have made that a little bit smaller :-)

 >> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

 >  This doesn't match your Author line. Was it committed with your
 >  akersolutions address on your side? Normally, git send-email should
 >  insert a From line if it then sends with a different From address and
 > you wouldn't have this issue...

 >  Anyway, I fixed it up (changed the Author) and applied to master, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
