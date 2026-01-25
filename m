Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771C1E63CA3
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 18:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 807FA60B02;
	Sun, 25 Jan 2026 18:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fF4DHRFESVcr; Sun, 25 Jan 2026 18:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B670960AFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769364245;
	bh=8i6sUKxQub+fvn5Hean3oenKuMpGJA5MkfgYaqlkQvg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JEk+8GH9bH+/y6X7YWLiwd4hJJbDiCrPH3dWLCpIc/wBeF5LrDi+VYvD7bPRNyMDC
	 KkKb2xIXsBcxZkk7A7dPRZU0HS0S/9wjYN3VcK8Y6mx6bze60hV/J3wbLbQIMaZ2iM
	 LJX7KPdIUE7vTvfpyMFJLtrNv0k52o8rijt0DboR9b3HRfMtizr5Ie6MWr34+S0gJW
	 UPZzPWs9wSHLbD372fsJVpVq7z2OcfCefAIJin5Eh8TRTPbBHxb7lxEcZLpSnKRlpI
	 jESM6PlAtZSy/2dy9vaj7E9++6UXrgW8dVDlAoMjSOxUF7GSMvY5X8b1ijBHi8aB4l
	 2JaIzKUL4jZdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B670960AFC;
	Sun, 25 Jan 2026 18:04:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 598D835C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 18:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4933D82028
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 18:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxZTCn3P2bSw for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 18:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B8E581F93
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B8E581F93
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 18:04:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47AFC8763A; Sun, 25 Jan 2026 18:04:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jan 2026 17:37:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c643cbfa5dd2dfccf1dac8887cb3515709ad914
X-Git-Newrev: 13297c10cad0c58d318e8410f6f1d49d24f3dde3
X-Patchwork-Hint: ignore
Message-Id: <20260125180403.47AFC8763A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: bump version to 1.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=13297c10cad0c58d318e8410f6f1d49d24f3dde3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched to tarball hash provided by github.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/meson/meson.hash | 6 +++---
 package/meson/meson.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index d07ea4d1dd..7ac7c8364d 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.10.0/meson-1.10.0.tar.gz.asc
-sha256  8071860c1f46a75ea34801490fd1c445c9d75147a65508cd3a10366a7006cc1c  meson-1.10.0.tar.gz
+# From https://github.com/mesonbuild/meson/releases/tag/1.10.1
+sha256  c42296f12db316a4515b9375a5df330f2e751ccdd4f608430d41d7d6210e4317  meson-1.10.1.tar.gz
+# Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index ca42edf63b..6b2a25f1dd 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.10.0
+MESON_VERSION = 1.10.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
