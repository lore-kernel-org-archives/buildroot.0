Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47689C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 07:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83F14416E5;
	Mon, 17 Oct 2022 07:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F14416E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivrXmwxiS9Ho; Mon, 17 Oct 2022 07:43:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25E4A416EA;
	Mon, 17 Oct 2022 07:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25E4A416EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 073CF1BF3F4
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E367B81276
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 07:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E367B81276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPpvUTUenO0W for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 07:43:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BECC8125F
 for <buildroot@uclibc.org>; Mon, 17 Oct 2022 07:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BECC8125F
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id E8FE186708; Mon, 17 Oct 2022 07:43:39 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 17 Oct 2022 07:43:39 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.08
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hello.skyclo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15061-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15061] New: Node.js Package fails to build against
 musl i386
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

https://bugs.busybox.net/show_bug.cgi?id=15061

            Bug ID: 15061
           Summary: Node.js Package fails to build against musl i386
           Product: buildroot
           Version: 2022.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: hello.skyclo@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hello,

I have been trying to build the Nodejs package against musl for a i386 Pentium3
target. Nodejs has an unofficial build for musl (x64) and for x86 (gcc),
however there is no unofficial build for x86 musl. I assume it's possible to
build against musl-i386. I built nodejs against uClibc-ng i386 on the exact
same machine months ago, however now that doesn't work either. For reference,
my system uses glibc x64 and does not contain a musl i386 linker (since Ubuntu
no longer supports i386).

The full output of make is attached here along with the defconfig (for
reprod.):
https://gist.github.com/Skyclo/4168deaa1a73be8574d43eb70a4d9de1

The ninja build seems to fail consistently when doing anything related to
"obj/gen/generate-bytecode-output-root/builtins-generated/bytecodes-builtins-list.h".
It produces the following output before eventually crashing the make job queue:


>> [218/2653] ACTION generate_bytecode_builtins_list: generate_bytecode_builtins_list_action_3931b343a4cb0bd98da4e581f6ce90fe
>> FAILED: obj/gen/generate-bytecode-output-root/builtins-generated/bytecodes-builtins-list.h
>> cd ../../tools/v8_gypfiles; python ../../deps/v8/tools/run.py ../../out/Release/v8-qemu-wrapper ../../out/Release/bytecode_builtins_list_generator ../../out/Release/obj/gen/generate-bytecode-output-root/builtins-generated/bytecodes-builtins-list.h
>> qemu-i386: Could not open '/lib/ld-musl-i386.so.1': No such file or directory
Return code is 255


Getting the file info from "./output/target/lib/ld-musl-i386.so.1" returns the
following:


>> ./output/target/lib/ld-musl-i386.so.1: broken symbolic link to /lib/libc.so


I'm unsure if that is what is causing my issues. From what I can tell, the qemu
wrapper should be able to resolve that symlink to the one found under the
target's lib.

I do not believe that my issue is related to Bug 14936 nor Bug 14366. I have
not had time to see if the patch available at
https://patchwork.ozlabs.org/project/buildroot/patch/20220809075704.86472-4-ardeleanalex@gmail.com/
works for my specific case.

Thanks for any help in advance!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
