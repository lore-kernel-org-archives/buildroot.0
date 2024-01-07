Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441B7C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 23:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3B7541687;
	Sun,  7 Jan 2024 23:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3B7541687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SA4jEk4PRDqy; Sun,  7 Jan 2024 23:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A5364167D;
	Sun,  7 Jan 2024 23:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A5364167D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9E31BF48B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 23:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75FE560E55
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 23:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75FE560E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dpB2DpVpfah0 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 23:22:47 +0000 (UTC)
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F28A60E4D
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 23:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F28A60E4D
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id McTarVOj11f5IMcTbrANbg; Mon, 08 Jan 2024 00:22:43 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 00:22:41 +0100
Message-Id: <20240107232241.666769-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240107232241.666769-1-giulio.benetti@benettiengineering.com>
References: <20240107232241.666769-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJF5yGA/U8pcHh8uzbtdH5sfecyG/e7GcOqwlVO3/vBIUay62BeMhHLjWpzT3fI8aeFggvzfspfKVxI20KAkZz05UKpvDEXJUZdwVKUosZPSUeUJjvw7
 SRjEz4B6JKS7pe3X/78aN46/ihoeC42SFSnWKWfED9hD4H1vKcjOC/hIjbYDGpkdThchzb+D2c4NsFXU8ZD1WnkqFvaa6MgsFEbjpcDob6CWz1laIPbz1LsB
 ymWnPaX+shSFNikL7jcSKh2IUeYoYZ88OvpJM9Hf5MaZ/3Vwdl+H2bzotpa3+J84XbF4HiYe6NiiMfr04VCHPlH+8s38fYrv+6JjKCuCJq3B22kdqwiPHx06
 WnQOC0E6
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704669763; bh=YU/flXPUc+xN4cc5wkv+CNzbooQ4K/aRqZLmL4lAV6k=;
 h=From:To:Subject:Date:MIME-Version;
 b=KFID/AGfKw3FHSGjdA5xDSQhhG16EU+LN59qQvXONXfeBDBIyLP682HHXaf2iYXO8
 iU4Y4Pvh4QZQxS73O60g0bhI0aLi10AamoMChfHwmTaBEl5i9MQofyUMupptQSy+H6
 usukNPY0RGiCGquhNkaVRGJzRH13lyoDN+KhV3p2q9zvpZ59DwJQcYJbJvtz2tSCy7
 VOOevblX51nWwQGrGyaepMD/82vWyH0SUvbmEm18rZ3LtqBxh/xvqSOVQ5WxaYO39L
 gN36yIFnkH6j7BSmFdpY68Ypw8gxo3HVNlwRosFp9G3bKjw7SI0ThYXS3VKhEiNrY8
 HS7mBJcPcLFTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=KFID/AGf
Subject: [Buildroot] [PATCH 4/4] package/trace-cmd: bump to version 3.2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 6edcaf0e1c..30b0c48de6 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e496d41e599f8ef3c9a74675da05f86be0d8d48d524f0182c73ab98cd16da0b0  trace-cmd-v3.1.7.tar.gz
+sha256  62af2c6062eeb434925921bb5936774b0a0e17a5f86671fa2ea2f40704a080cd  trace-cmd-v3.2.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index ab8e9149f7..e02eb79530 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 3.1.7
+TRACE_CMD_VERSION = 3.2
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
