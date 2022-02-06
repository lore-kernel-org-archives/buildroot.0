Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4142BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 21:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2ECB60B08;
	Sun,  6 Feb 2022 21:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ReNV6K8pIfwb; Sun,  6 Feb 2022 21:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2386E60ADA;
	Sun,  6 Feb 2022 21:06:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 342861BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 224FF4019C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cfisQwRLlW65 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 21:06:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D985400E3
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 21:06:20 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id m8so3011315ilg.7
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 13:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/RdVheyDR2vuhdvzDSjNovCJ87LnjSWyt+28AGv44nc=;
 b=OLHgR0Eb1JA6dFDo+ZhTWBV4ytZOUSMUdimTNAzCrV7G1ooH99fs/bm5S7xDHMZrTp
 8KL2hrcEl3MHkCFcZVOltWkVv9LSk1ABqm3sudiagW7EzZKBO5Wd19t+RcK4qtiIe8f6
 3O5ETDq/joGOmyHFYJIaLTIHOip+Zs1WRLaECdmd8W21ed5tl9TTISsqzjmFeqn2bUkz
 oCPstlIT99sXVY9+95XBw70gf9XBO6HynIxzmNJEzQ0mdgWKHav/Fqpb936h/Zd+Dzmg
 hpxF1EHPUntpoAjRBTMjP7OnVg/MTIr0BOgSlpY1e1MdU0O8wSFpz0UjltyGwSClN/yv
 onag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/RdVheyDR2vuhdvzDSjNovCJ87LnjSWyt+28AGv44nc=;
 b=LsZaS90AyLGgspX4bMVt/y85Yc2Shu577I4mTV2SrkeqL37b2OB/k/rsn6WL0pjbW+
 9wcKL7QXsbHEFA34H63sSihUFjMsL1AZMGdTYR4v9kKCqjsEcwxrKp1ul3sLv3SiL+UU
 zJD8j60vt1qzw9D7EQxbf0C+kG3afhEr6DBt29EwkTU8OMA51HC9Gem/zmBGX4OykoxI
 CtIQ/b07GP+23QOiLxgxaoZdFGKjvM8+u3HsVcPxke/mWYxDBm7sfGK60gkwUI9ifzJ3
 jzTbsdvTjAXIHX0XnQwuXqhqR2g//F3qqkte1M47VGYWgA2Zh9D+qG4BrWJmi+fm+PYt
 iNfw==
X-Gm-Message-State: AOAM532oB5J1o7jn8gQFRbUwa+fM/2J2z8+Np1Fhj0R9206wp5Cbjzdz
 s5GKfEqidKmHvEuaWx5In3TtpHgRaT0=
X-Google-Smtp-Source: ABdhPJy2eNmD3bNIDJaT4Y1UPMjG2inA4QuiyVWQPZc3Rb9zXLchESZJAL0hubVc6lTDuTBCN6EfEQ==
X-Received: by 2002:a05:6e02:1887:: with SMTP id
 o7mr4037721ilu.128.1644181579975; 
 Sun, 06 Feb 2022 13:06:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id f2sm4364130ilu.79.2022.02.06.13.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 13:06:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 14:06:18 -0700
Message-Id: <20220206210618.1781561-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5declarative: bump to version
 b3fc740080137fdc36853b8ffedc241c901cb34e
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
 package/qt5/qt5declarative/qt5declarative.hash | 2 +-
 package/qt5/qt5declarative/qt5declarative.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index adda7e03ba..3f2a0891a9 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  14a4b9640a2cd94771108dc3658a77c04c680f3d6444750d55e313b20774ce00  qtdeclarative-9349f3975d26632befc036fc9f2ea6e03aee2182.tar.bz2
+sha256  6c81d1d63991c682c6df74e8208cf22fa4c7753cd59b21ee5d665a6ec3f2982f  qtdeclarative-b3fc740080137fdc36853b8ffedc241c901cb34e.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index e63a78021a..882b24d2e9 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5DECLARATIVE_VERSION = 9349f3975d26632befc036fc9f2ea6e03aee2182
+QT5DECLARATIVE_VERSION = b3fc740080137fdc36853b8ffedc241c901cb34e
 QT5DECLARATIVE_SITE = $(QT5_SITE)/qtdeclarative/-/archive/$(QT5DECLARATIVE_VERSION)
 QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5DECLARATIVE_VERSION).tar.bz2
 QT5DECLARATIVE_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
