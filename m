Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2531AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 23:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98B8760E40;
	Mon, 21 Feb 2022 23:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nc2PvZCgmUen; Mon, 21 Feb 2022 23:08:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C284160C2E;
	Mon, 21 Feb 2022 23:08:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A01E1BF97F
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 23:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 471E4400E3
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 23:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2hL0KC5Gljx for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 23:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEED8400D6
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 23:08:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v12so29586106wrv.2
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 15:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tWnRlI/shwAVCLXxzmR5tiKjha56kq4vPO405FmvhHc=;
 b=KZGaofAmJy62vAj3arvBbYV4N1/oSx577uselArkrfzY/aaABREgaNX8jQVINGwhVl
 EvPHoDBrPDSiiDrj2UIdj24m0Hx/E8ZS6fku0Ecvbqn5ri6/y3+LYLdh+ENiMpeyqnXK
 nmYXX5kWCPgnohSjRUUhig+ZC61Yt7rTgzQuLy8som6mUOF8zz+3iIzFlLZE2RQZErpY
 n2ccRwl6EzogPm8D4nojYYQbO6vIM+3qD4Zu59a1+3UAkSfvT6wW4qP9a2Zy0B3fqYie
 O/P/BDxab4219PHWRs0x5NH7c13oOf2zXzinQ+5uueUWRCazFM2hTnZSnrDf3CVkc8AV
 s3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tWnRlI/shwAVCLXxzmR5tiKjha56kq4vPO405FmvhHc=;
 b=51Fk13G5ex19aifIm9Yp++KkosP33XvMrlOFpqrCVEOUVWrYfYduov0EoMoilUQRui
 3HIRzulunjrPW7uym1Jv6SHNtKOSESCzSa5Jxft4JnJ1BnvdH1huS4yPJNDfdIAVvWN5
 aj2MUvopUkoCCUCqLBuaAL5qP8syF8YIx0CC7jVEQTGjbEuFzNXIxSagHRN3sQqRk3Zn
 ODCFrOV3AXhFF96jM8Kthv0IbB/AKVhtBiJx1Voxp5LqdJ8b+O0+1dnDd/WwcB9LdxjW
 r1HIKGeazeg5E2WHo1JEcHQEzlHSdp6lECRhsh10vTO7N2hC702d/cUuOUlrZTG8IIEA
 WiXQ==
X-Gm-Message-State: AOAM533csTmDIk7nFVV8SEHBH4E09y+/AbdxSG3LxTPRpNW+s+Y1+dEh
 JkX32Qt7wvZD573aNMqBnhpZmTBWBzc=
X-Google-Smtp-Source: ABdhPJxPqKL2Zy5Wv9rMoQ6Yf8fozCZvvozWl6jNgyzvOMSb7KFeDf4ybLMXitU3pbNtCGLPP8aPuw==
X-Received: by 2002:adf:9f44:0:b0:1e3:1d24:ff9c with SMTP id
 f4-20020adf9f44000000b001e31d24ff9cmr17374125wrg.568.1645484896751; 
 Mon, 21 Feb 2022 15:08:16 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n7sm610107wmd.30.2022.02.21.15.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 15:08:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 00:08:15 +0100
Message-Id: <20220221230815.2203955-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-treq: bump to version 22.2.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- hyperlink is a dependency since version 20.4.0 and
  https://github.com/twisted/treq/commit/5475def96f3ec93075ff95709fec4acd154e6fed
- six is not a dependency since version 21.5.0 and
  https://github.com/twisted/treq/commit/22bdb399a03b0eebaa93023b80d348f584f567d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-treq/Config.in        | 2 +-
 package/python-treq/python-treq.hash | 4 ++--
 package/python-treq/python-treq.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 7c02a35638..5d76a5cdd6 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -3,9 +3,9 @@ config BR2_PACKAGE_PYTHON_TREQ
 	# twisted TLS -> python-{pyopenssl,service-identity}
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED_TLS # runtime
 	help
diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index 288279cbd8..aecf71aad8 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/treq/json
-md5  b75f6c89fd481989a9cfdec8d61a6d84  treq-20.3.0.tar.gz
-sha256  a72d7587d6f81c7a32620b00175825b4334bafbde73d37098d139ac7b11dca98  treq-20.3.0.tar.gz
+md5  43892086d556e7596392134f1e10bdef  treq-22.2.0.tar.gz
+sha256  df757e3f141fc782ede076a604521194ffcb40fa2645cf48e5a37060307f52ec  treq-22.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index 320f57b6f2..57dc50ee74 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 20.3.0
+PYTHON_TREQ_VERSION = 22.2.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/98/09/25064d7224efde9fd51e8865353d516c53306e476eab27ab21fb258cf7d4
+PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/cd/c8/b68ab17d994133baf6edbcb5551ba81e1494bdc6d5e21a9d4f3bc4315140
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
