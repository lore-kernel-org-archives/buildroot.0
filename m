Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0E8C77B61
	for <buildroot@archiver.kernel.org>; Thu, 27 Apr 2023 09:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A5760BD6;
	Thu, 27 Apr 2023 09:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A5760BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EAoGd5g1Jqm3; Thu, 27 Apr 2023 09:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C9F605B1;
	Thu, 27 Apr 2023 09:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C9F605B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D28C1BF5B3
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 09:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6530741E0B
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 09:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6530741E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lQZsBU1CXOY1 for <buildroot@lists.busybox.net>;
 Thu, 27 Apr 2023 09:38:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2144A41DEF
 for <buildroot@uclibc.org>; Thu, 27 Apr 2023 09:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2144A41DEF
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 0CA298449E; Thu, 27 Apr 2023 09:38:24 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 27 Apr 2023 09:38:23 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bradley.gamble@ncipher.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-15551-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15551] New: Linux extensions are not applied to
 linux-headers package
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

https://bugs.busybox.net/show_bug.cgi?id=15551

            Bug ID: 15551
           Summary: Linux extensions are not applied to linux-headers
                    package
           Product: buildroot
           Version: 2023.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: bradley.gamble@ncipher.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9586
  --> https://bugs.busybox.net/attachment.cgi?id=9586&action=edit
Example of the difference between the linux and linux-headers trees following
an extension being applied.

Linux extensions are a mechanism for providing new features through
modification to the Linux kernel tree. This is usually in the form of patches
or new files from an out-of-tree source. (See Buildroot manual section 18.22.2.
linux-kernel-extensions).

Currently during a build the Linux extensions are applied to the linux source
tree, but not the linux-headers source tree. In comparison, the global and
Linux patch directories are applied to both the linux and linux-headers source
trees. This can lead issues where the source of the linux-headers does not
represent the kernel running on the target - For example, linux-headers is
consumed by most C libraries.

I have encountered this when attempting to write a patch that modifies an
applied kernel extension. The patch fails to apply to linux-headers as the
source files added by the extension do not exist.

This can be reproduced this by enabling a Linux extension (I've tested with
fbtft and ev3dev-linux-drivers) and performing a build, then comparing the
linux and linux-headers build directories - I have attached a diff example
showing the additions in one source tree but not the other.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
