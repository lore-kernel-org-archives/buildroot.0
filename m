Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9E1C6FD18
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 01:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE23A841B4;
	Thu, 30 Mar 2023 01:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE23A841B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NmDgbPetaVZv; Thu, 30 Mar 2023 01:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 382E48412E;
	Thu, 30 Mar 2023 01:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 382E48412E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6691E1BF573
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 01:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C6F340439
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 01:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C6F340439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7-mJxZfemln for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 01:41:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CB3B4011F
 for <buildroot@uclibc.org>; Thu, 30 Mar 2023 01:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CB3B4011F
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 56A6E836C3; Thu, 30 Mar 2023 01:41:42 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 30 Mar 2023 01:41:41 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2020.02.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: simitel@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15506-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15506] New: Failed to login to system with root
 and its password.
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

https://bugs.busybox.net/show_bug.cgi?id=15506

            Bug ID: 15506
           Summary: Failed to login to system with root and its password.
           Product: buildroot
           Version: 2020.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: simitel@163.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

I am working on an emebeded system, where busybox is used as init and shell. 

The rootfs is built on X86 host with buildroot (2020.02.1). The buildroot is
configured as follows,
BR2_TARGET_GENERIC_PASSWD_SHA256=y
# BR2_TARGET_GENERIC_PASSWD_SHA512 is not set
BR2_TARGET_GENERIC_PASSWD_METHOD="sha-256"
BR2_INIT_BUSYBOX=y
......
......
BR2_TARGET_ENABLE_ROOT_LOGIN=y
BR2_TARGET_GENERIC_ROOT_PASSWD="000000"
BR2_SYSTEM_BIN_SH_BUSYBOX=y

During the building of rootfs on the host, it shows following logs,
"/usr/bin/sed -i -e
s,^root:[^:]*:,root:"`/home/t/develop/test/project/out/product/linux_nand_5.10-eng/obj/buildroot-intermediate/host/bin/mkpasswd
-m "sha-256" "000000"`":,
/home/t/develop/test/project/out/product/linux_nand_5.10-eng/obj/buildroot-intermediate/target/etc/shadow
"

When the image and rootfs are deployed into the target board and boot up. I
cannot login to system with 'root' and '000000' from serial console.

Then in adb shell, I regenerated the password of root with `echo root:000000 |
chpasswd -c SHA256`, I can login to the system with 'root' and '000000' from
serial console. 

I don't know if this is a bug and how to make login with password.

Thanks,

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
