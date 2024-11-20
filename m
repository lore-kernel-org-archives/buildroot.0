Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E155D6E2CD
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 07:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1AB26108B;
	Wed, 20 Nov 2024 07:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdfloCIHHrlF; Wed, 20 Nov 2024 07:46:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A18F60820
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A18F60820;
	Wed, 20 Nov 2024 07:46:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EC3227D6
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 07:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D0C84013C
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 07:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqOqtcoXmPgE for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 07:46:33 +0000 (UTC)
X-Greylist: delayed 513 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 Nov 2024 07:46:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A391C40135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A391C40135
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=168.119.168.44;
 helo=mail.sinic.eu; envelope-from=simon@sinic.eu; receiver=<UNKNOWN> 
Received: from mail.sinic.eu (mail.sinic.eu [168.119.168.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A391C40135
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 07:46:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0EBDC3F1FA; Wed, 20 Nov 2024 08:37:55 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2024 08:37:55 +0100
Message-ID: <20241120073755.17583-1-simon@sinic.eu>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sinic.eu; s=dkim; 
 t=1732088277; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=wP2xlXxUBU+IXFRTwO1ugPM2qjv8G5gqNRhtNn/VWPs=;
 b=ALxGXCtHTPoboVUOtzJUw5qB6aciz63pedsPmyoWWG8e6ZCXVZIiHr5I/ee8+DLtHEfMpB
 u1efQWZ5qQBSlMLojYXQlmldmeWeT2D44rwIP/LTtQsiD3U3PQVD2H37LytCFmgGMYaSNs
 cj28q5YLlt10plRCSALRli8U5T8iH5RHC2f0einyoCTg4H/cTpPyRpo2tDC2XDuBXVCJvQ
 B0EC6eYaeoyYZ69Aj138RLCFynAVMV6N+EzlL9Wg0qjSavosx0z3+RKphrw5maAzkjziVd
 i5/L52UV+CosS4gJOojudqftzkqziXfD6OH9/8mJ83h4Nuc7QVRpSt41pV2KsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=sinic.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sinic.eu header.i=@sinic.eu header.a=rsa-sha256
 header.s=dkim header.b=ALxGXCtH
Subject: [Buildroot] [PATCH] package/pkg-generic.mk: add missing quotes
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
From: Simon Richter via buildroot <buildroot@buildroot.org>
Reply-To: Simon Richter <simon@sinic.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This allows <PKG>_SOURCE to contain characters like `&`.

Signed-off-by: Simon Richter <simon@sinic.eu>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9ec84d0f45..96cc5a1d25 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -176,7 +176,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 # Only show the download message if it isn't already downloaded
-	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
+	$(Q)for p in "$($(PKG)_ALL_DOWNLOADS)"; do \
 		if test ! -e $($(PKG)_DL_DIR)/`basename $$p` ; then \
 			$(call MESSAGE,"Downloading") ; \
 			break ; \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
