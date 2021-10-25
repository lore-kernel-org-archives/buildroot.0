Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC35CC433FE
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:17:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97A86610CF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97A86610CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69FB54047C;
	Mon, 25 Oct 2021 19:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bin3qm2DE7TX; Mon, 25 Oct 2021 19:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D005440486;
	Mon, 25 Oct 2021 19:17:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C64451BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5EFE60893
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9kICpEaxeUp for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:16:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87E4860719
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:16:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 00175887ED; Mon, 25 Oct 2021 19:13:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 21:09:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ebc5415e12a5c6936d7ce217de43f7d910ee025
X-Git-Newrev: 59bc401fa4af5664cc84e172c39467030710051f
X-Patchwork-Hint: ignore
Message-Id: <20211025191322.00175887ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic: bump to version
 1.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=59bc401fa4af5664cc84e172c39467030710051f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE copyright year was updated.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pydantic/Config.in            | 1 +
 package/python-pydantic/python-pydantic.hash | 6 +++---
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
index 07b506a20f..ac81aeb342 100644
--- a/package/python-pydantic/Config.in
+++ b/package/python-pydantic/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYDANTIC
 	bool "python-pydantic"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Data validation and settings management using python 3.6
 	  type hinting.
diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 7bb076fe2f..215b5d1714 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5	ce0c1824d1797bc7d67953428c4fe965  pydantic-1.3.tar.gz
-sha256	2eab7d548b0e530bf65bee7855ad8164c2f6a889975d5e9c4eefd1e7c98245dc  pydantic-1.3.tar.gz
+md5  7845d2f3c8fe8602f73f53ec5b6dfa29  pydantic-1.8.2.tar.gz
+sha256  26464e57ccaafe72b7ad156fdaa4e9b9ef051f69e175dbbb463283000c05ab7b  pydantic-1.8.2.tar.gz
 # Locally computed sha256 checksums
-sha256	66badbfe56618ec52ddcbfda62450e43752d16fe1e7cae78d346c7ed10a35306  LICENSE
+sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 0f9dd66a6f..b282241506 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 1.3
+PYTHON_PYDANTIC_VERSION = 1.8.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/3e/69/b22c0eb3157115e1e3d111f574a6a41552539f1e53b064121ef4e9ac1368
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b9/d2/12a808613937a6b98cd50d6467352f01322dc0d8ca9fb5b94441625d6684
 PYTHON_PYDANTIC_SETUP_TYPE = setuptools
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
