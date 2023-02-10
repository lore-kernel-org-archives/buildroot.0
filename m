Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356B8C636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 10:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BE1D40247;
	Fri, 10 Feb 2023 10:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BE1D40247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duiULzXDw9oo; Fri, 10 Feb 2023 10:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933D14021B;
	Fri, 10 Feb 2023 10:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 933D14021B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D87121BF383
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 10:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEB2E82111
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 10:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEB2E82111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25GWcetRmCuF for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 10:13:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A16D8820D7
 for <buildroot@uclibc.org>; Fri, 10 Feb 2023 10:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A16D8820D7
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 8D56284251; Fri, 10 Feb 2023 10:13:15 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 10 Feb 2023 10:13:15 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: trivial
X-Bugzilla-Who: alexis.lothore@bootlin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-15331-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15331] New: Warning on python-flit-core license
 when generating legal info
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

https://bugs.busybox.net/show_bug.cgi?id=15331

            Bug ID: 15331
           Summary: Warning on python-flit-core license when generating
                    legal info
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: alexis.lothore@bootlin.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9506
  --> https://bugs.busybox.net/attachment.cgi?id=9506&action=edit
Modified defconfig to reproduce the issue

The legal-info target emits a warning on python-flit-core: 
WARNING: python-flit-core-3.8.0: cannot save license
(HOST_PYTHON_FLIT_CORE_LICENSE_FILES not defined)

Steps to reproduce:
- clone buildroot
- make qemu_x86_64_defconfig
- in menuconfig, enable python3, a python package having flit as setup type
(e.g.: argon2_cffi)
- make legal-info 

Host OS : Archlinux (Linux arch-bootlin-alexis 6.1.9-arch1-2 #1 SMP
PREEMPT_DYNAMIC Fri, 03 Feb 2023 18:49:53 +0000 x86_64 GNU/Linux)
Buildroot version : master (e2fd606b91784ced64c7312e02fcbf95f3e736d6)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
