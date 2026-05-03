Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDDFCD342F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B1F66129F;
	Sun,  3 May 2026 14:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuXnqyB5trcc; Sun,  3 May 2026 14:50:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F6986128D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819833;
	bh=VlqckWqbkJztgvNIm8dQ/AihZPKUiDDTZ0Vw4OZ2xhw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pFU/X3j2SrbZA1Zh2ws8AWdi+wd6pVZarh2D91zDqlU9dkG+YkrdJcx5Yjx+zf065
	 hLCphtPiO1XoGPvX33CYROosNmntSfJrhPSfe4KieLPSZIMH6kKep1MJ1TB5Gi9VwT
	 yDbxLrid6V5hNsVTOeyTKbuMFwmNtibzON70nNITm75D2wG5icLeyi/moxz4QJTlQK
	 3TErznmGFzSdaifYpLN16egUuWCoIDEp1QMUEXSztaAGe5S0AN8AyITlrXi68gqpA5
	 9Ma45UWNIwDCqGOMeUur4Po7fAxQKklJ99WsygoIC+3PYkmt3I/ZJF0fq+71ppbqZX
	 UG6gBTNaFE0wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F6986128D;
	Sun,  3 May 2026 14:50:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C2C9190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A0E4046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K914wq6SnGCY for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 948E14072A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 948E14072A
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51E5F83FAE; Sun,  3 May 2026 14:50:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 738fcefad61bde2584454b40592ecef7ffabd0b1
X-Git-Newrev: 6f49639d8c1a7539dfab14e872a2b73aaa6e22d7
X-Patchwork-Hint: ignore
Message-Id: <20260503145025.51E5F83FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-wtf: bump version to
 1.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f49639d8c1a7539dfab14e872a2b73aaa6e22d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pallets-eco/flask-wtf/releases/tag/v1.3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flask-wtf/python-flask-wtf.hash | 4 ++--
 package/python-flask-wtf/python-flask-wtf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-wtf/python-flask-wtf.hash b/package/python-flask-wtf/python-flask-wtf.hash
index 082db8a7d8..329d25104d 100644
--- a/package/python-flask-wtf/python-flask-wtf.hash
+++ b/package/python-flask-wtf/python-flask-wtf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-wtf/json
-md5  4582b41cf00556f226e0256404310cfa  flask_wtf-1.2.2.tar.gz
-sha256  79d2ee1e436cf570bccb7d916533fa18757a2f18c290accffab1b9a0b684666b  flask_wtf-1.2.2.tar.gz
+md5  cf980f2b80f63c09ba6fcfac24d14099  flask_wtf-1.3.0.tar.gz
+sha256  61d5dabc50c3df885c297dcbd80810443a5d632106c8a69cab8ce740f0cdd7cc  flask_wtf-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d5f19036451578cb36eeef04c99ebf7d7ca2e70dcf043636519bc420e15a7c62  LICENSE.rst
diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index 787029639b..5a52c9d4c9 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_WTF_VERSION = 1.2.2
+PYTHON_FLASK_WTF_VERSION = 1.3.0
 PYTHON_FLASK_WTF_SOURCE = flask_wtf-$(PYTHON_FLASK_WTF_VERSION).tar.gz
-PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/80/9b/f1cd6e41bbf874f3436368f2c7ee3216c1e82d666ff90d1d800e20eb1317
+PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/91/f1/605a56d4ea217b307f3e6f4d663e0351253d85d841edc93ba559f0648e19
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
 PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
 PYTHON_FLASK_WTF_SETUP_TYPE = hatch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
