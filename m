Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F54C3ABB0
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 10:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160F340596;
	Mon,  5 May 2025 10:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYNp14quuAVf; Mon,  5 May 2025 10:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49EA0403F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49EA0403F5;
	Mon,  5 May 2025 10:22:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 160BC12E
 for <buildroot@buildroot.org>; Mon,  5 May 2025 10:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB7B840BBB
 for <buildroot@buildroot.org>; Mon,  5 May 2025 10:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dk5sbA31aIb2 for <buildroot@buildroot.org>;
 Mon,  5 May 2025 10:22:21 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 05 May 2025 10:22:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 161D640589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 161D640589
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.250.0.168;
 helo=mx.adeep.su; envelope-from=adeep@lexina.in; receiver=<UNKNOWN> 
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 161D640589
 for <buildroot@buildroot.org>; Mon,  5 May 2025 10:22:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 74EEC199C8C; Mon,  5 May 2025 13:15:02 +0300 (MSK)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  5 May 2025 13:14:34 +0300
Message-ID: <20250505101447.624822-1-adeep@lexina.in>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1746440109; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=5a1uk6dXD4gWCdbvBcBSjjb2wIKeLJr36LZ1LSRAmKI=;
 b=UWzHgHJEDv8NpkDB2CTAHjPdnPcR7JbPIjXBz/NI0VCuOFWot9CWvdg5ExzPuAcUNf82sc
 47x238IM45JB9mQKGeFP9Ds873DyYHBkZ3a68UaQwi5rRyy0S8/U81jUjX5BR4iGwf8Vhw
 sbeZBJyAreL0hcggi6DIA41yryla3WmqHYdlY+LvrEfTCzPcPsi4GglOCpM0MmwEcxLvVk
 2k19x7WJMXYo3mvd9EF3BJHP+JgaOgjxiQ4nT6ZFF+MhTl56qReFAiDGL1KpD/Rhg8G6/i
 MWNnYgGU68ErKDpbV14EYQIn3TjtwnufutXQvX/NupzfxOYUsHfD5B+StBDDUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=lexina.in
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lexina.in header.i=@lexina.in header.a=rsa-sha256
 header.s=dkim header.b=UWzHgHJE
Subject: [Buildroot] [PATCH] package/rtl8822cs bump driver version to latest
 with support kernel 6.13/6.14
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update driver for kernel 6.13+
- Fix warning/errors on build

Fixes: https://autobuild.buildroot.org/results/464780b85739f323a21f9205634f6b51e3f2b916

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 53fc06cca5..1d7c074ff1 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9aea86233848e9edb497b27614c78680f7bb1962579d4b05333d9c1a189c62fe  rtl8822cs-40450f759c8a930d271b5f0a663685f412debc72.tar.gz
+sha256  6150edd8e5d5812831597d4f49a6631a503468c512f85cbe449d853b6caea261  rtl8822cs-0986d5734e7630efea218dae9c16d11a10231819.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index 223d232c8d..345e4a0c48 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 40450f759c8a930d271b5f0a663685f412debc72
+RTL8822CS_VERSION = 0986d5734e7630efea218dae9c16d11a10231819
 RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
