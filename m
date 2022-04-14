Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E0CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 17:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C54CC60E80;
	Thu, 14 Apr 2022 17:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ouemlvMqZ-Hr; Thu, 14 Apr 2022 17:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9FB960E5E;
	Thu, 14 Apr 2022 17:44:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8FD1BF39C
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 193D3405B4
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 17:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfumrvl4Y4tm for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 17:44:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5102D40124
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 17:44:18 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 074B920C34F4;
 Thu, 14 Apr 2022 10:44:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 074B920C34F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649958257;
 bh=nzFOoYj4ltFNhrbtLIVtbiSYKVeyCjYfHqwaytOoplY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W6FRLAfy/Xw3RZq/0twu2ODxMjXwPHmOuEl3EIIPkh31QghUVOQBX0VdWLciWFwJ0
 N8EZV2OrCqDG/RD/9h9dLflEnFh0mtCUENyx9DThDLmy2gEd/s2oKqgWH2ghLJPtjl
 5tHrSrFICTAPFEK+NgjEQ5Obvp7AO5VACOfKCw7Y=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 18:43:56 +0100
Message-Id: <20220414174358.38059-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414174358.38059-1-flaniel@linux.microsoft.com>
References: <20220414174358.38059-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] nlohmann-json: add new package.
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/nlohmann-json/Config.in          |  7 +++++++
 package/nlohmann-json/nlohmann-json.hash |  3 +++
 package/nlohmann-json/nlohmann-json.mk   | 14 ++++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/nlohmann-json/Config.in
 create mode 100644 package/nlohmann-json/nlohmann-json.hash
 create mode 100644 package/nlohmann-json/nlohmann-json.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ca9decb58f..b997b859ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -969,6 +969,7 @@ F:	package/ipmitool/
 F:	package/odhcploc/
 
 N:	Francis Laniel <flaniel@linux.microsoft.com>
+F:	package/nlohmann-json
 F:	package/pahole/
 F:	package/sysdig/
 F:	package/tbb/
diff --git a/package/Config.in b/package/Config.in
index 24f7af5ea8..46df1b3540 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1700,6 +1700,7 @@ menu "JSON/XML"
 	source "package/libxslt/Config.in"
 	source "package/libyaml/Config.in"
 	source "package/mxml/Config.in"
+	source "package/nlohmann-json/Config.in"
 	source "package/pugixml/Config.in"
 	source "package/rapidjson/Config.in"
 	source "package/rapidxml/Config.in"
diff --git a/package/nlohmann-json/Config.in b/package/nlohmann-json/Config.in
new file mode 100644
index 0000000000..1e63fbc029
--- /dev/null
+++ b/package/nlohmann-json/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NLOHMANN_JSON
+	bool "nlohmann-json"
+	help
+	  nlohmann/json is a header C++ library that allows manipulating JSON
+	  with an intuitive syntax.
+
+	  https://github.com/nlohmann/json
diff --git a/package/nlohmann-json/nlohmann-json.hash b/package/nlohmann-json/nlohmann-json.hash
new file mode 100644
index 0000000000..d69c4daf72
--- /dev/null
+++ b/package/nlohmann-json/nlohmann-json.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  2fd1d207b4669a7843296c41d3b6ac5b23d00dec48dba507ba051d14564aa801  nlohmann-json-v3.3.0.tar.gz
+sha256  7b875bb7a4e28abb7956ea821b4b7d88ff6a2a4fabf261c3993730a365ec56dd  LICENSE.MIT
diff --git a/package/nlohmann-json/nlohmann-json.mk b/package/nlohmann-json/nlohmann-json.mk
new file mode 100644
index 0000000000..0810fe7b61
--- /dev/null
+++ b/package/nlohmann-json/nlohmann-json.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# nlohmann
+#
+################################################################################
+
+NLOHMANN_JSON_VERSION = v3.3.0
+NLOHMANN_JSON_SITE = $(call github,nlohmann,json,$(NLOHMANN_JSON_VERSION))
+NLOHMANN_JSON_LICENSE = MIT
+NLOHMANN_JSON_LICENSE_FILES = LICENSE.MIT
+NLOHMANN_JSON_CPE_ID_VENDOR = json++
+NLOHMANN_JSON_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
