Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B3AC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 18:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 766C241C96;
	Fri,  1 Mar 2024 18:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hm4LdfPSzGRP; Fri,  1 Mar 2024 18:18:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C4F400D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7C4F400D0;
	Fri,  1 Mar 2024 18:18:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5671BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EDDF83B47
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILYiy2Wqea0Z for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 18:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FEFB83AAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FEFB83AAF
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 18:18:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67EEB87F20; Fri,  1 Mar 2024 18:18:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 19:16:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fcb4469dbd2392c3210293d04d9776190280373
X-Git-Newrev: fd3f953c7883b2a5d30cff03c92e34a2b2718953
X-Patchwork-Hint: ignore
Message-Id: <20240301181825.67EEB87F20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/syslinux: fix build with gnu-efi >=
 3.0.16
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fd3f953c7883b2a5d30cff03c92e34a2b2718953
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fa9893ad8f "package/gnu-efi: bump to version 3.0.17" updated
gnu-efi. This update introduced syslinux build failure, as reported
in [1].

This commit adds a package patch to fix this issue. For technical
details of the issue, see the package patch commit log.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/6256880937
- https://gitlab.com/buildroot.org/buildroot/-/jobs/6256880949

[1] https://lists.buildroot.org/pipermail/buildroot/2024-February/685971.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0019-stddef.h-add-wchar_t-type-definition.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/boot/syslinux/0019-stddef.h-add-wchar_t-type-definition.patch b/boot/syslinux/0019-stddef.h-add-wchar_t-type-definition.patch
new file mode 100644
index 0000000000..65d9463a6f
--- /dev/null
+++ b/boot/syslinux/0019-stddef.h-add-wchar_t-type-definition.patch
@@ -0,0 +1,59 @@
+From 063dac55c45d0264671c3463e824ab659e5cbb87 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Tue, 27 Feb 2024 21:09:15 +0100
+Subject: [PATCH] stddef.h: add wchar_t type definition
+
+Syslinux fail to build with gnu-efi >= 3.0.16 with error:
+
+    In file included from /host/i686-buildroot-linux-gnu/sysroot/usr/include/efi/efi.h:44,
+                     from /build/syslinux-6.03/efi/efi.h:23,
+                     from /build/syslinux-6.03/efi/adv.h:4,
+                     from /build/syslinux-6.03/efi/adv.c:29:
+    /host/i686-buildroot-linux-gnu/sysroot/usr/include/efi/ia32/efibind.h:90:9: error: unknown type name 'wchar_t'
+     typedef wchar_t CHAR16;
+             ^~~~~~~
+
+This is because gnu-efi started to use the "wchar_t" type from the
+toolchain's <stddef.h> header, in commit [1]. Before this commit,
+gnu-efi was defining the type as "short".
+
+Syslinux is including its own minimal stddef.h file, which masks the
+one provided by the toolchain. See [2]. This file does not have a type
+definition for "wchar_t".
+
+Finally, the POSIX <stddef.h> header is supposed to provide this
+"wchar_t" type definition. See [3].
+
+This commit fixes the issue by adding the "wchar_t" type definition in
+the com32/include/stddef.h header. Since Syslinux has "-fshort-wchar"
+in its CFLAGS (see [4]), "wchar_t" is simply defined as "short". This
+also follow the previous gnu-efi < 3.0.16 behavior.
+
+This issue was seen in Buildroot Linux, in [5].
+
+[1] https://sourceforge.net/p/gnu-efi/code/ci/189200d0b0f6fff473d302880d9569f45d4d8c4d
+[2] https://repo.or.cz/syslinux.git/blob/refs/tags/syslinux-6.03:/com32/include/stddef.h
+[3] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/stddef.h.html
+[4] https://repo.or.cz/syslinux.git/blob/refs/tags/syslinux-6.03:/mk/efi.mk#l27
+[5] https://lists.buildroot.org/pipermail/buildroot/2024-February/685971.html
+
+Upstream: Proposed: https://www.syslinux.org/archives/2024-February/026903.html
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ com32/include/stddef.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/com32/include/stddef.h b/com32/include/stddef.h
+index f52d62f3..437b11f2 100644
+--- a/com32/include/stddef.h
++++ b/com32/include/stddef.h
+@@ -29,4 +29,6 @@
+  */
+ #define container_of(p, c, m) ((c *)((char *)(p) - offsetof(c,m)))
+ 
++typedef short wchar_t;
++
+ #endif /* _STDDEF_H */
+-- 
+2.44.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
