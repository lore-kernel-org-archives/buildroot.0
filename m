Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6424DD3B98E
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B29B84360;
	Tue,  9 Dec 2025 18:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzJKEIN816Go; Tue,  9 Dec 2025 18:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3421884523
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304904;
	bh=keYEL71pAObLtuwi8gNHI8GKR6Gggcauy+LbPArLmGw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dAyEeafRQivU5mg1Tfhk0/BU/gY4onD8BbaIVF1IOHzORFp/TF2GS/rwSTtZCHFX6
	 1D5qCkJ/ROOBqIVTO+V2ppVHa8lmirvm8K2p6i8LVk2jtK98Cwezgs3JocLtr9PghO
	 UdUNMCGgIa9qElRYoIa2+hCxeh/6qiMDdNxfafzjuZ4G8Y7fdWSyBt3zLo5X8xHchR
	 VoY/PMD9FKKn+H/QAzDoX/jmJeITR8t4rPd4HCL6VJtk/EbCID8hNKQPQh89xooA36
	 fYfg/RHOtIQEFMqsCORddSdCRp7dVTpOH7mU8BHLI+1sHJFXqLKi7tyC/WSOjJvCus
	 fKWw6oYJLxgeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3421884523;
	Tue,  9 Dec 2025 18:28:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D6F82C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB88684360
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfR2H8Wns8Mv for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF5DD84373
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF5DD84373
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED2B586964; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7dd31d302133dd8fc5d6f44a42209fdb3573c51f
X-Git-Newrev: 1983c12bd3c50a2a2b180b6562425746d4f90cdc
X-Patchwork-Hint: ignore
Message-Id: <20251209182817.ED2B586964@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/waylandpp: bump
 version to 1.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1983c12bd3c50a2a2b180b6562425746d4f90cdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/NilsBrause/waylandpp/releases/tag/1.0.1

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-add-missing-cstdint-include.patch         | 61 ----------------------
 package/waylandpp/waylandpp.hash                   |  2 +-
 package/waylandpp/waylandpp.mk                     |  2 +-
 3 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/package/waylandpp/0001-add-missing-cstdint-include.patch b/package/waylandpp/0001-add-missing-cstdint-include.patch
deleted file mode 100644
index 13b0ce49ad..0000000000
--- a/package/waylandpp/0001-add-missing-cstdint-include.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 3c441910aa25f57df2a4db55f75f5d99cea86620 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Sun, 8 Jan 2023 18:24:53 +0000
-Subject: [PATCH] add missing <cstdint> include
-
-Upcoming `gcc-13` made `<string>` leaner and does not include `<cstdint>`
-implicitly anymore. As a result build fails without the change as:
-
-    [  2%] Building CXX object CMakeFiles/wayland-scanner++.dir/scanner/scanner.cpp.o
-    scanner/scanner.cpp:378:3: error: 'uint32_t' does not name a type
-      378 |   uint32_t width = 0;
-          |   ^~~~~~~~
-
-Upstream: https://github.com/NilsBrause/waylandpp/pull/71
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- include/wayland-client.hpp | 1 +
- scanner/scanner.cpp        | 3 +++
- 2 files changed, 4 insertions(+)
-
-diff --git a/include/wayland-client.hpp b/include/wayland-client.hpp
-index a3f782b..4598a0e 100644
---- a/include/wayland-client.hpp
-+++ b/include/wayland-client.hpp
-@@ -29,6 +29,7 @@
- /** \file */
- 
- #include <atomic>
-+#include <cstdint>
- #include <functional>
- #include <memory>
- #include <string>
-diff --git a/scanner/scanner.cpp b/scanner/scanner.cpp
-index bebd71e..37cf7ff 100644
---- a/scanner/scanner.cpp
-+++ b/scanner/scanner.cpp
-@@ -23,6 +23,7 @@
- #include <vector>
- #include <cctype>
- #include <cmath>
-+#include <cstdint>
- #include <stdexcept>
- 
- #include "pugixml.hpp"
-@@ -1106,6 +1107,7 @@ int main(int argc, char *argv[])
-   wayland_hpp << "#pragma once" << std::endl
-               << std::endl
-               << "#include <array>" << std::endl
-+              << "#include <cstdint>" << std::endl
-               << "#include <functional>" << std::endl
-               << "#include <memory>" << std::endl
-               << "#include <string>" << std::endl
-@@ -1125,6 +1127,7 @@ int main(int argc, char *argv[])
-     wayland_server_hpp << "#pragma once" << std::endl
-                        << std::endl
-                        << "#include <array>" << std::endl
-+                       << "#include <cstdint>" << std::endl
-                        << "#include <functional>" << std::endl
-                        << "#include <memory>" << std::endl
-                        << "#include <string>" << std::endl
diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
index a3eb5379af..8513060f91 100644
--- a/package/waylandpp/waylandpp.hash
+++ b/package/waylandpp/waylandpp.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b20b45917382c6b87e9380130c9a1a1c563da2f498de5830df12fbce326dd9f5  waylandpp-1.0.0.tar.gz
+sha256  49c362fa5db28ab5472968215b88f1fbe3a7b7f57818dde722fd7d38997d940a  waylandpp-1.0.1.tar.gz
 sha256  3eee5022ce84ead344e1c51b9d00c7f450f53003fe096fe460d66c616fe56782  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
index 4a0d58ba50..f177c6e5be 100644
--- a/package/waylandpp/waylandpp.mk
+++ b/package/waylandpp/waylandpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLANDPP_VERSION = 1.0.0
+WAYLANDPP_VERSION = 1.0.1
 WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
 WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
 WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
