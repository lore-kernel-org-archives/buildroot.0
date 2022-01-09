Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25E3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52F2960B35;
	Sun,  9 Jan 2022 11:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Un4vrV5hS9m5; Sun,  9 Jan 2022 11:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73FA660669;
	Sun,  9 Jan 2022 11:24:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD4B11BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C40F240497
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPKXX2xlQfbc for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:24:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B271A4047C
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:24:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 50FE882A93; Sun,  9 Jan 2022 11:18:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 12:21:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01764876e3d4e7ab95c8365f1c83e6c12d49757c
X-Git-Newrev: c39e0abba945dcc52e2e9e70b92fc94f1c351c0b
X-Patchwork-Hint: ignore
Message-Id: <20220109111822.50FE882A93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poppler: use HTTPS for upstream URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: multipart/mixed; boundary="===============1689957596926353811=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1689957596926353811==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c39e0abba945dcc52e2e9e70b92fc94f1c351c0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/145/1456f9512371ecb5a0a374943178e4bd7b0967e8/

The HTTP URL returns a 308 redirect to HTTPS, which confuses old wget
versions (E.G.  s.b.o):

wget -d http://poppler.freedesktop.org/poppler-21.12.0.tar.xz
DEBUG output created by Wget 1.14 on linux-gnu.

URI encoding = ‘UTF-8’
Converted file name 'poppler-21.12.0.tar.xz' (UTF-8) -> 'poppler-21.12.0.tar.xz' (UTF-8)
Converted file name 'poppler-21.12.0.tar.xz' (UTF-8) -> 'poppler-21.12.0.tar.xz' (UTF-8)
--2022-01-09 09:28:02--  http://poppler.freedesktop.org/poppler-21.12.0.tar.xz
Resolving poppler.freedesktop.org (poppler.freedesktop.org)... 147.75.198.156
Caching poppler.freedesktop.org => 147.75.198.156
Connecting to poppler.freedesktop.org (poppler.freedesktop.org)|147.75.198.156|:80... connected.
Created socket 3.
Releasing 0x0000000001ceda80 (new refcount 1).

---request begin---
GET /poppler-21.12.0.tar.xz HTTP/1.1
User-Agent: Wget/1.14 (linux-gnu)
Accept: */*
Host: poppler.freedesktop.org
Connection: Keep-Alive

---request end---
HTTP request sent, awaiting response...
---response begin---
HTTP/1.1 308 Permanent Redirect
Date: Sun, 09 Jan 2022 09:28:02 GMT
Content-Type: text/html
Content-Length: 164
Connection: keep-alive
Location: https://poppler.freedesktop.org/poppler-21.12.0.tar.xz

---response end---
308 Permanent Redirect
Registered socket 3 for persistent reuse.
Skipping 164 bytes of body: [<html>
<head><title>308 Permanent Redirect</title></head>
<body>
<center><h1>308 Permanent Redirect</h1></center>
<hr><center>nginx</center>
</body>
</html>
] done.
2022-01-09 09:28:02 ERROR 308: Permanent Redirect.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/Config.in  | 2 +-
 package/poppler/poppler.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index f59115813d..21c4d86cf6 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_POPPLER
 	  Poppler is a PDF rendering library based on the xpdf-3.0
 	  code base.
 
-	  http://poppler.freedesktop.org/
+	  https://poppler.freedesktop.org/
 
 if BR2_PACKAGE_POPPLER
 
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 23f04f6e51..9e9bfc9cba 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -6,7 +6,7 @@
 
 POPPLER_VERSION = 21.12.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
-POPPLER_SITE = http://poppler.freedesktop.org
+POPPLER_SITE = https://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
 POPPLER_LICENSE = GPL-2.0+
 POPPLER_LICENSE_FILES = COPYING

--===============1689957596926353811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1689957596926353811==--
