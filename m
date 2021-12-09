Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E69BC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 20:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B082859F7;
	Thu,  9 Dec 2021 20:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4AA6NOGyhyZU; Thu,  9 Dec 2021 20:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F2BA859E4;
	Thu,  9 Dec 2021 20:15:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C06401BF25B
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 20:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDD418599E
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 20:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gVBMuNU1tQ1w for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 20:15:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 882FD859F2
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 20:15:10 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id d10so14217823lfg.6
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 12:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=detguNF8HeKWsuVPvTqsWAoMz4oJySlkLESlDZ3v78g=;
 b=QmFMbi5WY++5uhnLhhgWkr0sOsLz9ayoK1qdzJpocqZPNwETNb4yYeOMFf0l8F1GXo
 S3+BqcFXMhQYWlOuD4xt7PXV9TdY1wo03+FLeUoF9tVbqTq4/9ypt3DI2kQgWdxdhbz/
 xU1pq2kWA8Ncxk6UDqPpI8Y0cbNIB5cEJqTjr6KRxUctYKPxH7+Sq0KlK8FsPM9sTG+i
 KAuYYdWgSFddX2ovMum5+60BG2ZKJ9zdb00+qFGkGFkEXf9evZ8j0osgWtjA35rqhtNg
 xtZjWrl2wNEJVUG4Gp2CBGReqNGqymkXbjc1CjAxdXXreP+XZxu5KH4HVZWdr9bUpXG3
 N6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=detguNF8HeKWsuVPvTqsWAoMz4oJySlkLESlDZ3v78g=;
 b=6o0YTo2HkjzCB7ZW/kiO1iJ9DT/H27xPSQSYwLt+zNXU3pZVaE/V0GN26afCR48/PT
 TnuB5T9pH41ra6gAgPByLQjxVlmTPtNmX+MW6kOLttMi/pJgFn+fQ+zOyAlAoV6nPvKi
 KpHZFHzE8JygXks3hZA+VVQ210wozNMqkzPhgp3TgISwQd+h8kefYbQhcuRTSf+/BO8d
 BrPJtTjSJ0nBb7ZeTkMCkYTWikc1EPC+aOWRTMw7/do05shO/jtLvNplKx9mvN1zRs+f
 KDIOLgmNItdxrcIvS166/KqGsaYCd4wfZzY/PCy4FmcrxrrOgRUM861emFHHdIKoASL5
 A4sQ==
X-Gm-Message-State: AOAM5311zyb72WrCr/57+93Spz0InFklNmdqQiQDeR4H16uSd2Ge7El0
 ZLjLE1bIKER3dw/qNi6wCXZCRWpxv9M=
X-Google-Smtp-Source: ABdhPJwWTNIWdKoaTf0UND0Y5Nq2O8NLlKU5UEHGty3qVNpxQhMlYZQpiftqHnA7ykDKU6kS4Yo+Jw==
X-Received: by 2002:a05:6512:3f7:: with SMTP id
 n23mr8236062lfq.206.1639080908063; 
 Thu, 09 Dec 2021 12:15:08 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.198])
 by smtp.gmail.com with ESMTPSA id o19sm79409ljp.83.2021.12.09.12.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 12:15:07 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 21:14:55 +0100
Message-Id: <20211209201455.139562-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/inadyn: bump to version 2.9.1
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the ChangeLog, or release notes at GitHub, for full details:
https://github.com/troglobit/inadyn/releases/tag/v2.9.1

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/inadyn.hash | 2 +-
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 801400b2f5..98af30e9fc 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  b90c02a4f1964d8c1f3e178b6ef22eb29c689cd9e09669af17a8fd998c87dab5  inadyn-2.9.0.tar.gz
+sha256  7370eb7ad5d33a9cf2e7e4a6a86c09587fbf9592cd357c6f472c33f575bac26d  inadyn-2.9.1.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 9ccb16ddfe..041d1eff57 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.9.0
+INADYN_VERSION = 2.9.1
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
