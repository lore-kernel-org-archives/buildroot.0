Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D6BC19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A6B460A87;
	Wed,  3 Aug 2022 20:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6B460A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKp_LIPEiknS; Wed,  3 Aug 2022 20:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB94F60A82;
	Wed,  3 Aug 2022 20:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB94F60A82
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98D081BF3CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81C2940332
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81C2940332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4OF-s0rg-jd for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:49:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72D39401D8
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72D39401D8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8B3E886DF8; Wed,  3 Aug 2022 20:35:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 22:48:46 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: c8155917689c4042ee9e7951dc777183fadcc2ce
X-Git-Newrev: ce38be1e67857ffac9eca65f86c8c7db7cd7e3a8
X-Patchwork-Hint: ignore
Message-Id: <20220803203520.8B3E886DF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/python-bottle:
 security bump to version 0.12.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce38be1e67857ffac9eca65f86c8c7db7cd7e3a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

- Fix CVE-2022-31799: Bottle before 0.12.20 mishandles errors during
  early request binding.
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5deea4be64a62e9b5fb4f0085b14d712e3921ac9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bottle/python-bottle.hash | 6 +++---
 package/python-bottle/python-bottle.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 7dcaac8dc6..b1cc2aac20 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bottle/json
-md5  50075544706b5e662a3fbd9a98e24b07  bottle-0.12.19.tar.gz
-sha256	a9d73ffcbc6a1345ca2d7949638db46349f5b2b77dac65d6494d45c23628da2c  bottle-0.12.19.tar.gz
+md5  4934ad7347eef30db669ccd05283a5e0  bottle-0.12.21.tar.gz
+sha256  787c61b6cc02b9c229bf2663011fac53dd8fc197f7f8ad2eeede29d888d7887e  bottle-0.12.21.tar.gz
 # Locally computed sha256 checksums
-sha256	d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
+sha256  d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index d19a439f8c..ffea59f38f 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.12.19
+PYTHON_BOTTLE_VERSION = 0.12.21
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/ea/80/3d2dca1562ffa1929017c74635b4cb3645a352588de89e90d0bb53af3317
+PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/95/e3/5749d7657b6fb38d65afb3c0b345514a783de7a9feb4fab594fa0bacc2a0
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
