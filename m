Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6025FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 08:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F6B60AB9;
	Mon, 24 Jan 2022 08:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmOjPBXsUIOy; Mon, 24 Jan 2022 08:04:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49AE16076A;
	Mon, 24 Jan 2022 08:04:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 563151BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52D6F824EE
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vFckVmOXwmH for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 08:04:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE726824DF
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 08:04:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a13so11918939wrh.9
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 00:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eLk6tT38uKgOBiJj991h0nA6MLKz61AZtSS3GdioxvI=;
 b=PeOZhGDl+ldv6TmsaTZ3HB7QyUN0JOiQhpZkT//KnMPGRHNKWwskLO87nc9m61Jgmg
 cNl2pD2VR759L8paGW7ktTRmUsDr2yuCp+wv18p2wsjBK7Q7QhI5NEf5nq4J0x/9cLXb
 yg0ZZhR54fnBarQgaciPB+w+FaoeDvK7Sl4JC8PxqqGLHDvyT1ecylOwFShSDSvwx7Tz
 cT+ZcIM5OfewSqQwXZm6CVsKzJOKkHjXYq4oCIMKot4iuIXmLWDL+yBOMiBM/e6Y0RUN
 p/M8+23Alde/dynY1qUyhIoMCL6T1+BM/j7CFeVMCI5tbtLtD5cXFqfVIc5wvBdNRyIF
 i80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eLk6tT38uKgOBiJj991h0nA6MLKz61AZtSS3GdioxvI=;
 b=I/JWWxpNNd7F5tvaJstqbuwYGatR25e7hsVEc5pgjFsu6NYt7YrfJkWo3UIEx3B5PO
 O9JV3sRNf4DltCUU/Th44CyZ6lx8szRSOMyLbPp8dEKrI0XY3SH1KJKmeJ8Qcpc0QNg0
 Nwad6bHlAw2zOpOYERHDFagBLVc/EzZnBhNwbJ0BHm26vsEIt35I9k8/2wuxXIKxxFPn
 8EIJhhmy6nBFeoQnIvUbqGCzGnqrtL3JxeqdFJswrTd6EorFrHJjn/y77KMjy6Syxoin
 1vzxO5Pc2onZ2KyFEy7T3Ri5bEcYVhg/LFhyiE47wOpTYpPRDf5ws1AnkQnQyZgTwkYB
 8N/A==
X-Gm-Message-State: AOAM533NfEGXri1ihImLK2u7z0yEjeHF0U7f+ds0UDTszncnaPxUmekd
 4l69EFrynZdc45zSSC+X4BBZAdtivG0=
X-Google-Smtp-Source: ABdhPJzYUAcA0FwHoReO/xh8njMLl7nGIFyHhvIpynzrRwwQORZYHdwEu16gaT7P/kgfPJv8MCMt0w==
X-Received: by 2002:a05:6000:1708:: with SMTP id
 n8mr4989003wrc.227.1643011448090; 
 Mon, 24 Jan 2022 00:04:08 -0800 (PST)
Received: from home.localdomain ([178.124.208.44])
 by smtp.gmail.com with ESMTPSA id y2sm17639128wmj.13.2022.01.24.00.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 00:04:07 -0800 (PST)
From: Uladzimir Bely <wiselord1983@gmail.com>
To: wiselord1983@gmail.com,
	buildroot@buildroot.org
Date: Mon, 24 Jan 2022 11:03:52 +0300
Message-Id: <20220124080352.2116-1-wiselord1983@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-mpd2: bump to version 3.0.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>
---
 package/python-mpd2/python-mpd2.hash | 4 ++--
 package/python-mpd2/python-mpd2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mpd2/python-mpd2.hash b/package/python-mpd2/python-mpd2.hash
index 83487257ee..88dcb28377 100644
--- a/package/python-mpd2/python-mpd2.hash
+++ b/package/python-mpd2/python-mpd2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-mpd2/json
-md5  e31c6063e9c2e029a26b0815cd08b05e  python-mpd2-3.0.4.tar.gz
-sha256  7a67834e22d97e7cd77f8951c8baf87c149285c67d67d73550ce034302561ae5  python-mpd2-3.0.4.tar.gz
+md5  594dff3e53c8eb6f583ba642bc2c1a27  python-mpd2-3.0.5.tar.gz
+sha256  6f1bffd93b9a32fc018a9bbf3487505b52e0d757ec34066905c60a912d492384  python-mpd2-3.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
index f357e302fd..bfe382b59e 100644
--- a/package/python-mpd2/python-mpd2.mk
+++ b/package/python-mpd2/python-mpd2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_MPD2_VERSION = 3.0.4
-PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ad/92/bec26455a3a6d6146bcf2a974f5c3509d451306413b386fc12b037d9e3b0
+PYTHON_MPD2_VERSION = 3.0.5
+PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ed/c2/263621bdbbc37fa1a55fa1a7f66fd601bf08b3f87481e318a3509fb6c4bf
 PYTHON_MPD2_SETUP_TYPE = setuptools
 PYTHON_MPD2_LICENSE = LGPL-3.0+
 PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
