Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCE5C54E5D
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 17:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6430482152;
	Sat, 16 Mar 2024 17:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0klQmoLBcV2; Sat, 16 Mar 2024 17:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 009CB82167
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 009CB82167;
	Sat, 16 Mar 2024 17:27:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5720A1BF2C8
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 17:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42F6582167
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 17:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Vpoz7MXAzkw for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 17:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CCB482140
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CCB482140
 for <buildroot@uclibc.org>; Sat, 16 Mar 2024 17:27:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 04FB4878D0; Sat, 16 Mar 2024 17:27:50 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 16 Mar 2024 17:27:49 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fli4l@franke-prem.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-16000-163-KHY8XJUnlb@https.bugs.busybox.net/>
In-Reply-To: <bug-16000-163@https.bugs.busybox.net/>
References: <bug-16000-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16000] GDB will not build
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

https://bugs.busybox.net/show_bug.cgi?id=16000

--- Comment #1 from Roland Franke <fli4l@franke-prem.de> ---
Here are some additional information:
The host is a x86_64 system. But i will try to cross-compile for a x86_64 but
also for x86 (i586) systems.
Now the build from GDB (Host-GDB) for the x86 (i586) system will still fail
also when i have include the first named patch.
I will get as error:
/home/roland/.fbr/fbr-4.0-test_1_2024-x86/buildroot/output/per-package/gdb/host/bin/../lib/gcc/i586-buildroot-linux-uclibc/13.2.0/../../../../i586-buildroot-linux-uclibc/bin/ld:
../gdbsupport/libgdbsupport.a(common-exceptions.o): non-canonical reference to
canonical protected function `__pthread_key_create' in
/home/roland/.fbr/fbr-4.0-test_1_2024-x86/buildroot/output/per-package/gdb/host/i586-buildroot-linux-uclibc/sysroot/lib/libc.so.1
/home/roland/.fbr/fbr-4.0-test_1_2024-x86/buildroot/output/per-package/gdb/host/bin/../lib/gcc/i586-buildroot-linux-uclibc/13.2.0/../../../../i586-buildroot-linux-uclibc/bin/ld:
failed to set dynamic section sizes: bad value
collect2: error: ld returned 1 exit status

any suggestion what is here to do? 
Maybe the patch will not work in all situations?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
