Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A4AC25B50
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 21:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 493708205B;
	Mon, 23 Jan 2023 21:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 493708205B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2g_mZg5M22W; Mon, 23 Jan 2023 21:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D10382050;
	Mon, 23 Jan 2023 21:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D10382050
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3AC1BF342
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 21:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55745416FC
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 21:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55745416FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zhib7H25fnRA for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 21:37:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43E1B416E9
 for <buildroot@uclibc.org>; Mon, 23 Jan 2023 21:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E1B416E9
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 2D3CA87C39; Mon, 23 Jan 2023 21:37:14 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 23 Jan 2023 21:37:13 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.11
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: himaralonso+buildroot@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15281-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15281] New: Error compiling GDAL library for
 RPi-64 if libgdal-dev installed on the host computer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15281

            Bug ID: 15281
           Summary: Error compiling GDAL library for RPi-64 if libgdal-dev
                    installed on the host computer
           Product: buildroot
           Version: 2022.11
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: himaralonso+buildroot@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

I get a compiler error when Buildroot tries to compile "tigerpoint.cpp" from
the GDAL package if the "libgdal-dev" package is installed on the host computer
(Ubuntu 22.04 x86_64).

I am using the default configuration for Raspberry Pi CM4IO 64 bits; the "gdal"
library is the only extra package I am adding.

This is the sequence to reproduce the error:
$ git clone https://github.com/buildroot/buildroot.git -b 2022.11.1
$ cd buildroot
$ make raspberrypicm4io_64_defconfig
$ make menuconfig
#  Add: Target packages / Libraries / Other / gdal (BR2_PACKAGE_GDAL=y)
$ make

The error message does not give any clues:
make[1]: *** [package/pkg-generic.mk:293:
/home/user/rpitest/buildroot/output/build/gdal-3.5.1/.stamp_built] Error 2
make: *** [Makefile:84: _all] Error 2

The same error happens on different computers, all running the same Ubuntu
version. I have also tried using an external toolchain (Bootlin
aarch64--musl--stable-2021.11-1) and I get the same result.

The only way out seems to be removing "libgdal-dev" on the host computer along
with its dependencies (note the apt autoremove line below) and a running a
clean rebuild as follows:
$ sudo apt purge libgdal-dev
$ sudo apt autoremove
$ make gdal-dirclean
$ make gdal

Given my lack of experience and the little amount of information from the error
message I am unable to figure out where the problem could be. There seems to be
some conflict between the GDAL library installed on my computer and the one
downloaded by Buildroot. I might have made a mistake but I would just not
expect Buildroot to look for (e.g.) include paths out of the "buildroot"
folder.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
