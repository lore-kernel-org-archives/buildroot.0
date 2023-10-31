Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E19C4167B
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 12:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5DF3428AF;
	Tue, 31 Oct 2023 12:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5DF3428AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCGKuQGzNbw1; Tue, 31 Oct 2023 12:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FD75428A8;
	Tue, 31 Oct 2023 12:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FD75428A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7061BF2F2
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 551E0612EA
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551E0612EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2-DWdMQ07oR for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 12:07:18 +0000 (UTC)
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9AF0612E9
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 12:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9AF0612E9
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xnWcqAguFcfkCxnWcqOcDx; Tue, 31 Oct 2023 13:07:15 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 13:07:13 +0100
Message-Id: <20231031120713.678783-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ7z8eb7EZ8sWUhZwv1Z7QgJzYDGIjTlnlUO/yZKxo7Ro2aL7Tgob1Mm3dOPl+hu5DfPffJ3oEfecO7dJAPQbgNGm9uQPw54l3yXntzs3e+mf3TLwS8/
 C84jWpYUP2JCK1us963DbaCE+aJ2b2sjuxNs5Ap0QMbtajr/A2ajRnB7UQZcNCkRVXCAwyK06DqpS5lKrN0z7CpYmH3K5nppTBZlFC0/i2j7fbwsmYFSkhui
 nrhru48RmrF8iy0hF22cL6caWhjQdUpys5zfKVtmys6MTXmCT9pjdUl/oEJRVKw5m3Eb6cz0ke14OcL0AqBqcyQbqJF7hXC0yU/e4VTyy61Wk9jwIhhMX2Wj
 eRMfNXIKflOn87ckf6gY6iQgshChZjMvBAGSIrX7wUT5lj+bA54=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698754035; bh=VQqlEjT9uMc8PAKLSaPNUBDueNr1qA08B4NW3bAMIuY=;
 h=From:To:Subject:Date:MIME-Version;
 b=HkzyKRdIXFvcnDLC/1zs0fx46bEezXMjI1pW7smnAz4xzJyIGjjg2tL+4ScnTkuGd
 sauGzWrgEAQQKZXKyZGbFnWio4IwxyBEUKn9IXGPkvOF1gsXPl20E/bHscA9Oe4fba
 Pw1QK2UHNpOn9cON1qoVjK2oBlNT3G31pKprLCFlkzCTarsHqP60Rj5sZIr/22ieaG
 luVat+iOo51TjVFaW/ypCUK+kIbUQPanbjs9L1PbIqBbpil5AKYo8Qwi+y/rYt+In5
 HGmofD4WgPAVVQn+zgcmZOZ8R7DHqCZ1e6iMqw2df1Ao7VCFuorkd8Jf0MAwWe5Og0
 2e3+nyaRa6jiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=HkzyKRdI
Subject: [Buildroot] [PATCH] package/nodejs/nodejs-src: remove .node files
 with different architecture
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
 Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Actually nodejs-src fails to build when additional modules with prebuilt
.node files are added. This is due to Buildroot's check-bin-arch that
checks for executable files and libraries that have different architecture
from the one we're building for. So let's go through all .node files in
$(TARGET_DIR)/usr/lib/node_modules and check if the architecture is
different or not found and in case delete the .node file.

Fixes:
https://bugs.busybox.net/show_bug.cgi?id=15823

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/nodejs/nodejs-src/nodejs-src.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
index 3452c93728..bdbf0709c6 100644
--- a/package/nodejs/nodejs-src/nodejs-src.mk
+++ b/package/nodejs/nodejs-src/nodejs-src.mk
@@ -247,6 +247,18 @@ define NODEJS_SRC_INSTALL_MODULES
 	# npm install call below and setting npm_config_rollback=false can both
 	# help in diagnosing the problem.
 	$(NPM) install -g $(NODEJS_SRC_MODULES_LIST)
+
+	# Remove prebuilt files which are not compatible with the architecture
+	# and OS(Linux) we're building for. NOTE: .node files that don't have a
+	# readelf output have different ABI(i.e. Windows, Darwin etc.)
+	for f in $$(find $(TARGET_DIR)/usr/lib/node_modules -type f -name "*.node"); do \
+		echo $$f; \
+		arch=`$(TARGET_READELF) -h "$$f" 2>&1 | \
+			sed -r -e '/^  Machine: +(.+)/!d; s//\1/;' | head -1`; \
+		if [ "$$arch" != "$(BR2_READELF_ARCH_NAME)" ]; then \
+			rm -f $$f; \
+		fi \
+	done
 endef
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
