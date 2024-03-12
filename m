Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE25C54E58
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 11:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E38340343;
	Tue, 12 Mar 2024 11:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNYJjQaz8zOh; Tue, 12 Mar 2024 11:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A6340345
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39A6340345;
	Tue, 12 Mar 2024 11:35:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED841BF37F
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 11:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7967581587
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 11:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y24o6jUjWCeG for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 11:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97FB880C39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97FB880C39
 for <buildroot@uclibc.org>; Tue, 12 Mar 2024 11:35:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 7F2B881087; Tue, 12 Mar 2024 11:35:55 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 12 Mar 2024 11:35:55 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: info@hifiberry.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15991-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15991] New: host-heimdal fails to build on Ubuntu
 x64
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

https://bugs.busybox.net/show_bug.cgi?id=15991

            Bug ID: 15991
           Summary: host-heimdal fails to build on Ubuntu x64
           Product: buildroot
           Version: 2024.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: info@hifiberry.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

make raspberrypi4_defconfig
select SAMBA package

make

checking for /usr/bin/gcc  options needed to detect all undeclared functions...
cannot detect
configure: error: in
'xxxx_buildroot-2024.02/output/build/host-heimdal-f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17':
configure: error: cannot make /usr/bin/gcc  report undeclared builtins
See 'config.log' for more details

Tested on both Ubuntu 23.10 and 22.04.4 LTS

In the config.log I can see
| int
| main (void)
| {
| (void) strchr;                                                               
                                                                               
                      |   ;                                                    
                                                                               
                                            |   return 0;                      
                                                                               
                                                                  | }          
                                                                               
                                                                               
        configure:20087: /usr/bin/gcc  -c -O2
-Ibuildroot-2024.02/output/host/include  -fno-builtin
-Ibuildroot-2024.02/output/host/include -D_LARGE_FILES= -D_FILE_OFFSET_BITS=
conftest.c >&5
In file included from
/usr/include/x86_64-linux-gnu/bits/libc-header-start.h:33,
                 from /usr/include/limits.h:26,
                 from /usr/lib/gcc/x86_64-linux-gnu/12/include/limits.h:203,
                 from /usr/lib/gcc/x86_64-linux-gnu/12/include/syslimits.h:7,
                 from /usr/lib/gcc/x86_64-linux-gnu/12/include/limits.h:34,
                 from conftest.c:44:
/usr/include/features.h:388:52: error: operator '&&' has no right operand
  388 | #if defined _FILE_OFFSET_BITS && _FILE_OFFSET_BITS == 64
      |                                                    ^~
conftest.c:35:16: error: duplicate 'unsigned'
   35 | #define size_t unsigned int
      |                ^~~~~~~~
conftest.c:35:25: error: two or more data types in declaration specifiers
   35 | #define size_t unsigned int
      |                         ^~~
configure:20087: $? = 1
configure: failed program was:

...

| extern void ac_decl (int, char *);
|
| int
| main (void)
| {
| (void) ac_decl (0, (char *) 0);
|   (void) ac_decl;
|
|   ;
|   return 0;
| }
configure:20107: result: cannot detect
configure:20111: error: in
'buildroot-2024.02/output/build/host-heimdal-f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17':
configure:20113: error: cannot make /usr/bin/gcc  report undeclared builtins

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
