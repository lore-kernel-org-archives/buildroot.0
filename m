Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11B0E6919C
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 22:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C16680E19;
	Sun, 24 Nov 2024 22:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNQbh-mLa1mp; Sun, 24 Nov 2024 22:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F4E180E1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F4E180E1C;
	Sun, 24 Nov 2024 22:28:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA99B31
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABF2180E19
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kw_yKK2QWh3F for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 22:28:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDE9780E1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE9780E1C
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDE9780E1C
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 22:28:48 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FL5wtCu9lNhthFL5xt2PkY; Sun, 24 Nov 2024 23:28:45 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 24 Nov 2024 23:28:44 +0100
Message-Id: <20241124222844.162887-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241124222844.162887-1-giulio.benetti@benettiengineering.com>
References: <20241124222844.162887-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIE3uhwKYZ9lMmJwOzVs2wSohr0Ku7IyTZx6+xEUqvuBppVs6GqpuGH/sqHJkgit4v0dV8trcZ/SGNxr8XnzfcVUPL83xLKXBh1pVoz99PI5ql7/jSzg
 9aAMV/pj6CMA8KhAjCBz+UH5koAXCiUZ69LPH0LYxKpItjKQWvuSwpiM62DA9odu8EipLnSN4U8mzcD/k3HPZPtXo96VjqY5mVtbB1D+IhoyxZ22W6y57FJP
 lC06Lan+nL50ZTlU2zB9+NPTRHKGNGC5TWBEb1eKy0fG/VdxchzSlvMSeKAny4bQZK3UbEfELKKv+CTRHe1VAQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1732487325; bh=V6VSWA5x6a2J1k2tZVvhML502v9iAwlUnzrny7dNmJI=;
 h=From:To:Subject:Date:MIME-Version;
 b=XtkGZHRPJq5MpMBqNbmv4OQYK2SIo5AC28TSEAYsuam4ezua0YeHanVfyc4+JFHCM
 YPxDPQk1f44uCe3BV/kvJhOiwgJu49KfrYxsOeDwm+N2ApoToaZgccW5rcMj/eNkSu
 CxXVDIzdTK9W/M6I+h1NZcfzMoo7NNk1KM/rUoh6eVkg42q59Q0O8oj1TQ1FcjxKn0
 Yck+UMgiaGe4fNUQ/RJACU55NH3WnFdE5aeuZK3Zs2myWAi+IMsoOKSSDBUBqFrBH6
 yPS1Pzq0clmsIF+/Hgs3gmvcnfdwkp1AZ5IEuSfcz7iyfCoub9jdNY/IIa+niwTMh3
 41PFVQGKAnx+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=XtkGZHRP
Subject: [Buildroot] [PATCH] package/mongoose: bump to version 7.16
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

https://github.com/cesanta/mongoose/releases/tag/7.16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 6e8d1e3804..15aa2b35ba 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  efcb5aa89b85d40373dcff3241316ddc0f2f130ad7f05c9c964f8cc1e2078a0b  mongoose-7.15.tar.gz
+sha256  f2c42135f7bc34b3d10b6401e9326a20ba5dd42d4721b6a526826ba31c1679fd  mongoose-7.16.tar.gz
 sha256  7e2bc5dabbc27b431a530540161ba860906f12109d4b84b1e4bc8879f1afc3bc  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index e3c57c8e8a..9ec6423e93 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.15
+MONGOOSE_VERSION = 7.16
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
