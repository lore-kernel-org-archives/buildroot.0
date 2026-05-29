Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2B0CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BCF83E1E;
	Fri, 29 May 2026 08:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isMl37O56B-A; Fri, 29 May 2026 08:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2816983E6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043301;
	bh=JNNeKpreAEY/c3Na2t/3XcJhMpc/2jimRUuKP2Xpw1w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PwRY87qnpYvEoNfaskCRH1YaV3099fNmdRQNcH4VwAGR/51TzFfndzTNX65jIgVpb
	 MNufvAlIRGl64OHHQTGTJRJnSEH7BaflhYYqL8NaPHxDTM80nKIV87xA+ZKMi1ihyk
	 UWW4NqIw0Bj8WhrQcmsG0BX9wwZaG2J/2qpVf3lgc8ly1MshT57yNpLU1y88MGLk4/
	 uEiijW/Fhz0i01UhC2O4j44JEMnYpmHPKhLS7L64B12vblGmIuZUsIFf3v7VEbHsiq
	 sOwNAi0OY797aadC/fOF1y2ov61KjJys/lwHRAaI9Ai4atL4JUVbBWecnWVN8dsJr4
	 N/TiCc/i7Zmfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2816983E6B;
	Fri, 29 May 2026 08:28:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09A3E28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C18D6132B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Rp8KI1JSJqH for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D28D6134D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D28D6134D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B7D8873A6; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:01 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 9bedf714a065af8f7af43bb8eda96a281d11b350
X-Git-Newrev: b2d223c9fc6f1bc10e5f6a8c6eec39d4c14a99c0
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.0B7D8873A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/mongoose: fix
 typo in CPE vendor
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2d223c9fc6f1bc10e5f6a8c6eec39d4c14a99c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

There is no CVE assigned with the vendor name "cesenta".

The CPE ID introduced in [1], correctly reference "cesanta" as a CPE
vendor but introduced a typo while writing the vendor metadata in
`mongoose.mk`.

[1] 3d632c941f package/mongoose: add MONGOOSE_CPE_ID_VENDOR

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit de4044a0c9854c761b42c45923a07eef9978a2b1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mongoose/mongoose.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 44de3fa1e0..d58311eb7b 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -8,7 +8,7 @@ MONGOOSE_VERSION = 7.20
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-MONGOOSE_CPE_ID_VENDOR = cesenta
+MONGOOSE_CPE_ID_VENDOR = cesanta
 MONGOOSE_INSTALL_STAGING = YES
 # static library
 MONGOOSE_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
