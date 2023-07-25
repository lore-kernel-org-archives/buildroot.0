Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B17C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 18:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73A4061101;
	Tue, 25 Jul 2023 18:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73A4061101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZVTR8yFaGDp; Tue, 25 Jul 2023 18:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DF1661105;
	Tue, 25 Jul 2023 18:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DF1661105
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 304BF1BF376
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 18:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1660F41578
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 18:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1660F41578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvj5bjT-Y-DV for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 18:41:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70C8141667
 for <buildroot@uclibc.org>; Tue, 25 Jul 2023 18:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70C8141667
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 4E6498289C; Tue, 25 Jul 2023 18:41:39 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 25 Jul 2023 18:41:38 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bernd@kuhls.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone attachments.created
Message-ID: <bug-15709-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15709] New: Building BR2_PACKAGE_LIBOPENSSL_BIN=y
 broken with defconfig bootlin-armv7m-uclibc
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

https://bugs.busybox.net/show_bug.cgi?id=15709

            Bug ID: 15709
           Summary: Building BR2_PACKAGE_LIBOPENSSL_BIN=y broken with
                    defconfig bootlin-armv7m-uclibc
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: bernd@kuhls.net
                CC: buildroot@uclibc.org
  Target Milestone: ---

Created attachment 9628
  --> https://bugs.busybox.net/attachment.cgi?id=9628&action=edit
defconfig

/home/bernd/buildroot/br4/output/per-package/libopenssl/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real:
./libcrypto.a(libcrypto-lib-threads_pthread.o): in function `CRYPTO_atomic_or':
threads_pthread.c:(.text+0xf6): undefined reference to `__atomic_is_lock_free'
/home/bernd/buildroot/br4/output/per-package/libopenssl/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real:
threads_pthread.c:(.text+0x106): undefined reference to `__atomic_fetch_or_8'
/home/bernd/buildroot/br4/output/per-package/libopenssl/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real:
./libcrypto.a(libcrypto-lib-threads_pthread.o): in function
`CRYPTO_atomic_load':
threads_pthread.c:(.text+0x158): undefined reference to `__atomic_is_lock_free'
/home/bernd/buildroot/br4/output/per-package/libopenssl/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real:
threads_pthread.c:(.text+0x162): undefined reference to `__atomic_load_8'

The toolchain contains libatomic
$ find
output/per-package/libopenssl/host/arm-buildroot-uclinux-uclibcgnueabi/sysroot/
| grep atomic
output/per-package/libopenssl/host/arm-buildroot-uclinux-uclibcgnueabi/sysroot/lib/libatomic.la
output/per-package/libopenssl/host/arm-buildroot-uclinux-uclibcgnueabi/sysroot/lib/libatomic.a

Adding -latomic to the openssl configure script fixes the build error.

BR2_TOOLCHAIN_HAS_LIBATOMIC is not enabled:

$ grep ATOMIC .config
BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS=y
BR2_TOOLCHAIN_HAS_ATOMIC=y
BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC=y
BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS=y
# BR2_PACKAGE_LIBATOMIC_OPS is not set

The reason why buildroot does not enable BR2_TOOLCHAIN_HAS_LIBATOMIC is the
binfmt used:

$ grep BINFMT .config
BR2_BINFMT_FLAT=y
BR2_BINFMT_FLAT_ONE=y
# BR2_BINFMT_FLAT_SEP_DATA is not set

which leads to BR2_TOOLCHAIN_HAS_LIBATOMIC not being enabled:
https://git.busybox.net/buildroot/tree/toolchain/Config.in#n851

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
