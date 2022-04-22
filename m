Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504F5C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 21:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E655B40AF5;
	Fri, 22 Apr 2022 21:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJ4yLulGtVGb; Fri, 22 Apr 2022 21:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFF284046D;
	Fri, 22 Apr 2022 21:23:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2A641BF336
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9085A610B6
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPC1B8P0miW6 for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 21:23:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7393D60EFA
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 21:23:23 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v12so5942127wrv.10
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 14:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CIIdSzayDLJTp6kvLXHaYH3BM3rY7WR36nptwb0dszs=;
 b=na8hVGDOeJFnezoArMY123pyROYRGqwvsKNbVOBshL8gqVYZ3sjP8FfSsCiUkOcAp8
 YwvxDKI9kjBPhvAGk472QS/tAKIezdnDjukPtS1Dhuwe2uMsvOFpQ0YTGqmZz0FHFKKL
 QEbR4o1OoGNqIFTXqi+6klWRHHkaScgwinY2Y8z25Py+FryZBAImRMbVHF5Q4TeuwbpT
 f8QB76TfTPvOInMzo3YLwOyciYisHocFigWf5HSIubQMWz8k8eQeY03UdbfsLLLCwQMR
 CcHCcjA7Z49vXp4qIoePKnh6iQ29iuz6q4OpL+QwnDKby7XdLJGyoEOVrbzNZ8YJLP/O
 1RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CIIdSzayDLJTp6kvLXHaYH3BM3rY7WR36nptwb0dszs=;
 b=ryfytMGHsEQN2oKMHVNyCi+icBfDnSCSySOKQH+06DSs/PuZU35+U4MlKNAldyZ6TX
 +pcfP4YRJC3lwnbPr3W70cL2nOo4IQG3pQ9KYsNBGrofK0IyORJVWs6Gv/cXywMoZwgp
 e+I2EXvT5WyzykwLt5mdgpg5epKVH16gDenKTuwn6aHP0G7OsdR/eG6GEZF6XZsmd5K8
 DgUkdWAl80jU2pk2HV220dDsfBkmxhA+gL8o6KfrQ6M1qYtTvZh1FFwva9xs459ZnvnC
 N3tcpdqmuuabHZqDhSJq9Sckaw0t+01ETIgx9RMImgiS3qbZ+76EW+hyIefyYxtQPqvA
 43Ng==
X-Gm-Message-State: AOAM533qeYI97rjhNrR8TejLpKuMkJ5sqQYMKjvtWCgZ/N2mDQCadoJE
 djYD+8jTvBqITLSrxfXMiuIBSGERNkI=
X-Google-Smtp-Source: ABdhPJyjwDNTgFtYgcREQfhVU0qdigyMXdQk3MBtZHBjZu3efIgx8ki235bj3gvriKybBfbMi/KvmQ==
X-Received: by 2002:a5d:6487:0:b0:20a:a575:c136 with SMTP id
 o7-20020a5d6487000000b0020aa575c136mr5269075wri.402.1650662601303; 
 Fri, 22 Apr 2022 14:23:21 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c1d2900b0038ec7fcb979sm5554139wms.26.2022.04.22.14.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 14:23:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 23:21:16 +0200
Message-Id: <20220422212117.1291718-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/2] package/netsurf: fix build with BR2_OPTIMIZE_FAST
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

Disable duktape with BR2_OPTIMIZE_FAST to fix the following build
failure:

In file included from content/handlers/javascript/duktape/duktape.h:195,
                 from build/Linux-framebuffer/duktape/application_cache.c:21:
content/handlers/javascript/duktape/duk_config.h:2861:2: error: #error __FAST_MATH__ defined, refusing to compile
 2861 | #error __FAST_MATH__ defined, refusing to compile
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2f1b42e2be3aa76cbacd84f3d0ad8b13edce6982

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netsurf/netsurf.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 1064698c12..574c1423df 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -14,6 +14,17 @@ NETSURF_CPE_ID_VENDOR = netsurf-browser
 NETSURF_DEPENDENCIES = expat jpeg libpng \
 	host-bison host-flex host-gperf host-pkgconf host-vim
 
+# internal duktape doesn't build with BR2_OPTIMIZE_FAST
+ifeq ($(BR2_OPTIMIZE_FAST),y)
+define NETSURF_DUKTAPE_CONFIGURE_CMDS
+	echo "override NETSURF_USE_DUKTAPE := NO"       >> $(@D)/netsurf/Makefile.config
+endef
+else
+define NETSURF_DUKTAPE_CONFIGURE_CMDS
+	echo "override NETSURF_USE_DUKTAPE := YES"      >> $(@D)/netsurf/Makefile.config
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
 NETSURF_DEPENDENCIES += libgtk2
 NETSURF_FRONTEND = gtk2
@@ -77,6 +88,7 @@ endef
 endif
 
 define NETSURF_CONFIGURE_CMDS
+	$(NETSURF_DUKTAPE_CONFIGURE_CMDS)
 	$(NETSURF_ICONV_CONFIGURE_CMDS)
 	$(NETSURF_SVG_CONFIGURE_CMDS)
 	$(NETSURF_FONTLIB_CONFIGURE_CMDS)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
