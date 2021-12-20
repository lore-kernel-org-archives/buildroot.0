Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC266C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 583DB825E8;
	Mon, 20 Dec 2021 22:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBCcLPW8vWG1; Mon, 20 Dec 2021 22:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B50F18246F;
	Mon, 20 Dec 2021 22:03:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27B531BF2A2
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12AE68246F
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WPpYhWOLO9qG for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:03:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 078EB82451
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:03:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r17so22509539wrc.3
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/UgOqoENMpcCiWfOm3dMHq5a+vEo/CI1ByVauHTOIaI=;
 b=h6G4EmvZ0pLk14z/sOFEMkDEtxKb2wjZkWA0MkC1nki4owU2BnufxAlf/2HoebxNJk
 1GaAFFn5ugQJ0awKxiySEIOI2EFzWmHJyN5vrltMRRIUIUXb5zQv/9Urfo/Z2x/G7F7t
 Mdzw4euxtWQwM2urYl2z6P1VPxG9sRmGLQtRcXxGp+cA6MQnATSv79XK5fPl8a9OJBpM
 LG8DCovBe/sbozjDQG448T+xRLJr9ZD8ExUlCPON7PySBYB3NUNi5KCheK7DjOtnjL/R
 Ksn+suoIemfr1NckHtUNc0Dx/z40/cIiJEczCfi+MiQ3CDLbF7QfzC23fzccZXsFsQ6k
 O7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/UgOqoENMpcCiWfOm3dMHq5a+vEo/CI1ByVauHTOIaI=;
 b=vALpkB1Bm2jpEfxTKHohRAgAtkO1YwaGRrJxFO6CPjV5up0yA6AsDG3aip8g5O/oCo
 ZqT80PduZxJceLniXLKsfufnjuuD2c0nCkXpsN0MlCigrp/pKdT5ckgY7+wRKVxeofG/
 377Oia6SoQxyt8WkltCn2JXoBIaz8BRkTMN8AQrTVelICiteDzqtnr2sRgAaweQMONOx
 tAdlWvd70k+4m7PP/lsdxsoYsCKTWhS7Y9kogl7oc23Cq8guyFvL6NWZg9WopQFLoXfJ
 fr3wxq6PUSGvbycRa5HlX+VtdtXn2EBbhH5kQ4Nr40KR4+Km6PUfxgi4Yq0Ch28O+ovE
 KYaA==
X-Gm-Message-State: AOAM531Jzsvn5yJXQO/uKh2dOXRfdUaelD2FQl26WLL2ba9Rzya6ZM23
 rEcLqavRljFYJwwaKIqSmlpr6aXZKoqinQ==
X-Google-Smtp-Source: ABdhPJwI9WV2ZJYnqTKMArSSGdqpBoVWC8X+/iF0vYCrCM2qrJVJUceQHgOMzclv1dUuN5IG2vaKkA==
X-Received: by 2002:a05:6000:184e:: with SMTP id
 c14mr101353wri.265.1640037804039; 
 Mon, 20 Dec 2021 14:03:24 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id p21sm541203wmq.20.2021.12.20.14.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 14:03:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 23:02:46 +0100
Message-Id: <20211220220246.2896270-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boost: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on musl raised since bump to version
1.78.0 in commit ebef6189141c0070730fce46c1305c030d4cad44:

In file included from libs/log/src/permissions.cpp:18:
./boost/interprocess/permissions.hpp:73:14: error: 'mode_t' in namespace '::' does not name a type
   73 |    typedef ::mode_t    os_permissions_type;
      |              ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ca22263cef24b0240f7e5c374c0aeebb01ecc63e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...stat-h-include-on-musl-based-systems.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch

diff --git a/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch b/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch
new file mode 100644
index 0000000000..9b86b816bf
--- /dev/null
+++ b/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch
@@ -0,0 +1,31 @@
+From de657e01635306085488290ea83de541ec393f8b Mon Sep 17 00:00:00 2001
+From: Leonardo Neumann <leonardo@neumann.dev.br>
+Date: Mon, 13 Dec 2021 01:07:20 -0300
+Subject: [PATCH] Fix missing sys/stat.h include on musl-based systems
+
+Boost 1.78.0 fails to build on musl-based systems because musl does
+not include sys/stat.h by default.
+
+Fixes #161 ("Boost compiler error")
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/boostorg/interprocess/pull/162]
+---
+ include/boost/interprocess/permissions.hpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/boost/interprocess/permissions.hpp b/boost/interprocess/permissions.hpp
+index ab55411e..0b21a685 100644
+--- a/boost/interprocess/permissions.hpp
++++ b/boost/interprocess/permissions.hpp
+@@ -29,6 +29,10 @@
+ 
+ #include <boost/interprocess/detail/win32_api.hpp>
+ 
++#else
++
++#include <sys/stat.h>
++
+ #endif
+ 
+ #endif   //#ifndef BOOST_INTERPROCESS_DOXYGEN_INVOKED
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
