Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0712C5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 19:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 585E181FA7;
	Mon,  2 Jun 2025 19:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yul9De3N7b6U; Mon,  2 Jun 2025 19:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 762CC81E62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 762CC81E62;
	Mon,  2 Jun 2025 19:04:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A417DA
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 19:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFA9D60EAA
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 19:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6Sx80i7NRv1 for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 19:04:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6640960EA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6640960EA1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6640960EA1
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 19:04:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.165.82]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MMofW-1ucaqh19oC-00LvnZ; Mon, 02 Jun 2025 21:04:39 +0200
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  2 Jun 2025 21:04:16 +0200
Message-ID: <20250602190418.939289-1-dalang@gmx.at>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:/E1i9ug/FMPAtUUL9kSoz7pHt6bMICmzexdv2/aVZ9QLgYjZWDf
 eWUUhlfSjznP6qKzcg7MUQTXXakt3QhSAG74LcLutFeW9t6IGuE7DMO8EN6RQG7I7bPGhtz
 1rFCNIUQsgGt5WnKqgHhatkIEP1frQ5x/GDXiccdQ9uSccXE6JcsdeXQCARccOeQJNk6szP
 osxw39xeHKZQ/yEgoewzw==
UI-OutboundReport: notjunk:1;M01:P0:3mGlX4IGV/A=;hR0zJJipLPkrxQ/hPc16RMLgYAy
 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
 LTfwNd3rbmXF3LM1akqxJiESg
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1748891079; x=1749495879; i=dalang@gmx.at;
 bh=7bxGF9NLp5bHUxUfMraSNnzEHz5neZIjIymjEVKkMpI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=N88d/I/Undqm2uc/sntZzodISL9UoMuND6KVCge7buT2pwMYyy2fHA+5UzsdjJ58
 lusIyNwqww/mwcEp3FGzvpqzNwhFuI+22NGmV6e6864BjG9vc0JmtFUZVY159kXQb
 sLoWmZ0w6kD7LHvA858+kFzRCy8RkKxZ40IrTTp8XZbHHNZ2QSLxG/Q+kvHO3sZtS
 ZyRbbsTKsfDUQMaeE6Hxx28djhPW7mtkgwqN8X1q2yr34P+3fAOz3/IqaqC2gIwTH
 PpmHIYTQhDwLAvjfQs5rT7v4wDgXFGEVC+8Y/wy5bFkf4u48r6sz8symsU3adYnB/
 hzXSqCHhUYyuD+umkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=N88d/I/U
Subject: [Buildroot] [PATCH] package/ninja: ignore CVE-2021-4336
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CVE is filed against a different project.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/ninja/ninja.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index b7bc1a4f1c..805fef4541 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -10,6 +10,9 @@ NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
+# Filed against a different project called monitor-ninja
+NINJA_IGNORE_CVES += CVE-2021-4336
+
 define HOST_NINJA_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
 endef
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
