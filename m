Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6343C369B5
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 09:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B27B40D99;
	Tue, 15 Apr 2025 09:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UlNX-j_o8pw; Tue, 15 Apr 2025 09:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFA3240DDA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFA3240DDA;
	Tue, 15 Apr 2025 09:57:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3F4A108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D581E6061E
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlRS-ex033gJ for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 09:57:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=83.166.143.172;
 helo=smtp-8fac.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D579C60837
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D579C60837
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch
 [83.166.143.172])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D579C60837
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:57:42 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZcKMm53VBzXQK;
 Tue, 15 Apr 2025 11:57:40 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZcKMm15qgz5B9; Tue, 15 Apr 2025 11:57:40 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Tue, 15 Apr 2025 11:57:28 +0200
MIME-Version: 1.0
Message-Id: <20250415-libcamera-qcam-v2-1-84301a46a144@cherry.de>
References: <20250415-libcamera-qcam-v2-0-84301a46a144@cherry.de>
In-Reply-To: <20250415-libcamera-qcam-v2-0-84301a46a144@cherry.de>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Peter Seiderer <ps.report@gmx.net>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH v2 1/2] Makefile: add libexec to BR_PATH
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

From: Quentin Schulz <quentin.schulz@cherry.de>

Meson qt6 module is looking for uic, moc and other host tools that are
now installed in /libexec since Qt 6.1.[1]

Since the libexec directory can contain executables, it seemingly makes
sense to add that path to the BR_PATH environment variable so that Qt6
applications built with meson can find uic, moc, rcc, etc... in the
Buildroot host tools.

Another attempt[2] was made to make Meson look into the Buildroot host
directory but maybe it does make more sense to have libexec part of
BR_PATH anyway. Both solutions to the issue aren't exclusive though.

[1] https://github.com/mesonbuild/meson/issues/9791
[2] https://github.com/mesonbuild/meson/pull/14381

Suggested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5bf5abfe3badbd460392582425bbb49ab1a4e7b1..8787a9065fcaae126ed46c434f7ed7988d99bb16 100644
--- a/Makefile
+++ b/Makefile
@@ -468,7 +468,7 @@ $(STAGING_DIR_SYMLINK): | $(BASE_DIR)
 	ln -snf $(STAGING_DIR) $(STAGING_DIR_SYMLINK)
 
 # Quotes are needed for spaces and all in the original PATH content.
-BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
+BR_PATH = "$(HOST_DIR)/libexec:$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
