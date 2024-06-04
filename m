Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741D4C25B75
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 00:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D6814034F;
	Tue,  4 Jun 2024 00:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiV5kKBS0TFr; Tue,  4 Jun 2024 00:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C322E40302
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C322E40302;
	Tue,  4 Jun 2024 00:18:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBFB91BF868
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 00:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4A6D40302
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 00:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XbS4XxYia7T for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 00:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 894C8402E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 894C8402E1
 for <buildroot@uclibc.org>; Tue,  4 Jun 2024 00:18:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 728048755E; Tue,  4 Jun 2024 00:18:50 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 04 Jun 2024 00:18:49 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Outdated package
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: rmderbes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-16090-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16090] New: Buildroot-2024-02-2 error building
 libffi
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

https://bugs.busybox.net/show_bug.cgi?id=16090

            Bug ID: 16090
           Summary: Buildroot-2024-02-2 error building libffi
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Outdated package
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: rmderbes@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

When trying to build root image for zynq target, it throws this error:
....
../src/tramp.c: In function 'ffi_tramp_get_temp_file':
../src/tramp.c:262:22: error: implicit declaration of function
'open_temp_exec_file' [-Wimplicit-function-declaration]
  262 |   tramp_globals.fd = open_temp_exec_file ();
....
Host OS: Fedora 40
Kernel: 6.8.10-300.fc40.x86_64
gcc : version 14.1.1 20240522 (Red Hat 14.1.1-4) (GCC)

Problem: libffi-3.4.4 does not compile with gcc > 14.

Solution: 
1) Edit buildroot-2024.02.2/package/libffi/libffi.mk and change libffi version
LIBFFI_VERSION = 3.4.6

2) Edit buildroot-2024.02.2/package/libffi/libffi.hash and change hashes:
# For libffi-3.4.6.tar.gz
sha256  b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a4e 
libffi-3.4.6.tar.gz
sha256  67894089811f93fca47a76f85e017da6f8582d4ba0905963c6e0f1ad6df7a195 
LICENSE

I have tried it only for zynq target, but I assume that this fix works for all
targets that compile libffi and all systems  where GCC > 14
Regards

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
