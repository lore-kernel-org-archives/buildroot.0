Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C139AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 20:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4784D83046;
	Tue,  5 Apr 2022 20:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_iPIsWM9L0g; Tue,  5 Apr 2022 20:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5224A82FDE;
	Tue,  5 Apr 2022 20:57:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE4FE1BF3A4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB19E4136C
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzSpGs6eAHdT for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 20:57:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC5E841296
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 20:57:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h4so255933wrc.13
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 13:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rR2yfEHl2gVgvCXD5DktYAQKO1Ejz01luyBIrvofdWo=;
 b=PneuiOJkveKsLjgYqndVPZjyjeJSwsJbBD5Vwz8qq+iVL04wdHYIAzpHj9xFi9p+6r
 v0HiEIi7BLbjtDrrjczkD+38Jf1e411mBgx6GEpB/YCQY1gzTJQwJhfXGipfrkHd1Bha
 0yIKaS4uWf2aEOu09DYXTBQIBe9hanRjThrdQ2fpNXggqaAeBC3a8t/Bmhzz2iNH+k7h
 pC+3Rn89VDWWJfeGJc5ZDWzAQgjZFqTdBdsclI6FdJ1hCeg56f5bxmmwrRq+3vrwOP6A
 DwbCpSeZPlys+UhrJAZ1Y5N2dDgCXmMDNkBngeOa9vlxbMLu7ZkeR0ryzq9lPKaQH2do
 c/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rR2yfEHl2gVgvCXD5DktYAQKO1Ejz01luyBIrvofdWo=;
 b=ZrE5FwK0mwQ9Tb1j2NBeOG45EATJWDA9mTYKHZmMC8it6aX3XiY24Ue7q5y0U4HmSJ
 Gl5Lkl0Lz/Rin1SYGldCysbvdvq59bviTNLS8vi63x5Vewq8+q4JPTcfa0HcE1VR7vu7
 XKcWDGo2LMcJ6hz5Z00NCEf18ZFYHiXGZTQFLkdeOfepc+tslSzKbazCjpvMQDvYEbHe
 +U7xNJq/MhoCNZM8Eu6Qb7BR3D2gjffjExqKey02LjKM9OGoKMAUmMLBFusQ3lX80ivD
 yU2D2vPc/y327/VQkH74mWCdYvOPXD4BL3MCUDa9J40weLSo1Hzqr+xTd7GzIqi7b/MJ
 TX0Q==
X-Gm-Message-State: AOAM532XRA8dBOCOWsnWEN7ROoodMSj5WPW1c//IWRwXD9eomXy4o9oZ
 DDiD8+lsoeJ3Z9+cQWt+1XfqDHsdQvQ=
X-Google-Smtp-Source: ABdhPJyVaUoN9BiO++TytdEV11seTs5tD29eEn8U3q1IepIXio4bnqHXTH9i5WrG+oF5twfMpCbGQA==
X-Received: by 2002:a05:6000:1848:b0:204:e92:5af6 with SMTP id
 c8-20020a056000184800b002040e925af6mr3989014wri.180.1649192224765; 
 Tue, 05 Apr 2022 13:57:04 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d6c6f000000b002040552e88esm15204729wrz.29.2022.04.05.13.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 13:57:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 22:55:21 +0200
Message-Id: <20220405205521.2117028-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lsof: drop first and second patches
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

Set LSOF_AR and LSOF_CC to be able to drop first patch which is not
upstreamable: https://github.com/lsof-org/lsof/issues/197

$(TARGET_CONFIGURE_OPTS) must also be removed to avoid overriding AR
and so we can drop LSOF_CFLAGS_OVERRIDE=1 and third patch

DEBUG="$(TARGET_CFLAGS)" can also be dropped from LSOF_BUILD_CMDS as it
is already set in LSOF_CONFIGURE_CMDS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lsof/0001-makefile.patch                   | 14 --------------
 ...cs.patch => 0001-remove-susvlegacy-funcs.patch} |  0
 package/lsof/0003-override-cflags.patch            | 13 -------------
 package/lsof/lsof.mk                               |  5 +++--
 4 files changed, 3 insertions(+), 29 deletions(-)
 delete mode 100644 package/lsof/0001-makefile.patch
 rename package/lsof/{0002-remove-susvlegacy-funcs.patch => 0001-remove-susvlegacy-funcs.patch} (100%)
 delete mode 100644 package/lsof/0003-override-cflags.patch

diff --git a/package/lsof/0001-makefile.patch b/package/lsof/0001-makefile.patch
deleted file mode 100644
index 65b1b2e2a7..0000000000
--- a/package/lsof/0001-makefile.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff -ru lsof_4.81.orig/lsof_4.81_src/lib/Makefile.skel lsof_4.81/lsof_4.81_src/lib/Makefile.skel
---- a/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
-+++ b/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
-@@ -21,8 +21,8 @@
- all:	${LIB}
- 
- ${LIB}:	${OBJ}
--	${AR}
--	${RANLIB}
-+	${AR} cr ${LIB} ${OBJ}
-+	${RANLIB} ${LIB}
- 
- clean:	FRC
- 	rm -f ${LIB} ${OBJ} errs Makefile.bak a.out core
diff --git a/package/lsof/0002-remove-susvlegacy-funcs.patch b/package/lsof/0001-remove-susvlegacy-funcs.patch
similarity index 100%
rename from package/lsof/0002-remove-susvlegacy-funcs.patch
rename to package/lsof/0001-remove-susvlegacy-funcs.patch
diff --git a/package/lsof/0003-override-cflags.patch b/package/lsof/0003-override-cflags.patch
deleted file mode 100644
index 135e599ac9..0000000000
--- a/package/lsof/0003-override-cflags.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- lsof_4.84/Configure	2008-10-21 18:21:45.000000000 +0200
-+++ lsof_4.84/Configure	2010-11-03 14:00:00.000000000 +0100
-@@ -5206,6 +5206,10 @@
-   cp $LSOF_MKFC ${LSOF_LIB}/$LSOF_LIBMKF
- fi	# }
- cat ./dialects/$LSOF_DIALECT_DIR/$LSOF_REST >> $LSOF_MKFC
-+if test "X$LSOF_CFLAGS_OVERRIDE" != "X"	# {
-+then
-+  sed -i -e 's/^CFLAGS=/override CFLAGS=/' $LSOF_MKFC
-+fi	# }
- if test "X$LSOF_LIB_NO" = "X"	# {
- then
- 
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index ff09d64345..e4e339349a 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -33,7 +33,8 @@ endif
 define LSOF_CONFIGURE_CMDS
 	(cd $(@D) ; \
 		echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" \
-		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" LSOF_CFLAGS_OVERRIDE=1 \
+		LSOF_AR="$(TARGET_AR) cr" LSOF_CC=$(TARGET_CC) \
+		LSOF_INCLUDE="$(STAGING_DIR)/usr/include" \
 		LINUX_CLIB=-DGLIBCV=2 LSOF_CFGL="$(TARGET_LDFLAGS)" \
 		./Configure linux)
 	$(LSOF_CONFIGURE_WCHAR_FIXUPS)
@@ -41,7 +42,7 @@ define LSOF_CONFIGURE_CMDS
 endef
 
 define LSOF_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define LSOF_INSTALL_TARGET_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
