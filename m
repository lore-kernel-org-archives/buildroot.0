Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559B5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C1F440A38;
	Wed, 26 Jan 2022 21:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSICRl1P87U0; Wed, 26 Jan 2022 21:19:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E00D0409F5;
	Wed, 26 Jan 2022 21:19:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B357F1BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0F65409F5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3ueoeUiJPZ0 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:19:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C4F7403A4
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:19:33 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a13so1176616wrh.9
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 13:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7ALtjrp6yUSfOLTTA6xD+r66hUoTob9YXNERzpevmA=;
 b=CpQQ0+8rjkwiVNpwQoUfH6nZa4EgI0/z410tHkLleJ+WGVNQ/9+2Ap2y00noDnUeSq
 lWkUsGqaFkobuQZaTjSoi3GWFs9tn/beRVd1dFQ5M+Uh9aygjWC3FS5lGyjmi+AxuWER
 +ry8MqKlACM4xzYZNxtSRcQrbiiB8NPrWeXSAZ1qHcU7AITyAHw0hS2TKE9lSUyYnGmw
 cN4MEAEjfJ+MdheNSaR4L93IY0grFVxCtzEc29mvKO9ANH/e1vDa9UeEQmZzC07I52WW
 aC33qpa4NLEgl5bjMRWmRNHTH63fmzThmmDz+3yLjJ9kU8fAGAeJgB27H3ceYns1rKtJ
 WAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7ALtjrp6yUSfOLTTA6xD+r66hUoTob9YXNERzpevmA=;
 b=R5gnT5/u3z08fL9dKSFCR4HeiINkeWCoFh+DFmPHgqWcy4SGxErWlK0wEjVSXTbSuJ
 QC3LV4SMDaG8EKAMRonMPIgcZw0jVQLx98suiVj4Wcedzl/adVcnc3X6LfIYsSjlOtDV
 l/trbRUIad/ALOwLXGpfwpjo6lD5Q2SAAbCttkUjOPevcGxV+ipt4bKqB8UNa4oekQP1
 SK6DxCKyNddXSIEhOQHtGsWsaBz5exhzlxbUapyH3Q9sL3jn3I8558jxAzgnNj/oPnG5
 FcNxlHki8XpCLILHMeqs2HrJ9mx+7XciLESpRo9rbZtKlFr8jhn5nixlsaSQ6jVJQEdk
 HgvQ==
X-Gm-Message-State: AOAM533I0ToRMPWRQXRmuzGcNnqH3/NenFJPeAPabaoVijBQSBcxglf4
 +Y0CoESnW7e41r57S3gBLIjorxUTaiY=
X-Google-Smtp-Source: ABdhPJzds6sU7Tu27zHVx4J8Zk49YB1WeqsauhT54H+L1+vawpVCOS10u3JFRkV2FviXyuz0QkrWgw==
X-Received: by 2002:a05:6000:3ce:: with SMTP id
 b14mr446133wrg.118.1643231971777; 
 Wed, 26 Jan 2022 13:19:31 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id o3sm339963wrq.70.2022.01.26.13.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:19:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:17:49 +0100
Message-Id: <20220126211749.1550932-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lighttpd: add pgsql support
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lighttpd/Config.in   | 10 ++++++++++
 package/lighttpd/lighttpd.mk |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index eb8ab480a0..57bb756603 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -86,6 +86,16 @@ config BR2_PACKAGE_LIGHTTPD_PCRE
 	help
 	  Enable PCRE support. Needed to support mod_rewrite
 
+config BR2_PACKAGE_LIGHTTPD_PGSQL
+	bool "pgsql support"
+	depends on BR2_USE_MMU # postgresql
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  Enable postgres support for lighttpd mod_vhostdb_pgsql.
+
+comment "pgsql support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_LIGHTTPD_WEBDAV
 	bool "webdav support"
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 90b4ba0a72..595c59cb37 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -22,7 +22,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_nettle=false \
 	-Dwith_nss=false \
 	-Dwith_pcre=false \
-	-Dwith_pgsql=false \
 	-Dwith_sasl=false \
 	-Dwith_wolfssl=false \
 	-Dwith_xattr=false \
@@ -101,6 +100,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_pcre2=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_PGSQL),y)
+LIGHTTPD_DEPENDENCIES += postgresql
+LIGHTTPD_CONF_OPTS += -Dwith_pgsql=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_pgsql=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
 LIGHTTPD_DEPENDENCIES += libxml2 sqlite
 LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=true
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
