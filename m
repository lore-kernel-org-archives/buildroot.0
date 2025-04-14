Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97607C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 21:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B51B81F16;
	Mon, 14 Apr 2025 21:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRa9fofR2xBb; Mon, 14 Apr 2025 21:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C46D81F0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C46D81F0F;
	Mon, 14 Apr 2025 21:42:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51A2ECF
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42FAA608DC
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9T8QvNBpT9Il for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 21:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8768760BD6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8768760BD6
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:42:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AF6B846DD; Mon, 14 Apr 2025 21:42:48 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 23:40:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9abf662cfd35c101b2c4c0e191adc3b949846663
X-Git-Newrev: d759f8a4bd90b50b5ff839dace58fe140ed2e539
X-Patchwork-Hint: ignore
Message-Id: <20250414214248.4AF6B846DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfcgi: security bump to 2.4.5 to
 fix CVE-2025-23016
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d759f8a4bd90b50b5ff839dace58fe140ed2e539
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Announcement:
- https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.5

See:
- https://nvd.nist.gov/vuln/detail/CVE-2025-23016
- https://github.com/advisories/GHSA-9825-56cx-cfg6
- https://github.com/FastCGI-Archives/fcgi2/issues/67

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libfcgi/libfcgi.hash | 2 +-
 package/libfcgi/libfcgi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index ca660c6ebd..371dba8939 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c0e0d9cc7d1e456d7278c974e2826f593ef5ca555783eba81e7e9c1a07ae0ecc  libfcgi-2.4.4.tar.gz
+sha256  92b0111a98d8636e06c128444a3d4d7a720bdd54e6ee4dd0c7b67775b1b0abff  libfcgi-2.4.5.tar.gz
 sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index 3c90b30e39..2348af843b 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFCGI_VERSION = 2.4.4
+LIBFCGI_VERSION = 2.4.5
 LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
