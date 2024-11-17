Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF99D10F35
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 22:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C69E084EA4;
	Sun, 17 Nov 2024 22:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQoSMU5cW0hi; Sun, 17 Nov 2024 22:09:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D488984EA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D488984EA6;
	Sun, 17 Nov 2024 22:09:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24D62DB2
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12D956159C
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTpmrmk7EASY for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 22:09:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.41;
 helo=smtpcmd0641.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D467661592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D467661592
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D467661592
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:09:00 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CnRxtmDndDhSBCnRxtRVOv; Sun, 17 Nov 2024 23:08:58 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 17 Nov 2024 22:54:29 +0100
Message-Id: <20241117215429.136783-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIgzEqwh9//8M4svnAOA8MO4BWPOfSVXCEHu/xoSoUjOs6alQPIILh2uJ4ajwKVgUrUTo5nWzLmTFJ4Pt4R0fhC167yTaKfyfyJJp7e+epqXBYhatU+L
 yrLzhAXPdML2rhNddWDbZyMcPiDaVjplmrXkqE6JJq1g8PI3yTlyK2q3SaNLHs8GFl56n5UAiPsXQU484VXCIS0xbxEC5yXvIQcOcZ43r4SInanj7dfXQRpb
 PhJeX882rEEC+LeRMHBkGsDctjuxezP9kapw48Z+4ks=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1731881338; bh=Nr4ey3lbB/uZQhDbLGlPcYT1n4poDeXn360xgRGqcs8=;
 h=From:To:Subject:Date:MIME-Version;
 b=eKoQhEos5HPSU5cZN1dyJTbprWFM8FcHev8D2nbbK+VluDcNVulqjTsXGzsWueUVV
 4EVlnTK3E0sGK0IkiYt0HsRmFoFJPYKq6NIEycxcUDPaFShTzAJUuw1PLb9bT4C0qP
 aP013YFAMyXSqZ/U1RcOq/GiO4Y7+p0Egv/T3p3aiVblgVesZNnV0oDi5XDB8zdmbO
 PBNc+V1+I/IMLt4Ojz6oKZ+ZVNvzvppNpnyQpicxCp/e5ejNIl84JfAxxLrs85smiR
 B378Y9B+zktpNxEL8A0aYnQlX/u6jDejPqj8Rp1/JrteVb0qwfn9RDcJCtoop8EfU5
 PFjIiHn8udsuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=eKoQhEos
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.11.1
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
https://github.com/linux-nvme/libnvme/releases/tag/v1.11.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnvme/libnvme.hash | 2 +-
 package/libnvme/libnvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 5c221b7dce..68546c76b4 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  f6da60036b14e0427246718a32abff442228331f9ae3853f89160cf366d83dfe  libnvme-1.11.tar.gz
+sha256  6d5d8ba2cc4c94a61a994c9f7f25b3b26ef973fb5c0daa37729890903f37a1f1  libnvme-1.11.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index b1039265df..fc7edda7ff 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.11
+LIBNVME_VERSION = 1.11.1
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
