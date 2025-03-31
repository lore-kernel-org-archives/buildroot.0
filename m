Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609ADC3600B
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 13:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B21F160C07;
	Mon, 31 Mar 2025 13:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YUfoj5Ueoh0; Mon, 31 Mar 2025 13:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C26CC60822
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C26CC60822;
	Mon, 31 Mar 2025 13:14:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA559D0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B80D8408E8
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xf39j-7XDFhd for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 13:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 307E04062B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 307E04062B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 307E04062B
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:14:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.117.119]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sit-1t2cjB3oUB-00tcdo; Mon, 31
 Mar 2025 15:14:31 +0200
To: buildroot@buildroot.org
Date: Mon, 31 Mar 2025 15:14:00 +0200
Message-ID: <20250331131402.3590411-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:BhgjVVcfse4XBPuHVz/4jNWXnVJMBX+3P9ndXvVBdzakPoOTgk5
 RT4n0yVGMfmYWnwoGxNTPt1LoWnCsny+phac6Cixhttg1EnU1TM+X4yqqHx7ZALCDlDMEkt
 tpuI+bHeuv5aO1OSk15gQBmxHrTz0CLWsUfg4Ob2CBkIL/N6910gxXdxBmHihUqz81OGPU4
 ctu09m3EnDgKzqWwk6xTw==
UI-OutboundReport: notjunk:1;M01:P0:uKjUeuaaDEg=;zxndn/C3XwdDEXKjm4cu1XYze4B
 VDmbOCuPGUNFRWTmo4plzPLZO9OoHwSwSGwlLgvbPpswPv99wqjvcNsnmHqEgVmyg+YKMC9lW
 HDFNNZItYknLDwFGRY9o3T9/06jDO1/LRmgHR1HQmxkErt1EE+/3MkLx3AhN2/OXJTsZY0J+n
 hh38LDjOAGtvLeaHUKmmrlS3jcT94eIeJl5kgCOTMaP5VURxFA1r2YaivUbo56wEWNdFXTQ0U
 JDxYna4Gx/0un8Z51VDwCo9AmkQVeqglGZjFxrqwlc2Qpie8rA8mpo5cr7MJ6YGbwB0avZvv6
 f8woyUkvWIBu0nsVBGo+oAKaOvdJkhlpkDxfGI9PdPoukcYJdO9J+/9prie/1AgCCm8iyPbTF
 SZgMNHOuOpPV3+pYxgN/TxVZ7V0HX6za84y2Oa0/m+xZZ02INDg4gUtOzak56b25E/Ks8ZiJ2
 n3yjpRj5GDj7AYlacBupHMmKHWE+pD9K0EYH2MXFsN+ValHpnzSTmhxq4LhnvjI6TJyMzPMpU
 1zx0oRX7i8+RqpEC5es2pq/H4i6ITut9hDWwnPoVNi1fTh12HpGN28YgWKziUWAhf+mwSSspl
 3Aoaad2x5baSM1vntRxpl8a33zRmcr+aoYD+cclKcyTm62UeqPagrwqWcApbLXpVY/+Ogcmir
 h3tHKsG3kvzlk9mJmyZXbyzlKKlDaj87Iy3JzugYJ1p+9cE25a4WZfetOH0L41gd9TDgmBb9E
 FTSol7Jy43gzXtZPfsgNV8/iZVzmGXo425+VXiMPO44KHh4mpz4U48JbS0zk+tlC6XQPN8AoN
 B7kNbUOn7RR5zjAKUAcPXUHj8w5G83s+prAl0o2ATX/HF6KxbBZKhWtoi+5Y5/HBOCe+sbbiU
 EGF7AeMdkXxIhlwabpwG1UZPgwIoXIC/FeV1nRbOTJz6IO5JdySxWJapRx4Fg9jdnN4/t4wbt
 uYTXDldR9pZhaIuhAKKcs5gMvsJYYNHA0HsvMKyCMn8z4QFj6+BdzHMUPMllQFSxOYZ9HHScU
 PhLBbCOJ9F34U2OjCitzzX1FBBaMKnT3lbknP1CVba7YOGido6kcl+5s+HAUhpoAM+vVJ7HQH
 epFGl01zOH1frm+EMeCVhb90Ny8s21gP5CHSNepJdXw/Q3cKQm2GpjowGTSS9/ZKtnVauYbqF
 om70dk8ddXQtisjwBefu2nn/JagYEuDn3UtRe87+oIzGhY8Wyhxjx/GH/EP4GcTFkHZWoKcM3
 lXukHY5ygTCFF1jTzBbpE1PiDFyki2Zbd4JBix4y7rl2qZA2lOyk/mlbq/2p/X0MLzBBvw7oB
 E87wxuyPxRWrctehbSOBEc0eB0ylc+gcm/hzyaXmbnZ29qg/ENrDWoqfaoNo/ILKx7E3FAl0c
 T0w29br93c0txX98RGxS3uGgDQ/+fUc4d0ii0RIkqlpUuUH9+PWOQriquG2bho/wb3J8fZ9Mn
 gTiycP0SuGTh5FJSu2YdNuWgeBomXCY3m25/yMhed/ckai5NY
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1743426871; x=1744031671; i=fiona.klute@gmx.de;
 bh=MySOe1GvBUS+gVH1XMPRQm7JyV65K8+rpZaH/7+mepM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RQlnEpSufCz2iEbQX04PfkEVTdRF7X5hNVrFhyDanaJaDvahzBLGbfGQi/8lNhf0
 ovRyUeizy4yWWd5plm86pHH9tzP8WCdQ5I5b6iNittFG1yLnke835EEWHUX7gvUiC
 Hgq7fCI1jhcrN4YQzFdyUJmYomwWmWlwztRzyNeve6CQw+eWRIFSj68reW2snAeyq
 a4oKAB1vS7ZpJ34ysZsCA9M+2FHYR+k7Fp3CXYrQDbS76ovoMt0H2EzBLyi8IHbNZ
 y7tqSBCTUjLgxKG2Xrlsx2A45IS1j0IIPDrb9Ndd0gb2qiwngUGyuZR5qBtBFS8sq
 CjdlvIRv9MWN53S8PQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=RQlnEpSu
Subject: [Buildroot] [PATCH v2 1/3] package/python-gobject: bump version to
 3.52.3
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog:
https://gitlab.gnome.org/GNOME/pygobject/-/blob/3.52.3/NEWS?ref_type=tags

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 1dbd40d038..e49c7ddd08 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.50/pygobject-3.50.0.sha256sum
-sha256  8d836e75b5a881d457ee1622cae4a32bcdba28a0ba562193adb3bbb472472212  pygobject-3.50.0.tar.xz
+# from https://download.gnome.org/sources/pygobject/3.52/pygobject-3.52.3.sha256sum
+sha256  00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82  pygobject-3.52.3.tar.gz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 001f355844..3021937887 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.50
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
-PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
+PYTHON_GOBJECT_VERSION_MAJOR = 3.52
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
+PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
 PYTHON_GOBJECT_LICENSE_FILES = COPYING
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
