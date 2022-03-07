Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE54C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 05:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA35660DC6;
	Mon,  7 Mar 2022 05:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifVQlnsRHOH7; Mon,  7 Mar 2022 05:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1E7360E2A;
	Mon,  7 Mar 2022 05:29:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6F011BF410
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 05:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD9C860DED
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 05:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Z4xtCY3BnTQ for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 05:29:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 244A760DB7
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 05:29:08 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso15601331pjj.2
 for <buildroot@buildroot.org>; Sun, 06 Mar 2022 21:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H0VGlebZxvC+A+XkrWcq69LuLFbwp7k1Enbr4I5zcvA=;
 b=TGnw8r2zaLZ/GPbq1oOBy996O3B50A7TkAUnljwLID83kjgxEdZ+J/vDBvCGQIb/15
 kw6PJ6PriMM+cTghHJhi5GbqG/JN2OQ3aDzu5if20pE9QVuDK3JAXGHwoVOzavftYrVr
 OK08PsYMwLeC80bS0ENQC2hMVTIJxXM2DUSNvb0Rwe3D6aqjKGd9VuzzGkRrBQHgHe+U
 vRWXjQZxZs1NkW3c9MuKyMtimRO8BD2G2zFmJbeXavS6H4n4HUFedSlhOTsd9J8Nr50J
 vSw6UZWsHBh01O/m5K60T36EQI7jyTVJqVj8mobEzo8Bxhh4pv5F4a13RKrgrTWuZ52E
 VS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=H0VGlebZxvC+A+XkrWcq69LuLFbwp7k1Enbr4I5zcvA=;
 b=CfWpWhKUXTaWPVo1K1xzOBiBYzxhE7xQlEYzBadcwy/paNz2FjY8R5lfnRdwhPh1tY
 puztmErteIwF/b4oNOJmke5VYLRwNxcQwGwIwAzCMjyr1hHvu7sWG3TDVtuidh33gdRP
 QrDht38KNnC4I6RG8w673Ym//IXpmYtdz5YC4XjJNNbxrPyM36+UcRp4ZjFd43pbbgtk
 FFYPAQlOL7sZBrqC3bSu2dsC7vBYXXwYW1Q6Z/g4TOSw5a4ArE8ePr5s0T0uXQekjiVM
 5PGJXv94gXUejvTn7xDuhW71ruikGC4O6rF7cJgg30WH12lw2+f/ZDJ+Ps8Ncxq8VJe5
 V2Jw==
X-Gm-Message-State: AOAM532pzwNGRXaY13Hk+NepvIS/MN0roOI2IiOr+ut7IhELdP8LG/Ds
 jJYlUzx/ftSSygWlWPOBxPS7K39IH/uKyA==
X-Google-Smtp-Source: ABdhPJyvJA0SfwmNi8Ev4t3D/5pZdcXLlkh5Mx+El7FXofkcXt0Rg+sEvSZlp7WnKt+kW7IhD8Fx5w==
X-Received: by 2002:a17:90b:3886:b0:1bf:1a16:25d4 with SMTP id
 mu6-20020a17090b388600b001bf1a1625d4mr11217427pjb.193.1646630946685; 
 Sun, 06 Mar 2022 21:29:06 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a17090a609700b001bf5a1830f3sm2728165pji.10.2022.03.06.21.29.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 21:29:05 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Mon,  7 Mar 2022 15:58:57 +1030
Message-Id: <20220307052858.1245393-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pdbg: bump version to v3.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/pdbg/pdbg.hash | 2 +-
 package/pdbg/pdbg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index df7ba314bfbc..58c256e6ceb2 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5b721fd5551591cd5626ccf72c8d9096d902de4da10324097a37b4763815f0d7 pdbg-3.4.tar.gz
+sha256 7bdbab4e14b8cf50dbf6242955e46e58882c37b1a52671d9e6f3073885629dfa pdbg-3.5.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 5a5cfbc62d8a..871bf953f23e 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 3.4
+PDBG_VERSION = 3.5
 PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
