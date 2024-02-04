Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B1BC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 13:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00AF84060C;
	Sun,  4 Feb 2024 13:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00AF84060C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHYqMcFTcl1T; Sun,  4 Feb 2024 13:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2A15408B4;
	Sun,  4 Feb 2024 13:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2A15408B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 727AB1BF48C
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 13:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5962E60757
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 13:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5962E60757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVyPME_Z7WgP for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 13:36:16 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55D396074C
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 13:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55D396074C
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40fccd09082so12888395e9.2
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 05:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707053773; x=1707658573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oYbzqC3Sl7ZLa9dcrfmfO6Ghd35mfOpb5hwKxP5cuag=;
 b=TPZOmy0/fE3iS2p/gPeT03z/pR10JcydbrBN4BF06vo9++jRh4OALYX00KbovzUGzl
 bz4pKDUuwyB267tN9Q95riG0Xskc6VJLcU/zQcPJx+yItJ24FYwJTvG+Az1IRIEvAm//
 JzRoPQX0i5w9omJQwV1JjfLoA22rW3QUE8FCcNtcmxbqNF0/QgCKx81aUjABfUodwGTM
 9lYwqNdkwYsmj7uDW6s/8WorxUmbqSupsPJqzPyLaTXutbQ8zf43JxhIfTWJJLiEqo5/
 zPytG5PSdV0LBUNMEUocrMk8xCKmRjXfypS6eq9GNnviaaGCQECRRo/rRNQMReWxlGVr
 Ljdw==
X-Gm-Message-State: AOJu0YxPZF0B9HAu7xoydH6CNEwzXYDhqOhQrYghiuEss/Q4WhKmKK8x
 Yqs6XTIvWvHstoV1+I2glqyzq1C1Lbm0YoA5mX/o3wAgst7HARNe+K3sZ5VjGhI=
X-Google-Smtp-Source: AGHT+IFtTDVhcj4qR2Rdm+f9u6h+RYW8tY7W4AzIe1N/Qavz6iSqOZU9KRGrlkJ62g9UfkmGAsMpIw==
X-Received: by 2002:a05:600c:198f:b0:40e:b284:c333 with SMTP id
 t15-20020a05600c198f00b0040eb284c333mr2519568wmq.1.1707053773425; 
 Sun, 04 Feb 2024 05:36:13 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUh3ZZKcXj6BaBxh+FmgZj/2bx7V7ipZSzbc5gaLp5Exupa7D/QEBkW0FjS5mlsj5wAfYLFdwZwMlMBnnsYCySfRu+L2/qVXWd8TvFvojbVWwPLo3Ks4lt1FZezKbEVcMOR528Kyr8zmxWiJoWTkLsXXSxTU64+MI8IamK+SvvCtYI=
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b0040d8ff79fd8sm5750125wmq.7.2024.02.04.05.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 05:36:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 14:35:57 +0100
Message-ID: <20240204133557.1512951-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240204133557.1512951-1-fontaine.fabrice@gmail.com>
References: <20240204133557.1512951-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707053773; x=1707658573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYbzqC3Sl7ZLa9dcrfmfO6Ghd35mfOpb5hwKxP5cuag=;
 b=g1wg7XK6MAnJLNnHoFYGTPcrGew/O3rl6bJXnitdKF5aW/X4zZQ9pi+K51Zylt2vCS
 rQ0P4Gz95tG8bHjtbJ3RJ62rfVat/Ev9bKQbJ9za9QWlesEq9l8//ZNvnddSTcz4971Q
 yCS/ja00TQFuY0jbUtxEDmPfpeeH9OGZZxrNbEPoLGi0A97X6Guhkdeb2gTH6g6vb0CA
 jPVaQld1Srlg22oYHygqYQPmAMPYd/YjgoXPuO8C73qf8sezF5ggvMnQFxqSJXfM8WRT
 Ejf664I3q0f1md1kg+R/j0ZbTBTZCh/o69dkEH1QW2bsfclEYfkPb4ayrvi5YVV+GKAI
 OkCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g1wg7XK6
Subject: [Buildroot] [PATCH 3/3] utils/checkpackagelib: add
 RemoveDefaultPackageCpeIdProductVariable
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Christian Stewart <christian@aperture.us>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As advised by Yann E. Morin [1], add
RemoveDefaultPackageCpeIdProductVariable

[1]: https://patchwork.ozlabs.org/project/buildroot/patch/20240204103204.1415592-1-fontaine.fabrice@gmail.com

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/checkpackagelib/lib_mk.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 551c87168f..b5cfdd7f41 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -227,6 +227,24 @@ class RemoveDefaultPackageSourceVariable(_CheckFunction):
                     text]
 
 
+class RemoveDefaultPackageCpeIdProductVariable(_CheckFunction):
+    def before(self):
+        package, _ = os.path.splitext(os.path.basename(self.filename))
+        package_upper = package.replace("-", "_").upper()
+        self.package = package
+        self.FIND_CPE_ID_PRODUCT = re.compile(
+            r"^{}_CPE_ID_PRODUCT\s*=\s*{}$"
+            .format(package_upper, package, package_upper))
+
+    def check_line(self, lineno, text):
+        if self.FIND_CPE_ID_PRODUCT.search(text):
+
+            return ["{}:{}: remove default value of _CPE_ID_PRODUCT variable "
+                    "({}#generic-package-reference)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
+
 class SpaceBeforeBackslash(_CheckFunction):
     TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH = re.compile(r"^.*(  |\t ?)\\$")
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
