Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0324AD5B171
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE15960807;
	Sun, 14 Dec 2025 17:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Rx8pTbCbd5s; Sun, 14 Dec 2025 17:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE05760DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734490;
	bh=O3J/BL+Xck0+EVtxlOANZX0w/6Bcn3sY1g5RCmVLjYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Im64dgbQyvokMES2W+ZIomM6nbrCt/nWjNmuQHBbChtcNRh9YKtFHtxLRXaRzKP+v
	 FxYEBd379BIQfy54lLdlACOGn6vbcAP0hN/ui3o53kDJ/d4zIQzoIcg4F9IeJoEjyT
	 fLgyu94fei+Tfk/eXY1CgXiKHrv+ZoGVYXWuDo8u6rqZVEBSxOBOgxpI72iuur5z1F
	 MPb1hBVS/OcW5SVs9r6oTmqjG+zY4XJRIqqp/MnZOVVNkPLwK9y1kLSPXvlg0aPgR6
	 6OFDgLQtKA/B7daVA51ydl/1qJzUuHd6PtKUrbDxqixEnNnBoU6OIBv42gyRBZJrFQ
	 T+JJNawXPEPKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE05760DEB;
	Sun, 14 Dec 2025 17:48:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D18022D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07A80406B8
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sPfdQrWET8k for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D9AA406D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D9AA406D1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D5B086E95; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 818218ae7e33d0e7ad6071c2778d6e61b910ae30
X-Git-Newrev: c8eca760054ce8409d0b1e6486f05ef231f57bdf
X-Patchwork-Hint: ignore
Message-Id: <20251214174743.3D5B086E95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cbor2: bump version to 5.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8eca760054ce8409d0b1e6486f05ef231f57bdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/agronholm/cbor2/blob/5.7.1/docs/versionhistory.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 8c30bced20..54c297bdb4 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  0804f5be872bcdbed12fb1314615b461  cbor2-5.6.5.tar.gz
-sha256  b682820677ee1dbba45f7da11898d2720f92e06be36acec290867d5ebf3d7e09  cbor2-5.6.5.tar.gz
+md5  9f5b82e0ca69926b4eb9dc145b82c524  cbor2-5.7.1.tar.gz
+sha256  7a405a1d7c8230ee9acf240aad48ae947ef584e8af05f169f3c1bde8f01f8b71  cbor2-5.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 9e410376fb..65873d77ca 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.6.5
+PYTHON_CBOR2_VERSION = 5.7.1
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/e4/aa/ba55b47d51d27911981a18743b4d3cebfabccbb0598c09801b734cec4184
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/a2/b8/c0f6a7d46f816cb18b1fda61a2fe648abe16039f1ff93ea720a6e9fb3cee
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
