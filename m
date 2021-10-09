Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E94C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:07:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF4360F5D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBF4360F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB3E2823AA;
	Sat,  9 Oct 2021 12:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBPx-Nfj90Q0; Sat,  9 Oct 2021 12:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 148B182628;
	Sat,  9 Oct 2021 12:07:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DA311BF36A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93AF060A70
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DMp3T52uxydw for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:03:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55ED160B9B
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:03:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9A2CD93613; Sat,  9 Oct 2021 12:00:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 14:02:45 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 6ee815f77b8e1b8e8fcb7922d41042379b4ce0b1
X-Git-Newrev: 280ad9a5856d1d37e5ebd3651696aac9d3eb2b80
X-Patchwork-Hint: ignore
Message-Id: <20211009120024.9A2CD93613@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libressl: bump to
 version 3.2.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=280ad9a5856d1d37e5ebd3651696aac9d3eb2b80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Bugfix release, fixing a stack overread issue:
https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.2.7-relnotes.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 14b9165d8c..94b50103f0 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  b043640520d2eec56bd16ae639ce53017eecacc3d86388b54f838a548de3325b  libressl-3.2.6.tar.gz
+sha256  7c32ff037597ce471c7cfd9dcb8471cda3a02983aeba3315059362ceb3934b84  libressl-3.2.7.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 62d1e85d5b..9e91fea19c 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.2.6
+LIBRESSL_VERSION = 3.2.7
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
