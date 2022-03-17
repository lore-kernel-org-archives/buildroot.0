Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911EAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 19:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D2EE40343;
	Thu, 17 Mar 2022 19:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "To"
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIlA4wCtdJ0F; Thu, 17 Mar 2022 19:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CE7440209;
	Thu, 17 Mar 2022 19:23:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51E801BF343
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 19:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40F374109B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 19:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "To"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sPC6YJb6dp5H for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 19:23:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ruschival.de (mail.rolf-dv.de [168.119.71.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6300E4030C
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 19:23:07 +0000 (UTC)
Received: from i59f4b8c5.versanet.de ([89.244.184.197] helo=VillaStraylight)
 by rolf-dv.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <thomas@ruschival.de>)
 id 1nUviB-00027q-EH; Thu, 17 Mar 2022 20:23:03 +0100
User-agent: mu4e 1.4.15; emacs 27.1
From: Thomas Ruschival <thomas@ruschival.de>
To: buildroot@buildroot.org
To: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Mar 2022 20:23:01 +0100
Message-ID: <8735jgs7sa.fsf@ruschival.de>
MIME-Version: 1.0
Subject: [Buildroot] RFC: Patch "Gallium VC4 driver depends on NEON"?
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
Reply-To: thomas@ruschival.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, 

the Patch "package/mesa3d: Gallium VC4 driver depends on NEON"
commit a5cdb54ed78b136c83dd44aebfa27f715cda5ea3 prevents using VC4 and
hence OpenGL on Raspberry Pi Zero.

From the referenced autobuild logs I gathered that the build that failed
used the bootlin-armv5-uclibc toolchain.

Since I wanted to use OpenGL for Qt on a Raspberry Pi Zero I reverted
the commit. The package compiled without errors and the system works as
expected.  Since my build is using a buildroot toolchain
arm-buildroot-linux-gnueabihf (gcc 10, glibc) I guess the assembler
errors are due to the toolchain.

I am not sure how to proceed in this case.

Should I investigate further on a more elaborate dependency logic to
allow for usage of VC4 on Raspberry Pi Zero that doesn't break
autobuild with bootlin-armv5-uclibc?

Best regards
Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
