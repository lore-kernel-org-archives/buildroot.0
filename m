Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF44C61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 20:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 998CA6070B;
	Thu, 27 Aug 2026 20:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJVk2uiK590c; Thu, 27 Aug 2026 20:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787863414;
	bh=y7mF8a7gIunsE6FERgMtklytyQPOIfx6eQxDxuZKGWI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BXSnjxW3fydCziSv+23OIN9kLc7Nq9holmNqBQ0nB5g/q/1aAKK11KdZmpV5myk1m
	 tPtr/KpPLpoxXW6cly0HPrAl5WZ7qyP4+W4zpP+QTVbq3nczMb/Vb6g9z4EUWXEQK5
	 KBHgx0UKFWwhDCAxCp3TVHOlcn6PRzcFew7ilGevy0Oi/I5SvZloBv3ujwc1kua9Td
	 eoXxEaNHTqRpIPPV1EJ3y4T7RldnOJ5FYHqDiFDXfn6Gy733YK/GjxPIVhHnGGPusH
	 ZMh9oA4Q+6/8csjTUyNRFgfr6OA2fFR5vxtcyasJHqZyQqOIc32NXnHxgmyL0q+W97
	 MqTsuGML5TjwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B86B2607E0;
	Thu, 27 Aug 2026 20:43:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 199E675
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B82440143
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocoJuoUuxisi for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 20:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E1EE4011D
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 20:43:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6D36920D9; Thu, 27 Aug 2026 20:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 22:42:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34473e672b7cb4dabcf6ed36a4cb41ccb1e04641
X-Git-Newrev: 79554a4520f3d3c07c3ddf12e6c64669b5a9cc8a
X-Patchwork-Hint: ignore
Message-Id: <20260827204235.A6D36920D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: fix build issue with gcc <
 13
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
Content-Type: multipart/mixed; boundary="===============8831975859087011891=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8831975859087011891==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79554a4520f3d3c07c3ddf12e6c64669b5a9cc8a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since upstream commit
e42e3193137d1b21e84b499336e7a8887b8a8689 ("intel: add Jay"), a C23
construct is used in the intel driver code:

enum jay_predication : uint8_t

This causes a build issue with GCC < 13:

In file included from ../src/intel/compiler/jay/jay_builder.h:12,
                 from ../src/intel/compiler/jay/jay_from_nir.c:23:
../src/intel/compiler/jay/jay_ir.h:582:22: error: expected identifier or ‘(’ before ‘:’ token
  582 | enum jay_predication : uint8_t {
      |                      ^
../src/intel/compiler/jay/jay_ir.h:637:25: error: field ‘predication’ has incomplete type
  637 |    enum jay_predication predication;
      |                         ^~~~~~~~~~~

We fix that by integrating a patch already available in
OpenEmbedded. It changes the code to not use the C23 construct.

This build issue was encountered on host-mesa3d while building an
allyespackageconfig configuration inside our standard Docker
container.

Buildroot commit
c073c976179021c84e0c84f6f23e938b43783e75 ("package/{mesa3d,
mesa3d-headers}: bump version to 26.1.0") that switched to mesa3d
26.1.0, which contains the problematic commit. Therefore 2026.05 is
affected, but not earlier Buildroot versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ompiler-jay-jay_ir.h-do-not-used-typed-en.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
new file mode 100644
index 0000000000..af066287e2
--- /dev/null
+++ b/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -0,0 +1,41 @@
+From 345ccf93e9d00dfd0f71085832a7df0170b74f74 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 14 Jun 2026 17:42:19 +0200
+Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
+
+This is a C23 feature and not supported by gcc < 13, which
+many host distros still have (e.g. Debian 12).
+
+Upstream-Status: Inappropriate [yocto host distro requirements]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+Upstream: N/A, code completely changed upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/intel/compiler/jay/jay_ir.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/intel/compiler/jay/jay_ir.h b/src/intel/compiler/jay/jay_ir.h
+index 8307044ef8a..abf175a71bf 100644
+--- a/src/intel/compiler/jay/jay_ir.h
++++ b/src/intel/compiler/jay/jay_ir.h
+@@ -579,7 +579,7 @@ jay_type_is_any_float(enum jay_type t)
+    return jay_base_type(t) == JAY_TYPE_F || jay_base_type(t) == JAY_TYPE_BF;
+ }
+ 
+-enum jay_predication : uint8_t {
++enum jay_predication {
+    /** No predication. */
+    JAY_NOT_PREDICATED = 0,
+ 
+@@ -634,7 +634,7 @@ typedef struct jay_inst {
+    bool decrement_dep:1;
+    unsigned padding  :12;
+ 
+-   enum jay_predication predication;
++   uint8_t predication;
+    enum jay_conditional_mod conditional_mod;
+ 
+    jay_def cond_flag; /**< conditional flag */
+-- 
+2.55.0
+

--===============8831975859087011891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8831975859087011891==--
