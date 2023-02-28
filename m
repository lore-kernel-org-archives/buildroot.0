Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590D1C64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 16:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03D9980C3B;
	Tue, 28 Feb 2023 16:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03D9980C3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_tISn1pqfXG; Tue, 28 Feb 2023 16:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D38F81007;
	Tue, 28 Feb 2023 16:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D38F81007
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 897FE1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA713408FB
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA713408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQ4IhrkdbC3l for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 16:16:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E63A408B3
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 16:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E63A408B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C78E86D40; Tue, 28 Feb 2023 16:16:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 17:00:13 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 004660e84fa30d8fa033015f452b6ad807622afc
X-Git-Newrev: 13702acd003f951069c57fa1028c7b93c10c7394
X-Patchwork-Hint: ignore
Message-Id: <20230228161658.8C78E86D40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libressl:
 security bump to version 3.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=13702acd003f951069c57fa1028c7b93c10c7394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

security fix:
    A malicious certificate revocation list or timestamp response token
    would allow an attacker to read arbitrary memory.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 02f80f5c224a1d8830fab48ae0c19a9e28f2c082)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 0988e6a36d..907b9cdd06 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  acfac61316e93b919c28d62d53037ca734de85c46b4d703f19fd8395cf006774  libressl-3.6.1.tar.gz
+sha256  4be80fff073746cf50b4a8e5babe2795acae98c6b132a9e02519b445dfbfd033  libressl-3.6.2.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 8fd7bccbc4..b5fae7e26e 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.6.1
+LIBRESSL_VERSION = 3.6.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
