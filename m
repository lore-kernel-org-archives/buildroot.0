Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C28CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 20:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1569E611DE;
	Mon,  1 Sep 2025 20:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Eg2NJXKjFKI; Mon,  1 Sep 2025 20:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AC4A611F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AC4A611F3;
	Mon,  1 Sep 2025 20:28:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13399D2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECA30611F3
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNs5-CvWAv5q for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 20:28:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.165;
 helo=smtpdh20-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A2776119A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A2776119A
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A2776119A
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:28:52 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id tB8xuleVTqg4ptB8xu9LyB; Mon, 01 Sep 2025 22:28:49 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon,  1 Sep 2025 22:28:46 +0200
Message-ID: <20250901202846.811867-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMli+yZpHdlbThoMVzAMc42CF1R3qCRiMq/wGUHfNv3UyqtgBXqvsOR7Gk9wqKlmI/W0XWs+fRVJc6Is1PmkuQUtdd/W66jK6bjS3N6uaNY+jJRHi4pd
 L5YXBtT3Jt3p+kYw2GiSgXPcnDv9xM9OK1Sma9kgx607xkmjWNrxkHsv9tKFKs3VGUuK0hXOKPv/+/V3f2Wul+DmztojEk/4WlK4Etw+hq89MA95vrCAp+Qi
 PyWh0qfWxjK8yHpj5WsZundtqGkeEPM0bz4kiSXe4sCd1zVpicy9iOyWHU/qrNEJX41iA/fY+aTxmk8mufXYK9LdYmZQa/rlkFGX/VUgtR0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1756758529; bh=mzyQCUeFsRa+lofc1U6hPwbp+KD/o12erMbZtXLg91k=;
 h=From:To:Subject:Date:MIME-Version;
 b=CUbRphd3xCjouYV/amUUpK4UXSsZto0x1n+JiyBg5AnZhCsV6PD4OKYWIbnK0FoAq
 oveSOMpDryojXFbK2UKE8wiUS2iiuEciEfuM+wjOuLk0qNV0UwbFKd7aMxDTxztDuq
 lPZYwvVoVstkHWqHMUOM0JU9yzwrL40nckl2aSwViz5m3BSO6NlRdpx7tCbCFqYyFe
 6hVhDhSTB8sYIhAk59AtEAot2W52he2XjM/pBJy6aBycXZurNxEfW8vfQ8jL+EN6y+
 BqqJC17gI9yeGpODOB+YIXINq1dtS9mCgkOObtUpC4F0XmO8pP3iyOKltuCrjMzzdk
 KAP2yXLDqnfZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CUbRphd3
Subject: [Buildroot] [PATCH] package/udisks: security bump to version 2.10.2
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

This fixes this security bug:
https://github.com/storaged-project/udisks/security/advisories/GHSA-742q-gggc-473g

Release notes:
https://github.com/storaged-project/udisks/releases/tag/udisks-2.10.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index 66f4be5e1f..8803bedb21 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b75734ccf602540dedb4068bec206adcb508a4c003725e117ae8f994d92d8ece  udisks-2.10.1.tar.bz2
+sha256  6401c715d287ec84fe605e0cb90579e8da6c395bce5f42e419f205dd297e261f  udisks-2.10.2.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 0d63532d8a..515797f39a 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.10.1
+UDISKS_VERSION = 2.10.2
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
