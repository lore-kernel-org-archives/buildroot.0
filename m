Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4B4E69187
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 22:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0BF8804CA;
	Sun, 24 Nov 2024 22:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOWauh0ctw-R; Sun, 24 Nov 2024 22:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7E1F80507
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E1F80507;
	Sun, 24 Nov 2024 22:09:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8044431
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B1786109D
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Lr0cG4i050P for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 22:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C0A76084C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C0A76084C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C0A76084C
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:09:29 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 44D0AB00563;
 Sun, 24 Nov 2024 23:09:24 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Bogdan Radulescu <bogdan@nimblex.net>,
	Julien Olivain <ju.o@free.fr>
Date: Sun, 24 Nov 2024 23:09:12 +0100
Message-ID: <20241124220912.2773290-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732486166;
 bh=ZgdoX4ucPUJ8Jv1rLgV656rOi9dF78lNGeCMismnEHA=;
 h=From:To:Cc:Subject:Date:From;
 b=t36x1Eq+l8iK1Q3S81QB7O+r7kLyfIpC89hThuY8+42jC91XukcyFVsvNgcxT85dE
 IjoHTnBDYYNLDSV2jY2N4f0+PFBuuU/ZqbljC2haMpE6d8hfGo6MSwb6Mpuf67WIKm
 L5tA0dMVbZ7j1mcea8kd86ylTaGTS6sSLD437GS1tKBaFqpJCMcMMx2u3D0p2IJ0jY
 7qOqW7zwKQk1S+lqeJTEs7wkRDUwucSa7KpaLcP9AOPMdZCQICQ3yKZZC8njLpSvk2
 7WsA+MKfVvwD/Hcaj/hVcaTNIVz3WePKWEwzUEZ6kDSC3vZu7tgBgGPTPp7mgUR8+L
 F5Op9zkexx0uQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t36x1Eq+
Subject: [Buildroot] [PATCH next 1/1] package/ncdu: bump to version 1.21
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

For change log since 1.20, see:
https://dev.yorhel.nl/ncdu/changes

This commit also update the _SITE URL to use https.

The autoconf configure script of this new version (generated with
autoconf 2.72) now requires pkg-config. Therefore, this commit also
adds host-pkgconf in _DEPENDENCIES.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8457342890
https://gitlab.com/jolivain/buildroot/-/pipelines/1558320155
---
 package/ncdu/ncdu.hash | 8 ++++----
 package/ncdu/ncdu.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index cfb44b7d31..40faf9bd0d 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,10 +1,10 @@
 # From https://dev.yorhel.nl/ncdu
 # After checking pgp signature from:
-# https://dev.yorhel.nl/download/ncdu-1.20.tar.gz.asc
+# https://dev.yorhel.nl/download/ncdu-1.21.tar.gz.asc
 # With key 74460D32B80810EBA9AFA2E962394C698C2739FA
-md5  563966db4c3c34d61cc890a85ddedae0  ncdu-1.20.tar.gz
-sha1  1a3543cfbbe3e402d6347cf688468327064941b9  ncdu-1.20.tar.gz
-sha256  5fe2bb841abe72374bb242dbb93293c4ae053078432d896a7481b2ff10be9572  ncdu-1.20.tar.gz
+md5  3d5f399a00ca2ac3ba319e8cb99118ab  ncdu-1.21.tar.gz
+sha1  98c365e681f2c42a54d6277bea041d5a7104d934  ncdu-1.21.tar.gz
+sha256  a894d3a9b46bce578a6039bef48f54533ec402fb589b0769bfbb1d1edf9601a6  ncdu-1.21.tar.gz
 
 # computed locally
 sha256  a324e25fe6af7fa45286b34a516b4c5a11544344bc80efb74fc51033b2e76df4  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index cff824fd74..c8c691605a 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.20
-NCDU_SITE = http://dev.yorhel.nl/download
+NCDU_VERSION = 1.21
+NCDU_SITE = https://dev.yorhel.nl/download
 
-NCDU_DEPENDENCIES = ncurses
+NCDU_DEPENDENCIES = host-pkgconf ncurses
 
 NCDU_LICENSE = MIT
 NCDU_LICENSE_FILES = COPYING
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
