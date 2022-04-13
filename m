Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2374EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 16:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 559A684011;
	Wed, 13 Apr 2022 16:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9iKbijlgDP4P; Wed, 13 Apr 2022 16:27:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4140784001;
	Wed, 13 Apr 2022 16:27:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A65251BF9A4
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 16:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1FB6417DA
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 16:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mi5rRx-RG42a for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 16:27:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24AAE417D3
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 16:27:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r13so3388532wrr.9
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 09:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yvaSDsGakqbUTAuPNwwYOCPsFQ65qR52pfGAF66EER0=;
 b=S0DZ2T8mBTPeX1LiuxfHQtWYCkHGjHCI0q6ajkL+Ucvi9fm2CpVext3rF7teCcCxXt
 UyI/qu4Ewf8yQroIjtQmOxuI7WpUEhYoYEM16NsatL7qRKGe1sqpQa8SkU5jzzs7UTaf
 lrI27O1/1M5Co+vTt5gj4cKniuu9OZ7tiHWXcdh5YoBY76W5MALfMzPztnDEG9hoH/RF
 w+lw0SPYM/iv3zcb7ztb+z7dXW92nf5j5E347sz6r+XEnAxvs3Ail7FhyFTqsCtSBE3I
 Bv5ztNNxLdWHQAASySZrYbxxHcImS51+4SH+1aXI0p2xztWg4vhmMvE9vhJirlC/qQds
 39Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yvaSDsGakqbUTAuPNwwYOCPsFQ65qR52pfGAF66EER0=;
 b=CJ1fm3SzrRrMOzKYpX91xp1lkcziGwlTLThp0ZhniKrq31SB6hoqHaj5pEmdIG9SYA
 sQwm8EEVTcx+AbpwQ0w6fI34/VBmTt76Z49VblVagfLr9w3d5BIARZZiDMmOAKpfjwm6
 yb8JXPB0jzFWX0EOiapJKouosboRvsNPir+uU41YH2+QQDdhk0AXAyC3CQZFFG0qxHs3
 MidS4vxzcV+vW2sgCGZOfMsgh22j9dBoEPgLdNYu/r4IAJACPvvpYYgx8uM66dIk5jqW
 Dj/28NqhGn/A5Soa2U2NbCzr4Y/rRX2QfWZAhxofhxLsKB2+lNhmKmX9Mnm3SOYmXFYD
 0HWQ==
X-Gm-Message-State: AOAM530RZ4NLf1SVr5SwivGNRvnsmdzEkH6GAKxwZoI8KROXwWUZYVPQ
 SmMSMu1G8kEi+T+3E2T/idNf1JzUIKs=
X-Google-Smtp-Source: ABdhPJwvCjKz8on3LVh5xjN51adAwc1PUekO1ubpbGR1aAyepCIGS7RB0B4G422c3aq4WQT/670fLA==
X-Received: by 2002:adf:eed0:0:b0:207:9b35:62c4 with SMTP id
 a16-20020adfeed0000000b002079b3562c4mr18625346wrp.509.1649867245978; 
 Wed, 13 Apr 2022 09:27:25 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a5d4247000000b00207a281b2f4sm9950633wrr.110.2022.04.13.09.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 09:27:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 18:25:20 +0200
Message-Id: <20220413162520.594048-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liboping: fix build with gcc >= 7
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

Replace first patch (which is not in master after nearly 4 years) with
a new set of pending patches to fix the following build failure with
gcc >= 7:

liboping.c: In function 'ping_set_ttl':
liboping.c:207:9: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
  207 |    "%s: %s", function, message);
      |         ^~
......
  829 |      sstrerror (ret, errbuf, sizeof (errbuf)));
      |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into a destination of size 256
  206 |  snprintf (obj->errmsg, sizeof (obj->errmsg),
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  207 |    "%s: %s", function, message);
      |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/31083354e9064b2deef86917d67e92a88af0fa46

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...port.patch => 0001-fix-utf8-support.patch} |  0
 ...to-make-GCC-s-truncation-check-happy.patch | 31 ------------------
 ...when-adding-hosts-not-when-doing-th.patch} |  0
 ...-GCC-7-buffer-overflow-with-snprintf.patch | 28 ++++++++++++++++
 .../0004-Fix-compile-error-on-GCC-7.patch     | 32 +++++++++++++++++++
 5 files changed, 60 insertions(+), 31 deletions(-)
 rename package/liboping/{0002-fix-utf8-support.patch => 0001-fix-utf8-support.patch} (100%)
 delete mode 100644 package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch
 rename package/liboping/{0003-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch => 0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch} (100%)
 create mode 100644 package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch
 create mode 100644 package/liboping/0004-Fix-compile-error-on-GCC-7.patch

diff --git a/package/liboping/0002-fix-utf8-support.patch b/package/liboping/0001-fix-utf8-support.patch
similarity index 100%
rename from package/liboping/0002-fix-utf8-support.patch
rename to package/liboping/0001-fix-utf8-support.patch
diff --git a/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch b/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch
deleted file mode 100644
index b0aca8a715..0000000000
--- a/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 18ca43507b351f339ff23062541ee8d58e813a53 Mon Sep 17 00:00:00 2001
-From: Florian Forster <ff@octo.it>
-Date: Sun, 29 Jul 2018 14:34:19 +0200
-Subject: [PATCH] ping_host_add: Decrease buffer size to make GCC's truncation
- check happy.
-
-Fixes: #38
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/octo/liboping/commit/18ca43507b351f339ff23062541ee8d58e813a53]
----
- src/liboping.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/src/liboping.c b/src/liboping.c
-index 5253e8c..2470988 100644
---- a/src/liboping.c
-+++ b/src/liboping.c
-@@ -1636,10 +1636,8 @@ int ping_host_add (pingobj_t *obj, const char *host)
- 		}
- 		else
- 		{
--			char errmsg[PING_ERRMSG_LEN];
--
--			snprintf (errmsg, PING_ERRMSG_LEN, "Unknown `ai_family': %i", ai_ptr->ai_family);
--			errmsg[PING_ERRMSG_LEN - 1] = '\0';
-+			char errmsg[64];
-+			snprintf (errmsg, sizeof(errmsg), "Unknown `ai_family': %d", ai_ptr->ai_family);
- 
- 			dprintf ("%s", errmsg);
- 			ping_set_error (obj, "getaddrinfo", errmsg);
diff --git a/package/liboping/0003-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch b/package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
similarity index 100%
rename from package/liboping/0003-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
rename to package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
diff --git a/package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch b/package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch
new file mode 100644
index 0000000000..546f159187
--- /dev/null
+++ b/package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch
@@ -0,0 +1,28 @@
+From 0ad9ee080a7cd8037c341067cc67a84e32e69fea Mon Sep 17 00:00:00 2001
+From: Maurice Smulders <Maurice.Smulders@windtalker.com>
+Date: Thu, 30 Dec 2021 10:45:42 -0700
+Subject: [PATCH] Fix compile break with GCC 7+ - buffer overflow with snprintf
+
+[Retrieved from:
+https://github.com/octo/liboping/pull/64/commits/0ad9ee080a7cd8037c341067cc67a84e32e69fea]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/liboping.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/liboping.c b/src/liboping.c
+index bf9e059..9fd8f53 100644
+--- a/src/liboping.c
++++ b/src/liboping.c
+@@ -203,8 +203,11 @@ static char *sstrerror (int errnum, char *buf, size_t buflen)
+ static void ping_set_error (pingobj_t *obj, const char *function,
+ 	       	const char *message)
+ {
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-truncation"
+ 	snprintf (obj->errmsg, sizeof (obj->errmsg),
+ 			"%s: %s", function, message);
++#pragma GCC diagnostic pop
+ 	obj->errmsg[sizeof (obj->errmsg) - 1] = 0;
+ }
+ 
diff --git a/package/liboping/0004-Fix-compile-error-on-GCC-7.patch b/package/liboping/0004-Fix-compile-error-on-GCC-7.patch
new file mode 100644
index 0000000000..38355be40e
--- /dev/null
+++ b/package/liboping/0004-Fix-compile-error-on-GCC-7.patch
@@ -0,0 +1,32 @@
+From 3d685bdb1a6c655bce6d36cfd96e084be07cd2b1 Mon Sep 17 00:00:00 2001
+From: Maurice Smulders <Maurice.Smulders@windtalker.com>
+Date: Tue, 4 Jan 2022 12:49:36 -0700
+Subject: [PATCH] Fix compile error on GCC < 7
+
+[Retrieved from:
+https://github.com/octo/liboping/pull/64/commits/3d685bdb1a6c655bce6d36cfd96e084be07cd2b1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/liboping.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/liboping.c b/src/liboping.c
+index 9fd8f53..1ccf609 100644
+--- a/src/liboping.c
++++ b/src/liboping.c
+@@ -203,11 +203,15 @@ static char *sstrerror (int errnum, char *buf, size_t buflen)
+ static void ping_set_error (pingobj_t *obj, const char *function,
+ 	       	const char *message)
+ {
++#if __GNUC__ >= 7
+ #pragma GCC diagnostic push
+ #pragma GCC diagnostic ignored "-Wformat-truncation"
++#endif
+ 	snprintf (obj->errmsg, sizeof (obj->errmsg),
+ 			"%s: %s", function, message);
++#if __GNUC__ >= 7
+ #pragma GCC diagnostic pop
++#endif
+ 	obj->errmsg[sizeof (obj->errmsg) - 1] = 0;
+ }
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
