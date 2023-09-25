Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18A4CE79A5
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 22:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 716C641D6D;
	Mon, 25 Sep 2023 22:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 716C641D6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMfnEQqQCzRC; Mon, 25 Sep 2023 22:02:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CDDB41D6A;
	Mon, 25 Sep 2023 22:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CDDB41D6A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD7B11BF2F7
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 22:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8246541D6A
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 22:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8246541D6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGCmjnf3xDR6 for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 22:02:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94ACE41D69
 for <buildroot@uclibc.org>; Mon, 25 Sep 2023 22:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94ACE41D69
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 800B786502; Mon, 25 Sep 2023 22:02:11 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 25 Sep 2023 22:02:11 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.05.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paul@modernsubject.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-15805-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15805] New: Unable to build with ccache enabled.
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

https://bugs.busybox.net/show_bug.cgi?id=15805

            Bug ID: 15805
           Summary: Unable to build with ccache enabled.
           Product: buildroot
           Version: 2023.05.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: paul@modernsubject.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9643
  --> https://bugs.busybox.net/attachment.cgi?id=9643&action=edit
cmake error log

When building with ccache enabled, I get the following error during the ccache
build:

"
... snip
-- Ccache version: 4.7.4                                                        
-- Ccache dev mode: OFF                                                         
-- Performing Test std_atomic_without_libatomic                                 
-- Performing Test std_atomic_without_libatomic - Success                       
-- Performing Test std_filesystem_without_libfs                                 
-- Performing Test std_filesystem_without_libfs - Failed                        
-- Performing Test std_filesystem_with_libfs                                    
-- Performing Test std_filesystem_with_libfs - Failed                           
CMake Error at cmake/StdFilesystem.cmake:22 (message):                          
  Toolchain doesn't support std::filesystem with nor without -lstdc++fs         
Call Stack (most recent call first):                                            
  cmake/StandardSettings.cmake:57 (include)                                     
  CMakeLists.txt:70 (include)                                                   


-- Configuring incomplete, errors occurred!                                     
See also
"/home/paul/src/pi2/buildroot/build/host-ccache-4.7.4/CMakeFiles/CMakeOutput.lo 
g".                                                                             
See also
"/home/paul/src/pi2/buildroot/build/host-ccache-4.7.4/CMakeFiles/CMakeError.log 
".                                                                              
make[1]: *** [package/pkg-generic.mk:283:
/home/paul/src/pi2/buildroot/build/host-ccache 
-4.7.4/.stamp_configured] Error 1                                               
make: *** [Makefile:23: _all] Error 2 
"

Disabling ccache, everything builds properly.  Also 2023.02.4 builds properly
with ccache.  I also tried building with "BR2_FORCE_HOST_BUILD=y" -- no change.

Environment:
- openSUSE Leap 15.5

Target:
- Raspberry Pi 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
