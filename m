Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800FDC71149
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BA0F40A83;
	Thu, 12 Jun 2025 20:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecVfT50eKHbQ; Thu, 12 Jun 2025 20:12:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 495BD40995
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 495BD40995;
	Thu, 12 Jun 2025 20:12:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A98327A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8CDF40944
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fq_odLBGqvGH for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF6E40978
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FF6E40978
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E5B58354A; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 345f56ebe07cbb0fb800ae3dd9e014c54d824384
X-Git-Newrev: da8b43bc92af7bcc482896e4d18d71251f89a6e4
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.7E5B58354A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/qt5/qt5webengine-chromium: fix build with host GCC 15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da8b43bc92af7bcc482896e4d18d71251f89a6e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Ideally we should update our version of qt5webengine-chromium first,
we're more than 600 commits behind on the stable branch from KDE.
However, this is a quick fix solution that allows us to build the
current state in Fedora 42.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c9ae932c94e84f325d1d1d87e00965559263a8c6)
[thomas: rename patch from 0012-.. to 0011-..]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...Include-cstdint-for-uintptr_t-uint8_t-etc.patch | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0011-Include-cstdint-for-uintptr_t-uint8_t-etc.patch b/package/qt5/qt5webengine-chromium/0011-Include-cstdint-for-uintptr_t-uint8_t-etc.patch
new file mode 100644
index 0000000000..f68f266e39
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0011-Include-cstdint-for-uintptr_t-uint8_t-etc.patch
@@ -0,0 +1,101 @@
+From 80ddc04dd2398611afd8eafd89f5a6cd81b82363 Mon Sep 17 00:00:00 2001
+From: Arnout Vandecappelle <arnout@rnout.be>
+Date: Sun, 18 May 2025 09:59:24 +0200
+Subject: [PATCH] Include <cstdint> for uintptr_t, uint8_t, etc.
+
+GCC 15 adheres more strictly to the standard about which type is defined
+in which header. As such, uintptr_t, uint8_t, etc. are  no longer
+available unless cstdint is included.
+
+Add #include <cstdint> in the files that gave errors with GCC 15
+
+Most (all?) of these fixes are already upstream, but spread out over
+various commits that don't necessarily apply to our version. Fixing it
+ourselves is simpler.
+
+Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
+Upstream: N/A, already fixed and we're very far behind
+---
+ chromium/base/task/thread_pool.h                                 | 1 +
+ chromium/net/tools/huffman_trie/trie_entry.h                     | 1 +
+ .../transport_security_state_entry.h                             | 1 +
+ .../perfetto/include/perfetto/ext/tracing/core/slice.h           | 1 +
+ .../perfetto/include/perfetto/tracing/tracing_backend.h          | 1 +
+ .../perfetto/src/trace_processor/importers/gzip/gzip_utils.h     | 1 +
+ 6 files changed, 6 insertions(+)
+
+diff --git a/chromium/base/task/thread_pool.h b/chromium/base/task/thread_pool.h
+index 085c249ba58e6..afc674ca7f6fb 100644
+--- a/chromium/base/task/thread_pool.h
++++ b/chromium/base/task/thread_pool.h
+@@ -5,6 +5,7 @@
+ #ifndef BASE_TASK_THREAD_POOL_H_
+ #define BASE_TASK_THREAD_POOL_H_
+ 
++#include <cstdint>
+ #include <memory>
+ #include <utility>
+ 
+diff --git a/chromium/net/tools/huffman_trie/trie_entry.h b/chromium/net/tools/huffman_trie/trie_entry.h
+index fe70260f981f2..eac6a7fc2499d 100644
+--- a/chromium/net/tools/huffman_trie/trie_entry.h
++++ b/chromium/net/tools/huffman_trie/trie_entry.h
+@@ -5,6 +5,7 @@
+ #ifndef NET_TOOLS_HUFFMAN_TRIE_TRIE_ENTRY_H_
+ #define NET_TOOLS_HUFFMAN_TRIE_TRIE_ENTRY_H_
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <vector>
+diff --git a/chromium/net/tools/transport_security_state_generator/transport_security_state_entry.h b/chromium/net/tools/transport_security_state_generator/transport_security_state_entry.h
+index 59059d88f6df2..fe15bb7429f6d 100644
+--- a/chromium/net/tools/transport_security_state_generator/transport_security_state_entry.h
++++ b/chromium/net/tools/transport_security_state_generator/transport_security_state_entry.h
+@@ -5,6 +5,7 @@
+ #ifndef NET_TOOLS_TRANSPORT_SECURITY_STATE_GENERATOR_TRANSPORT_SECURITY_STATE_ENTRY_H_
+ #define NET_TOOLS_TRANSPORT_SECURITY_STATE_GENERATOR_TRANSPORT_SECURITY_STATE_ENTRY_H_
+ 
++#include <cstdint>
+ #include <map>
+ #include <memory>
+ #include <string>
+diff --git a/chromium/third_party/perfetto/include/perfetto/ext/tracing/core/slice.h b/chromium/third_party/perfetto/include/perfetto/ext/tracing/core/slice.h
+index 4ce66fdeadc3a..3f3932b228737 100644
+--- a/chromium/third_party/perfetto/include/perfetto/ext/tracing/core/slice.h
++++ b/chromium/third_party/perfetto/include/perfetto/ext/tracing/core/slice.h
+@@ -20,6 +20,7 @@
+ #include <stddef.h>
+ #include <string.h>
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <vector>
+diff --git a/chromium/third_party/perfetto/include/perfetto/tracing/tracing_backend.h b/chromium/third_party/perfetto/include/perfetto/tracing/tracing_backend.h
+index 67b0d2eb51e0d..3c2462de588dd 100644
+--- a/chromium/third_party/perfetto/include/perfetto/tracing/tracing_backend.h
++++ b/chromium/third_party/perfetto/include/perfetto/tracing/tracing_backend.h
+@@ -17,6 +17,7 @@
+ #ifndef INCLUDE_PERFETTO_TRACING_TRACING_BACKEND_H_
+ #define INCLUDE_PERFETTO_TRACING_TRACING_BACKEND_H_
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ 
+diff --git a/chromium/third_party/perfetto/src/trace_processor/importers/gzip/gzip_utils.h b/chromium/third_party/perfetto/src/trace_processor/importers/gzip/gzip_utils.h
+index 624363ff66f90..68783e879c8e0 100644
+--- a/chromium/third_party/perfetto/src/trace_processor/importers/gzip/gzip_utils.h
++++ b/chromium/third_party/perfetto/src/trace_processor/importers/gzip/gzip_utils.h
+@@ -18,6 +18,7 @@
+ #define SRC_TRACE_PROCESSOR_IMPORTERS_GZIP_GZIP_UTILS_H_
+ 
+ #include <memory>
++#include <cstdint>
+ 
+ struct z_stream_s;
+ 
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
