Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0DDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 11:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7883641BF3;
	Sat, 20 Nov 2021 11:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id II7e8QeAlves; Sat, 20 Nov 2021 11:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF3D541BEC;
	Sat, 20 Nov 2021 11:35:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4B21BF28D
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 698A560706
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o0dnNU6IpXXU for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 11:35:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B7616058D
 for <buildroot@uclibc.org>; Sat, 20 Nov 2021 11:35:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 8A37587E3D; Sat, 20 Nov 2021 11:31:14 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 20 Nov 2021 11:35:33 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mail@jens-maus.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14366-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14366] New: 2021.11-rc2: Build of nodejs fails
 with "version `GLIBC_2.34' not found" on Ubuntu 20.04
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

            Bug ID: 14366
           Summary: 2021.11-rc2: Build of nodejs fails with "version
                    `GLIBC_2.34' not found" on Ubuntu 20.04
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: mail@jens-maus.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

After upgrading from 2021.08.2 to the latest 2021.11-rc2 the following error
appear when compiling nodejs-14.18.1:

-- cut here --
 
LD_LIBRARY_PATH=/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/lib.host:/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/lib.target:$LD_LIBRARY_PATH;
export LD_LIBRARY_PATH; cd ../tools/v8_gypfiles; mkdir -p
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/obj/gen/inspector-generated-output-root/include/inspector
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/obj/gen/inspector-generated-output-root/src/inspector/protocol;
python ../../deps/v8/third_party/inspector_protocol/code_generator.py
--jinja_dir ../../deps/v8/third_party --output_base
"/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/obj/gen/inspector-generated-output-root/src/inspector"
--config ../../deps/v8/src/inspector/inspector_protocol_config.json
--inspector_protocol_dir ../../deps/v8/third_party/inspector_protocol
 
LD_LIBRARY_PATH=/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/lib.host:/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/lib.target:$LD_LIBRARY_PATH;
export LD_LIBRARY_PATH; cd ../tools/v8_gypfiles; mkdir -p
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/obj/gen/inspector-generated-output-root/include/inspector
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/obj/gen/inspector-generated-output-root/src/inspector/protocol;
python ../../deps/v8/third_party/inspector_protocol/code_generator.py
--jinja_dir ../../deps/v8/third_party --output_base
"/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/obj/gen/inspector-generated-output-root/src/inspector"
--config ../../deps/v8/src/inspector/inspector_protocol_config.json
--inspector_protocol_dir ../../deps/v8/third_party/inspector_protocol
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/bytecode_builtins_list_generator:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/bytecode_builtins_list_generator)
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/bytecode_builtins_list_generator:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found (required by
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/bytecode_builtins_list_generator)
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/bytecode_builtins_list_generator:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/bytecode_builtins_list_generator)
make[3]: *** [tools/v8_gypfiles/generate_bytecode_builtins_list.target.mk:13:
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/out/Release/obj/gen/generate-bytecode-output-root/builtins-generated/bytecodes-builtins-list.h]
Error 1
make[3]: *** Waiting for unfinished jobs....
rm e730c40db4707fa90e26f9a1f4e233545a966191.intermediate
f851aa033254e58b7e35f943f6814ef5e8f9642a.intermediate
make[2]: *** [Makefile:109: node] Error 2
make[2]: Leaving directory
'/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1'
make[1]: *** [package/pkg-generic.mk:294:
/home/damato/projekte/linux/RaspberryMatic/build-raspmatic_ova/build/nodejs-14.18.1/.stamp_built]
Error 2
make[1]: Leaving directory
'/home/damato/projekte/linux/RaspberryMatic/buildroot-2021.11-rc2'
make: *** [Makefile:51: build] Error 2
-- cut here --

Thus, it looks like the host system libc.so.6 is used for the
"bytecode_builtins_list_generator" tool that is automatically build during the
nodejs-14.18.1 build run. However, as buildroot 2021.11 introduced GLIBC_2.34
the execution of "bytecode_builtins_list_generator" fails because Ubuntu 20.04
does not come with a glibc with GLIBC_2.34 symbols in libc.so. Thus, the
dedicated compiled 2.34 glibc for the host in
"host/x86_64-buildroot-linux-gnu/sysroot/lib" should be used instead so that
the "bytecode_builtins_list_generator" tool can be correctly executed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
