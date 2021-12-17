Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED08C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 736E7400CC;
	Fri, 17 Dec 2021 21:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6UB4DQhzzL8; Fri, 17 Dec 2021 21:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64C6E40C31;
	Fri, 17 Dec 2021 21:22:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1ADE61BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16C7D60C13
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qQ51OdM_kcd6 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:22:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13BD560B6E
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:22:18 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id o13so6355564wrs.12
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 13:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ruJI2ieyAtPgeoebWgi3Nml4xTJvtwVGmevXAGuHaZE=;
 b=J0zD9lTmiQxotELD9ZwxT8j4FNFj98AwzkSli4Iei985MxCROpV9DD7pQHa/BOlxVV
 veon6uc57Ismktyqbe+4cwpOJvFzRMwHRmgu1XlNI95HLSXPdMIQ32AZwFUXhKOyINNy
 HzmkFUTlS00lI51/RiHuulAcXeDz7QTn/GmeLE/V6SxPtHyvF55u95+3N8M41G3MXsXo
 Ly4HQUNlOvpQpXf+ohjr6ovOUlV5HKiYF/1LzY1lH561ShCWHVRktmQuIS/jdLWTzaZ8
 qe9uezQorIB64nPlYrQN78pZ3FotNz5LkTrq9zzinS4TWeVf6jqgK1fxrNqFrEhD6iBi
 xzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ruJI2ieyAtPgeoebWgi3Nml4xTJvtwVGmevXAGuHaZE=;
 b=I3C77ZKM1HghgXKnxYohsHAjjN1BVm7XwNfh5o9Iqo6bRtu1nERo93hXgP4QphSzfK
 uAhjiupJPLPXCdems1fN7QfJke+emQXIPRap12/2J7UxPddadN/DUdWDvQE0DrM0QGoN
 fyl4zX2GiOAMJ9Perek2ombewBRtxq8+k749yxL0WWKQxwXEpTqLJLBNqMq/RPr+kcGC
 dynDipiAOzY+UWHfff2d5KrlQam5DAZZ4CJUbhPbgoLHizBX2sYlMXBWlGMHLzJCT0NU
 6EtoDeAkotRAT8oJS6ibv6HfO1nGk0rWEa5WcMmE3/m9Se9dsP15qyE9VYv06GUHimmo
 KpqQ==
X-Gm-Message-State: AOAM532R1lK55Ug1m9aonwMNRMpN0GhqNA11SCrJHYH9h2R6bqTOZJKH
 BAZAe+qYm8y/RBomFTdX2SHk5RuT4rqgfg==
X-Google-Smtp-Source: ABdhPJypklv73SqPs1opLYJYqQYynmDrRmh5jtjNtRUeJaqFSo4dm7VZEQHPyVBP85Rqtt7zjYn7rg==
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr1705186wrz.513.1639776136173; 
 Fri, 17 Dec 2021 13:22:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id q14sm5610938wro.58.2021.12.17.13.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 13:22:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:21:45 +0100
Message-Id: <20211217212145.99516-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/modsecurity2: security bump to
 version 2.9.5
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2021-42717: ModSecurity 3.x through 3.0.5 mishandles
  excessively nested JSON objects. Crafted JSON objects with nesting
  tens-of-thousands deep could result in the web server being unable to
  service legitimate requests. Even a moderately large (e.g., 300KB)
  HTTP request can occupy one of the limited NGINX worker processes for
  minutes and consume almost all of the available CPU on the machine.
  Modsecurity 2 is similarly vulnerable: the affected versions include
  2.8.0 through 2.9.4.
- Use official tarball and so drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/modsecurity2/modsecurity2.hash | 4 +++-
 package/modsecurity2/modsecurity2.mk   | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/modsecurity2/modsecurity2.hash b/package/modsecurity2/modsecurity2.hash
index 1501b5642e..a19f4823a8 100644
--- a/package/modsecurity2/modsecurity2.hash
+++ b/package/modsecurity2/modsecurity2.hash
@@ -1,3 +1,5 @@
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v2.9.5/modsecurity-2.9.5.tar.gz.sha256
+sha256  e2bfc8cd8b8de1e21f054d310543373ea5d89adbd96784e832be0da3e4dc149e  modsecurity-2.9.5.tar.gz
+
 # Locally computed
-sha256  686695c650449a338757711254ea78c67dedb1d258e03e5c8686f869388fff8c  modsecurity2-2.9.4.tar.gz
 sha256  2c564f5a67e49e74c80e5a7dcacd1904e7408f1fd6a95218b38c04f012d94cb9  LICENSE
diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index 5d91818ade..a1ad8fe5bc 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-MODSECURITY2_VERSION = 2.9.4
-MODSECURITY2_SITE = $(call github,SpiderLabs,ModSecurity,v$(MODSECURITY2_VERSION))
+MODSECURITY2_VERSION = 2.9.5
+MODSECURITY2_SOURCE = modsecurity-$(MODSECURITY2_VERSION).tar.gz
+MODSECURITY2_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
 MODSECURITY2_LICENSE = Apache-2.0
 MODSECURITY2_LICENSE_FILES = LICENSE
 MODSECURITY2_CPE_ID_VENDOR = trustwave
 MODSECURITY2_CPE_ID_PRODUCT = modsecurity
 MODSECURITY2_INSTALL_STAGING = YES
 MODSECURITY2_DEPENDENCIES = apache libxml2 pcre
-MODSECURITY2_AUTORECONF = YES
 
 MODSECURITY2_CONF_OPTS = \
 	--with-pcre=$(STAGING_DIR)/usr/bin/pcre-config \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
