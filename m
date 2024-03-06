Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BD2C54E41
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 736D8418FB;
	Wed,  6 Mar 2024 21:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fA350mVcxzUY; Wed,  6 Mar 2024 21:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F81D41923
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F81D41923;
	Wed,  6 Mar 2024 21:36:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 206F61BF5E6
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B3C580FA8
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hrL28t8PjnwK for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 21:36:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.105;
 helo=smtpdh16-b1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B5AD80EE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B5AD80EE0
Received: from smtpdh16-b1.aruba.it (smtpdh16-b1.aruba.it [62.149.155.105])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B5AD80EE0
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 21:36:12 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyvnrMrp4EG7Lhyvqr90TE; Wed, 06 Mar 2024 22:36:10 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 22:36:06 +0100
Message-Id: <20240306213606.2149683-10-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
References: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKeX8HOmXHZo8lOrd7EONARBGx2ODX/MOPa1mfH2bm8CqcVAczmH3EYvfgqP0neAoQxADVmMpcUXCod3fltGslCXxlLp4s4H3BQS/e5P/+UADszoYhjz
 Rgtaznbf8uGO+j9LOL1BvOjn6Cavz6vyuOAuxwdj3v4etczv2ZdL4Ky0t7VlijkQ0KTR+RCHrZK8kdeINvt5stWP1weTkUaXDvLKU5ukdaChDFutDAOXYdzZ
 j1og0pp9GlTy6+KYE98p+YxKJxNkN0jLxWf5cuoA28dTxKISlSnqBDrkp125LwTJkoJm8ZbEzi8AuXIm9TCgwyEBqSsVdAeZC59BG3VYeUDhT6NsV7BYJt0Z
 +lBYfpXUDEhV3rHYQMuzgCp2jNMDs4jVz95r+hZb3h0IFtQ2xlNK9psFe3V71FZD+G8ujdZ4QmyptxQdmHaEP+KEawwSkGJbFzqNNhskGmxTPFZbWTae66gx
 2R7CQTI90eN+d8efEFAEJDqgdGSFNShODnG2MkgTtRImRgxYq1MEYpKBrT4FjLuJf5yYa/siRCHjxqcX3zlmtzaTdHxPdO6Z1r8MsIIQHkwm0IXUooMDJ+ep
 WqU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709760970; bh=Qzyxw2Ek+4QFR3gWh459XJTcO8GHLzMFbCSuHoRKvMU=;
 h=From:To:Subject:Date:MIME-Version;
 b=CHrkXZhtwakGRb2K/IFj0i/Ci8pLI6K4cGfUndD+R4mbc8asydD7lN8EmnqgYwDoq
 O+VZF0Q4W5Qkjy83BfeTT+3D5WL3r7amVvKA437IcRPVBdGQ5kol7JsNDXxj46xFeo
 h8FevadoevqCRXjVIDRE+Z3n2LY2SidnV66K7eXxiRcTk+IwVeYE3sc8bIr4F0GNZO
 URiSPyHSJaJX2ZQR1rXq3fz+k2NSFprrBkqjvjfyLFdIhyEoWgzunW4JP7uDROAN+a
 jlL6wllA6wNT7ZfIvPLK/Ck5396OrwZwSUMOi9TeoxLHNDfKpVhNtwyyrFTMOd4Xm7
 IwVz/87UMssyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CHrkXZht
Subject: [Buildroot] [PATCH v3 9/9] toolchain: remove binutils bug 27597
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Binutils bug 27597 is not present anymore in Buildroot so let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3dd6e83d35..79a9cb7bb7 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -70,12 +70,6 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
-# https://sourceware.org/bugzilla/show_bug.cgi?id=27597
-# Affect toolchains built with binutils 2.36.1, still not fixed.
-config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-	bool
-	default y if BR2_nios2
-
 # https://sourceware.org/bugzilla/show_bug.cgi?id=30730
 # Affect toolchains built with binutils 2.40, still not fixed.
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
