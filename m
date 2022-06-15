Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AF5CCA473
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 21:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 259444186D;
	Wed, 15 Jun 2022 21:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5V2BHXINr5kD; Wed, 15 Jun 2022 21:20:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D50B541767;
	Wed, 15 Jun 2022 21:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD7281BF3DC
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 21:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA23A818A2
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 21:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oK2j9K4YJIZK for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 21:20:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D21E08177C
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 21:20:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c21so16994675wrb.1
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 14:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJYUXJud5tC5XiSW3QVJ3aG9vVvchBU18gFXA02eXrM=;
 b=apVP/EKqyihx4Ig6iixP7c4cYVVDei0BTP/bfT4+qE/x/wctuIhfNjN7wFCNsnHMVs
 /hmSCHVj29PnmdXfLu2D88815h8kzBzi+FWUI7oUOaSWV+mz3p2el9KLCSmQ291jxsKD
 4hfEMohmt6kfyLUevEU/GJ/wS5urD7NOsdXJHKawUxyEaufjbRsjXk7yycrjY+MLtNpj
 Yv09D7J01pAc9u8lifPqWpczXvGlL6wPZXVMqqNgjLSxV5QMsoUS0BKTlPUBRy40Ivh6
 ChuGbz2KuU3CAYragbXGuPUct4wCn12ZVg6bnWHV4Gr1cSYA7zjra+HO55vUPl90Nqjf
 8gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJYUXJud5tC5XiSW3QVJ3aG9vVvchBU18gFXA02eXrM=;
 b=3kqMN0agX7am9Ds8I7GoENFsMBqffHGXyRTYNmNqMUBNxSVJDm78VFqEHJ/j9P7dqt
 dKEl+DhLj2v0tObxTpLKIsNXMKXBV+JLcwf2PNdMQRyE7geB0QlhopykVKQu4mlkLL2L
 XrgnLCh451m3B7EnSQ6jVK7RbNgucb/EPRwFMHfDEfPkMg3RqJlwT9/sZp36rjBPVUi4
 43MQNu4FH7pIR6cbQhytU9yFRhp7X7SFWClO7+l+XpTGkbcrSrifBgCZo0YBWYdXhAFG
 btA9FzZHBbc9KSM1AYnHYwf2l4m6V8n2R7315rLC47md+n/VpeaDAwoV/a/2GepQ8+i9
 qBTA==
X-Gm-Message-State: AJIora/OrpHI1cXE/0Lg4bPNClMnJohlY8f0t65W7wBC1dr1JkGwXp7B
 yDJHdGghHsccFKngfUVaiQ/oYUOmu24=
X-Google-Smtp-Source: AGRyM1tyjveLMQvLPLMm3Tplrj1N6qGtvx5F/AUT7PlyiO3g6P5u8ZrUimYIZSfLVTeEkbn35AQvTw==
X-Received: by 2002:a5d:648a:0:b0:217:3552:eb2d with SMTP id
 o10-20020a5d648a000000b002173552eb2dmr1653237wri.78.1655328035883; 
 Wed, 15 Jun 2022 14:20:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a5d5187000000b0021033caa332sm37984wrv.42.2022.06.15.14.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 14:20:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Jun 2022 23:17:51 +0200
Message-Id: <20220615211751.121459-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-xmltodict: bump to version
 0.13.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/martinblech/xmltodict/blob/v0.13.0/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-xmltodict/python-xmltodict.hash | 6 +++---
 package/python-xmltodict/python-xmltodict.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xmltodict/python-xmltodict.hash b/package/python-xmltodict/python-xmltodict.hash
index 16422d78c9..48fb5265f6 100644
--- a/package/python-xmltodict/python-xmltodict.hash
+++ b/package/python-xmltodict/python-xmltodict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xmltodict/json
-md5	ddb2bd078cef4f7e3021a578034ad941  xmltodict-0.12.0.tar.gz
-sha256	50d8c638ed7ecb88d90561beedbf720c9b4e851a9fa6c47ebd64e99d166d8a21  xmltodict-0.12.0.tar.gz
+md5  1ece0a5bbd494bac414058405606475e  xmltodict-0.13.0.tar.gz
+sha256  341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d037e56  xmltodict-0.13.0.tar.gz
 # Locally computed sha256 checksums
-sha256	d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
+sha256  d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
diff --git a/package/python-xmltodict/python-xmltodict.mk b/package/python-xmltodict/python-xmltodict.mk
index 05be4b3c6c..9201bc1507 100644
--- a/package/python-xmltodict/python-xmltodict.mk
+++ b/package/python-xmltodict/python-xmltodict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XMLTODICT_VERSION = 0.12.0
+PYTHON_XMLTODICT_VERSION = 0.13.0
 PYTHON_XMLTODICT_SOURCE = xmltodict-$(PYTHON_XMLTODICT_VERSION).tar.gz
-PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/58/40/0d783e14112e064127063fbf5d1fe1351723e5dfe9d6daad346a305f6c49
+PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/39/0d/40df5be1e684bbaecdb9d1e0e40d5d482465de6b00cbb92b84ee5d243c7f
 PYTHON_XMLTODICT_SETUP_TYPE = setuptools
 PYTHON_XMLTODICT_LICENSE = MIT
 PYTHON_XMLTODICT_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
