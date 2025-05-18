Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2795AC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28E940B43;
	Sun, 18 May 2025 12:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-7IVMTb37z1; Sun, 18 May 2025 12:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E2D340B26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E2D340B26;
	Sun, 18 May 2025 12:16:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 142BC1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C9D60639
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMPW-Atx9Jv7 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A967B60AD0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A967B60AD0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A711886879; Sun, 18 May 2025 12:16:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:15:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c482f525a3f3d5c2d157e4dbc598ea1c7869338
X-Git-Newrev: e3a15862fbfc49a22f7cc94ef1fdd11abc701d7d
X-Patchwork-Hint: ignore
Message-Id: <20250518121639.A711886879@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sox: annotate ignore CVE entries
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e3a15862fbfc49a22f7cc94ef1fdd11abc701d7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b6871f9d93055ec94d6fb88779d44b3235b29ce9 ("package/sox:
security bump to latest git commit") forgot to annotate the ignore CVE
entries, so let's do this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sox/sox.mk | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 42e47a916c..8922f98d5c 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -19,10 +19,44 @@ SOX_AUTORECONF = YES
 SOX_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 SOX_INSTALL_STAGING = YES
 
-SOX_IGNORE_CVES += CVE-2017-11332 CVE-2017-11358 CVE-2017-11359 \
-	CVE-2017-15370 CVE-2017-15371 CVE-2017-15372 CVE-2017-15642 \
-	CVE-2017-18189 CVE-2019-8354 CVE-2019-8355 CVE-2019-8356 \
-	CVE-2019-8357 CVE-2019-13590
+# sox-14.4.2-6-g6e177c45
+SOX_IGNORE_CVES += CVE-2017-11332
+
+# sox-14.4.2-7-ge410d00c
+SOX_IGNORE_CVES += CVE-2017-11358
+
+# sox-14.4.2-8-g7b3f30e1
+SOX_IGNORE_CVES += CVE-2017-11359
+
+# sox-14.4.2-9-ge076a7ad
+SOX_IGNORE_CVES += CVE-2017-15370
+
+# sox-14.4.2-10-g968c689a
+SOX_IGNORE_CVES += CVE-2017-15371
+
+# sox-14.4.2-11-g515b9861
+SOX_IGNORE_CVES += CVE-2017-15372
+
+# sox-14.4.2-12-gf56c0dbc
+SOX_IGNORE_CVES += CVE-2017-15642
+
+# sox-14.4.2-13-g09d7388c
+SOX_IGNORE_CVES += CVE-2017-18189
+
+# sox-14.4.2-38-gf7091126
+SOX_IGNORE_CVES += CVE-2019-8354
+
+# sox-14.4.2-39-gf8587e2d
+SOX_IGNORE_CVES += CVE-2019-8355
+
+# sox-14.4.2-40-gb7883ae1
+SOX_IGNORE_CVES += CVE-2019-8356
+
+# sox-14.4.2-41-g2ce02fea
+SOX_IGNORE_CVES += CVE-2019-8357
+
+# sox-14.4.2-44-g7b6a8892
+SOX_IGNORE_CVES += CVE-2019-13590
 
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
