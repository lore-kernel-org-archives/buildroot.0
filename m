Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21862D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECCAD40CF4;
	Tue, 13 Jan 2026 19:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QClpGiWqi3dI; Tue, 13 Jan 2026 19:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4811B40CFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333328;
	bh=+qcQGX4ig6SorrZSG0Vc28Rawl1g7e74mv9G50BCfuw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FOnhBFgnpZ0HaBWAGPgT9o96qTK2hombNwlv4NcKWeDpJU7zDTsCHletfA9LF5vFS
	 pepX+j+m9lnV0OuMKTY3IZMfcGby8FyZ3/WEna0RHHezD1I1Okme66Yag0pNenPTRg
	 UPpsnDU+5A1JPq6KEt5a9NoHf4PPfRDkRKQ1Ev6612hOyVjSRvAP+WoNVQBrLmhvNo
	 NF0Yh8nb3e3GTjucLhE8wNQO7Nz+4vNT3vcBJZDF5TeuXP3m2EeWL8FK19iXUCZd+p
	 IAfvqN8aB3rWBNQX6eb4WydJnMaYF6Wt6rolL/zp7wO09NZ/xrpl+a1ak2EJ2y3G/r
	 hI07YvTj3EhIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4811B40CFA;
	Tue, 13 Jan 2026 19:42:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6624231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27263406EA
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGv7Cs3cHG1f for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D99B406DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D99B406DD
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BB1186A2D; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:16:28 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b20acc5bea27d0dc279f9a89fe189386c891fd70
X-Git-Newrev: c2ce12fabce9e9edac5d0c4a4d266eb62b6bb591
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.0BB1186A2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/qt5/qt5webkit:
 fix build with ICU >= 76
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
Content-Type: multipart/mixed; boundary="===============0518784381226396656=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0518784381226396656==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c2ce12fabce9e9edac5d0c4a4d266eb62b6bb591
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since the bump of ICU from ICU 73 to ICU 77 in commit
dcee99507c6767230fd1faeeefe95f5662eb03a3, the build of qt5webkit fails
with:

/home/thomas/buildroot/br/output-all/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/unicode/char16ptr.h:271:38: error: ‘enable_if_t’ in namespace ‘std’ does not name a template type
  271 | template<typename T, typename = std::enable_if_t<std::is_same_v<T, UChar>>>
      |                                      ^~~~~~~~~~~

We taken two patches from Arch Linux, one which is a partial upstream
backport, and another which was submitted upstream, to address this
build issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0ad3afa1916d33d7e60e4385582cf8e73d1e6719)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...wtf-Platform.h-fix-build-with-newer-versi.patch | 40 ++++++++++++++++++++++
 ...U-C-header-only-APIs-introduced-in-ICU-76.patch | 28 +++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/package/qt5/qt5webkit/0010-Source-WTF-wtf-Platform.h-fix-build-with-newer-versi.patch b/package/qt5/qt5webkit/0010-Source-WTF-wtf-Platform.h-fix-build-with-newer-versi.patch
new file mode 100644
index 0000000000..4656289870
--- /dev/null
+++ b/package/qt5/qt5webkit/0010-Source-WTF-wtf-Platform.h-fix-build-with-newer-versi.patch
@@ -0,0 +1,40 @@
+From 30a9270a3fe9157a532e52458ee47b0f3fcc2f97 Mon Sep 17 00:00:00 2001
+From: Konstantin Tokarev <annulen@yandex.ru>
+Date: Mon, 27 May 2024 23:23:11 +0300
+Subject: [PATCH] Source/WTF/wtf/Platform.h: fix build with newer
+ versions of ICU
+
+Partial backport of r260554 (79fe19caf)
+
+In particular, we need -DU_SHOW_CPLUSPLUS_API=0 to avoid compilation
+errors in C++ parts of ICU headers which we are not using anyway.
+
+Change-Id: Ib45c74e3caad148fbd778d0c07330127f7dab5ec
+Taken from: https://github.com/archlinux/aur/blob/qt5-webkit/qt5-webkit-icu75.patch
+Upstream: part of https://github.com/qtwebkit/qtwebkit/commit/79fe19caf
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Source/WTF/wtf/Platform.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 5717f3ea1664..dfed4a13dd2b 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -1125,6 +1125,13 @@
+ #define ENABLE_PLATFORM_FONT_LOOKUP 1
+ #endif
+ 
++/* FIXME: This does not belong in Platform.h and should instead be included in another mechanism (compiler option, prefix header, config.h, etc) */
++/* ICU configuration. Some of these match ICU defaults on some platforms, but we would like them consistently set everywhere we build WebKit. */
++#define U_SHOW_CPLUSPLUS_API 0
++#ifdef __cplusplus
++#define UCHAR_TYPE char16_t
++#endif
++
+ #if COMPILER(MSVC)
+ #undef __STDC_LIMIT_MACROS
+ #define __STDC_LIMIT_MACROS
+-- 
+2.52.0
+
diff --git a/package/qt5/qt5webkit/0011-Disable-ICU-C-header-only-APIs-introduced-in-ICU-76.patch b/package/qt5/qt5webkit/0011-Disable-ICU-C-header-only-APIs-introduced-in-ICU-76.patch
new file mode 100644
index 0000000000..17dfc7e7e0
--- /dev/null
+++ b/package/qt5/qt5webkit/0011-Disable-ICU-C-header-only-APIs-introduced-in-ICU-76.patch
@@ -0,0 +1,28 @@
+From bf253b37ebf3fd99fa3cc46bd737a88defa8914e Mon Sep 17 00:00:00 2001
+From: Dmitry Shachnev <mitya57@gmail.com>
+Date: Thu, 9 Jan 2025 14:18:31 +0300
+Subject: [PATCH] Disable ICU C++ header-only APIs, introduced in ICU 76
+
+They require C++17 which we do not have, but we do not need them anyway.
+
+Upstream: https://github.com/qtwebkit/qtwebkit/pull/1107
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Source/WTF/wtf/Platform.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index dfed4a13dd2b..6ba6c3972aee 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -1128,6 +1128,7 @@
+ /* FIXME: This does not belong in Platform.h and should instead be included in another mechanism (compiler option, prefix header, config.h, etc) */
+ /* ICU configuration. Some of these match ICU defaults on some platforms, but we would like them consistently set everywhere we build WebKit. */
+ #define U_SHOW_CPLUSPLUS_API 0
++#define U_SHOW_CPLUSPLUS_HEADER_API 0
+ #ifdef __cplusplus
+ #define UCHAR_TYPE char16_t
+ #endif
+-- 
+2.52.0
+

--===============0518784381226396656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0518784381226396656==--
