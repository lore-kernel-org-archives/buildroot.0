Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A11BCCF9FA
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1515B83F79;
	Thu, 30 Oct 2025 08:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKx8YZXqyRxN; Thu, 30 Oct 2025 08:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2FC68403F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2FC68403F;
	Thu, 30 Oct 2025 08:22:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B6F42A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBC8F61391
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wW5BolnEyHlp for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 547E161383
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 547E161383
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52F8587A0C; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:17:49 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 9127f0dacbf0ddd6d32e19922d4d1d536e132d5b
X-Git-Newrev: 6827af4384b9576557b65fb48db2d84d7b830bfa
X-Patchwork-Hint: ignore
Message-Id: <20251030082228.52F8587A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/siproxd: Add
 upstream patch to fix build with gcc >= 14
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4686443233420649423=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4686443233420649423==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6827af4384b9576557b65fb48db2d84d7b830bfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/679/679fe86eea2001aed2baf066abf3ae43b38567b5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bd5934cd7e6bea10c0ce5d854e1e57962489c9ac)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../siproxd/0001-Fix-compilation-on-gcc-14.patch   | 50 ++++++++++++++++++++++
 package/siproxd/siproxd.mk                         |  2 +
 2 files changed, 52 insertions(+)

diff --git a/package/siproxd/0001-Fix-compilation-on-gcc-14.patch b/package/siproxd/0001-Fix-compilation-on-gcc-14.patch
new file mode 100644
index 0000000000..0a55969703
--- /dev/null
+++ b/package/siproxd/0001-Fix-compilation-on-gcc-14.patch
@@ -0,0 +1,50 @@
+From 985c2cd198213b250c61d8c6621af52e318c4c12 Mon Sep 17 00:00:00 2001
+From: crumpled-acronym <60061744+crumpled-acronym@users.noreply.github.com>
+Date: Mon, 30 Jun 2025 12:32:02 +0200
+Subject: [PATCH] Fix compilation on gcc >= 14
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+`./configure` fails for gcc >= 14 with the following error
+
+```
+checking "libosip prefix"...
+checking for osip_init in -losip2... yes
+checking for parser_init in -losipparser2... yes
+checking libosip2 version > 3.0.0... *** ERROR: libosip2-3.x.x is required!
+```
+
+which in fact is caused by the test program in `ACX_CHECK_LIBOSIP_VERSION` function in `acinclude.m4` due to
+
+```
+conftest.c:4:3: error: return type defaults to ‘int’ [-Wimplicit-int]
+    4 | main() {
+      | ^~~~
+```
+
+This patch fixes the issue!
+
+Upstream: https://github.com/hb9xar/siproxd/commit/985c2cd198213b250c61d8c6621af52e318c4c12
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 6fa4828..8164246 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -340,7 +340,7 @@ dnl pointer to the structure (bad)
+ AC_COMPILE_IFELSE(
+ [AC_LANG_SOURCE([
+   #include <osipparser2/osip_parser.h>
+-  main() {
++  int main() {
+   osip_message_t t;
+   int  e;
+   e=t.contacts.nb_elt;
+-- 
+2.47.3
+
diff --git a/package/siproxd/siproxd.mk b/package/siproxd/siproxd.mk
index 228f0855a6..faabb68a24 100644
--- a/package/siproxd/siproxd.mk
+++ b/package/siproxd/siproxd.mk
@@ -12,6 +12,8 @@ SIPROXD_LICENSE_FILES = COPYING
 
 SIPROXD_DEPENDENCIES = libosip2 libtool sqlite
 
+# 0001-Fix-compilation-on-gcc-14.patch
+SIPROXD_AUTORECONF = YES
 SIPROXD_CONF_OPTS = --without-included-ltdl
 
 $(eval $(autotools-package))

--===============4686443233420649423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4686443233420649423==--
