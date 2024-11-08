Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB37D64072
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 18:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D31CC6075F;
	Fri,  8 Nov 2024 18:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDvSWKQOyxEl; Fri,  8 Nov 2024 18:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8903610A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8903610A4;
	Fri,  8 Nov 2024 18:44:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4727EC2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3424443191
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vk2zQcBC-KYu for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 18:44:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 031A8400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 031A8400B5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 031A8400B5
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 18:44:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4A15EB00563;
 Fri,  8 Nov 2024 19:44:04 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  8 Nov 2024 19:43:56 +0100
Message-ID: <20241108184356.2519527-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731091447;
 bh=L7HBNGuZsmw++Ozd4VesSY2obTsTcNbtH6DbilD+y64=;
 h=From:To:Cc:Subject:Date:From;
 b=SAUCFVzKej04X77DOWCywYoxvifPE0EbDwI+rvqqe+M5uYtCrEldH6QiHpkZEPwcs
 s9oRpwsEpyljv1MGplk1ZAtzCEgda2klmBwLvz67F+3X2EAu4Nasn2S+jRPDFsVsQc
 hpcmGOKOOGL02Xmo23KaubCUJKDN7w61CJXiIS4IIWXhn45sDiLeDzNDALyHsbxl1E
 hwmSTpuzAoc9JUzp4/56BzbrQNEO0d1o4OK/WoDPEpdASY7J0q3Zvo+t88UW2/t929
 HbS1mzOvDuzksi382QvWnTn0ettDjT2JqC/m8LiSBMPWJJUf2vBa1HgE+p/VDWDzOw
 jVV/KjbX9hk3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SAUCFVzK
Subject: [Buildroot] [PATCH 1/1] package/uhubctl: bump to version 2.6.0
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For the release note, see:
https://github.com/mvp/uhubctl/releases/tag/v2.6.0

This commit also updates the LICENSE hash, due to a year update. See:
https://github.com/mvp/uhubctl/commit/4deae1731c337d087e554999bd3dc74199387c1f

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1534030118
---
 package/uhubctl/uhubctl.hash | 4 ++--
 package/uhubctl/uhubctl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uhubctl/uhubctl.hash b/package/uhubctl/uhubctl.hash
index 8a4581b84c..a7e4c1c242 100644
--- a/package/uhubctl/uhubctl.hash
+++ b/package/uhubctl/uhubctl.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d4452252f7862f7a45dd9c62f2ea7cd3a57ab5f5ab0e54a857d4c695699bbba3  uhubctl-2.5.0.tar.gz
-sha256  5eb09049fafa91347386daf769223ba2ee6914cb26ab95b86854ad6edea49b5d  LICENSE
+sha256  56ca15ddf96d39ab0bf8ee12d3daca13cea45af01bcd5a9732ffcc01664fdfa2  uhubctl-2.6.0.tar.gz
+sha256  80b933f8dfea8230f65744d303895ac724240f79ec89cc34a21cc2beba754967  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uhubctl/uhubctl.mk b/package/uhubctl/uhubctl.mk
index f9815409ae..284e27a60c 100644
--- a/package/uhubctl/uhubctl.mk
+++ b/package/uhubctl/uhubctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHUBCTL_VERSION = 2.5.0
+UHUBCTL_VERSION = 2.6.0
 UHUBCTL_SITE = $(call github,mvp,uhubctl,v$(UHUBCTL_VERSION))
 UHUBCTL_LICENSE = GPL-2.0
 UHUBCTL_LICENSE_FILES = LICENSE COPYING
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
