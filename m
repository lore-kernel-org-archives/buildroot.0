Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF87DC6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 16:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E6C661AEC;
	Fri, 17 Mar 2023 16:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E6C661AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtpUZY9eMtOR; Fri, 17 Mar 2023 16:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92EEB61AD4;
	Fri, 17 Mar 2023 16:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92EEB61AD4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3A6F1BF33E
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 16:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC08C82261
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 16:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC08C82261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3K4JYvzrs7X for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 16:49:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C960C8225F
 for <buildroot@uclibc.org>; Fri, 17 Mar 2023 16:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C960C8225F
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id B60E186E7A; Fri, 17 Mar 2023 16:49:43 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 17 Mar 2023 16:49:43 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jbglaw@lug-owl.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15421-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15421] New: qemu_aarch64_ebbr_defconfig: Missing
 Linux kernel source code
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

https://bugs.busybox.net/show_bug.cgi?id=15421

            Bug ID: 15421
           Summary: qemu_aarch64_ebbr_defconfig: Missing Linux kernel
                    source code
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: jbglaw@lug-owl.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi!

This configuration fails to find its kernel source code:

[build 2023-03-15 14:12:12] >>> linux-headers 6.0.6 Downloading
[build 2023-03-15 14:12:12] mkdir -p
/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/dl/linux
[build 2023-03-15 14:12:12]
PATH="/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/output/host/bin:/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/lib/laminar/cfg/scripts"
BR2_DL_DIR="/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/dl"
BUILD_DIR=/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/output/build
CONFIG_DIR=/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot
O=/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/output
 flock
/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/dl/linux/.lock
support/download/dl-wrapper -c '6.0.6' -d
'/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/dl/linux'
-D '/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/dl'
-f 'linux-6.0.6.tar.xz' -H 'package/linux-headers//linux-headers.hash' -n
'linux-headers-6.0.6' -N 'linux-headers' -o
'/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/dl/linux/linux-6.0.6.tar.xz'
  -u https+https://cdn.kernel.org/pub/linux/kernel/v6.x -u
http\|urlencode+http://sources.buildroot.net/linux -u
http\|urlencode+http://sources.buildroot.net   -- 
[build 2023-03-15 14:12:12] wget --passive-ftp -nd -t 3 -O
'/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/output/build/.linux-6.0.6.tar.xz.QVm6Kd/output'
'https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.0.6.tar.xz' 
[build 2023-03-15 14:12:12] --2023-03-15 14:12:12-- 
https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.0.6.tar.xz
[build 2023-03-15 14:12:12] Resolving cdn.kernel.org (cdn.kernel.org)...
151.101.37.176
[build 2023-03-15 14:12:12] Connecting to cdn.kernel.org
(cdn.kernel.org)|151.101.37.176|:443... connected.
[build 2023-03-15 14:12:28] HTTP request sent, awaiting response... 503 Backend
unavailable, connection timeout
[build 2023-03-15 14:12:28] 2023-03-15 14:12:28 ERROR 503: Backend unavailable,
connection timeout.
[build 2023-03-15 14:12:28] 
[build 2023-03-15 14:12:28] wget --passive-ftp -nd -t 3 -O
'/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/output/build/.linux-6.0.6.tar.xz.x0EFit/output'
'http://sources.buildroot.net/linux/linux-6.0.6.tar.xz' 
[build 2023-03-15 14:12:28] --2023-03-15 14:12:28-- 
http://sources.buildroot.net/linux/linux-6.0.6.tar.xz
[build 2023-03-15 14:12:28] Resolving sources.buildroot.net
(sources.buildroot.net)... 104.26.0.37, 172.67.72.56, 104.26.1.37
[build 2023-03-15 14:12:28] Connecting to sources.buildroot.net
(sources.buildroot.net)|104.26.0.37|:80... connected.
[build 2023-03-15 14:12:29] HTTP request sent, awaiting response... 404 Not
Found
[build 2023-03-15 14:12:29] 2023-03-15 14:12:29 ERROR 404: Not Found.
[build 2023-03-15 14:12:29] 
[build 2023-03-15 14:12:29] wget --passive-ftp -nd -t 3 -O
'/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/output/build/.linux-6.0.6.tar.xz.WSWS8f/output'
'http://sources.buildroot.net/linux-6.0.6.tar.xz' 
[build 2023-03-15 14:12:29] --2023-03-15 14:12:29-- 
http://sources.buildroot.net/linux-6.0.6.tar.xz
[build 2023-03-15 14:12:29] Resolving sources.buildroot.net
(sources.buildroot.net)... 172.67.72.56, 104.26.1.37, 104.26.0.37
[build 2023-03-15 14:12:29] Connecting to sources.buildroot.net
(sources.buildroot.net)|172.67.72.56|:80... connected.
[build 2023-03-15 14:12:29] HTTP request sent, awaiting response... 404 Not
Found
[build 2023-03-15 14:12:29] 2023-03-15 14:12:29 ERROR 404: Not Found.
[build 2023-03-15 14:12:29] 
[build 2023-03-15 14:12:29] make: *** [package/pkg-generic.mk:189:
/var/lib/laminar/run/buildroot-qemu_aarch64_ebbr_defconfig/1/buildroot/output/build/linux-headers-6.0.6/.stamp_downloaded]
Error 1


Full build log at
http://toolchain.lug-owl.de/laminar/log/buildroot-qemu_aarch64_ebbr_defconfig/1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
