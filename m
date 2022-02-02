Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E851AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 04:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 904E44018D;
	Wed,  2 Feb 2022 04:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ec1W0YAIXXNZ; Wed,  2 Feb 2022 04:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6217D4011C;
	Wed,  2 Feb 2022 04:11:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE7321BF380
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 04:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E736183437
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 04:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPweexvJ1ore for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 04:11:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 186E083434
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 04:11:17 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id m17so2868224ilj.12
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 20:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k3PqPWgkCdQpcvN9mh4Lbdzlb+fHp/hC+2OmIk4EUA8=;
 b=WSeyUnBK4pGhQ5xb3H7Wa7NIR5b3V5KPE1x3lHyxibA2zp5VInTF7U8ZmRpV5scBLI
 KOpaFWXohwF5MEBtwyxd9rGU5q+m/ZuKJIKKG7ZCFPA3jukVgVxlasl4MRS2kYdkC5eL
 i/W9jo06hipcSogEYgfxmGMnHNCCs3Mgch7iRTBQuiH0e45RuJIMC60n14HBnKJbIZ6l
 rGNRSViSI513wxfJmsNr/OpL3R1URlyYkIMhweYI+F6n3aIArpNhJVBipQTQyn3y4Y97
 ZPmGATQTiPQQv6US/o93myFDDV9LQVQym6zG2Sv425sgUBa0dVqnvfw90Q244A96VsAI
 HoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k3PqPWgkCdQpcvN9mh4Lbdzlb+fHp/hC+2OmIk4EUA8=;
 b=ccISN8lQ8dqdANb1CFlD5nSCCkEhlaF9TyIJBe7NMbHEnPVTW68UHvfWpe0et/vldX
 hw+Dsm431mszdssQEH0Ga1XutgEmUnWg3cSJLUPzWz2rTuG8srws9IqFSPWyP8wodaXv
 Bx4G+wIvZfWWZ7coOeK4cVaUFlxhfRCsCqCxODBewkzbC6TS8hftiw1EXTReoB43cEGQ
 siulpupgq+/wYaozJ4daU9j2egG9GSV2wYCJrsi/NpQviARc8EsXin9gTQ7CJ5zfmPxZ
 SaqNd4RrkexoqJQStIKjG/w03qXVzVU47Zkh6e4XdGWjZPADaVANbFxdwzpCNS6rw/Jl
 TrLg==
X-Gm-Message-State: AOAM530/lvmV4Z643npyl5aHHbwvitjZ0tx8HSQaNvsveoYQUFmUb/jR
 j58UwfdzXREupRuaHNqA5RFXwcrIA+0=
X-Google-Smtp-Source: ABdhPJzfCRYB98VDZB6GBtElf1665OgSsOrvbtnmeaFYA9x7RH8S+KgeN7wOxM92kKo78ojdbELEwA==
X-Received: by 2002:a92:c6c4:: with SMTP id v4mr16642051ilm.143.1643775077080; 
 Tue, 01 Feb 2022 20:11:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id g7sm3936245ild.23.2022.02.01.20.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 20:11:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 21:11:15 -0700
Message-Id: <20220202041115.2198598-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to version
 3.0.7
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index a21baf46e5..1e56e878a1 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  2f5fad6c8e99ac2562ab08ad9e45b195  pyparsing-3.0.6.tar.gz
-sha256  d9bdec0013ef1eb5a84ab39a3b3868911598afa494f5faa038647101504e2b81  pyparsing-3.0.6.tar.gz
+md5  9d38774991175444e21a3dfa865876cc  pyparsing-3.0.7.tar.gz
+sha256  18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea  pyparsing-3.0.7.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index b6ab353a6d..e33541bdb7 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.0.6
+PYTHON_PYPARSING_VERSION = 3.0.7
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/ab/61/1a1613e3dcca483a7aa9d446cb4614e6425eb853b90db131c305bd9674cb
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/d6/60/9bed18f43275b34198eb9720d4c1238c68b3755620d20df0afd89424d32b
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
