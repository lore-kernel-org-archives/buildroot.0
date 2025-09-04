Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274ADCAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC35C607DA;
	Mon,  8 Sep 2025 14:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dl7TxmNwIIPD; Mon,  8 Sep 2025 14:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 153B9607A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 153B9607A0;
	Mon,  8 Sep 2025 14:18:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FCC7234
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64A8440074
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhJChGfuQNhn for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B06B4007B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B06B4007B
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0794980DA7; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 18:58:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7216460a3afc07b5a263e54a20158eccb2affa4
X-Git-Newrev: bf55f4713e1ba877183b9e31469df5d3823ec4c0
X-Patchwork-Hint: ignore
Message-Id: <20250908141631.0794980DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apitrace: fix build with GCC 15.x
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
Content-Type: multipart/mixed; boundary="===============1497090811296335717=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1497090811296335717==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bf55f4713e1ba877183b9e31469df5d3823ec4c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  /home/thomas/buildroot/buildroot/outputs/all/build/apitrace-10.0/retrace/metric_writer.cpp:50:70: error: ‘uint64_t’ does not name a type
   50 |         case CNT_NUM_UINT64: std::cout << "\t" << *(reinterpret_cast<uint64_t*>(data)); break;
      |                                                                      ^~~~~~~~

Fixes:

  http://autobuild.buildroot.net/results/6e4/6e4e841b4f0be29956fdfad43a406d2dab3003f3/build-end.log

Patch is backported from upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a4b0913280b95b62cd74fdc5ff0b25e3afa2c529)
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/apitrace/0003-Explicit-header-stdint.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/apitrace/0003-Explicit-header-stdint.patch b/package/apitrace/0003-Explicit-header-stdint.patch
new file mode 100644
index 0000000000..efd7522314
--- /dev/null
+++ b/package/apitrace/0003-Explicit-header-stdint.patch
@@ -0,0 +1,42 @@
+From 3cc8956995d6d702a2c3ef0d7f91500c6accbfad Mon Sep 17 00:00:00 2001
+From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+Date: Fri, 21 Mar 2025 05:02:23 +0000
+Subject: [PATCH] Explicit header: stdint
+
+Fix building with GCC-15. It no longer includes it by default.
+
+Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+Upstream: 952bad1469ea747012bdc48c48993bd5f13eec04
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ frametrim/ft_dependecyobject.hpp | 1 +
+ retrace/metric_writer.cpp        | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/frametrim/ft_dependecyobject.hpp b/frametrim/ft_dependecyobject.hpp
+index cf1885f1..53b910d0 100644
+--- a/frametrim/ft_dependecyobject.hpp
++++ b/frametrim/ft_dependecyobject.hpp
+@@ -28,6 +28,7 @@
+ #pragma once
+ 
+ #include "ft_tracecall.hpp"
++#include <stdint.h>
+ 
+ namespace frametrim {
+ 
+diff --git a/retrace/metric_writer.cpp b/retrace/metric_writer.cpp
+index e923ed1d..4e4ce748 100644
+--- a/retrace/metric_writer.cpp
++++ b/retrace/metric_writer.cpp
+@@ -24,6 +24,7 @@
+  **************************************************************************/
+ 
+ #include <iostream>
++#include <stdint.h>
+ 
+ #include "metric_writer.hpp"
+ 
+-- 
+2.50.1
+

--===============1497090811296335717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1497090811296335717==--
