Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE50C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8A06405A5;
	Sun,  3 Apr 2022 15:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6HKQDY0ruGL; Sun,  3 Apr 2022 15:48:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8A7140594;
	Sun,  3 Apr 2022 15:48:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1B851BF2AF
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D261D827C9
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEjg407GvSLb for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:48:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0EC680C50
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 15:48:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u3so11001016wrg.3
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GlkHWO39GCsc6WAOAe2QIn3gIqlb2mdhu1b5HxLa6ac=;
 b=MG1hj4oVPYuinXdALStATu+Z47qmgrMI2TQ4CsdZ0ky2IyHXhRRqgSXrBknIlE/Uko
 iJrQ5jGABCCe1EcryUuJvKc4ZeyjqabezJgU2W9V+6HSgBPXpt3m8VkP6IP0KQtUYy+M
 xRDv7+edffSuuIQ7O7AwEAlMgtnIrcNkNDZ0UFoakFll9ZNhkZlj4kzv4ZdYbcoR9cTI
 8iwL9FClYoawja1xquk8NMEH92mjhm6sy+07Np4OxO5Pi9lsRgXFcFPdvpanpw1evECR
 42N+QdKtBo0/NQn5Opzr5kvE5RP4FJZPL91dZplx7VP4eIhWRO6il7VcJGegmeVVDv1H
 L+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GlkHWO39GCsc6WAOAe2QIn3gIqlb2mdhu1b5HxLa6ac=;
 b=4AZXhtYrYlAQ40kXPTH9QGFu0Xj2IW7jDQWFthCEKIv27IC5VGp85QaC8yUabtIaNi
 n8aCaDeJE/DhbjnO7o5EFppm6EwTJPvbLu62Y0kOD4KNMS9PwFbG1xQqN32xdRW9qEKk
 m6LIR5ImVsc1MU8c97Q+4gliydWuG+fDtnQSzYDr39BHzq/Wm2HgrICU9V8vyqjSL0vd
 Mss4YBGfQvWjyC9e8Qi+FmUKZDQdjinLNF0C8oNuwkrLvOdwNgB+HmDiYYK/heTp7np+
 uYU5Iij06PJdvK5hfF/FN1s1F9q2cYkmmmWhH08fAVytN+Ka2QIxkKtNqM0ljjon1NNS
 QyTg==
X-Gm-Message-State: AOAM532B+Xlm+28lsl0ks3TWBfd87LeaMDqQtDNaw3X96Weq/PB9DhZt
 aw8lfHycvLaLWtHcX+3OY4Jxjn2cmTI=
X-Google-Smtp-Source: ABdhPJwsH0veeotW4fzARMKUm4BqJDJ6X+U8i2uA3xbFU/Ok2zbhNSpv3BWnZFHt4eiI90auVEPQ9g==
X-Received: by 2002:adf:ebc7:0:b0:1ee:945a:ffb4 with SMTP id
 v7-20020adfebc7000000b001ee945affb4mr14490202wrn.641.1649000881913; 
 Sun, 03 Apr 2022 08:48:01 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f13-20020adff58d000000b002060e84bcc9sm1406573wro.44.2022.04.03.08.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 08:48:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 17:46:12 +0200
Message-Id: <20220403154612.4158174-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403154612.4158174-1-fontaine.fabrice@gmail.com>
References: <20220403154612.4158174-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/cppcms: bump to version 2.0.0-beta2
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

- Update indentation in hash file (two spaces)
- This bump will fix the following build failure if python2 is not
  available on host (while at it, add host-python3 dependency):

Traceback (most recent call last):
  File "/home/autobuild/autobuild/instance-4/output-1/build/cppcms-1.2.1/bin/cppcms_tmpl_cc", line 14, in <module>
    import StringIO
ModuleNotFoundError: No module named 'StringIO'

http://cppcms.com/wikipp/en/page/cppcms_2_0_whats_new

Fixes:
 - http://autobuild.buildroot.org/results/00482ee24deae95a91f8499f499b18e15f14b51a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppcms/cppcms.hash | 14 +++++++-------
 package/cppcms/cppcms.mk   |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/cppcms/cppcms.hash b/package/cppcms/cppcms.hash
index 86f86d94af..a8d04ff36f 100644
--- a/package/cppcms/cppcms.hash
+++ b/package/cppcms/cppcms.hash
@@ -1,8 +1,8 @@
-# From http://sourceforge.net/projects/cppcms/files/cppcms/1.2.1/
-sha1	9cb25cc5d507d2f4235326ba3815eba252b4ac77	cppcms-1.2.1.tar.bz2
-md5	2bb259fefb86532e404207c71c094a0c	cppcms-1.2.1.tar.bz2
+# From http://sourceforge.net/projects/cppcms/files/cppcms/2.0.0-beta2/
+sha1  746cc5e3f58565d91d9ded6e2616399d60e9d01d  cppcms-2.0.0.beta2.tar.bz2
+md5  ef561d13ee92d2053151cab073feba10  cppcms-2.0.0.beta2.tar.bz2
 # Locally computed:
-sha256  10fec7710409c949a229b9019ea065e25ff5687103037551b6f05716bf6cac52	cppcms-1.2.1.tar.bz2
-sha256  fb7c15ddf590037d4cd18ebd61148a2304b9243369d238a64f599182377e32db	COPYING.TXT
-sha256	3e4012cc5950e05bedfdd2f00ceffe1ef71c46ac8c79f07e237ecb23c773f65f	MIT.TXT
-sha256	d6ce062e5cf4f7e3c536d7d2fee84c882c45245f1848ed3162401f2b29fa2b4b	THIRD_PARTY_SOFTWARE.TXT
+sha256  697031c7d141fdd215c6be5090b66e2106a63bb3e52f09ee8120e8efc6c08a21  cppcms-2.0.0.beta2.tar.bz2
+sha256  fb7c15ddf590037d4cd18ebd61148a2304b9243369d238a64f599182377e32db  COPYING.TXT
+sha256  3e4012cc5950e05bedfdd2f00ceffe1ef71c46ac8c79f07e237ecb23c773f65f  MIT.TXT
+sha256  d6ce062e5cf4f7e3c536d7d2fee84c882c45245f1848ed3162401f2b29fa2b4b  THIRD_PARTY_SOFTWARE.TXT
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index c560b5d0fa..8a59990a8d 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CPPCMS_VERSION = 1.2.1
-CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
+CPPCMS_VERSION = 2.0.0-beta2
+CPPCMS_SOURCE = cppcms-$(subst -,.,$(CPPCMS_VERSION)).tar.bz2
 CPPCMS_LICENSE = MIT, BSL-1.0 (boost), Public Domain (json2.js), Zlib (md5)
 CPPCMS_LICENSE_FILES = COPYING.TXT MIT.TXT THIRD_PARTY_SOFTWARE.TXT
 CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
@@ -18,7 +18,7 @@ CPPCMS_CONF_OPTS = \
 	-DCMAKE_SKIP_RPATH=ON \
 	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)"
 
-CPPCMS_DEPENDENCIES = pcre
+CPPCMS_DEPENDENCIES = host-python3 pcre
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=OFF
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
