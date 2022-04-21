Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17600C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE0D541C72;
	Thu, 21 Apr 2022 21:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shTNGmw789uL; Thu, 21 Apr 2022 21:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E21841C6D;
	Thu, 21 Apr 2022 21:56:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D92F1BF95C
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDAEB400FD
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wYCxyzT2nAfP for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:56:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F275640C77
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:56:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m14so8457615wrb.6
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 14:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3MndRDI7PR7+Kr7Ua6DpVNTAlfiJuBqx2j4jdCooHzU=;
 b=SnfE/D2FktPWAAQHZAf1qmaeg0aQKzfDNm08VkynWkmMynP4LIBcQb7fugUx4a0rwg
 9RiAkkxdGZj//pvVlrIwHY91COrwfwSKwAxkcEuxWFH68XLeBiEaiuhRuyRwAIIArkHV
 GGIsGMyuxihn7GCydNfm3ze3ixmXXQUYJeKcz46uhmac0hoUfjt1WQgqeu4loyfZhTyd
 T4r8JPTTc8wf0x/qWS5sRPphi1OPDVJraStn/16Xv10vNwn/90DRwxr82yMrUVsjRfET
 4zwjz/brizYBpp97aV3GtJcSO4tN6PBqUeo2ph0wPl0BczkuhUHOS/K+h1tZstrX3Lzf
 +cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3MndRDI7PR7+Kr7Ua6DpVNTAlfiJuBqx2j4jdCooHzU=;
 b=XRGyDUxvjk1p8dTld3kmf1Q2oPuw+EukAeCzRNZT7Z9mMl+MyAmyr7Eow1wt58ySbA
 SSopN7UWGoMTr2UkJaHn6R9siU+2SSATuELkHkXc6qZ+BNqeBQZfcYftRHI7b9bacxOq
 C9Ep2MXOb098z+pjJbpKC4cn8py3NOMgDLBdjfvw9C+kPf+v3Nj7btArqmEbuKC2COts
 kLSeXJjFAJshvjblY0iN2wrawsebKgBs8NItMvOWcbyi9977Wx24A5/LjYEgfoi28FX1
 q76EYHap14+0o9FQYEIFf/ESI518Si2XsKddn8F6M4tWNBJJQhwUjrbtjXpxxvkhBnoI
 9PzA==
X-Gm-Message-State: AOAM532t9YNEe3fDaLXJTA+ydt2hN3RDVFBb8SuTmy9mtApWRJLRIdMP
 5UDRFfaV910O7ig0yfx/NEDKCzfjOZs=
X-Google-Smtp-Source: ABdhPJyfkPcDVxlqny9JpoRFcCqqYe1QoYZL2Oid7sQZGWmRBEBcvKW662s/U20vZt16AmqN98OLfw==
X-Received: by 2002:a5d:64cb:0:b0:20a:903f:5d70 with SMTP id
 f11-20020a5d64cb000000b0020a903f5d70mr1222513wri.138.1650578202891; 
 Thu, 21 Apr 2022 14:56:42 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c34d200b0038ed14b7ac3sm133341wmq.40.2022.04.21.14.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:56:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 23:54:44 +0200
Message-Id: <20220421215444.3798671-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421215444.3798671-1-fontaine.fabrice@gmail.com>
References: <20220421215444.3798671-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/zlog: fix CVE-2021-43521
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

A Buffer Overflow vulnerability exists in zlog 1.2.15 via
zlog_conf_build_with_file in src/zlog/src/conf.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...verflow-at-zlog_conf_build_with_file.patch | 25 +++++++++++++++++++
 package/zlog/zlog.mk                          |  3 +++
 2 files changed, 28 insertions(+)
 create mode 100644 package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch

diff --git a/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch b/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
new file mode 100644
index 0000000000..d5f23e1b26
--- /dev/null
+++ b/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
@@ -0,0 +1,25 @@
+From a5be8b3a8ddc498de4ad041757285136a55d97e3 Mon Sep 17 00:00:00 2001
+From: XiangfeiCH <chenthrone@163.com>
+Date: Tue, 12 Apr 2022 00:13:35 +0800
+Subject: [PATCH] Fix stack-buffer-overflow at zlog_conf_build_with_file
+
+[Retrieved from:
+https://github.com/HardySimpson/zlog/commit/a5be8b3a8ddc498de4ad041757285136a55d97e3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/conf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/conf.c b/src/conf.c
+index 0f862fa..9a4cb75 100644
+--- a/src/conf.c
++++ b/src/conf.c
+@@ -305,7 +305,7 @@ static int zlog_conf_build_with_file(zlog_conf_t * a_conf)
+ 				/* Oops the buffer is full - what now? */
+ 				pline = line;
+ 			} else {
+-				for (p--; isspace((int)*p); --p)
++				for (p--; p >= line && isspace((int)*p); --p)
+ 					/*EMPTY*/;
+ 				p++;
+ 				*p = 0;
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index c7b7035c1f..1929a45a3e 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -11,6 +11,9 @@ ZLOG_LICENSE_FILES = COPYING
 ZLOG_CPE_ID_VENDOR = zlog_project
 ZLOG_INSTALL_STAGING = YES
 
+# 0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
+ZLOG_IGNORE_CVES += CVE-2021-43521
+
 define ZLOG_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 		-C $(@D) all
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
