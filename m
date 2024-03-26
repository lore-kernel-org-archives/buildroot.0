Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE2ACD11DF
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 22:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1FE6408D3;
	Tue, 26 Mar 2024 22:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MCuUCw7ySSW; Tue, 26 Mar 2024 22:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 686F3408C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 686F3408C4;
	Tue, 26 Mar 2024 22:50:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4401BF95D
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 22:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C75C4056F
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 22:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OaYPpyKkqq2y for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 22:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.146;
 helo=smtpcmd13146.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56E54400FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E54400FD
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56E54400FD
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 22:50:35 +0000 (UTC)
Received: from localhost.localdomain ([79.54.175.3])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pFclr9KIiJAuQpFcmrBn6j; Tue, 26 Mar 2024 23:50:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 23:50:31 +0100
Message-Id: <20240326225031.224022-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326225031.224022-1-giulio.benetti@benettiengineering.com>
References: <20240326225031.224022-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIvAxgoedLNsciNceAscyJSUuJ1QIicUGclQ7QHck6dwgr0PQAcMYoNLKGrsoEGCQ38ie30lIHF50BhUofwgWKNftf0WkmWq45LNU+q4SduIHbNMxEXg
 Me+cxUqqvhY8Bm7X1IfuwJ/22Ee58BrsPU4nlrs0CPgAobH8TBG+W8B3QhFjHZffP1dvIPQCVItbYTQCIK9BsgsB90YR383CXF41sqqjN2wvL7mO74a71Vjb
 t58SLHsDaYcWc8TN8ibxXIbADCEYqJZbVZ98bDv+1hQI6Obi+lViLsbCi70qoDWPClsHCdqECEGewNaX1+waxfI/G/b3FwaAoEjSG+ILyWueoPub7vVWhxi2
 iGKnztXp
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1711493432; bh=zX5/Z8kMSwQbs46IMfCR8MagZDTsCtRWgWUn1B1YH7Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=OuMKg90FT9Zs93hG+2K8WJov4zYFxXmDjbiVHOsj/XKzOBmwjCpIxKiTOhQBbHdh5
 Qp6l0w2979HcltOnTZF5YmnwzbWDxERXLRZD0oIOd7YwYQZju9aEek3zKQFQNnr2ON
 rTr/mbrkFSWEzWwX7XN63jcfaEe3gMcA5A90q9RH4YHvfpWJFppGqxfuVEzF2TPjQQ
 HEZWdMLBxRMGIU8x7FGPIWQ66AKIKzhP4lssaHLU9vQXMCQOeBxTOJJL2q9il8iYKC
 h03xZLvMewhvzB1bmod2RLjdwvxpdcxoYPuLOx5zG3qdvwS2AF9RAYZNjIxirTulF7
 lsirPYoiwsAfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OuMKg90F
Subject: [Buildroot] [PATCH] package/libblockdev: bump to version 3.1.1
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
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libblockdev/libblockdev.hash | 2 +-
 package/libblockdev/libblockdev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 79700a4996..1438fad741 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  41e4af66c9d78e795302d37825dfd88a4970f82da7b4ebe6487feba2afae44fb  libblockdev-3.1.0.tar.gz
+sha256  a5cb33a53ff5969067982704f45399d02555fdb2313ed0c56eac9555397dc2db  libblockdev-3.1.1.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index ebf01acfb5..9ffa15a7a9 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.1.0
+LIBBLOCKDEV_VERSION = 3.1.1
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
