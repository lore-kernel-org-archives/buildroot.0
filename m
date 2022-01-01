Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A10C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 18:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6878060D4D;
	Sat,  1 Jan 2022 18:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q7T5VxuzqZu1; Sat,  1 Jan 2022 18:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9679860C12;
	Sat,  1 Jan 2022 18:37:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BE111BF2F1
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 18:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43F0660C12
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 18:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rb-zNzgnN7Rz for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 18:37:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E5DB60B3F
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 18:37:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i22so61595173wrb.13
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 10:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BL6BULZZgIZa0UQGTWUBGyUASLU9OQ5vhjzjAzLMFNY=;
 b=RAbkFlWHORxPL0oydiV7sl5EQZkNSyTdtntL6P2dPw1Ayxcv23gTKV/fesupzqhZHd
 mHLo14bhQdlUFZqV+Qt4BmJCJxY6S2LEX0dfMomFbZHX5M8mF7WuwdeqQ26TAiumOQ9W
 92CvAZN5B9lwu2OrywalEO/OOhhyv9dUjUHiFIVINQa2rcI7EU7gRiB4elYyht41+ZZP
 I7DHg4088Uq1E4jSca1souqUzpDr3HUHrgLdNBJ9bCK0Akh1c25PANvKh4QIfmS8vc8U
 GUvcnULmwgXEaly74TZ+oFZ43G5wLI6nlFFborunBWhpK1kHYX4o1375INVlK0TisxdL
 KlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BL6BULZZgIZa0UQGTWUBGyUASLU9OQ5vhjzjAzLMFNY=;
 b=wm6XryyhDYCwQYQiCVeXeiongebYoLjvnX5s2Axe9lLmrOfNa+5WLmKSJFjh+SzU65
 XBeFenR1xOmlbe1G4oX9GMb0cVfhDvvt0kGfXP4lwXaHMEx9oNFo9kwv0wK0ebTlZMK/
 A7uDH7cio4iEORSCWWcfqO4bOYhGDmxuy1fWmw0Vb+iVeyNd58I42Gd5dIly4uYcP4LX
 rBqGs4qFqeha36YQVBDsz0qJVeHhW1iSRywQA8c+TxxyB1WGJRPbdwB90VEawvvnvd48
 gIIe1W5wlIQRojcDjd10LRUDylxxAQ7fkEe4T67dKlsHygUBJcTPIPIkxMfVDLSdL0NB
 /Diw==
X-Gm-Message-State: AOAM532SAZuGPLs91w7X0UMdu/bD4rmPSg8K+Lboeh7SuoQRb0d29DKc
 luqv8aXUzdO0M5Z8dSJpURjWLpKGP8Y=
X-Google-Smtp-Source: ABdhPJwzHqz8p0JuVPIAXGDy8WXA4zPTRlcxE9n7spRsJXdZf/sfQMjz2VJNioeYLqkXD0eWF5wPFQ==
X-Received: by 2002:adf:f08c:: with SMTP id n12mr33055818wro.598.1641062221079; 
 Sat, 01 Jan 2022 10:37:01 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id f16sm40663702wmg.27.2022.01.01.10.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 10:37:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 19:36:12 +0100
Message-Id: <20220101183612.1965455-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: fix static build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure with alsa-utils raised since bump
to version 1.2.6 in commit 4d4a588a504a6446dd0a29a353d94c6e86cfd879:

checking for snd_tplg_new in -latopology... no
configure: error: No linkable libatopology was found.

Fixes:
 - http://autobuild.buildroot.org/results/08d028004090b2a8292f03910cb9bf80a73ac804

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ser.c-drop-duplicate-safe_strtol_bas.patch | 51 +++++++++++
 ...-safe_strto-functions-from-libasound.patch | 88 +++++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100644 package/alsa-lib/0003-src-topology-parser.c-drop-duplicate-safe_strtol_bas.patch
 create mode 100644 package/alsa-lib/0004-conf-fix-the-export-of-safe_strto-functions-from-libasound.patch

diff --git a/package/alsa-lib/0003-src-topology-parser.c-drop-duplicate-safe_strtol_bas.patch b/package/alsa-lib/0003-src-topology-parser.c-drop-duplicate-safe_strtol_bas.patch
new file mode 100644
index 0000000000..a3741c42c0
--- /dev/null
+++ b/package/alsa-lib/0003-src-topology-parser.c-drop-duplicate-safe_strtol_bas.patch
@@ -0,0 +1,51 @@
+From 47252054b4a2d5c8382cb1342f5d4eb89dabf95f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 1 Jan 2022 17:20:47 +0100
+Subject: [PATCH] src/topology/parser.c: drop duplicate safe_strtol_base
+
+The safe_strtol_base() function is defined twice since
+	f547b2e3 ("conf: introduce safe_strtol_base()") and
+	5fab157a ("topology: do not call strtol directly")
+resulting in the following build failure when alsa-utils is built
+statically because safe_strtol_base is defined twice.
+
+Fixes: http://autobuild.buildroot.org/results/08d028004090b2a8292f03910cb9bf80a73ac804
+Fixes: https://github.com/alsa-project/alsa-lib/pull/207
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+[Retrieved from:
+https://github.com/alsa-project/alsa-lib/commit/47252054b4a2d5c8382cb1342f5d4eb89dabf95f]
+---
+ src/topology/parser.c | 19 -------------------
+ 1 file changed, 19 deletions(-)
+
+diff --git a/src/topology/parser.c b/src/topology/parser.c
+index 01c95afa..e70173f6 100644
+--- a/src/topology/parser.c
++++ b/src/topology/parser.c
+@@ -21,25 +21,6 @@
+ #include "list.h"
+ #include "tplg_local.h"
+ 
+-/*
+- * Safe strtol call
+- */
+-int safe_strtol_base(const char *str, long *val, int base)
+-{
+-	char *end;
+-	long v;
+-	if (!*str)
+-		return -EINVAL;
+-	errno = 0;
+-	v = strtol(str, &end, base);
+-	if (errno)
+-		return -errno;
+-	if (*end)
+-		return -EINVAL;
+-	*val = v;
+-	return 0;
+-}
+-
+ /*
+  * Get integer value
+  */
diff --git a/package/alsa-lib/0004-conf-fix-the-export-of-safe_strto-functions-from-libasound.patch b/package/alsa-lib/0004-conf-fix-the-export-of-safe_strto-functions-from-libasound.patch
new file mode 100644
index 0000000000..3dfcb78b5c
--- /dev/null
+++ b/package/alsa-lib/0004-conf-fix-the-export-of-safe_strto-functions-from-libasound.patch
@@ -0,0 +1,88 @@
+From c687c482107f746332dd18f7407f6c6efbffccb2 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Sat, 1 Jan 2022 19:18:25 +0100
+Subject: [PATCH] conf: fix the export of safe_strto* functions from libasound
+
+Only one library should define the safe_strto function. Export it
+correctly and add _snd_ prefix to avoid possible clashes with the other
+application code.
+
+Fixes: 47252054 ("src/topology/parser.c: drop duplicate safe_strtol_base")
+Fixes: https://github.com/alsa-project/alsa-lib/pull/208
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+[Retrieved from:
+https://github.com/alsa-project/alsa-lib/commit/c687c482107f746332dd18f7407f6c6efbffccb2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/local.h | 8 ++++++--
+ src/Versions.in | 6 ++++++
+ src/conf.c      | 6 +++---
+ 3 files changed, 15 insertions(+), 5 deletions(-)
+
+diff --git a/include/local.h b/include/local.h
+index ebc9350c..f64fe9d8 100644
+--- a/include/local.h
++++ b/include/local.h
+@@ -232,10 +232,14 @@ size_t page_align(size_t size);
+ size_t page_size(void);
+ size_t page_ptr(size_t object_offset, size_t object_size, size_t *offset, size_t *mmap_offset);
+ 
+-int safe_strtoll_base(const char *str, long long *val, int base);
++#define safe_strtoll_base _snd_safe_strtoll_base
++int _snd_safe_strtoll_base(const char *str, long long *val, int base);
+ static inline int safe_strtoll(const char *str, long long *val) { return safe_strtoll_base(str, val, 0); }
+-int safe_strtol_base(const char *str, long *val, int base);
++#define safe_strtol_base _snd_safe_strtol_base
++int _snd_safe_strtol_base(const char *str, long *val, int base);
+ static inline int safe_strtol(const char *str, long *val) { return safe_strtol_base(str, val, 0); }
++#define safe_strtod _snd_safe_strtod
++int _snd_safe_strtod(const char *str, double *val);
+ 
+ int snd_send_fd(int sock, void *data, size_t len, int fd);
+ int snd_receive_fd(int sock, void *data, size_t len, int *fd);
+diff --git a/src/Versions.in b/src/Versions.in
+index 5daccbd4..85031b38 100644
+--- a/src/Versions.in
++++ b/src/Versions.in
+@@ -134,3 +134,9 @@ ALSA_1.1.6 {
+ 
+     @SYMBOL_PREFIX@snd_dlopen;
+ } ALSA_0.9.7;
++
++ALSA_1.2.6 {
++  global:
++
++    @SYMBOL_PREFIX@_snd_safe_strto*;
++} ALSA_1.1.6;
+diff --git a/src/conf.c b/src/conf.c
+index d3597cbc..098ebd63 100644
+--- a/src/conf.c
++++ b/src/conf.c
+@@ -663,7 +663,7 @@ static int input_stdio_open(snd_input_t **inputp, const char *file,
+ 	return err;
+ }
+ 
+-int safe_strtoll_base(const char *str, long long *val, int base)
++int _snd_safe_strtoll_base(const char *str, long long *val, int base)
+ {
+ 	char *end;
+ 	long v;
+@@ -679,7 +679,7 @@ int safe_strtoll_base(const char *str, long long *val, int base)
+ 	return 0;
+ }
+ 
+-int safe_strtol_base(const char *str, long *val, int base)
++int _snd_safe_strtol_base(const char *str, long *val, int base)
+ {
+ 	char *end;
+ 	long v;
+@@ -695,7 +695,7 @@ int safe_strtol_base(const char *str, long *val, int base)
+ 	return 0;
+ }
+ 
+-static int safe_strtod(const char *str, double *val)
++int _snd_safe_strtod(const char *str, double *val)
+ {
+ 	char *end;
+ 	double v;
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
