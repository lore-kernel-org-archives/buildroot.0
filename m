Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FF4C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 069A180AF8;
	Thu, 12 Jun 2025 20:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDlC3isz5i_P; Thu, 12 Jun 2025 20:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CB1580A80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB1580A80;
	Thu, 12 Jun 2025 20:12:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 141811BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB07E40983
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEWibe371AZX for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FE874091F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FE874091F
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 224278354A; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dc537f767bb045e0dce5ffc7668fcc5b77c5e596
X-Git-Newrev: 2eb204effcb89f09f6e0413c66a0edca97b1fbe1
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.224278354A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uuu: fix gcc-15
 compile errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=2eb204effcb89f09f6e0413c66a0edca97b1fbe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fix the following compilation errors:

In file included from /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.cpp:32:
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:52:9: error: 'uint32_t' does not name a type
   52 |         uint32_t m_offset = 0;
      |         ^~~~~~~~
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:33:1: note: 'uint32_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
   32 | #include "cmd.h"
  +++ |+#include <cstdint>
   33 |
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:53:9: error: 'uint64_t' does not name a type
   53 |         uint64_t m_scan_limited = UINT64_MAX;
      |         ^~~~~~~~
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:53:9: note: 'uint64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h: In constructor 'SDPSCmd::SDPSCmd(char*)':
/workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:41:47: error: 'm_offset' was not declared in this scope
   41 |                 insert_param_info("-offset", &m_offset, Param::Type::e_uint32);

Fixes:
- https://autobuild.buildroot.org/results/b7b/b7bd052a0137a2e2d5606d66a0dc563789999364/
- https://autobuild.buildroot.org/results/350/3500f573427545e51bfc4fc708f769966d95bf1e/
- https://autobuild.buildroot.org/results/6dc/6dc2b0585e8e1900e5a977cd0b9e26b2ee1e90d4/
- https://autobuild.buildroot.org/results/d1f/d1f82cae003cddefae0c49f673768cd8601449f2/
- https://autobuild.buildroot.org/results/9ed/9edc245d0a03089812d631708a4294ff293a461d/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6788f3d26ccf36b928c68b423077ae590d176967)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0001-libuuu-sdps-fix-gcc15-compile-errors.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch b/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch
new file mode 100644
index 0000000000..a3c1d85fc0
--- /dev/null
+++ b/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch
@@ -0,0 +1,33 @@
+From 142448e55386b88adf5b1d7e6206df1ca6784708 Mon Sep 17 00:00:00 2001
+From: Bruno Thomsen <bruno.thomsen@gmail.com>
+Date: Sat, 1 Mar 2025 14:32:41 +0100
+Subject: [PATCH] libuuu/sdps: fix gcc15 compile errors
+
+This gcc 15 error happens on Fedora 42.
+
+error: uint32_t does not name a type
+
+error: uint64_t does not name a type
+
+Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
+Upstream: https://github.com/nxp-imx/mfgtools/commit/142448e55386b88adf5b1d7e6206df1ca6784708
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ libuuu/sdps.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libuuu/sdps.h b/libuuu/sdps.h
+index b82f9d71c981..667a477ee48f 100644
+--- a/libuuu/sdps.h
++++ b/libuuu/sdps.h
+@@ -30,6 +30,7 @@
+ */
+ 
+ #include "cmd.h"
++#include <cstdint>
+ 
+ class SDPSCmd : public CmdBase
+ {
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
