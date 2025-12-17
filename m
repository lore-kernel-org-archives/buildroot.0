Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A7DD68BC2
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5132F61134;
	Wed, 17 Dec 2025 21:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9VQa68aegBE; Wed, 17 Dec 2025 21:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7DF161115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007888;
	bh=tz90yOhj9AZjUGfcg45b1yxeExixgrF5k5tgJuSr6bA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GyNdOEuRY54yeAZ1tnDF5mFMrIy5puR3K9ebV6wilmTMNCIfdnchloC6Ta1m0HClP
	 l7OVdND5FtUB+M9z3hyPqhcZU3EjU7mx80rELupwkc2k8vRI/LQlCbuUIPoPFQjsL1
	 MfM7cqo/AhlGmzO1ZcVHqisNumpV5VGjMeWNy72ncEIMoHb4z2uU9Dps82crfWYemM
	 vHj20V7e+Rs7wgUfukKhb9GzfMqykp19VQ1xPIVsnMKX7bLtaGaBRLZdb16LlPrJro
	 JYvfokRWLbSlxAtOs8alhVwRDSo4YB3B/yHXE6rrSi/pLJUo8oqEgSFC71GWV24gAw
	 0FWW1xLFls9Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7DF161115;
	Wed, 17 Dec 2025 21:44:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 400C0375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26190610F4
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yvjjmEBBY2KB for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66796607D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66796607D1
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5654682534; Wed, 17 Dec 2025 21:44:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:04:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edac93a6c6cb0c2efeff35f907dd7e9f14ed7dbc
X-Git-Newrev: ffd323dffc696f2d3eb09915a3d0a09b9035becc
X-Patchwork-Hint: ignore
Message-Id: <20251217214445.5654682534@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-scm: bump
 version to 9.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ffd323dffc696f2d3eb09915a3d0a09b9035becc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pypa/setuptools-scm/blob/v9.2.2/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 9a1c6f0262..eaed490fc7 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  35e09656d091a94b27f9c50b383b32c5  setuptools_scm-8.3.1.tar.gz
-sha256  3d555e92b75dacd037d32bafdf94f97af51ea29ae8c7b234cf94b7a5bd242a63  setuptools_scm-8.3.1.tar.gz
+md5  72975fc3ec40a1ae06bb2d86ca8ac48d  setuptools_scm-9.2.2.tar.gz
+sha256  1c674ab4665686a0887d7e24c03ab25f24201c213e82ea689d2f3e169ef7ef57  setuptools_scm-9.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 8bf879082e..8c74a55335 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 8.3.1
+PYTHON_SETUPTOOLS_SCM_VERSION = 9.2.2
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/b9/19/7ae64b70b2429c48c3a7a4ed36f50f94687d3bfcd0ae2f152367b6410dff
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/7b/b1/19587742aad604f1988a8a362e660e8c3ac03adccdb71c96d86526e5eb62
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
