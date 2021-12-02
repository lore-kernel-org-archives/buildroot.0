Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7FCC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 01:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7192C40303;
	Thu,  2 Dec 2021 01:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJFeXvHV2FGB; Thu,  2 Dec 2021 01:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B678A402ED;
	Thu,  2 Dec 2021 01:39:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A92F1BF5DB
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 01:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B0DB80CBA
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 01:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9uCD320lrqJk for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 01:39:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CEB480CB6
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 01:39:09 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id z8so51781608ljz.9
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 17:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xaT6nAlLJvRZzSXpiVC3LK7kyUraDhwiALThPLe3Bv0=;
 b=Igp/W2YRWl/daqQpHJjM72tiZZfWc/c3r5aYOLC3LvUhsjVN8KmTG3RAZY9o7lhBFi
 NvSLOpSTlbQR6Pl7cbyvxKgI1tXz/bJZbmprsHTruBTSvUNMEIH3q3ZWEEleTbwCp6xT
 czg6NGs3VE557FGhy2TTi+7UtclnNFWV3wUNrC+HWASNuwAkpMEbuxht7sFU41oWmuS4
 STQ3bFTqqhr8lHFOysQDqElqqAGcBz9cnZwGRSANLbywzEPRkb2z8R9Ek31HLPF/73QO
 8d4pBFWXA4C0XmofpzQ0eeznTIx4lXSkmOsgGdO+Hi89h4tq05ddGB72kz5IHdFT2AOh
 4+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xaT6nAlLJvRZzSXpiVC3LK7kyUraDhwiALThPLe3Bv0=;
 b=isJM9bRX3/+28b2JRdE/kx49DDYFDTZ6JIkY45cG+JOOwqoVcypqDvIIgltbIActuT
 b8WVHgBi93alPTDph3K0TW59ns+ed3Xsdrc9/lrWBInNjaB4TGoOX5t10fHVLSMyl40e
 HcU9Dz5TcCoaA9445fkl3NoYhNBdt64OCHREfP9NINtFJrHg6jkM7SDkVGNu+77rb+oe
 JZ7rUZvAXcWl0n1HoW8xgoxa6uIfZmTbZyRJp9dQpORnEuC3403/JxtNEiwwVPJA1xeT
 FuipUwH3RPfjAnXqAbYU/VIboHJA7PJG7CZMy3x+0SnrBUKZ9otBK/JAgkrTuNkg5cTX
 kaWw==
X-Gm-Message-State: AOAM531m0ieBs/wgvFrScYGdivf1+eRKHJqjPTUnA3+XBsbYFUPqB31n
 Ok6OsxnJhcu+BUHr8D6cwRdW250xvTE=
X-Google-Smtp-Source: ABdhPJy9oEB1xuo+Na5XUi84IuAQGXv1M3k78yqQJ2gQ2B/H/Pxn38uEBCPEq4gIhJ+KGb1VLIVyXw==
X-Received: by 2002:a2e:8455:: with SMTP id u21mr8972449ljh.388.1638409147334; 
 Wed, 01 Dec 2021 17:39:07 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.198])
 by smtp.gmail.com with ESMTPSA id b13sm176939lfv.200.2021.12.01.17.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 17:39:07 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 02:39:01 +0100
Message-Id: <20211202013902.1593562-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202013902.1593562-1-troglobit@gmail.com>
References: <20211202013902.1593562-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next 1/2] package/watchdogd: bump to version 3.5
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
Cc: Joachim Wiberg <troglobit@gmail.com>, =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?=
 <alejandro.gonzalez.correo@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This addresses the autobuilder failure for master as per 2021-11-27.
The root cause was a name clash in a dependency, the libite library,
clashing with the DirectFB LiTE library header files.  Hence, this
update alone does not fix [1], libite also needs to be updated.  To
provide a smooth transition though, watchdogd should be updated first.

[1]: http://autobuild.buildroot.net/results/185c753af2aa159b494b13f78b0826dddbe4aed6

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/watchdogd/watchdogd.hash | 2 +-
 package/watchdogd/watchdogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/watchdogd/watchdogd.hash b/package/watchdogd/watchdogd.hash
index 7c1acf0820..09a34d6b47 100644
--- a/package/watchdogd/watchdogd.hash
+++ b/package/watchdogd/watchdogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256 f36fdea9b323534a704c4c23d9af8050480bca4bdad89cdb50d26fcac316d172  watchdogd-3.4.tar.gz
+sha256 33ec4edc8cb4ada7a4d8324a27d897d33aae5e83257ed64d3d37508825c11237  watchdogd-3.5.tar.gz
 
 # Locally calculated
 sha256 fd685e20931174308c45a26418a7ce34d66704c4e4b92ab1d8299deb255cd676  LICENSE
diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index 34b17aa169..b666b56433 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WATCHDOGD_VERSION = 3.4
+WATCHDOGD_VERSION = 3.5
 WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATCHDOGD_VERSION)
 WATCHDOGD_LICENSE = ISC
 WATCHDOGD_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
