Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F066C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 18:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9727440AC3;
	Mon, 18 Mar 2024 18:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQgwZO-SW1wD; Mon, 18 Mar 2024 18:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86D5F40AC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86D5F40AC7;
	Mon, 18 Mar 2024 18:46:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B87E11BF2EC
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 18:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4F9B405EB
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 18:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7lWv0oyaRmYu for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 18:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AD34405EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AD34405EA
 for <buildroot@uclibc.org>; Mon, 18 Mar 2024 18:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id DBCE5826AD; Mon, 18 Mar 2024 18:46:42 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 18 Mar 2024 18:46:42 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-16003-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16003] New: samba4 will not build for x86
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

https://bugs.busybox.net/show_bug.cgi?id=16003

            Bug ID: 16003
           Summary: samba4 will not build for x86
           Product: buildroot
           Version: 2024.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: fli4l@franke-prem.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

On my system (Debian 11 X86_64) i will try to build as cross-compile 
the samba4 package.
Setup is near similar to the setup as x86_64 system what is build samba4
without problems.
So when i try to build samba4 i run in the error:
[1659/4058] Compiling source4/lib/socket/connect_multi.c
/home/roland/.fbr/fbr-4.0-test_1_2024-x86/buildroot/output/per-package/samba4/host/bin/../lib/gcc/i586-buildroot-linux-uclibc/12.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld:
/home/roland/.fbr/fbr-4.0-test_1_2024-x86/buildroot/output/per-package/samba4/host/i586-buildroot-linux-uclibc/sysroot/usr/lib/uclibc_nonshared.a(ssp-local.os):
in function `__stack_chk_fail_local':
buildroot/build/uclibc-1.0.45/libc/sysdeps/linux/common/ssp-local.c:35:
undefined reference to `__stack_chk_fail'
collect2: error: ld returned 1 exit status

../../lib/krb5_wrap/krb5_samba.c: In function 'smb_krb5_salt_principal_str':
../../lib/krb5_wrap/krb5_samba.c:712:9: warning: 'krb5_free_unparsed_name' is
deprecated [-Wdeprecated-declarations]
  712 |         krb5_free_unparsed_name(krb5_ctx, salt_principal_malloc);
      |         ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../third_party/heimdal/lib/krb5/krb5.h:1019,
                 from ../../lib/replace/system/kerberos.h:33,
                 from ../../lib/krb5_wrap/krb5_samba.h:41,
                 from ../../lib/krb5_wrap/krb5_samba.c:25:
third_party/heimdal/lib/krb5/krb5-protos.h:3774:1: note: declared here
 3774 | krb5_free_unparsed_name (
      | ^~~~~~~~~~~~~~~~~~~~~~~
../../lib/krb5_wrap/krb5_samba.c: In function 'smb_krb5_unparse_name':
../../lib/krb5_wrap/krb5_samba.c:892:17: warning: 'krb5_free_unparsed_name' is
deprecated [-Wdeprecated-declarations]
  892 |                 krb5_free_unparsed_name(context, utf8_name);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~
third_party/heimdal/lib/krb5/krb5-protos.h:3774:1: note: declared here
 3774 | krb5_free_unparsed_name (
      | ^~~~~~~~~~~~~~~~~~~~~~~
../../lib/krb5_wrap/krb5_samba.c:895:9: warning: 'krb5_free_unparsed_name' is
deprecated [-Wdeprecated-declarations]
  895 |         krb5_free_unparsed_name(context, utf8_name);
      |         ^~~~~~~~~~~~~~~~~~~~~~~
third_party/heimdal/lib/krb5/krb5-protos.h:3774:1: note: declared here
 3774 | krb5_free_unparsed_name (
      | ^~~~~~~~~~~~~~~~~~~~~~~

Waf: Leaving directory
`/home/roland/.fbr/fbr-4.0-test_1_2024-x86/buildroot/output/build/samba4-4.19.5/bin/default'
Build failed
 -> task in 'cluster' failed with exit status 1 (run with -v to display more
information)

Any suggestion what will not work here?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
