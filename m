Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D525C27C53
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 14:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C93D81FA9;
	Sat, 15 Jun 2024 14:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-YY6KVbh8Jj; Sat, 15 Jun 2024 14:59:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB78980ECD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB78980ECD;
	Sat, 15 Jun 2024 14:59:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C86B31BF2C3
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4641605FF
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfLLt4ZfwSEJ for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 14:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBDFE60785
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBDFE60785
 for <buildroot@uclibc.org>; Sat, 15 Jun 2024 14:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id AA10A87A1F; Sat, 15 Jun 2024 14:59:21 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 15 Jun 2024 14:59:21 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone resolution attachments.created
Message-ID: <bug-14026-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14026] New: gdb pretty printers import script sets
 incorrect path
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

https://bugs.busybox.net/show_bug.cgi?id=14026

            Bug ID: 14026
           Summary: gdb pretty printers import script sets incorrect path
           Product: buildroot
           Version: 2021.02.3
          Hardware: All
                OS: Linux
            Status: RESOLVED
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: dennis.peeten@heliox-energy.com
                CC: buildroot@uclibc.org, yann.morin.1998@free.fr
  Target Milestone: ---
            Status: RESOLVED
        Resolution: MOVED
                CC: yann.morin.1998@free.fr

Created attachment 9056
  --> https://bugs.busybox.net/attachment.cgi?id=9056&action=edit
gdb-pretty-printers-import-script-workaround.patch

gcc-10.3.0
libstdc++ 6.0.28
python 3.9
gdb 10.3

How to reproduce:

 - build firmware with:

     BR2_GCC_VERSION_10_X=y
     BR2_GCC_VERSION="10.3.0"
     BR2_TOOLCHAIN_BUILDROOT_CXX=y

     BR2_PACKAGE_HOST_GDB=y
     BR2_PACKAGE_HOST_GDB_TUI=y
     BR2_PACKAGE_HOST_GDB_PYTHON3=y
     BR2_GDB_VERSION_10=y
     BR2_GDB_VERSION="10.1"

     BR2_PACKAGE_GDB_ARCH_SUPPORTS=y
     BR2_PACKAGE_GDB=y
     BR2_PACKAGE_GDB_SERVER=y

     BR2_PACKAGE_HOST_PYTHON3=y

  - cross compile c++ application with debug symbols.

  - remotely debug application on the target.

  - print the value of an stl object.

Expected:

  A human readable value.

Actually:

  Dumps the implementation details of the stl objects.

  gdb also prints this error:

    Traceback (most recent call last):
    File
"/opt/heliox/some-board-sdk/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libstdc++.so.6.0.28-gdb.py",
line 61, in <module>
    from libstdcxx.v6 import register_libstdcxx_printers
        ModuleNotFoundError: No module named 'libstdcxx'


Root cause:

The script that fails is the python import script. It is supplied by
gcc/libstdc++ and is generated from this template:
https://github.com/gcc-mirror/gcc/blob/master/libstdc%2B%2B-v3/python/hook.in

The script is supposed to set the path to the libstdcxx python module, import
it and register the printers with gdb.
It has the correct info to do so, however it manages to mess it up in my case.

The script contains two hard-coded paths:

    pythondir = '/opt/heliox/some-board-sdk/share/gcc-10.3.0/python/'
    libdir = '/opt/heliox/some-board-sdk/arm-buildroot-linux-gnueabihf/lib'

The pythondir is the exact path needed for the import. Replacing the whole
script with just:

    sys.path.insert(0, '/opt/heliox/some-board-sdk/share/gcc-10.3.0/python/')
    from libstdcxx.v6 import register_libstdcxx_printers
    register_libstdcxx_printers(gdb.current_objfile())

Fixes my problem.

The error occurs when the script tries to construct a relative path from libdir
to pythondir and append that to the directory of the object file being debugged
(/opt/heliox/some-board-sdk/arm-buildroot-linux-gnueabihf/sysroot/lib/libstdc++.so.6)

This results in a non existent path:

   
/opt/heliox/some-board-sdk/arm-buildroot-linux-gnueabihf/sysroot/lib/../../share/gcc-10.3.0/python

I don't know enough python to understand why a new path needs to be
constructed, however it seems to me that the path calculation is wrong;
it should calculate the relative path from object dir to pythondir and append
that to the object dir.

For now I added a patch with a workaround (see attached file).

Kind regards,
Dennis Peeten.

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
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
