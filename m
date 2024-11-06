Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DE9D59F5B
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 18:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E756A606F7;
	Wed,  6 Nov 2024 18:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74cqsBI8c18t; Wed,  6 Nov 2024 18:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A2A606EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07A2A606EC;
	Wed,  6 Nov 2024 18:11:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99C4A3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 18:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A83F80DB9
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 18:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4IKGFd6T5STv for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 18:11:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6022C80D7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6022C80D7D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6022C80D7D
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 18:11:43 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 22EE7B0059A;
 Wed,  6 Nov 2024 19:11:40 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed,  6 Nov 2024 19:11:33 +0100
Message-ID: <20241106181133.8290-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730916701;
 bh=incn8N41veQ+TkwoFQYQbbjqqMqh8wxRo00Ok2h/DAA=;
 h=From:To:Cc:Subject:Date:From;
 b=FCaTl7rGDoXjLfBdiJpLqgbKGhau6UK4CrUWRLVvgUJmwoaYF1SofzZyleozOeBiO
 BAnqdSsyx9xrn9R8oCMEs+lODxQ6cB2lAgHZEeTUsjDPIumCMDtCsQOoKe055XotZ7
 RnFhezXg5GicXgXL7BBr9COU9yHbXXxn1jRmU92CxqSxoKS6ReJ1pJ6pv1XY3lbHXL
 PqxJE+3dT2J4/C1qpoRwyCzn+xWhIqJta05w6xN8Jq81O/CL7Ldw/bcw3fdTO1W8Os
 oo0WGX5BiJNy9etrIXcOm5m9v60KKRJGRb6zxilOeH/SfkBFZHcR2lGrwcgEmyWiJQ
 2h85jZgL2JpZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FCaTl7rG
Subject: [Buildroot] [PATCH 1/1] package/pv: bump to version 1.9.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://codeberg.org/a-j-wood/pv/src/tag/v1.9.0/docs/NEWS.md

This commit also updates the PV_SITE url from http to https, to
follow the download url published on the home page:
https://www.ivarch.com/programs/pv.shtml

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pv/pv.hash | 2 +-
 package/pv/pv.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index e6b1b9bd69..6b0ffbc02e 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
 # using key: 4267B4F90F2678A112169BD61D1EF7581B45E9A0
 # from: https://codeberg.org/a-j-wood.gpg
-sha256  0cc18811a4809a587d4b11d47691bbc0ad83a5d95d2c2606af74ea7b4a674756  pv-1.8.14.tar.gz
+sha256  b38d69d7fc0785eb5eb3c57e8b12a7334f862047bf84b18f414365335399469a  pv-1.9.0.tar.gz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 0c0fc55fab..1266d83a07 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PV_VERSION = 1.8.14
-PV_SITE = http://www.ivarch.com/programs/sources
+PV_VERSION = 1.9.0
+PV_SITE = https://www.ivarch.com/programs/sources
 PV_LICENSE = GPL-3.0+
 PV_LICENSE_FILES = docs/COPYING
 PV_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
