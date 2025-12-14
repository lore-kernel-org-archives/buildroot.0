Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60476D5B16E
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3709A40722;
	Sun, 14 Dec 2025 21:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isu-51wwiCHA; Sun, 14 Dec 2025 21:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7747940753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747319;
	bh=5GGcHfTemGtSRTeG5CjKV5rrk//Bf68Ykkca5a+ulJ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KM4WLInMwBt9FfJmuNfUoXD1p4R21N+rs1nq1wdBVfpe/K4the18ZY5JW3ctsEd5k
	 DW9WokiUVs4jQzRjW4cfmmSHv7cT9oLS/jhHCO4nB1DoqU+9C8fpnHpQ8GiY23+s0C
	 XSTHoifkfiRkHBDYHKzPWSi4Lx5ZXWn7VsNmHwCU6+WnjcmswmSFx98dyePZAqP4Hl
	 XjDsBCGASl0l8TswR7GGNlUkiggFk95TLNYluvhiCfUuWl1a37dnTkK/G2KN1pFNey
	 TJqRqBubZfAYrzALOQomoQzPhA4rYYwYPNOUt1ZNkq8UpTt98SnIWJVY1n95jAfXrS
	 2vNeMmQgsPryA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7747940753;
	Sun, 14 Dec 2025 21:21:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D5FB117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF22B60D73
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AByF2c56Nd-V for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FB7260AAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FB7260AAD
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DDBC7FF02; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7f4ebcd2a4ace033342293bb702e143693fe393
X-Git-Newrev: 2f056baf7cc15b0b91d1d5474c44d009ca75dcbe
X-Patchwork-Hint: ignore
Message-Id: <20251214212140.7DDBC7FF02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-googleapis-common-protos:
 bump version to 1.72.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f056baf7cc15b0b91d1d5474c44d009ca75dcbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/googleapis/google-cloud-python/blob/main/packages/googleapis-common-protos/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-googleapis-common-protos.hash                              | 4 ++--
 .../python-googleapis-common-protos.mk                                | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index a00b871bb8..682ea22690 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  fca59b82ad99d5dc1da6a94e5ec6e819  googleapis_common_protos-1.70.0.tar.gz
-sha256  0e1b44e0ea153e6594f9f394fef15193a68aaaea2d843f83e2742717ca753257  googleapis_common_protos-1.70.0.tar.gz
+md5  58ddbf8920c529b542af9be18101fe61  googleapis_common_protos-1.72.0.tar.gz
+sha256  e55a601c1b32b52d7a3e65f43563e2aa61bcd737998ee672ac9b951cd49319f5  googleapis_common_protos-1.72.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index 6afd1ea740..e72a7b45de 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.70.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.72.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/39/24/33db22342cf4a2ea27c9955e6713140fedd51e8b141b5ce5260897020f1a
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/e5/7b/adfd75544c415c487b33061fe7ae526165241c1ea133f9a9125a56b39fd8
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
