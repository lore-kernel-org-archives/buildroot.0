Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80670C54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 14:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45E5A81B70;
	Sun, 17 Mar 2024 14:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k7UbtQB7F3LA; Sun, 17 Mar 2024 14:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4812581B8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4812581B8A;
	Sun, 17 Mar 2024 14:14:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45FBF1BF303
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F2ED6062B
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CxCEL5r3iPAD for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 14:14:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7860A60620
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7860A60620
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7860A60620
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:14:49 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d29aad15a5so42873071fa.3
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 07:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710684886; x=1711289686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WPjRP0s8vxmhHQ4i5kGoACxexuKw7K37A7Fq8u6eyd0=;
 b=t1Wn4YyBjCKCm5hfBUkrnpFW+NiSnsoObRLnQdRHUtRkntpNiSJ/0iEL12X+csIa6y
 zQB0SVcfy7DGTxBAsEgML7d3dQDu+XtexIk4X98Fu6LLLUadlltMi5A/gKQfRkFos2CS
 y9ZFiTNJej0YfEqyVFeizkF9z+6nwweI92HexC+JCVM6lHrTIvxqYYbVmOzoIKljGDSm
 oUMoQSNnJ/NzGazPu2kIIJIm/b2hJgZEEA+E6GTFvOAmJSaPijHkdFPVK0qO0uAEcsZW
 BZAStIwUMq5ZtKzVfkg2OOYcbNXNO7RKScPFBfjmG/bVq2/clnEW5JJuRwgiJZylj4KN
 p+pg==
X-Gm-Message-State: AOJu0Ywib1x3oItI/KHJszVw7vwSRbZaFsH6021mPraeEA52eBarKpWN
 FqhU2SvmTV7YcOIfoul1gLnY+XEzFSDSPG7J2GI/eA3aTZ45Wqrh9H301Eol
X-Google-Smtp-Source: AGHT+IH8yAJ5NdwSR9EOApWXIbM1EjjvaM+jQEgr6fqlpi6RF1NK1cVq0lCzExlabauaP190aAiZRQ==
X-Received: by 2002:a2e:8195:0:b0:2d4:707e:623 with SMTP id
 e21-20020a2e8195000000b002d4707e0623mr4932974ljg.37.1710684886144; 
 Sun, 17 Mar 2024 07:14:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4f12000000b0033d56aa4f45sm7477233wru.112.2024.03.17.07.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 07:14:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 15:14:38 +0100
Message-ID: <20240317141438.809626-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710684886; x=1711289686; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WPjRP0s8vxmhHQ4i5kGoACxexuKw7K37A7Fq8u6eyd0=;
 b=gcv0+PIi/ThcyaqvoHsBKRdFcZudUIrLqLuEa7eVTkeivn+/eZKp6Ih4PhyDmUpU2+
 fz1b7AqN0VMqD7Ku/4HQs3MjOZn+Q31612uO6n1O2SVoZve+h0tTcYcGYiWQuQ8o7bo/
 WX+tchZ3tTMQjY/cYXkOg/X2X3pz8pD8JaJOMR+k7Y7r9UwZcemB6VB3NouLy47+wBnC
 akNLhOHtwvuEDY7lN+QA5mZHfFKRsTIFPdZuHF5mP0eqDPbeebBnqhd04nU5IpYizqfR
 kKGY536RkBe2ckixInQlfLM1w2FVmjXwge4C37+KfB9xrRPYN5qV1WAu2aK42AavjiIo
 V7RA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gcv0+PIi
Subject: [Buildroot] [PATCH 1/1] package/privoxy: fix build with root
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure when the configuration files are
installed as root:

id: 'privoxy': no such user
******************************************************************
 WARNING! WARNING! installing config files as root!
 It is strongly recommended to run privoxy as a non-root user,
 and to install the config files as that user and/or group!
 Please read INSTALL, and create a privoxy user and group!
*******************************************************************
make[1]: *** [GNUmakefile:861: install] Error 1

This failure is probably raised since the addition of the package in
commit f8a263fe361ab37ec6765b9ff6478c3b15e3d139 and
https://www.privoxy.org/gitweb/?p=privoxy.git;a=commit;h=26baf6bcc0b5db47b8cf5c55eece0614712b5180

Fixes:
 - http://autobuild.buildroot.org/results/28d8ca6f0e2d81d62196a0958c9274ad2c8c9871

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...on-t-exit-if-configuration-files-are.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch

diff --git a/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch b/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch
new file mode 100644
index 0000000000..e04d191ce0
--- /dev/null
+++ b/package/privoxy/0001-GNUmakefile-in-Don-t-exit-if-configuration-files-are.patch
@@ -0,0 +1,30 @@
+From 4b3b267db159dc23314de3062859481b7c397e32 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Mar 2024 12:36:31 +0100
+Subject: [PATCH] GNUmakefile.in: Don't exit if configuration files are
+ installed as root
+
+... as this can be considered acceptable when cross-compiling
+Privoxy inside an autobuilder with only a root user.
+
+Upstream: https://www.privoxy.org/gitweb/?p=privoxy.git;a=commit;h=4b3b267db159dc23314de3062859481b7c397e32
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ GNUmakefile.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/GNUmakefile.in b/GNUmakefile.in
+index 04cceb15..cf79aae1 100644
+--- a/GNUmakefile.in
++++ b/GNUmakefile.in
+@@ -927,7 +927,6 @@ install: CONF_DEST LOG_DEST PID_DEST check_doc GROUP_T
+ 					$(ECHO)  " and to install the config files as that user and/or group!" ;\
+ 					$(ECHO)  " Please read INSTALL, and create a privoxy user and group!" ;\
+ 					$(ECHO)  "*******************************************************************" ;\
+-					exit 1 ;\
+ 				fi ;\
+ 			else \
+ 				GROUP_T=$(GROUP) ;\
+-- 
+2.39.2
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
