Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F6EC433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 15:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA9068481C;
	Thu, 17 Mar 2022 15:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IjsNoPFQ0VOX; Thu, 17 Mar 2022 15:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB70F8481A;
	Thu, 17 Mar 2022 15:55:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A395F1BF25F
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 15:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9258141599
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 15:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UM-oPI03cP8A for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 15:55:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5781340474
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 15:55:40 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id h1so7096092edj.1
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/81fZTDKe75+muW/hRvKYsI4HQCArv52AZ6BZZSLP6Y=;
 b=JFblJkF1hI30+glsfJGeJo9Mrorl08raHZv8gyFriaA/QQn5AoHM0PZx92zo8B4l3j
 QzkrZ2/2sjpD4Qt1yjkzaOhazrdx/OHwPjCbDTk7LMYtyEq7aYKekAZKk0ZT2hl6r3LK
 iSGuaRWMBnMmfFlKO5BB5JomdktTgsSIgaX/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/81fZTDKe75+muW/hRvKYsI4HQCArv52AZ6BZZSLP6Y=;
 b=rOJrxXUEZsGXohIimtyDOLTHmlg9erK9QzHFEfKseW+SYW1OQeJNjef1gVP/ITvFrT
 cOfHwEW6l1YApGIgAp0cXEdpzPXH0cqFtCd+k1W2CBBhm2iwMD5M7kNOb1rq7bzmrNLI
 yx7ExiR65wxBCXAcSvDbeXJWbXDUxVU0Jvt683KWJ2FJFCkDEEC2Pq7QkvBuhH/tSdOl
 UZWfDZoDb07fI7INjX5p4NSrssSjgCVugHAIcVMBV2SE0FMGikKv7OjIET61kDD0Kjxz
 yCBrGDhx+cw8yO1wsVU53E8TkYzbAQLn6520GfL0fCiN8hUPgg6X+I5CudCtDYy44Qpz
 htVg==
X-Gm-Message-State: AOAM530tUPEaZAHcsMYaqLIcZ2fcT0vUNQpi+QdwS1u8pK8cD7tMwF8Q
 UzdMEkXVfT1LzgD4yA9i6utqloKWviMrlQ==
X-Google-Smtp-Source: ABdhPJzpz69pM1luKloyx2bFAIs7+mO3OHTeCHwIeKFZin1fYRYgTmjaCDdry/LdfIIfuDZCj9H8lg==
X-Received: by 2002:a05:6402:4307:b0:418:edb3:9f78 with SMTP id
 m7-20020a056402430700b00418edb39f78mr5247646edc.294.1647532538153; 
 Thu, 17 Mar 2022 08:55:38 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host185127038042.static.fidoka.tech. [185.127.38.42])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170906780400b006ce69ff6050sm2532292ejm.69.2022.03.17.08.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 08:55:37 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 16:55:33 +0100
Message-Id: <20220317155533.1906663-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libdill: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libdill is a C library that makes writing structured concurrent programs
easy.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libdill/Config.in    |  8 ++++++++
 package/libdill/libdill.hash |  3 +++
 package/libdill/libdill.mk   | 16 ++++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/libdill/Config.in
 create mode 100644 package/libdill/libdill.hash
 create mode 100644 package/libdill/libdill.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 70d71186ed..9410944584 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -167,6 +167,7 @@ F:	package/i2c-tools/
 F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
+F:	package/libdill/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
diff --git a/package/Config.in b/package/Config.in
index 0d5d763180..47f84a08dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1968,6 +1968,7 @@ menu "Other"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
+	source "package/libdill/Config.in"
 	source "package/libeastl/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
diff --git a/package/libdill/Config.in b/package/libdill/Config.in
new file mode 100644
index 0000000000..17bec04db7
--- /dev/null
+++ b/package/libdill/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBDILL
+	bool "libdill"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Libdill is a C library that makes writing structured concurrent
+	  programs easy.
+
+	  http://libdill.org
diff --git a/package/libdill/libdill.hash b/package/libdill/libdill.hash
new file mode 100644
index 0000000000..4a1fb91a57
--- /dev/null
+++ b/package/libdill/libdill.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  6df7527e8f1e91f5106c21c5bfeaa69eee470bec476c74585143e3e439864404  libdill-fa01648cf2a8d06e53c965b45eeacfb3ac57bd04.tar.gz
+sha256  3f78d9c42c8919cb6dc63e51de17b9eb40a49d9cdd876ce59e77392721e8c2c6  COPYING
diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
new file mode 100644
index 0000000000..036c73f33a
--- /dev/null
+++ b/package/libdill/libdill.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libdill
+#
+################################################################################
+
+LIBDILL_VERSION = fa01648cf2a8d06e53c965b45eeacfb3ac57bd04
+LIBDILL_SITE = $(call github,sustrik,libdill,$(LIBDILL_VERSION))
+LIBDILL_LICENSE = MIT
+LIBDILL_LICENSE_FILES = COPYING
+LIBDILL_CPE_ID_VENDOR = libdill
+LIBDILL_CPE_ID_PRODUCT = libdill
+LIBDILL_DEPENDENCIES = openssl
+LIBDILL_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
