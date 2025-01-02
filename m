Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93A1E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 11:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C8F607BE;
	Thu,  2 Jan 2025 11:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dl-TC1QdO4La; Thu,  2 Jan 2025 11:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 515A160769
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 515A160769;
	Thu,  2 Jan 2025 11:34:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF843E0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD5526069E
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxyqTLr-HAIb for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 11:34:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 024C660769
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 024C660769
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:34:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB22382AFD; Thu,  2 Jan 2025 11:34:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Jan 2025 12:08:32 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: a58fb01a6bc467e4737c1a9bd2d4f7d370078f40
X-Git-Newrev: a51d3f794fe7a97e5301ae4caa5c2e00c379d698
X-Patchwork-Hint: ignore
Message-Id: <20250102113415.EB22382AFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/libsha1: Fix
 gcc14 compilation in libsha1
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3018510957230093906=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3018510957230093906==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a51d3f794fe7a97e5301ae4caa5c2e00c379d698
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

GCC14 removed the implicit int support.
This commit adds a patch to libsha1 to fix an implicit int declaration
as recommended.

Link: https://gcc.gnu.org/gcc-14/porting_to.html

Fixes:
    http://autobuild.buildroot.net/results/87dc9ba9690cbb6a82875734ce9cb8dbaf878e46/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d427d27aeeaec4ff52e948fdc7d4be3ce0c9e2bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-test-fix-gcc-14.x-compile-implicit-int.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/libsha1/0001-test-fix-gcc-14.x-compile-implicit-int.patch b/package/libsha1/0001-test-fix-gcc-14.x-compile-implicit-int.patch
new file mode 100644
index 0000000000..603a2b77a8
--- /dev/null
+++ b/package/libsha1/0001-test-fix-gcc-14.x-compile-implicit-int.patch
@@ -0,0 +1,39 @@
+From d449f26f782be91b3847f88ed2bd937582a575b6 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 25 Aug 2024 11:33:59 +0200
+Subject: [PATCH] test: fix gcc-14.x compile (implicit int)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  test.c:14:8: error: type defaults to ‘int’ in declaration of ‘num_test’ [-Wimplicit-int]
+     14 | static num_test;
+        |        ^~~~~~~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+Upstream: https://github.com/dottedmag/libsha1/pull/1
+
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ test.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test.c b/test.c
+index 21a6525..1ec89d3 100644
+--- a/test.c
++++ b/test.c
+@@ -11,7 +11,7 @@ static void print_hex(const char* data, size_t size)
+         printf("%x%x", ((unsigned char)data[i])/16, ((unsigned char)data[i])%16);
+ }
+ 
+-static num_test;
++static int num_test;
+ 
+ static int do_test(const char* data, size_t size, const char* expected_dgst)
+ {
+-- 
+2.47.1
+

--===============3018510957230093906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3018510957230093906==--
