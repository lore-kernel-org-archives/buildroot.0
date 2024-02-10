Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761C8C48260
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 12:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15617605F8;
	Sat, 10 Feb 2024 12:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwMoM1eALzAZ; Sat, 10 Feb 2024 12:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 229FC60651
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 229FC60651;
	Sat, 10 Feb 2024 12:23:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5EDC1BF3C6
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 12:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B357A60651
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 12:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMlVpLhRh_hK for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 12:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4196E605F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4196E605F8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4196E605F8
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 12:23:48 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D59E813F8B9;
 Sat, 10 Feb 2024 13:23:44 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Feb 2024 13:23:38 +0100
Message-ID: <20240210122338.999772-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707567826;
 bh=85Ez/oX34jbfS/P8Ewrmgrb6tMTxvA7LLh00Z970kTg=;
 h=From:To:Cc:Subject:Date:From;
 b=iVpWzxe7MF2g/82wF7ToYxA2lIR+yEnomb/FqLX4yf4pgBcnkZECnfe78KoFTBZBq
 jEdKxGhWJ8AqydI6+973KupkjBY7a+DzWCQx2gajvGJhh91jFjcbbAHje2OMoqNkdx
 nfXsFwSnL4PGkdgaJ83zFZeVsHEi7s910/UmkGvDPkDrs7ZBsqUdYtX56R+g7g6fpJ
 C9+ysp/FFFBxJnx3p5rc0bfBcUy3iAimbp7n9GIPXr6NCWXE5ioKQt3cHqQBmSoTeQ
 zsqmxXFCJTYXxH98qPOwiZp0mLS2dWkOjLj2LMkWy/W2OMFNIIxAdoHXXXnBum4zoe
 UkzK1kepatnhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iVpWzxe7
Subject: [Buildroot] [PATCH 1/1] package/libgpgme: bump to version 1.23.2
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see [1] and [2].

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=blob;f=NEWS;hb=refs/tags/gpgme-1.23.2
[2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=shortlog;h=gpgme-1.23.2

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 8ab4a0a with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -p libgpgme
    ...
    6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_libgpgme
    ...
    OK
---
 package/libgpgme/libgpgme.hash | 4 ++--
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 5c47db76d5..64099df4c3 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  12f4c98ffa75bdbfc4934d38757f57ba718b5aa0  gpgme-1.22.0.tar.bz2
-sha256  9551e37081ad3bde81018a0d24f245c3f8206990549598fb31a97a68380a7b71  gpgme-1.22.0.tar.bz2
+sha1  b3a938939a9fb2182684aa9ba094c8e8ecd6167b  gpgme-1.23.2.tar.bz2
+sha256  9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224  gpgme-1.23.2.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 036103b7fc..dd39b37aa2 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.22.0
+LIBGPGME_VERSION = 1.23.2
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
