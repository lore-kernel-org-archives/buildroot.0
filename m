Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978D4CD6E68
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 13:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E8C881FDC;
	Tue,  2 Jun 2026 13:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27sdICK41g8g; Tue,  2 Jun 2026 13:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F00681FDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780407563;
	bh=BBvUKSXNEKyEiWnBOYek1WXYswLfaqjJlpVsyu1zYH0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F1dXtVbmBKbt61v/a4tU+HpPkp837t84yzmnK3Jo8GN7whfeegK+cfDypfH2D1h+o
	 74r5IVgwnKmNruNTkHUWHIBe8YK8OiOYvq+J3m41s3JoCb3Y79Z2/ft7Of2gcBhiKo
	 QGz+cCwoN+RDJXLdt9YgWgp6ywK8rHa85lf/nmh1UGOH47dJSqC3l9V5APlycUGcXU
	 9PxN2RuKBFNRQUWKvvimZHz/drhiNtLLDrsG04JQmntIyTOLC7LkLqeVJYe2LiTsQ4
	 em+/q8z9wSmSjfCc+MKLFWOKznR4+01KQURcYM3Q+ATL1YrDEUWmzArRfLBisLQEcE
	 OUhC4XWTKaVdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F00681FDE;
	Tue,  2 Jun 2026 13:39:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54B78223
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 13:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46B4681FDA
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 13:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNoNGcLmlw93 for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 13:39:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.73;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9062881FD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9062881FD9
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9062881FD9
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 13:39:19 +0000 (UTC)
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue106
 [212.227.15.153]) with ESMTPSA (Nemesis) id 1MUGRh-1wuUZ515t5-00JoJi; Tue, 02
 Jun 2026 15:34:12 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 15:29:15 +0200
Message-ID: <20260602133156.13676-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:sww2QzOxm5tWgQrICLarXNxq5RGblVvgE/sI2gOpbmgnit0K/7t
 svaNraAyHnF/YLx9VtCqZCOHWFRrFCz0O4sadwhz/2Y15yXMP9aizaQB00TMOBtxWngq4sL
 k+oxHFeNHYwHy/EE0AYrezSQJ3En+x9CYJnwvWMbwQ45QWS+zhJsnKmFZE4HX/Z07KByXTv
 jKEKW4DgAKIsj6zWi2Beg==
UI-OutboundReport: notjunk:1;M01:P0:n8VGNyy99Mo=;/xby55jWAIy1IoYohfn2xTr3ymY
 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
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH next 1/1] package/libgit2: bump version to 1.9.4
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

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.4

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 11eab3001c..f30f0c528c 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d532172d7ab24d2a25944e2434212d63ee85f3650e97b5f7579e7f201a78ad64  libgit2-1.9.3.tar.gz
+sha256  824b73bd13647800fe4b566a1008ae77fea0e3e3424edab632fcfd8c0b14ba8b  libgit2-1.9.4.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index b2607a178a..844f4d705f 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.3
+LIBGIT2_VERSION = 1.9.4
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
