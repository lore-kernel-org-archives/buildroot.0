Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5828CFC522
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 16:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4CB941303;
	Sat, 22 Nov 2025 16:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0E6by0SmGJ9; Sat, 22 Nov 2025 16:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFEBC412EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFEBC412EC;
	Sat, 22 Nov 2025 16:53:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BD6034E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D58C4026E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ME4sXCTd1X13 for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 16:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4460D4018D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4460D4018D
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:53:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F40C85E15; Sat, 22 Nov 2025 16:53:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 17:51:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08a638d49ffb956e759f1b3950dd2b11f6fea483
X-Git-Newrev: 32490ae99f9cfd2ded0b150071b28908419c7244
X-Patchwork-Hint: ignore
Message-Id: <20251122165322.3F40C85E15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/woff2: fix build with newer gcc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32490ae99f9cfd2ded0b150071b28908419c7244
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a build error not yet seen by the autobuilders due to other
packages failing before. Seen with defconfig:
https://autobuild.buildroot.net/results/ebf/ebf9a81f7e225ecdab20bbad8ad8daa136fddb46/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ff2-output.h-add-missing-stdint.h-include.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch b/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch
new file mode 100644
index 0000000000..a79b414a4c
--- /dev/null
+++ b/package/woff2/0002-include-woff2-output.h-add-missing-stdint.h-include.patch
@@ -0,0 +1,41 @@
+From 08ece7871775c0d7bf4fdff64b961cdc256adf6c Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Fri, 2 Aug 2024 22:12:03 +0100
+Subject: [PATCH] include/woff2/output.h: add missing <stdint.h> include
+
+Without the change `woff2` build fails on upcoming `gcc-15` as:
+
+    In file included from src/woff2_out.cc:9:
+    include/woff2/output.h:73:25: error: expected ')' before '*' token
+       73 |   WOFF2MemoryOut(uint8_t* buf, size_t buf_size);
+          |                 ~       ^
+          |                         )
+    include/woff2/output.h:79:3: error: 'uint8_t' does not name a type
+       79 |   uint8_t* buf_;
+          |   ^~~~~~~
+    include/woff2/output.h:16:1: note: 'uint8_t' is defined in header '<cstdint>';
+      this is probably fixable by adding '#include <cstdint>'
+       15 | #include <string>
+      +++ |+#include <cstdint>
+       16 |
+
+Upstream: https://github.com/google/woff2/pull/176
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/woff2/output.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/woff2/output.h b/include/woff2/output.h
+index dc78ccf..b12d538 100644
+--- a/include/woff2/output.h
++++ b/include/woff2/output.h
+@@ -9,6 +9,8 @@
+ #ifndef WOFF2_WOFF2_OUT_H_
+ #define WOFF2_WOFF2_OUT_H_
+ 
++#include <stdint.h>
++
+ #include <algorithm>
+ #include <cstring>
+ #include <memory>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
