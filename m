Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39339C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 22:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFABE86137;
	Thu,  9 Dec 2021 22:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9J8MLC1USpX; Thu,  9 Dec 2021 22:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 416C686135;
	Thu,  9 Dec 2021 22:17:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47AE71BF350
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 22:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42B4742552
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 22:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WwJ7rZjkfQ0G for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 22:17:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5988F42550
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 22:17:28 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r25so23685421edq.7
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 14:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7leGlAqvsqeAxOmMfnVOjYgVr7qlbISwslME2GTCIP0=;
 b=C8PxzwHo/6V5Q43KeaQSUwFojOwbxFsFS10GlPZ4TiGh5yb/owNUlz/GCnZweZ6ENM
 BP0wZqA3bWD6ce0hy8aiXXlcJvCB0EasJvoUJB7su7EbEdFIv3cKn2In4hbMnLzLq3hN
 AYjsLICmMZu1Y3sV4xkYFRNaO20tCStmbK7Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7leGlAqvsqeAxOmMfnVOjYgVr7qlbISwslME2GTCIP0=;
 b=dtJSgStqkNTjpUtjq4TJ+R73a8iNUrmmkFt4ZzubhOBoemncPl0MM7QhEA/t+PB11N
 p4TRiFQrc6nJFwvpvXCWrZtf/saOP9HqcvaEVCYGInH9XuzOH8er7wv90SBnO4hXtyCQ
 9sVqpUjVDRCNHMLaLdZtOgdiDMFFOTeN+VRdn9czyHhxl8Ll3LBxwyq8rhcHwy1K5qi8
 OKyPgRl/Hs1bQNVbb/MAulTGGIGycdBZHTSmsKcfTAhMTpSvYYxe5nvWLx0wUyc1zd47
 L/W0QiohCGq/RKJW4uejCQb9ZQwFkuuLsIpf+ST3TjWaZam8sz4ymEk0nEKh4DNPBunn
 omxg==
X-Gm-Message-State: AOAM533Ckgg8CHE5RCPi2/euIuRZMyAkJCfeR72MYba8EP61T2Mc/EG9
 d93t1xy8DA9mdnk9/SITXVO6kkf9Q58WxQ==
X-Google-Smtp-Source: ABdhPJwHSJqjYvX/cIA6thUINhPM+BihJ2NQz0xTjHFLoJlP+utfDJx4zZ86DTq7X4/GQd3VTmQBBQ==
X-Received: by 2002:a05:6402:168a:: with SMTP id
 a10mr32534883edv.219.1639088246399; 
 Thu, 09 Dec 2021 14:17:26 -0800 (PST)
Received: from localhost.localdomain (host185036130019.static.fidoka.tech.
 [185.36.130.19])
 by smtp.gmail.com with ESMTPSA id z1sm477344edq.54.2021.12.09.14.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 14:17:26 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 23:17:23 +0100
Message-Id: <20211209221723.502534-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pydal: bump to version 20210626.3
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pydal/python-pydal.hash | 2 +-
 package/python-pydal/python-pydal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 911734c8bf..eef00030bd 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  32faf0b7123bc19b5f70da654fc99a22f4ce6fb20f5e4b38aba819e0ab4060aa  python-pydal-20200321.1.tar.gz
+sha256  9634f34a31d4411588b73825c8acc7f73ca69ba8a665bb00d0a9b5baff69498b  python-pydal-20210626.3.tar.gz
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 2aeade322e..428999f5c1 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20200321.1
+PYTHON_PYDAL_VERSION = 20210626.3
 PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
