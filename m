Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC47AEEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79011407E4;
	Thu,  1 Jan 2026 09:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5H40m73Uwtso; Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74AED404A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260554;
	bh=b5uYtKgD1B5TN9FRAdqn4RcwII3dyJuvtCFBrb7h7bA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y8Xs4nQer8fGiAJzk6JU6pl3LFs+OJthVUyHl8bgzkf5hoIMUncZGMD8MiQMa9X7l
	 nboq0JcJPdSMzSPPbtH3yzqDOSGl1GYyBD3rFpSBPetpp7COU6WAQMW+Y5G56zXzbb
	 M4YNZHibMLnHphPoVDxKMoSUvrZA6Fea7tKqjDfhkhcmtdRFp8Eu56dpH1i4MsZTfj
	 6Y0+hFnK71G14xK3Uyuggrmxz6NHNkHp3xh05fLBhCpEOUY0IVfRbOEkBSXXtPjY7W
	 g0Ad1T9oGzlYFDUjMFrhxMr3EX5Uod/TFu45osWq+IhFvZBaST8mSZKAyAUhk16TMb
	 IbtcAuDMA6B0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74AED404A0;
	Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB01C351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD0E0607A3
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_K8czloAArL for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 144AC607A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 144AC607A1
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 104CF878FB; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e0f9b5350f0389115c7d0b8affaa0f553164651
X-Git-Newrev: 1c382be00da0f69505c71b0205e8e6ad5c3c97ca
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.104CF878FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xlrd: bump to version 2.0.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c382be00da0f69505c71b0205e8e6ad5c3c97ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-xlrd/python-xlrd.hash | 4 ++--
 package/python-xlrd/python-xlrd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xlrd/python-xlrd.hash b/package/python-xlrd/python-xlrd.hash
index 003ccc9a72..4d28fed039 100644
--- a/package/python-xlrd/python-xlrd.hash
+++ b/package/python-xlrd/python-xlrd.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlrd/json
-md5  ae3f951c857a490d432f0a7d722352bf  xlrd-2.0.1.tar.gz
-sha256  f72f148f54442c6b056bf931dbc34f986fd0c3b0b6b5a58d013c9aef274d0c88  xlrd-2.0.1.tar.gz
+md5  8afbdf48d53472530471a66e0978752d  xlrd-2.0.2.tar.gz
+sha256  08b5e25de58f21ce71dc7db3b3b8106c1fa776f3024c54e45b45b374e89234c9  xlrd-2.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b5a5dbce60265e305a815a6cb83ed07f24519d8ba644f2a307994488bced8815  LICENSE
diff --git a/package/python-xlrd/python-xlrd.mk b/package/python-xlrd/python-xlrd.mk
index 1f280bd432..b7a1420de3 100644
--- a/package/python-xlrd/python-xlrd.mk
+++ b/package/python-xlrd/python-xlrd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLRD_VERSION = 2.0.1
+PYTHON_XLRD_VERSION = 2.0.2
 PYTHON_XLRD_SOURCE = xlrd-$(PYTHON_XLRD_VERSION).tar.gz
-PYTHON_XLRD_SITE = https://files.pythonhosted.org/packages/a6/b3/19a2540d21dea5f908304375bd43f5ed7a4c28a370dc9122c565423e6b44
+PYTHON_XLRD_SITE = https://files.pythonhosted.org/packages/07/5a/377161c2d3538d1990d7af382c79f3b2372e880b65de21b01b1a2b78691e
 PYTHON_XLRD_SETUP_TYPE = setuptools
 PYTHON_XLRD_LICENSE = BSD-3-Clause
 PYTHON_XLRD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
