Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A78CC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 14:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C0282893;
	Sat, 15 Jun 2024 14:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IdXK-0d5bJGy; Sat, 15 Jun 2024 14:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 101E180ECD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 101E180ECD;
	Sat, 15 Jun 2024 14:59:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8753F1BF2C3
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 803DF81094
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqJ5WqydbG6y for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 14:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF75E833CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF75E833CD
 for <buildroot@uclibc.org>; Sat, 15 Jun 2024 14:59:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 815A787A1F; Sat, 15 Jun 2024 14:59:26 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 15 Jun 2024 14:59:26 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone resolution
Message-ID: <bug-14056-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14056] New: CVE-2021-33910 [SYSTEMD] Memory
 Allocation with an Excessive Size Value that results in an operating system
 crash.
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

https://bugs.busybox.net/show_bug.cgi?id=14056

            Bug ID: 14056
           Summary: CVE-2021-33910 [SYSTEMD] Memory Allocation with an
                    Excessive Size Value that results in an operating
                    system crash.
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: RESOLVED
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: francisjy.hu@moxa.com
                CC: buildroot@uclibc.org, yann.morin.1998@free.fr
  Target Milestone: ---
            Status: RESOLVED
                CC: yann.morin.1998@free.fr
        Resolution: MOVED

Hi:
There is an systemd issue reported by NVD in
https://nvd.nist.gov/vuln/detail/CVE-2021-33910.
The hyper link is shown below.
https://github.com/systemd/systemd-stable/commit/4a1c5f34bd3e1daed4490e9d97918e504d19733b

The issue description:
basic/unit-name.c in systemd prior to 246.15, 247.8, 248.5, and 249.1 has a
Memory Allocation with an Excessive Size Value (involving strdupa and alloca
for a pathname controlled by a local attacker) that results in an operating
system crash.

--- Comment #1 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
systemd has been bumped to version 249.1 since July 20 and
https://git.buildroot.net/buildroot/commit/?id=fbd9566220f2812baeff5dbd727bfc30fe4e93ea
so master is not affected by this CVE. 

However, LTS branches are still using version 247.3, they should be bumped to
247.9.

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Thank you for your report.

The issue tracker for the Buildroot project has been moved to
the Gitlab.com issue tracker:
    https://gitlab.com/buildroot.org/buildroot/-/issues

We are taking this opportunity to close old issues in this old
tracker. If you believe your issue is still relevant, please
open one in the new issue tracker.

Thank you!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
