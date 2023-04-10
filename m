Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF2CC77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5831641918;
	Mon, 10 Apr 2023 19:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5831641918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHVo2wngt8oV; Mon, 10 Apr 2023 19:50:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 155C541969;
	Mon, 10 Apr 2023 19:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 155C541969
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99FCB1BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72A4960F16
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72A4960F16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVT7p9OUQRY2 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:50:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69F8360B2F
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69F8360B2F
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:49:59 +0000 (UTC)
Received: from localhost.localdomain ([146.241.106.178])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lxWWpFg4s0mc7lxWWpQqYk; Mon, 10 Apr 2023 21:49:56 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:49:55 +0200
Message-Id: <20230410194955.104709-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKDYrxY7GRnwi3QwnZf0n0hyU+jkEPybM9DjM+3bEPasfeW2ZHLnds2WIlJvR+cNOGKoZYae4SkxlgIZsYxQkUX5rP+/Y+n3phyfVzYSnk6+kNMNmL2g
 9FtjjyfVfhDQlUON6o9OavWtImtLOaG3xaVnp2Q3MfQdgbVGaOWjcmERE94VnzLBb9VzbehHbYVbiCptjgXel0rqCNYjNDAZAVlqk4wr7nkCp9GV0J1zgkyk
 vlA/vN9+vTXwl7gQSh3ImTNqF+6x2E/zGGfo51VBPtnCI1kCRzeGRCSrUVrYx27dYAemfpKszpDXEQAcUpe3hA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1681156196; bh=QaRN2/ipGA+MtODTtK91GvzKdkEcw7NMcF7Ybl1gLbc=;
 h=From:To:Subject:Date:MIME-Version;
 b=gTqizFfPt7zrwmlHJEsokfXEQCYl8dSKLg83LwncXUsORNHHuxAjSH1TiXnHmns4G
 csIoBxgXJk+K0LjA/ZjpjSb/EdykE6Mn+6hSiz3THaf3P3ieFC7pvHZLvkgdeJ0/2d
 3EbHGjEXSYNEosOhtt0DaR3tXdcujnMytWhtROt29vJnaMAWqTCJIyKp+/Hf6LSCgk
 og+jqNHD0DfhZ66gzphyjjK5OpJbil3gGictUnPTDFmTtvVCpvHj4kUlMEGiljoxbg
 NXQIuxybohdUkZZuagKqUmWP/PqDC8O6ovayl3zSOSOd38G1NSa7nl0QRKubNDpnJb
 x/4tBos1BDdNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gTqizFfP
Subject: [Buildroot] [PATCH] package/xr819-xradio: bump to version 2023-04-10
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
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version fixes stack parameters issues:
https://github.com/fifteenhex/xradio/commit/a835c4747be088978a055b9645e3c523d0c54fe1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 60185db736..8676f065f8 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2b297fbcc9b5ed190bcfff9f6f808c170632ac3d69dbd92156a7f4f57142dec9  xr819-xradio-005f28cfe9e20b7f2dfd9d32d38ee97060dc707f.tar.gz
+sha256  93388424f1f136db541ce056be017f2f0f6688278ac15a88bef34da8f12ffea6  xr819-xradio-119cad7d07aef6973dd44e4dae74d4c9defd06a2.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index e5daaa6051..66c08e7921 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 005f28cfe9e20b7f2dfd9d32d38ee97060dc707f
+XR819_XRADIO_VERSION = 119cad7d07aef6973dd44e4dae74d4c9defd06a2
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
