Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7D8CF9C6B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 02:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 545B540124;
	Sun, 22 Sep 2024 02:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEjeIEtJKqC8; Sun, 22 Sep 2024 02:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0373E4036A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0373E4036A;
	Sun, 22 Sep 2024 02:53:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1DC1BF419
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 02:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A6634036A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 02:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57tmAG4YKtHa for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 02:53:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44D6F40124
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44D6F40124
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44D6F40124
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:53:40 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a08dbc6019so15078865ab.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 19:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726973619; x=1727578419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tpAMkag5Gi0rh1elzcHR42aXVKDB8QVskWDSeQGJnBg=;
 b=S1+dZSfDp3swcVPqWZFN6/DRheI9IqOXES+yojCzWDUZmejDRmjZRthTWs/4maD6Wz
 uJ82D8LLy1aTLnqW92EtM8YBpEkIStIv0Jl/tydFZjeEqzj4mcYynQO/gC4Bs5/W6+z4
 /PtAxMHW7lGTMZiRXcF/vt+st2FqlGL0Dtw0jzUY1hwJiyj+d6YImv6PcQKFMFuVjaqW
 H08CsK+PzXmtx/f5gy46sMOGJHclF/jsSt3Duet3jMmxPf/hWHh1Xk5TqdhIq8L4Lqgb
 MuDTRxgpf0yubPi2jY3GtSO+z8FBDak7r4PbwsxSQRhz4kC2W9Yk1UCVeqOLK7TQHY5n
 2DOw==
X-Gm-Message-State: AOJu0YwcicmHgZhfoRrZCu97JmXPdTs6atqAc4pXPZovN1dsTCN/rzGN
 5f4MU4o5tvMmI2hmmLFuuQX9d3STnDxmLoGKx7+N4rAYf451vwFbufgQvA==
X-Google-Smtp-Source: AGHT+IFQWXVq5TffKKpYp0W+4HM3DXMHCzEncaY8oFFXNSTmgsAGEL+MKcgh9Y/qe8HW30LGWzCJFg==
X-Received: by 2002:a05:6e02:1c2b:b0:3a0:436a:5f99 with SMTP id
 e9e14a558f8ab-3a0c9d78265mr59630635ab.21.1726973618808; 
 Sat, 21 Sep 2024 19:53:38 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13d3dsm4383322173.118.2024.09.21.19.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 19:53:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:53:31 -0600
Message-Id: <20240922025331.747307-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726973619; x=1727578419; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tpAMkag5Gi0rh1elzcHR42aXVKDB8QVskWDSeQGJnBg=;
 b=LX2VMjEkiY1ROQMChCn9LSN4w/8Ys7SdAy0LctQRSL5V8V8dNuvQj0dmBc7pvzgWam
 czZLtJcw6DXH8Q/Ye1kgHikeNEHvOKqf18HMaQ0Tp7KwD1VFojFG23U2ZCD6iX2wshM+
 stYSzN0AYPUGUvsvw2tvhKp8wRd2lhMCjymd0jIJzXaznA6YmI6qbEkmDbW497w8OJuM
 bh4gJ++HYIaHLBZvo+AwJymKwOBaM5wszJXPceXZlPoImX8G4A7ABe1orqNeNIk1M0mL
 ox8t0Xg80XA8TZ375OAj7oRivul8oO99WlEQkG0OsAuQS7t4AR51B4QohqefdNSiYGRX
 t5kQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LX2VMjEk
Subject: [Buildroot] [PATCH 1/1] package/python-socketio: bump to version
 5.11.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index a7756eb39d..709278fd5f 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  207c7452bf6f1f444d8b70cac8801647  python-socketio-5.11.0.tar.gz
-sha256  b03186e04b942088781f6286c13604a853e5e35ed59158c51ff7af22fa032e6f  python-socketio-5.11.0.tar.gz
+md5  d55f0439cf7d056c0dca99fe13ad8054  python_socketio-5.11.4.tar.gz
+sha256  8b0b8ff2964b2957c865835e936310190639c00310a47d77321a594d1665355e  python_socketio-5.11.4.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index dc0c24fef5..bc6cef6fc6 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.11.0
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/7a/e1/2817819a5635a099fda9fc758c51dc2f07996d6928d744639afcf5c5ddbb
+PYTHON_SOCKETIO_VERSION = 5.11.4
+PYTHON_SOCKETIO_SOURCE = python_socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/32/31/4ba0d9d86c645ba335d645f49167ca58b0874ca0e421682f97964e8adb42
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
