Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6A8C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 21:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE39B60B71;
	Sun,  6 Feb 2022 21:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mfqSSd3qwQLI; Sun,  6 Feb 2022 21:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14B3060B3C;
	Sun,  6 Feb 2022 21:20:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 650DC1BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BD994029B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5i9YRin3Sd1R for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 21:20:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A144040296
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 21:20:34 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id h11so1428680ilq.9
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 13:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oI1yQ7EMzo1DQuDYYFP+q1/EmMamsmp2Ml23n4oXVeE=;
 b=JL8wiabhWTAQzHDj791/dFqjtEsmcgbrdoXFgc4jfuzR/sZ7e2sBxyJ+7ObkDeXmyr
 Bxa03RI+lP1TCf8r7g9oKNEwgy4+zsCS2+OwtAYc4PuSJAFZVYPxMUZD2UBKfaqu9rfs
 HOvZZY7DCHZwogmQOz+Oggs00LPUV4BVwbYrVgJSSkYhRHj5uvP9pvlcrVDKnIg1v2Vz
 7feONIK88SYkaX5zTb/1lRjMYlCVorvxYz2JtkaW9itfsdOsQsbJeyuKQyzFg+zgM3TP
 AXh0YRNKTeY6x73/N5KrBVAma4TmBP/VI0BPaYqSZ/Td+cSV7FSw37FaIMgWXqy0o4p8
 oOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oI1yQ7EMzo1DQuDYYFP+q1/EmMamsmp2Ml23n4oXVeE=;
 b=jkt+3j8BENGbocDbgCZjV6D75hmoITD48gPdzxB3UGxL3f8D4zty2bGgYEu03BDSzt
 68Nu59HJ1D0eWTlseymCTJ1YBL4Gd/Aqw1HDOHcyia3hzTsIO+xZgVIvgAwDoLcRNme6
 8mMhqF7HMMGNtqdZiX6pziDqv0bjP7K9VM/RNDep8F6DIUkSCc647cr4edgTooXvWTBW
 e3+4r8VHzie75GD9YOY2EDQ87r5wpsfa8Wux+BgdDbKWutcYXhFXDJgCX62iZbS8qYG9
 8U3KkJFR0qfuIi/NP3AkI8Ln/kgMv22xW4rwHB3l+YUapD/zKjXyb5mObU2g+c9MT/h7
 6fhA==
X-Gm-Message-State: AOAM531ssncA/NbuQjOtGlaBPlK4x2DAhqrrMXwTtwFxllrr+pZzhwcT
 uss2dxHu2bZGMFg/pNKKGPHLFbltfys=
X-Google-Smtp-Source: ABdhPJyBvnobwpSU6mAcw1nS+QI1HfgqKCnkhecmhWfwkgNHGpk7OXluijdclH+ehziasHsZaOUGjw==
X-Received: by 2002:a05:6e02:b41:: with SMTP id
 f1mr4704792ilu.193.1644182433637; 
 Sun, 06 Feb 2022 13:20:33 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id k13sm4349052ili.22.2022.02.06.13.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 13:20:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 14:20:28 -0700
Message-Id: <20220206212028.1786742-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: bump to version
 d16bf02a11953dcac01dca73e6f3778f293adefe
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/qt5/qt5base/qt5base.hash | 2 +-
 package/qt5/qt5base/qt5base.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 396f5044ff..1b9ff43ab2 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  269ae20ed74cb949420ac3abac0bdef3b65501ea47c9312c01e8f9073baf24fe  qtbase-53a047c212af7fbded6505651f648172f9d7a34d.tar.bz2
+sha256  96b1c96041ae7b5186c94f231979217bd50e3c0a4caeba32982faa8054a6d113  qtbase-d16bf02a11953dcac01dca73e6f3778f293adefe.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index d8a0bf1d16..37ad9c652c 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5BASE_VERSION = 53a047c212af7fbded6505651f648172f9d7a34d
+QT5BASE_VERSION = d16bf02a11953dcac01dca73e6f3778f293adefe
 QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
 QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
