Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9221C54F32
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 12:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71163400D1;
	Wed, 28 Aug 2024 12:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jc5XZ5zEzpUc; Wed, 28 Aug 2024 12:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 288CE4029B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 288CE4029B;
	Wed, 28 Aug 2024 12:45:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32B3A1BF83A
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ECE940688
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Pbk7me9VMZX for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 12:45:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2ED5440663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED5440663
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ED5440663
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 12:45:42 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.86.110])
 by gzga-smtp-mta-g3-3 (Coremail) with SMTP id _____wDn74DsG89msiu4Ag--.34232S2;
 Wed, 28 Aug 2024 20:45:33 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 05:44:40 -0700
Message-ID: <20240828124440.3882-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDn74DsG89msiu4Ag--.34232S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF13Zw1xWrWDZryrCFW5Awb_yoW8tryDpa
 ya9wnI9Fy8KrW8trWkWrnakFy5Ka4vqr4Fg3WkJ3Z0yw13Jr4IvanFkF15XFy3Gw48A3y5
 ZF129rZrG3yUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRHa0gUUUUU=
X-Originating-IP: [223.102.86.110]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXQ9JjWXAm+T+4gAAsQ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=7tsef
 /2Fs14rxTHYCDY53EtVm+aGDtxMKg5QDvFF+zY=; b=DJ0pBrCoseyu9R+8vEF+u
 uW438QiRr+zV4LyO0JC7xVBP0NHna0qi0/AjyN668lhHFBHfWbe5Za0jU4c1KB3v
 u10GehvanyAcn6VGMnBY3k2wQnLR9DCU5ECdA9rVwyShocuEh1cm77DG/aiTV3B6
 t9uCawzjnWtapoejHaW4VQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=DJ0pBrCo
Subject: [Buildroot] [PATCH 1/1] Makefile: move 'ppd-fixup-paths' to
 'host-finalize'
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brandon Maier <Brandon.Maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using 'per-package', some python shebang in the host directory
will point to the per-package directory. However, the python modules
that are runtime dependencies will not be rsynced to the corresponding
per-package directory, which may cause the python script to fail to
find the python module.

For example, when enabling BR2_PER_PACKAGE_DIRECTORIES and
BR2_PACKAGE_HOST_BMAP_TOOLS, the following error will occur:

  ModuleNotFoundError: No module named 'six'

output/host/bin/bmaptool detects the presence of host-python-six in
output/per-package/host-bmap-tools/host. However, host-python-six is
not a required compile-time dependency for host-bmap-tools. Therefore,
it will not be rsynced to output/per-package/host-bmap-tools/host, but
only to output/host. This is the reason for the error.

Move the 'ppd-fixup-paths' to 'host-finalize' to allow the host python
script to search for python modules in output/host.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Brandon Maier <Brandon.Maier@collins.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 55aeafde23..f1fc3a4a52 100644
--- a/Makefile
+++ b/Makefile
@@ -604,7 +604,6 @@ prepare-sdk: world
 	PARALLEL_JOBS=$(PARALLEL_JOBS) \
 		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
 		$(TOPDIR)/support/scripts/fix-rpath staging
-	$(call ppd-fixup-paths,$(BASE_DIR))
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
@@ -722,6 +721,7 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
 host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
 	@$(call MESSAGE,"Finalizing host directory")
 	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR),copy)
+	$(call ppd-fixup-paths,$(BASE_DIR))
 
 .PHONY: staging-finalize
 staging-finalize: $(STAGING_DIR_SYMLINK)
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
