Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EADDCFB43F
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 08:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B2E78100B;
	Sun,  6 Oct 2024 08:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdr4Dgy3YLq5; Sun,  6 Oct 2024 08:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28925810A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28925810A5;
	Sun,  6 Oct 2024 08:57:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1735A1BF3DD
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 08:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12E86400EA
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 08:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGtorTQ7ysv2 for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 08:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F987400CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F987400CC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F987400CC
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 08:57:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7BC76B00565;
 Sun,  6 Oct 2024 10:57:34 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 10:57:27 +0200
Message-ID: <20241006085727.572679-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728205055;
 bh=sLEFSQhwFkzEJ6TUAcpvHctPY37PxgqHkdoMh+tV1YA=;
 h=From:To:Cc:Subject:Date:From;
 b=rIu2h9UNdWwifCifUtmBGpNb0zeKQDw3DDrmYQ1U3jU5oi6H1hLKKXa2WUcFc3c2+
 FA9/ZP4L8wskzS9FOEr6bx59A1mrIbPIf5AsKV60MXZzhslc76C8FMO2qOnldn3ddZ
 /+sMDU8awc3E/hDa6nG5MKXh6m2ML8AyrYIqBlsewjtQOWJ3IuLSNqUqJIx2TtwWhS
 uXrc4ldR0IcZxdHf+Wux8NmSBYB2WRts7/PlE3if4VCyXi2fKYt91J6UTnHOl69FyR
 xqRL3OBKy6fJ33JLK3JnSFQoqU+oxTLfoqWIrXYlClov8t2bct0sN0x4A4prXfSBfD
 mtHpX+OOy5SJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rIu2h9UN
Subject: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.13.2
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

For change log since 4.13.0, see:
https://github.com/Z3Prover/z3/blob/z3-4.13.2/RELEASE_NOTES.md#version-4132

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8003875233
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index df78fd8b7d..f138f39de6 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  01bcc61c8362e37bb89fd2430f7e3385e86df7915019bd2ce45de9d9bd934502  z3-4.13.0.tar.gz
+sha256  fd7dc6dd2633074f0a47670d6378b0e5c28c2c26f2b58aa23e9cd7f0bc9ba0dc  z3-4.13.2.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index e436d48f27..4763b1cc78 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.13.0
+Z3_VERSION = 4.13.2
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
