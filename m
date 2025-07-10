Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327C6C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A58261470;
	Fri, 11 Jul 2025 10:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0g4hgp237meU; Fri, 11 Jul 2025 10:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31FD3612E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31FD3612E7;
	Fri, 11 Jul 2025 10:21:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D881199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F29440DBA
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQxMlM_kx8E4 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4B2140C44
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4B2140C44
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2A3B86337; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:39:46 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: d6db027193ccf4c96f785e7b2088385f9c3ded30
X-Git-Newrev: a7aeb028b4e818174050da7d004cfa724113808e
X-Patchwork-Hint: ignore
Message-Id: <20250711102104.B2A3B86337@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/hddtemp: fix
 build without nls
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
Content-Type: multipart/mixed; boundary="===============1259915470330276389=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1259915470330276389==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a7aeb028b4e818174050da7d004cfa724113808e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Fixes:
https://autobuild.buildroot.org/results/06b44df261318ce1d07f6cb20b26e4ad64222940/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 196989235e6f0266fca48b6c73c780436c7ebcb0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/hddtemp/0001-fix-build-without-nls.patch | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/hddtemp/0001-fix-build-without-nls.patch b/package/hddtemp/0001-fix-build-without-nls.patch
new file mode 100644
index 0000000000..356b94b010
--- /dev/null
+++ b/package/hddtemp/0001-fix-build-without-nls.patch
@@ -0,0 +1,40 @@
+From c9d0d249ff013d33cf1fd5a586c16ee30095cc90 Mon Sep 17 00:00:00 2001
+From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+Date: Fri, 14 Feb 2025 10:08:43 +0100
+Subject: [PATCH] fix build without nls
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+> hddtemp.c: In function ‘main’:
+> hddtemp.c:274:3: error: implicit declaration of function ‘bindtextdomain’ [-Wimplicit-function-declaration]
+>   274 |   bindtextdomain (PACKAGE, LOCALEDIR);
+>       |   ^~~~~~~~~~~~~~
+> hddtemp.c:275:3: error: implicit declaration of function ‘textdomain’ [-Wimplicit-function-declaration]
+>   275 |   textdomain (PACKAGE);
+>       |   ^~~~~~~~~~
+> make[2]: *** [Makefile:496: hddtemp-hddtemp.o] Error 1
+
+Upstream: https://github.com/vitlav/hddtemp/pull/16
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/hddtemp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/hddtemp.c b/src/hddtemp.c
+index 64d000e..bfea556 100644
+--- a/src/hddtemp.c
++++ b/src/hddtemp.c
+@@ -270,9 +270,11 @@ int main(int argc, char* argv[]) {
+   backtrace_sigill();
+   backtrace_sigbus();
+ 
++#if ENABLE_NLS
+   setlocale (LC_ALL, "");
+   bindtextdomain (PACKAGE, LOCALEDIR);
+   textdomain (PACKAGE);
++#endif
+ 
+   show_db = debug = numeric = quiet = wakeup = af_hint = syslog_interval = foreground = 0;
+   unit = DEFAULT;

--===============1259915470330276389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1259915470330276389==--
