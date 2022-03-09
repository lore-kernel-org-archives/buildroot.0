Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D20C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 10:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C1E1842A3;
	Wed,  9 Mar 2022 10:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NP8VFQpSCRm7; Wed,  9 Mar 2022 10:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D51F284107;
	Wed,  9 Mar 2022 10:05:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 195D21BF576
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 10:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF20B84107
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 10:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nX-GpPV46zIN for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 10:05:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4430F84104
 for <buildroot@uclibc.org>; Wed,  9 Mar 2022 10:05:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 097A583489; Wed,  9 Mar 2022 09:57:25 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 09 Mar 2022 10:05:51 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: f.rogall@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: version bug_severity
Message-ID: <bug-14366-163-0rM6lrbCcD@https.bugs.busybox.net/>
In-Reply-To: <bug-14366-163@https.bugs.busybox.net/>
References: <bug-14366-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14366] Nodejs fails with "version `GLIBC_2.34' not
 found" on Ubuntu 20.04
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

https://bugs.busybox.net/show_bug.cgi?id=14366

Frank Rogall <f.rogall@gmx.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|2021.11.1                   |2022.02
           Severity|major                       |blocker

--- Comment #6 from Frank Rogall <f.rogall@gmx.de> ---
This Bug is still in 2022.02

LD_LIBRARY_PATH=/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/lib.host:/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/lib.target:$LD_LIBRARY_PATH;
export LD_LIBRARY_PATH; cd ../tools/v8_gypfiles; mkdir -p
/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/obj/gen/generate-bytecode-output-root/builtins-generated;
python ../../deps/v8/tools/run.py
"/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/v8-qemu-wrapper"
"/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/bytecode_builtins_list_generator"
"/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/obj/gen/generate-bytecode-output-root/builtins-generated/bytecodes-builtins-list.h"
/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/bytecode_builtins_list_generator:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by
/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/bytecode_builtins_list_generator)
/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/bytecode_builtins_list_generator:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found (required by
/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/bytecode_builtins_list_generator)
/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/bytecode_builtins_list_generator:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by
/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/bytecode_builtins_list_generator)
make[3]: *** [tools/v8_gypfiles/generate_bytecode_builtins_list.target.mk:13:
/home/fr/work/egate/x/egate/build/nodejs-14.18.3/out/Release/obj/gen/generate-bytecode-output-root/builtins-generated/bytecodes-builtins-list.h]
Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
