Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD84C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 16:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C9160E62;
	Tue, 26 Dec 2023 16:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3C9160E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1Z6WlGDmipZ; Tue, 26 Dec 2023 16:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F6D360DFE;
	Tue, 26 Dec 2023 16:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F6D360DFE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAC2E1BF3B0
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 924B340912
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 924B340912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrmSDnCUQt7A for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 16:45:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 776CE40182
 for <buildroot@uclibc.org>; Tue, 26 Dec 2023 16:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 776CE40182
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 6054A8195B; Tue, 26 Dec 2023 16:45:51 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 26 Dec 2023 16:45:50 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: volodymyr.makhitko@databridge.co
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15904-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15904] New: squashfs compilation error
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

https://bugs.busybox.net/show_bug.cgi?id=15904

            Bug ID: 15904
           Summary: squashfs compilation error
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: volodymyr.makhitko@databridge.co
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi, 

Compilation error on the latest buildroot
https://fossies.org/linux/privat/buildroot-2023.11.tar.xz/index_ap.html

Error: 

2023-12-26T17:40:55 mksquashfs.c: In function 'create_inode':
2023-12-26T17:40:55 mksquashfs.c:993:38: error: called object 'major' is not a
function or function pointer
2023-12-26T17:40:55 993 |                 unsigned int major =
major(buf->st_rdev);
2023-12-26T17:40:55 |                                      ^~~
2023-12-26T17:40:55 mksquashfs.c:993:30: note: declared here
2023-12-26T17:40:55 993 |                 unsigned int major =
major(buf->st_rdev);
2023-12-26T17:40:55 |                              ^
2023-12-26T17:40:55 mksquashfs.c:994:38: error: called object 'minor' is not a
function or function pointer
2023-12-26T17:40:55 994 |                 unsigned int minor =
minor(buf->st_rdev);
2023-12-26T17:40:55 |                                      ^
2023-12-26T17:40:55 mksquashfs.c:994:30: note: declared here
2023-12-26T17:40:55 994 |                 unsigned int minor =
minor(buf->st_rdev);
2023-12-26T17:40:55 |                              ^
2023-12-26T17:40:55 mksquashfs.c:1017:38: error: called object 'major' is not a
function or function pointer
2023-12-26T17:40:55 1017 |                 unsigned int major =
major(buf->st_rdev);
2023-12-26T17:40:55 |                                      ^
2023-12-26T17:40:55 mksquashfs.c:1017:30: note: declared here
2023-12-26T17:40:55 1017 |                 unsigned int major =
major(buf->st_rdev);
2023-12-26T17:40:55 |                              ^
2023-12-26T17:40:55 mksquashfs.c:1018:38: error: called object 'minor' is not a
function or function pointer
2023-12-26T17:40:55 1018 |                 unsigned int minor =
minor(buf->st_rdev);
2023-12-26T17:40:55 |                                      ^~~
2023-12-26T17:40:55 mksquashfs.c:1018:30: note: declared here
2023-12-26T17:40:55 1018 |                 unsigned int minor =
minor(buf->st_rdev);
2023-12-26T17:40:55 |

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
