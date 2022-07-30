Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08031C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 16:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85C2641592;
	Sat, 30 Jul 2022 16:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C2641592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3SVPnkB1kHvs; Sat, 30 Jul 2022 16:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6D00408C4;
	Sat, 30 Jul 2022 16:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D00408C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAC0E1BF84C
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F08B60E38
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F08B60E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ROlV3zFP6_Is for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 16:40:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75B6960BA8
 for <buildroot@uclibc.org>; Sat, 30 Jul 2022 16:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75B6960BA8
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 1CCD9837E7; Sat, 30 Jul 2022 16:26:22 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 30 Jul 2022 16:40:14 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.4
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wg@grandegger.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-14931-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14931] New: package/qt5/qt5webengine: build fails
 with unicode/uchar.h not found
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

https://bugs.busybox.net/show_bug.cgi?id=14931

            Bug ID: 14931
           Summary: package/qt5/qt5webengine: build fails with
                    unicode/uchar.h not found
           Product: buildroot
           Version: 2022.02.4
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: wg@grandegger.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9351
  --> https://bugs.busybox.net/attachment.cgi?id=9351&action=edit
Buildroot defconfig

The build of the package webengine fails with the error shown below.
The missing file "unicode/uchar.h" is not under "/usr/include" but
"$(HOST_DIR)/usr/include", which is obviously not used.

I'm using Buildroot 2022.02.4 under Ubuntu 22.04 LTS.

Thanks for your support.

Wolfgang

[6734/21974] CXX v8_snapshot/obj/v8/v8_libbase/cpu.o
[6735/21974] CXX
v8_snapshot/obj/v8/gen-regexp-special-case/gen-regexp-special-case.o
FAILED: v8_snapshot/obj/v8/gen-regexp-special-case/gen-regexp-special-case.o 
/usr/bin/g++ -MMD -MF
v8_snapshot/obj/v8/gen-regexp-special-case/gen-regexp-special-case.o.d
-DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DOFFICIAL_BUILD
-DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-DNO_UNWIND_TABLES -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DNDEBUG
-DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0
-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=64 -DENABLE_MINOR_MC -DV8_INTL_SUPPORT
-DV8_CONCURRENT_MARKING -DV8_ENABLE_LAZY_SOURCE_POSITIONS
-DV8_WIN64_UNWINDING_INFO -DV8_ENABLE_REGEXP_INTERPRETER_THREADED_DISPATCH
-DV8_SNAPSHOT_COMPRESSION -DV8_COMPRESS_POINTERS -DV8_31BIT_SMIS_ON_64BIT_ARCH
-DV8_DEPRECATION_WARNINGS -DV8_REVERSE_JSARGS -DV8_TARGET_ARCH_X64
-DV8_HAVE_TARGET_OS -DV8_TARGET_OS_LINUX -DDISABLE_UNTRUSTED_CODE_MITIGATIONS
-DV8_COMPRESS_POINTERS -DV8_31BIT_SMIS_ON_64BIT_ARCH -DV8_DEPRECATION_WARNINGS
-DV8_REVERSE_JSARGS -DUSING_SYSTEM_ICU=1
-DICU_UTIL_DATA_IMPL=ICU_UTIL_DATA_STATIC -DUCHAR_TYPE=uint16_t
-Iv8_snapshot/gen -I../../3rdparty/chromium -I../../3rdparty/chromium/v8
-I../../3rdparty/chromium/v8/include -Iv8_snapshot/gen/v8 -Iv8_snapshot/gen
-Iv8_snapshot/gen -fno-strict-aliasing --param=ssp-buffer-size=4
-fstack-protector -fno-unwind-tables -fno-asynchronous-unwind-tables -fPIC
-pipe -pthread -m64 -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
-Wno-unused-local-typedefs -Wno-maybe-uninitialized
-Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments
-Wno-packed-not-aligned -Wno-dangling-else -Wno-missing-field-initializers
-Wno-unused-parameter -fno-omit-frame-pointer -g0 -fvisibility=hidden
-Wno-strict-overflow -Wno-return-type -O3 -fno-ident -fdata-sections
-ffunction-sections -I/usr/include -I/usr/include -std=gnu++14 -Wno-narrowing
-Wno-class-memaccess -Wno-attributes -Wno-class-memaccess
-Wno-subobject-linkage -Wno-invalid-offsetof -Wno-return-type
-Wno-deprecated-copy -fno-exceptions -fno-rtti -fvisibility-inlines-hidden -c
../../3rdparty/chromium/v8/src/regexp/gen-regexp-special-case.cc -o
v8_snapshot/obj/v8/gen-regexp-special-case/gen-regexp-special-case.o
In file included from
../../3rdparty/chromium/v8/src/regexp/gen-regexp-special-case.cc:10:
../../3rdparty/chromium/v8/src/regexp/special-case.h:12:10: fatal error:
unicode/uchar.h: No such file or directory
   12 | #include "unicode/uchar.h"
      |          ^~~~~~~~~~~~~~~~~
compilation terminated.
[6736/21974] CXX v8_snapshot/obj/v8/v8_libbase/stack_trace.o
[6737/21974] CXX host/obj/third_party/protobuf/protoc_lib/js_generator.o
[6738/21974] CXX v8_snapshot/obj/v8/v8_libbase/division-by-constant.o
[6739/21974] CXX v8_snapshot/obj/v8/v8_libbase/file-utils.o
[6740/21974] CXX v8_snapshot/obj/v8/v8_libbase/functional.o
[6741/21974] CXX
v8_snapshot/obj/v8/bytecode_builtins_list_generator/bytecode-operands.o
[6742/21974] ACTION
//third_party/blink/public/mojom:mojom_platform__generator(/home/wolf/test/pc_x86_64_efi/build/qt5webengine-5.15.8/src/toolchain:target)
[6743/21974] CXX v8_snapshot/obj/v8/v8_libbase/bounded-page-allocator.o
[6744/21974] ACTION
//third_party/devtools-frontend/src/front_end/sdk:devtools_entrypoint-bundle-tsconfig(/home/wolf/test/pc_x86_64_efi/build/qt5webengine-5.15.8/src/toolchain:target)
[6745/21974] CXX
v8_snapshot/obj/v8/bytecode_builtins_list_generator/generate-bytecodes-builtins-list.o
[6746/21974] CXX
v8_snapshot/obj/v8/bytecode_builtins_list_generator/bytecodes.o
[6747/21974] ACTION
//third_party/devtools-frontend/src/front_end/ui:devtools_entrypoint-bundle-tsconfig(/home/wolf/test/pc_x86_64_efi/build/qt5webengine-5.15.8/src/toolchain:target)
[6748/21974] CXX host/obj/third_party/protobuf/protoc_lib/python_generator.o
[6749/21974] ACTION
//third_party/dav1d:dav1d_asm_action(/home/wolf/test/pc_x86_64_efi/build/qt5webengine-5.15.8/src/toolchain:target)
[6750/21974] ACTION
//third_party/dav1d:dav1d_asm_action(/home/wolf/test/pc_x86_64_efi/build/qt5webengine-5.15.8/src/toolchain:target)
[6751/21974] CXX v8_snapshot/obj/v8/torque/torque.o
[6752/21974] CXX v8_snapshot/obj/v8/torque_base/torque_base_jumbo_1.o
[6753/21974] CXX
host/obj/third_party/perfetto/src/trace_processor/db/lib/column.o
[6754/21974] CXX v8_snapshot/obj/v8/torque_base/torque_base_jumbo_2.o
[6755/21974] CXX v8_snapshot/obj/v8/torque_base/torque_base_jumbo_3.o
ninja: build stopped: subcommand failed.
make[5]: *** [Makefile.gn_run:360: run_ninja] Error 1
make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 2
make[3]: *** [Makefile:79: sub-core-make_first] Error 2
make[2]: *** [Makefile:49: sub-src-make_first] Error 2
make[1]: *** [package/pkg-generic.mk:293:
/home/wolf/test/pc_x86_64_efi/build/qt5webengine-5.15.8/.stamp_built] Error 2
make: *** [Makefile:23: _all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
