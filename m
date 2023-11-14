Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C62C54E7C
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 20:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF1F1400C1;
	Tue, 14 Nov 2023 20:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF1F1400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_I3jsAmtvEV; Tue, 14 Nov 2023 20:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC9C14011F;
	Tue, 14 Nov 2023 20:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC9C14011F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 641BD1BF2CD
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 20:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B9674011F
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 20:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B9674011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yUXp_F0gG24Q for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 20:40:25 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84883400C1
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 20:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84883400C1
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3EE4313F89A;
 Tue, 14 Nov 2023 21:40:21 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Nov 2023 21:40:12 +0100
Message-ID: <20231114204012.372583-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699994422;
 bh=8/IGytW1rdw+h1PZ/DFQp4HxJzY0ztr9sCp3BC1sad0=;
 h=From:To:Cc:Subject:Date:From;
 b=iri48gAtQe0JTJk/YYdK5s7PQcFLIKjl2UtvmQ+kqei7NTfXdZE5z0cUc1aNE2D1j
 KCV/N8eBkT/ZlA7OLsqx9PKwqIup6E2oYrWjJ4u/PYJj7R7868hXhac3j8tzwYPTNh
 C9YCtOqtC98kpXpVBEQTHXl/y0TxYS+L/r9gxGp1SAJBJdSXq/Hx8gv6BX7A3xxraI
 +kAEJgKNimvDZrgYlNkYhFSyEyKSBiPvGiMm2pyvlqvaYh8x/20/ZGjtsnCE1005dF
 lMFEnstdyVYYjk4PJv/vk7+D+geUERCHKmqIQlagTjC+Nonr868c94nC8AHVGm9PvM
 T1wzV/xmypusA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iri48gAt
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version v0.3.25
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

For change log since v0.3.24, see:
https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.25

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit f1ee701 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_openblas
    ...
    OK
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 8e416f98f6..d946ae7296 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.24
-md5  23599a30e4ce887590957d94896789c8  openblas-0.3.24.tar.gz
+# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.25
+md5  48384e324cd1cdcfbdb0d2e16ca55327  openblas-0.3.25.tar.gz
 # Locally calculated
-sha256  ceadc5065da97bd92404cac7254da66cc6eb192679cf1002098688978d4d5132  openblas-0.3.24.tar.gz
+sha256  4c25cb30c4bb23eddca05d7d0a85997b8db6144f5464ba7f8c09ce91e2f35543  openblas-0.3.25.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index aacfc74b53..76833121a9 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.24
+OPENBLAS_VERSION = 0.3.25
 OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
