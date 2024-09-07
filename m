Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBE4ECE567
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 20:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AF2C40492;
	Sat,  7 Sep 2024 20:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSU9fhQs6RKi; Sat,  7 Sep 2024 20:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D973A4059B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D973A4059B;
	Sat,  7 Sep 2024 20:04:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13C831BF3EC
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9ACB4042E
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 20:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huoSzSyUITmS for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 20:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB2CF400F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB2CF400F2
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 20:03:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D44C886F3D; Sat,  7 Sep 2024 20:03:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Sep 2024 21:46:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04eab07b0843e7a780fe78900d4865f4e9f33ea4
X-Git-Newrev: 7011c7feb6875db0d13b148dbfd9aaaba92b517e
X-Patchwork-Hint: ignore
Message-Id: <20240907200356.D44C886F3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-betterproto: bump to
 version 2.0.0b7
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

commit: https://git.buildroot.net/buildroot/commit/?id=7011c7feb6875db0d13b148dbfd9aaaba92b517e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-betterproto/Config.in               | 1 +
 package/python-betterproto/python-betterproto.hash | 4 ++--
 package/python-betterproto/python-betterproto.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-betterproto/Config.in b/package/python-betterproto/Config.in
index 8548fd43ba..927fb6d2d6 100644
--- a/package/python-betterproto/Config.in
+++ b/package/python-betterproto/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_BETTERPROTO
 	bool "python-betterproto"
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_GRPCLIB # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  A better Protobuf / gRPC generator & library.
 
diff --git a/package/python-betterproto/python-betterproto.hash b/package/python-betterproto/python-betterproto.hash
index 8d23d2ae56..2eed9a490d 100644
--- a/package/python-betterproto/python-betterproto.hash
+++ b/package/python-betterproto/python-betterproto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/betterproto/json
-md5  bd4192c2997959100097479c34ff87e6  betterproto-2.0.0b6.tar.gz
-sha256  720ae92697000f6fcf049c69267d957f0871654c8b0d7458906607685daee784  betterproto-2.0.0b6.tar.gz
+md5  de9a12d1943dfa266dc3cf489cd3c6fa  betterproto-2.0.0b7.tar.gz
+sha256  1b1458ca5278d519bcd62556a4c236f998a91d503f0f71c67b0b954747052af2  betterproto-2.0.0b7.tar.gz
 # Locally computed sha256 checksums
 sha256  a5b8df75467e4b57a308a94cce5fdae84808a83ee6cd5af7e175c6b9784a753f  LICENSE.md
diff --git a/package/python-betterproto/python-betterproto.mk b/package/python-betterproto/python-betterproto.mk
index 37f72f8166..70eb403f6e 100644
--- a/package/python-betterproto/python-betterproto.mk
+++ b/package/python-betterproto/python-betterproto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BETTERPROTO_VERSION = 2.0.0b6
+PYTHON_BETTERPROTO_VERSION = 2.0.0b7
 PYTHON_BETTERPROTO_SOURCE = betterproto-$(PYTHON_BETTERPROTO_VERSION).tar.gz
-PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/45/43/4c44efd75f2ef48a16b458c2fe2cff7aa74bab8fcadf2653bb5110a87f97
+PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/4e/94/930a1368fbed92adc897a9a1fae282e3f9d608547dbf805034ca549f381a
 PYTHON_BETTERPROTO_SETUP_TYPE = pep517
 PYTHON_BETTERPROTO_LICENSE = MIT
 PYTHON_BETTERPROTO_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
