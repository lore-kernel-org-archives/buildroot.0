Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517FEC433EF
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 18:30:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F54260F24
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 18:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F54260F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6589A605D5;
	Mon,  1 Nov 2021 18:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxY4ve-WF8ke; Mon,  1 Nov 2021 18:30:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8D0C605DB;
	Mon,  1 Nov 2021 18:30:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31F9D1BF2FD
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 18:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21C9840240
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 18:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0lUWEmEaZBY for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 18:30:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 502BB4023D
 for <buildroot@uclibc.org>; Mon,  1 Nov 2021 18:30:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 9005887499; Mon,  1 Nov 2021 18:27:17 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 01 Nov 2021 18:30:53 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: ingineru_de_sistem@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14311-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14311] New: Cannot compile dahdi (part of
 Asterisk) for x86 (P1mmx).
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

https://bugs.busybox.net/show_bug.cgi?id=14311

            Bug ID: 14311
           Summary: Cannot compile dahdi (part of Asterisk) for x86
                    (P1mmx).
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: ingineru_de_sistem@yahoo.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Tried to compile Asterisk for x86 (got an old PC which is the only one which I
can use for some older ZAPtel cards that need PCI without express).

1st bug got this - 
In file included from
/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/wctdm24xxp/base.c:73:
/home/qa/buildroot/output/build/dahdi-linux-3.0.0/include/dahdi/kernel.h:71:10:
fatal error: linux/pci-aspm.h: No such file or directory
   71 | #include <linux/pci-aspm.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.

Found a possible solution at
https://community.asterisk.org/t/dahdi-fails-fatal-error-linux-pci-aspm-h-no-such-file-or-directory/83561
, applied 
git clone -b next git://git.asterisk.org/dahdi/linux dahdi-linux 
on top of the one that buildroot downloaded, got past that point but now I get
this one:

ERROR: modpost: "__divmoddi4"
[/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/xpp/xpp.ko]
undefined!
ERROR: modpost: "__divdi3"
[/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/xpp/xpp.ko]
undefined!
ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_start"
[/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/wcaxx.ko]
undefined!
ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_size"
[/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/wcaxx.ko]
undefined!
ERROR: modpost: "_binary_dahdi_fw_oct6114_128_bin_start"
[/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/wcte43x.ko]
undefined!
ERROR: modpost: "_binary_dahdi_fw_oct6114_064_bin_start"
[/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/wcte43x.ko]
undefined!
ERROR: modpost: "_binary_dahdi_fw_oct6114_128_bin_size"
[/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/wcte43x.ko]
undefined!
ERROR: modpost: "_binary_dahdi_fw_oct6114_064_bin_size"
[/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/wcte43x.ko]
undefined!
ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_start"
[/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/wcte13xp.ko]
undefined!
ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_size"
[/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/wcte13xp.ko]
undefined!
make[3]: *** [scripts/Makefile.modpost:150:
/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/Module.symvers]
Error 1
make[3]: *** Deleting file
'/home/qa/buildroot/output/build/dahdi-linux-3.0.0/drivers/dahdi/Module.symvers'
make[2]: *** [Makefile:1773: modules] Error 2
make[1]: *** [package/pkg-generic.mk:295:
/home/qa/buildroot/output/build/dahdi-linux-3.0.0/.stamp_built] Error 2
make: *** [Makefile:84: _all] Error 2

Not sure if the patch for the first error provoked the next or what.

Please advise.

Question 2) Can one selectively only compile the Asterisk HW drivers for the
current plaform and a selection of boards ? (i.e. don't try pci express or x64
stuff when compiling for x86_32 nor the Octasic boards since all I have and
need are some old Zaptel PCI boards, including a T1000P compatible - aka
ancient Intel WinModem)



P.S. there was a trivial error before that point:
--2021-10-29 15:34:29--  http://sources.buildroot.net/m4-1.4.19.tar.xz
Resolving sources.buildroot.net (sources.buildroot.net)... 172.67.72.56,
104.26.1.37, 104.26.0.37, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|172.67.72.56|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2021-10-29 15:34:29 ERROR 404: Not Found.

which I solved by using 1.4.18 instead which did exist on your server. No
biggie there, just reporting it in case anyone needs the report. Feel free to
ignore this one. The dahdi part is important.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
