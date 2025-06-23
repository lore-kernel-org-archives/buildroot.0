Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDADC7EE2A
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 19:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5511960A53;
	Mon, 23 Jun 2025 19:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJuuE5XwaxQc; Mon, 23 Jun 2025 19:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CC5960A4D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC5960A4D;
	Mon, 23 Jun 2025 19:12:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB7C7154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 19:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C24760A4D
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 19:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-6F-u7ztpcB for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 19:12:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 977D46070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 977D46070D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 977D46070D
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 19:12:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 78B701FD32;
 Mon, 23 Jun 2025 19:12:25 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Jun 2025 21:12:24 +0200
Message-ID: <20250623191224.588712-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeffvdeltefhkeeftdffteeggeeitddttdeggfeiudeiveejveetleekfeelvddvnecuffhomhgrihhnpehsrghmsggrrdhorhhgnecukfhppedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgedphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1750705946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FfGT2i4DDbud7tCrrArcP2lXXtWGc/8FTACyDa5WjbE=;
 b=UAj+7AwDQgOCk0Y71zY7qf0T3/WFF1yKG9kDu+lTIQiC/tsu2jkkhjmVfreXlxco3nihOm
 CWzTkds2O5QNVMOWNknfYI2UHnY5tDJgeGVKpQuWTjd6fu8v+3TV+ym8ee5Ld9AiXgQdOD
 4HjB6jPI/uV8T1s/24YCfG0XxzarnEWyzdJBieFqErvROd3qJAhQWbaE/gGrpTQWVuurjd
 iv1A2gxBtCERIeJhxQoMG6RZ+8xKXefjHQ+4PxYL/ZYc8dihw5ncWYkYx8mypxBfQ77wn3
 RfE+9ntj892XWFEXzrmxE8Mbl6nLdITCZMB6iNOoYx3+PgC1q1OeJvZubCWaRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UAj+7AwD
Subject: [Buildroot] [PATCH] package/cifs-utils: bump to version 7.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to
https://lists.samba.org/archive/samba-technical/2025-June/139484.html:

A new update, version 7.4, of cifs-utils has been released today.
Users of cifs-utils version 7.3 on older kernels are encouraged to
update to 7.4 since it includes a fix for a mount problem with version
7.3 of cifs-utils on older kernels when using namespaces.

[...]

Detailed list of changes since version 7.3 was released
----------------------------------------------------------------
Enzo Matsumiya (1):
      mount.cifs: retry mount on -EINPROGRESS

Henrique Carvalho (1):
      cifs.upcall: correctly treat UPTARGET_UNSPECIFIED as UPTARGET_APP

Paulo Alcantara (1):
      cifs.upcall: fix memory leaks in check_service_ticket_exits()

Pavel Shilovsky (1):
      cifs-utils: bump version to 7.4

Z. Liu (2):
      getcifsacl, setcifsacl: use <libgen.h> for basename
      cifscreds: use <libgen.h> for basename

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cifs-utils/cifs-utils.hash | 2 +-
 package/cifs-utils/cifs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index ea32d4dca7..e6a5eefeaa 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  c4e1eb5f4ad880d96e16d95a1cdbc7ec978ab51c5b6d8a20ae09dac638f36dd5  cifs-utils-7.3.tar.bz2
+sha256  53353d05c30b4fc9dac006a8f0c5054cdd8a1834c176313c91e4694025c4b891  cifs-utils-7.4.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 9c029342eb..9e1e822c4c 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 7.3
+CIFS_UTILS_VERSION = 7.4
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
