Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25600C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 18:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E07641B93;
	Mon, 30 May 2022 18:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Gum3tMGiR1g; Mon, 30 May 2022 18:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B54A41B7F;
	Mon, 30 May 2022 18:35:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23D4F1BF38A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 18:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12BE983F8D
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 18:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6wXiNZCOnwVp for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 18:35:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20AF883F7D
 for <buildroot@buildroot.org>; Mon, 30 May 2022 18:35:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c5-20020a1c3505000000b0038e37907b5bso53780wma.0
 for <buildroot@buildroot.org>; Mon, 30 May 2022 11:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2SkBy7YYhiSgiFfNAGiAjMdK6TpaB1YWEEH39o+lLI=;
 b=fB82HnaGWQI9h/yKDZF6ofXKI6vXlVhZRU0auWs2B50+Q+CMxeqJMMydNjzDi9RYSA
 NNb4y65g3tBLYGohG1uYlPck5EpLfm8+yO4gYvi8HBZznGEtLnOcq5AIKX3v1aEBMtkk
 azBCmQ2YBf1vCFALEqa31OKd24wW1ZqMX7frDAg40njKQXDkr0xDlt8jBuPh3fWlJzwz
 XIPPQ7o7Xy4XT81vo62WIc3qYJomW/qrhO5FZ8rost0Z1Bf4Ub4XIFXSXEMErJsbYOFe
 OjJgmKSurYzEXOYENJ3vMFi9B6UJrTSaGITdghhLpSwehAD90EBW9ga+e/o2yXGfqMut
 D8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2SkBy7YYhiSgiFfNAGiAjMdK6TpaB1YWEEH39o+lLI=;
 b=PL0gy7yXmT73bQsUAdlNCdJR4cUatCaB5/A4TKjACmfZ8HRPKCuBJnR80+2b6VOKjA
 pJ6BxkEXpadrB9B/HHL6x8lUZg52MDiaMEDQ0xMzsWDXgjapaGl7/RCOsl+pbLpp/XTh
 9efcAFNAst3rW3HdToTboJOYxujGiwSFneyZIx6bxLp/2LR3+J7bYpUe15uaQbl9iqTm
 sKGSs1MGLrlzZo+61KPepVqZ53QWANRRhuIdFQosMIcDI1CbUyBFrs88R2oFrbH2ZrY+
 8mTPpoH9EsyMM4xaFWV+WGwpctd2LBt0tIQ7m9odjK/T8ST61GKKdlNG6RvxAukh3aKg
 Lu1A==
X-Gm-Message-State: AOAM532CGN1xccOzl1MGJx2ry3Z37bg6iMkLyXcsYrOWf6ZXI+LRq7NY
 sP5TUnG5NGq1gvenAuDsg/0KuBnK/uE=
X-Google-Smtp-Source: ABdhPJzJ4T+q3u0OZhtA4uP/OrfYSsOnEPyjvcZcM+NcsjvbGr7ws7iK9k29TwV0iRrKwTa3ErVfuA==
X-Received: by 2002:a05:600c:4e16:b0:397:6d34:76a4 with SMTP id
 b22-20020a05600c4e1600b003976d3476a4mr20290603wmq.0.1653935722131; 
 Mon, 30 May 2022 11:35:22 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a7bc354000000b003974a3af623sm65388wmj.17.2022.05.30.11.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 11:35:20 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 20:35:16 +0200
Message-Id: <20220530183516.829602-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-crossbar: use escape from
 markupsafe
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The last version bump of python-werkzeug v2.1.2 introduced a runtime
issue in python-crossbar since escape from werkzeug has been removed
since werkzeug 2.1.0 [1].

This has been fixed in python-crossbar v24.4.1 but we do not want
to bump this package for the Buildroot release 2022.05. Instead
apply the same change as the upstream commit [2] using escape from
python-markupsafe package.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2520606768

[1] https://github.com/pallets/werkzeug/commit/22d1e9ac13829b83347107a9b4d77072a8e1af6a
[2] https://github.com/crossbario/crossbar/commit/ca8d383f01231e2b3f986e791f215f12f2deee5d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 ...ice-wap-use-markupsafe-instead-of-we.patch | 40 +++++++++++++++++++
 package/python-crossbar/Config.in             |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch

diff --git a/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch b/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
new file mode 100644
index 0000000000..65ffc508ab
--- /dev/null
+++ b/package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
@@ -0,0 +1,40 @@
+From ac5fc826e33492bb0c4283a954389d7fd355fa61 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 30 May 2022 19:38:11 +0200
+Subject: [PATCH] crossbar/webservice/wap: use markupsafe instead of werkzeug
+
+wap.py use escape from werkzeug but it has been removed since
+the version 2.1.0 [1].
+
+Replace with escape from markupsafe like upstream commit [2]
+(wihout other changes).
+
+[1] https://github.com/pallets/werkzeug/commit/22d1e9ac13829b83347107a9b4d77072a8e1af6a
+[2] https://github.com/crossbario/crossbar/commit/ca8d383f01231e2b3f986e791f215f12f2deee5d
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ crossbar/webservice/wap.py | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/crossbar/webservice/wap.py b/crossbar/webservice/wap.py
+index 825558b1..6daa9b21 100644
+--- a/crossbar/webservice/wap.py
++++ b/crossbar/webservice/wap.py
+@@ -36,7 +36,12 @@ from collections.abc import Mapping, Sequence
+ 
+ from werkzeug.routing import Map, Rule
+ from werkzeug.exceptions import NotFound, MethodNotAllowed
+-from werkzeug.utils import escape
++
++try:
++    # removed in werkzeug 2.1.0
++    from werkzeug.utils import escape
++except ImportError:
++    from markupsafe import escape
+ 
+ from jinja2 import Environment, FileSystemLoader
+ from jinja2.sandbox import SandboxedEnvironment
+-- 
+2.35.3
+
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 9625d9ce8e..60b60b1740 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_INCREMENTAL
 	select BR2_PACKAGE_PYTHON_JINJA2
 	select BR2_PACKAGE_PYTHON_LMDB
+	select BR2_PACKAGE_PYTHON_MARKUPSAFE
 	select BR2_PACKAGE_PYTHON_MISTUNE
 	select BR2_PACKAGE_PYTHON_NETADDR
 	select BR2_PACKAGE_PYTHON_PASSLIB
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
