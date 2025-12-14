Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D88D5B16D
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB59E60DB8;
	Sun, 14 Dec 2025 17:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqfiGTltdw2z; Sun, 14 Dec 2025 17:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC1F560DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734486;
	bh=jmAZfQ0iEjCs3CLIDmXlbVs564IBvGwfTWuNyY6vYc4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cfqIeAJ2czrJqVFv/RZ1yxTw7apaYECcrea+DQQRKTnRKLTXgx++1RNnJpbUiSbjt
	 ygY6jAiQ5kYIrzCkTl4131h6VhyesEVyq7DIn156wHI/jhh1Ni/5rRnRQ7dpFXtuuY
	 ASFEk0ZpmTRPcjHb2EFeOolZKdKzjDhsmAkyEnzjYcjOl9L1dtG0AP4xYDzhN8Kz2M
	 T5aDC4/Wb8N+fo6zQLOFIbLjT/kum7JwPTwi/ZUkVd4pHr58q3J/E8x1BagCE4YVeJ
	 Qw13UzRhb43cf7mLmFtUiOK+t04/IvzISjk1/VqCHrS5XzwNFV1OwjxC5PJOxa5Flp
	 qZx/gYkqYbovg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC1F560DE3;
	Sun, 14 Dec 2025 17:48:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE5922D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72DD540692
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgevKWCefJDv for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 110F4406B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 110F4406B8
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10D2686E8E; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f13bdc0120c2cd1df4f78dd78a06ca57ee5128c6
X-Git-Newrev: 99acea3d8789977b38e5daad1777dbd5fa843239
X-Patchwork-Hint: ignore
Message-Id: <20251214174743.10D2686E8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bitarray: bump version to
 3.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=99acea3d8789977b38e5daad1777dbd5fa843239
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/ilanschnell/bitarray/blob/3.8.0/CHANGE_LOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index bcde731b60..dee6613e69 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  043d05ace953a31bee06a00f2c6c3a3d  bitarray-3.7.2.tar.gz
-sha256  27a59bb7c64c0d094057a3536e15fdd693f8520771ee75d9344b82d0a5ade2d0  bitarray-3.7.2.tar.gz
+md5  eedc882e4497c9b281f95af354f728d9  bitarray-3.8.0.tar.gz
+sha256  3eae38daffd77c9621ae80c16932eea3fb3a4af141fb7cc724d4ad93eff9210d  bitarray-3.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a554c25090ad5a5ea8ad35629dacffbb4d887234b011550218a5a1f9090e5274  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index 1aec908619..00b9a98d4b 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.7.2
+PYTHON_BITARRAY_VERSION = 3.8.0
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/e8/c1/644ea86b6f1a0864f656a3b3ee5bf8c29daa895cb3233942315fe065ea3a
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/95/06/92fdc84448d324ab8434b78e65caf4fb4c6c90b4f8ad9bdd4c8021bfaf1e
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
