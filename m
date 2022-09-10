Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D1EECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 10 Sep 2022 14:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A75A360E5F;
	Sat, 10 Sep 2022 14:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A75A360E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPEgQxjAf8bK; Sat, 10 Sep 2022 14:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFCA860FE5;
	Sat, 10 Sep 2022 14:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFCA860FE5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2764A1BF97D
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 14:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1C841C51
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 14:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1C841C51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3GZKRaN9m74 for <buildroot@lists.busybox.net>;
 Sat, 10 Sep 2022 14:00:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F287141C40
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id F287141C40
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 14:00:01 +0000 (UTC)
Received: from localhost.localdomain ([146.241.28.15])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X0unoChogeVWJX0uooKHyl; Sat, 10 Sep 2022 15:52:58 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 10 Sep 2022 15:52:56 +0200
Message-Id: <20220910135256.1689860-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910135256.1689860-1-giulio.benetti@benettiengineering.com>
References: <20220910135256.1689860-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfN0Ar1pW01O8tfPIEIx17q4j5bCyiQsjhblRfJ4Tl3YoP3azP2vvdPdp7F/YYBom+XPxs27g4l3goltamllQyTF/o3iZfaweInaiQ/iBv9aVvN5QP8Z4
 obJJxtuXHKhZajzR4318g4BXGtx5hW2o33g9YvfQbO2Dvqr0qrfyvkLiNUdebH/kKBul8rmIDe84rtSTjlsDIWBgCIgZpjUNLbyCr1Wu82sA3U4Y65SY0RUK
 1aMhKtfjq8yHkSVssb7W8AeVRWRUc91n1zSZl2cWdLZ3CDDu5687ZcnbyAboUGe2mNgonibHyTOaE38NYoOjYm6WaVLgvtWelatHz39A9gfrUpzk7Z4rH93+
 066cb095Z1blZuorMEJAkqBtZtvYlM2/FHApMILhIpUFiuyIyYYuI+xhklQPd4fda8wwtcBzfImKKbhLL/WHgk4YnFRinEoMayXD0sP2dxqbf36Uy7c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662817978; bh=gFRM39j8fwagc2q4bEO5OgVku5ZfAW8DpvTqa7BeC9Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=lO9mwuOwXCWyyk5TcmJoDI/X7MXWdhXKorSGC38jUfCAtiWPtsAj35RPEdqk+3rrN
 9qjmljVg/0KN9pD+9U+99gGZKjViCnxX0HsXm23D7mrSgRkwIw61OmK6ZI1nYc2TU2
 p5eGowKzqfon3ayzZjiPjPkYsrK/wEcYsBJosXLlU188qvXWIbHa3tbON6oFLitrZV
 36mF4NCrcADS1TOZbRa8DKP+2nqgkpb61fCRurbkMvES4ekKWQKozHBc45ohG60ut4
 K7nIrQoEnpVC+nFIDE6/1k9IkKXxJ1OawJuGBGJbnfjCvvJBEWcR+ClxjbZKmjWBeY
 +KM9/CCWWwFnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lO9mwuOw
Subject: [Buildroot] [PATCH 2/2] package/qt5/qt5xmlpatterns: fix build
 failure due to gcc bug 90620
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The qt5xmlpatterns package exhibits gcc bug 90620 when built for the
Microblaze architecture with optimization enabled, which causes a build
failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_90620=y like we
already do for BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y.

Fixes:
http://autobuild.buildroot.net/results/346/346e6d502a8927c8e95eea156f5b2943a85d0a6b/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 3bb4ef74fd..6711e9bf70 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -20,4 +20,8 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5XMLPATTERNS_LICENSE += , BSD-3-Clause (examples)
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
+QT5XMLPATTERNS_CONF_OPTS += "QMAKE_CXXFLAGS+=-O0"
+endif
+
 $(eval $(qmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
