Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EECAD2AB3C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 13:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C30F6077D;
	Tue, 29 Oct 2024 13:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GRzYu8LA5Ij; Tue, 29 Oct 2024 13:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2347860855
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2347860855;
	Tue, 29 Oct 2024 13:59:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16716112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBB014023C
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmZsP-h87Wvz for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 13:59:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10449405A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10449405A0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10449405A0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:59:00 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2e2ed59a35eso4476953a91.0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 06:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730210340; x=1730815140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QP7sQjs0NiwupZRhPq8g4PerYcgG0AGbi0vpDojW5RE=;
 b=brPLOUYljtfb4bBs1fcfn6llF4/xsZbtp8WEXKVYFBLqtPk0j9Arnn1l9fBnKAgvrr
 QcAl2DLCgqcRdML5yh007tcKM92CyOF4M0qehl+pSgpeJNQs9WdqIuWnymNxHChC3w/V
 CrX47Dqcx+OtQxmNhlIYNBENOg0G4PnNj0/BLn37hRO0H2CqfWQRvsjyNqp/FQs9wjAX
 +iWz0llPxnvApNBy5aG1IfJ5pz/6m9U3CrncjUeNSd/fLUZdYhwLTUllnVRCkxno1wWz
 3QEznXkhuDROVXlTGzs5sShNGoIkExVv458zIDdoxdcY/km7ummoDKyMIjVFaQeJi933
 IbDg==
X-Gm-Message-State: AOJu0Yxd2RF7jYqrMQnkqqlqKxBkJnddB3xfoNv8U9/ucLKBvbwE96DW
 mwPa6h1dERfV0nYgrXL7dF1k0F8iYdUk8BotRzp6y7bfDAZQWnld3eTVFoy1
X-Google-Smtp-Source: AGHT+IFW5Z1apHTiN31cl/fx1haPTwBklv9CNRRVk5hy9wAriFNTOAii3GnVMXVNO1p2DLRYkiptPA==
X-Received: by 2002:a17:90a:510f:b0:2e2:cd65:de55 with SMTP id
 98e67ed59e1d1-2e8f10723a7mr13311607a91.20.1730210339819; 
 Tue, 29 Oct 2024 06:58:59 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e925cd952dsm1221133a91.57.2024.10.29.06.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 06:58:59 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Tue, 29 Oct 2024 21:58:50 +0800
Message-ID: <20241029135851.1063521-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029044843.703796-1-fancp2007@gmail.com>
References: <20241029044843.703796-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730210340; x=1730815140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QP7sQjs0NiwupZRhPq8g4PerYcgG0AGbi0vpDojW5RE=;
 b=aFW6iZRU3Y7feECJkrNXwfyRDb0jAvTwXOLYSUP/Lc75y/2pUnrZkyspWXgc+7UZeV
 02S8TJrPTwoRIHvXuu2UKV4QoZWd9GAnxynulJsLNAxKDSZhOVYmWD5bPlwl2ZE122mC
 PUuZPh0QixxIqM0VBrA08ZRQ9guf64tbQm/h9dZa7ZA6HautAYBNCJ6RNDgYFWVqVMFC
 MRKJg2oXwFamYttZeEip44FLybkX98mxUvBY0irZoAgh00TYh0JaQTHfOol3+zqVhYMK
 x6Lm5kI/6U+ndJQajzw9ioq7Vq1a+x5rq6llblLnFGVRuN6gQ3w90iVRlQ9POC+LLVyv
 4xCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aFW6iZRU
Subject: [Buildroot] [PATCH v2] package/procps-ng: fix typos in config
 option and help text
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

The option has been renamed, so add an entry in the
Config.in.legacy file for the old option name.

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - add an entry in the Config.in.legacy file
---
 Config.in.legacy               | 6 ++++++
 package/procps-ng/Config.in    | 4 ++--
 package/procps-ng/procps-ng.mk | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a041d4da42..a6cef174c7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP
+	bool "BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP has been renamed"
+	select BR2_LEGACY
+	help
+	  The option has been renamed to BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP.
+
 config BR2_PACKAGE_QEMU_TARGET_NIOS2
 	bool "qemu nios2 support has been removed"
 	select BR2_LEGACY
diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 4afd01699b..7af0e97fb4 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -11,10 +11,10 @@ config BR2_PACKAGE_PROCPS_NG
 
 if BR2_PACKAGE_PROCPS_NG
 
-config BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP
+config BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP
 	bool "Use original top layout"
 	help
 	  Disable modern top layout, return to original top with
-	  detail cpu usage.
+	  detailed cpu usage.
 
 endif
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 4ac82cf6f9..c5185c2c8a 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -56,7 +56,7 @@ else
 PROCPS_NG_CONF_OPTS += --enable-w
 endif
 
-ifeq ($(BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP),y)
+ifeq ($(BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP),y)
 PROCPS_NG_CONF_OPTS += --disable-modern-top
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
