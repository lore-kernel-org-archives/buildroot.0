Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B207C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DADD360BF0;
	Sun, 20 Mar 2022 17:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGf9eE6FCxHP; Sun, 20 Mar 2022 17:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B81EF60AD7;
	Sun, 20 Mar 2022 17:14:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6BC61BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2F25400D9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ceQtxmabvPn for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:14:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67B0640022
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:14:08 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id p9so17906890wra.12
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 10:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D/KXYWwRlq64xvCI275SparN/uQ65HqzdnTIcjvbNRQ=;
 b=q5dY6tTa/Cw9EujAKe5kBxHKI2qcbRczshLLmWaEN9fSlhUCKohRNxcsmx9iCh5bqN
 pdNc/HNQHvZcXJ4TnYa4qbtOfNIqVQfLmPYbapblkW/3Qay0t6NwudBAy0t1869SwhkY
 MOucT0Xg2GcZIyDdo0vlWHmBiLPfF24bDZOlHIOxQeJ78ogBlHd8voy3+zlWytnYbQox
 2Sd2ccM6amxlwQSmqeD1fsIoPZt7uF1Z9JULladNp3Szd1upDRsM3XNnsf0Q5mxUKqi/
 qH+wnRj8ck/T4FFS3g9ZcalljtTzwAiJPsesHRWvcwV38ZnA/Vx0phG6vSoc9lAfUGlj
 WEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D/KXYWwRlq64xvCI275SparN/uQ65HqzdnTIcjvbNRQ=;
 b=3B37qDsbVd3xhslC8Y2lclTY+vAt/n7rO4vBpnXda/GGYrF0QLQAztnaydoVG7SY8x
 38vH8V4JVpPgSkqc1uhM+s/qYqgs0GZm1PYHPKAgWuUhksslcCDAPh1Dom6v5zvkScTq
 C0XlZdW4K5C1ExYHVSS6ytZkMkOAMjfGo8Kl8ziICMex3k9FiyLlKq3IRW39SdNZq7hK
 d9djr2j+CxGVxmwaQrQ4x1kHlO8n7f8ZCKAcP+DKwB5nekEehAXJio1rCLIno6TgJ3pM
 /Y3R8oQPJQutaw2eJDf/HTXEI+EzhGsmgNa9C6YtBK0gkdqpwmhh59H56HXrHsTX/rvi
 5zLg==
X-Gm-Message-State: AOAM531w86EpvsQkfoA+6RGYKtXxTfRZhblt1y+4wLBZbdYZhzA4qpj4
 eU2UoEC6Y7FLU8Fy2OJ1LqbNd0b6L1Q=
X-Google-Smtp-Source: ABdhPJzEMMUChK09rAK69LxnkWkvfpWLHkkRX2OTw8k2vs8zmVYwyJfMZ5nLVNE84yy4XEYAtsaDAg==
X-Received: by 2002:a5d:64ed:0:b0:203:7b40:de5b with SMTP id
 g13-20020a5d64ed000000b002037b40de5bmr15737248wri.253.1647796446303; 
 Sun, 20 Mar 2022 10:14:06 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d59a1000000b00203d83b0ae4sm11520587wrr.109.2022.03.20.10.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:14:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 18:12:59 +0100
Message-Id: <20220320171259.1591428-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/json-glib: bump to version 1.6.6
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

- Update introspection option:
  https://gitlab.gnome.org/GNOME/json-glib/-/commit/461edcc8cd6dc1c4efeb09aaaba02459293546f2
- Disable docs (enabled by default since
  https://gitlab.gnome.org/GNOME/json-glib/-/commit/8d6176451f9d7cd4d6660185c679733aee3b57ea)
- Disable tests (added by:
  https://gitlab.gnome.org/GNOME/json-glib/-/commit/8e835f8ed2299ad68032432eaf6491b2da8d532b)
- Update indentation in hash file (two spaces)

https://gitlab.gnome.org/GNOME/json-glib/-/blob/1.6.6/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/json-glib/json-glib.hash | 6 +++---
 package/json-glib/json-glib.mk   | 9 +++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index b68794db37..680d404a4b 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.4/json-glib-1.4.4.sha256sum
-sha256 720c5f4379513dc11fd97dc75336eb0c0d3338c53128044d9fabec4374f4bc47  json-glib-1.4.4.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.6/json-glib-1.6.6.sha256sum
+sha256  96ec98be7a91f6dde33636720e3da2ff6ecbb90e76ccaa49497f31a6855a490e  json-glib-1.6.6.tar.xz
 
 # Hash for license file:
-sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index accdb4f888..52ca47e906 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-JSON_GLIB_VERSION_MAJOR = 1.4
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).4
+JSON_GLIB_VERSION_MAJOR = 1.6
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
 JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPL-2.1+
 JSON_GLIB_LICENSE_FILES = COPYING
 JSON_GLIB_INSTALL_STAGING = YES
+JSON_GLIB_CONF_OPTS = -Dgtk_doc=disabled -Dtests=false
 
 JSON_GLIB_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
@@ -18,10 +19,10 @@ JSON_GLIB_DEPENDENCIES = \
 	libglib2
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-JSON_GLIB_CONF_OPTS += -Dintrospection=true
+JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
 JSON_GLIB_DEPENDENCIES += gobject-introspection
 else
-JSON_GLIB_CONF_OPTS += -Dintrospection=false
+JSON_GLIB_CONF_OPTS += -Dintrospection=disabled
 endif
 
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
