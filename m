Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41199C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 12:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2ADE816F5;
	Wed, 20 Dec 2023 12:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2ADE816F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hBeFt0o6dXdK; Wed, 20 Dec 2023 12:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD4C81501;
	Wed, 20 Dec 2023 12:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FD4C81501
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E08251BF333
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 12:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C73D160B3A
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 12:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C73D160B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yx_2oeOBnp0N for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 12:17:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19CF360AC6
 for <buildroot@uclibc.org>; Wed, 20 Dec 2023 12:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19CF360AC6
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 0517687BF6; Wed, 20 Dec 2023 12:17:58 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 20 Dec 2023 12:17:57 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.08
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peter.verbrugge@technolution.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15895-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15895] New: glibc version 'GLIBC_VERSION' does not
 match released glibc version
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

https://bugs.busybox.net/show_bug.cgi?id=15895

            Bug ID: 15895
           Summary: glibc version 'GLIBC_VERSION' does not match released
                    glibc version
           Product: buildroot
           Version: 2023.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: peter.verbrugge@technolution.nl
                CC: buildroot@uclibc.org
  Target Milestone: ---

The glibc package generates its own version number for glibc. It seems to be on
purpose but this causes issues when matching versions against the official
glibc releases.

The version generated for 2023.08 seems to be
'glibc:2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa' even though the glibc
project only released 2.37.

For tracking package versions used in a buildroot build we use 'make
show-info'. This generates a json blob containing all information about
packages, including a CPE string.

For glibc in 2023.08 this creates the following CPE string:
'cpe:2.3:a:gnu:glibc:2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa:*:*:*:*:*:*:*'
This string does not match any known CVE security vulnerabilities. All reported
vulnerabilities are reported with the version number 2.37 (without the number
of commits since & hash).

There's probably a reason why buildroot has deviated from the glibc reported
version number & the versions used by the NIST that i'm not seeing, but this
makes the CPE export and subsequent security analysis unusable for glibc.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
