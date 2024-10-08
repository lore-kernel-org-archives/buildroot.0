Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88C3CEFC53
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5410C607A3;
	Tue,  8 Oct 2024 20:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAStm5jjCTBP; Tue,  8 Oct 2024 20:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B16B26066E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B16B26066E;
	Tue,  8 Oct 2024 20:13:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C76F1BF59E
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37BA3405CB
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNiSzI6WWBHk for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:13:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C26E405C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C26E405C3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C26E405C3
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:13:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 49385B00573;
 Tue,  8 Oct 2024 22:13:11 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 22:12:59 +0200
Message-ID: <20241008201259.574500-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728418392;
 bh=Ouvpz9iSL+9gsu0o/MOw0t32mje7TcOFnhJVwIv2C3A=;
 h=From:To:Cc:Subject:Date:From;
 b=XIICzhQT5o3aGM3pc/u/77tvFFfhJJdTuTxheROlaPnm+xqoPiHuWRnjGbQZxmENk
 l1d+b9k5xwSutRWj1LLJ61SdvkaTbPIKxQju8k8MuCIwoeEizGERwjEhq8MSJXs6ES
 WFJNfT8fjZiemoIzUwk9sLxWc3Uot5vOiPtD6W9mW+3Yl3D3+DKgem/ZXnd0JYL24N
 WhRoh4x/DBJH+6ElJ7uuKKtbSH+pHypWjjjDV00dbZktyX626+no+OIEq0JhkcAz3t
 8ZvOwZD81AnAnIt4PPSA+doTCskRWzPz7ho7xdTXtmohfwAyK8uT7FRObjKnhx3dyB
 vq/lafymx2WJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XIICzhQT
Subject: [Buildroot] [PATCH 1/1] package/openipmi: bump to version 2.0.36
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release announces since 2.0.34, see:
https://sourceforge.net/p/openipmi/news/2024/08/openipmi-2036-released/
https://sourceforge.net/p/openipmi/news/2024/04/openipmi-2035-released/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openipmi/openipmi.hash | 6 +++---
 package/openipmi/openipmi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
index fdba9518c7..6015be0eaf 100644
--- a/package/openipmi/openipmi.hash
+++ b/package/openipmi/openipmi.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
-sha1  bc910d5d682710e9ff290c33e0780a71edba29d4  OpenIPMI-2.0.34.tar.gz
-md5  9d27cc86b95a29251009db96452e7213  OpenIPMI-2.0.34.tar.gz
+sha1  a7b8b581a32b649cbf5bc79926f97d59919c5b79  OpenIPMI-2.0.36.tar.gz
+md5  e77028dcfb6e91cc256da19723af1a2e  OpenIPMI-2.0.36.tar.gz
 # Locally computed
-sha256  93227e43c72b5c3bd5949323e0669aa5527d1a971473a3a365af03fb8284a95f  OpenIPMI-2.0.34.tar.gz
+sha256  a0403148fa5f7bed930c958a4d1c558047e273763a408b3a0368edc137cc55d9  OpenIPMI-2.0.36.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  185323a62589e7ee80f86bf2ea29caad9a09fdda0ea3f1c00db8b778c7edf60e  COPYING.BSD
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING.LIB
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 1c406879e3..63043f677b 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENIPMI_VERSION = 2.0.34
+OPENIPMI_VERSION = 2.0.36
 OPENIPMI_SITE = https://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
