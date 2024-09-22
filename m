Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECDACF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 05:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F41A4020C;
	Sun, 22 Sep 2024 05:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNfz4epAhxsX; Sun, 22 Sep 2024 05:37:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F4B540237
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F4B540237;
	Sun, 22 Sep 2024 05:37:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D46D1BF3C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 999F2813D7
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lo6Rf8_EwygJ for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 05:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E1E0813B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E1E0813B8
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E1E0813B8
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 05:37:35 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-39f54ab8e69so14649885ab.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726983454; x=1727588254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S+TSjab96ROM8k8IWOUOqZmrI/t2BklVrf3f5MixxUU=;
 b=HQkqkswZuZjQLpRGAhXiLgqZv91ladldnE09pruMm21EY8FiGL28bcbhcMSz2hX01X
 N3kVrxS9WqYyMhgQVFbdWdCfzEJQEScAzpUNqkLeRdZ7DM4rHUtyFZgvQ1hWTzZP4aTE
 3eMjiLYKL30s0zBT1Uhq6fVlBSimQ/Z4XTrSQArBhELCWEC3+1gZlHSV15zdo3rGmFTw
 9CMz6fZodsSYc9YYOXlkEUmefsxKHxz4Xd6BwiN0/4hs5QEUMak8f0/TESpw6klZ1KsP
 NMMorTCGOeCcKO6e/3AIidE7DWKoC+nVd1R43XJZNyLWcubxPXOa7kFNQPT15qp4Wh42
 H6mA==
X-Gm-Message-State: AOJu0YzS7ZM84gdOgMsnTtuyIUmpquo+g12GrKBt2gv5JZIeWqUQW+Ug
 JMIl+LXJvBfOiR3JeOUOUqFOZTVO8Rx1Y16Ws9ZE4uty2YY4wyghIEt4yQ==
X-Google-Smtp-Source: AGHT+IGGmKbTLsvF9BFUEC6BEedESBS6C8waQ9l8lUdfC6gANQxntuUdurDR8U0P2NffGgKqt5tdwQ==
X-Received: by 2002:a05:6e02:156d:b0:3a0:98ab:7932 with SMTP id
 e9e14a558f8ab-3a0c89fd980mr54761735ab.9.1726983454072; 
 Sat, 21 Sep 2024 22:37:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a0bf5c52casm23901115ab.52.2024.09.21.22.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 22:37:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 23:37:32 -0600
Message-Id: <20240922053732.940911-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726983454; x=1727588254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S+TSjab96ROM8k8IWOUOqZmrI/t2BklVrf3f5MixxUU=;
 b=drJvLk9FsHTO98hMSInQrS0XUmTZr4FUwf4atmpowj/nn+aNAw1aUhIyd89NwUPp2e
 2Ic5x7EHHF8Dhy4cqwy32eBJyGztEgVcs2m1EBm0fZIA9bc789+W/3Zd3OwIVjJ3oxkn
 haxZyEALdly68WZYeOjBwSF0cpHa5PyL2mTWFgdgbl4qxxQ/DqOGAPJ01AEvhUZD4N1y
 JAgpRZeV7nW8aRGUFTB3kvFvGDiYiZwoJpoMbr7LyWqQDXbgOpgE3CykvIVv/Srazchs
 UBT2Ozj15VmkApOT3M6p2aray2RVqrg+7q5xs2Tr93o8/eAwaXvTY4I7ePnDSKfzPBbx
 P7uQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=drJvLk9F
Subject: [Buildroot] [PATCH 1/1] package/python-txtorcon: bump to version
 24.8.0
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

Drop no longer required python-idna runtime dependency.

Drop no longer required python-incremental runtime dependency.

Drop no longer required python-pyopenssl runtime dependency.

Drop no longer required python-service-identity runtime dependency.

Add new python-cryptography runtime dependency.

Add new python-twisted-tls runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-txtorcon/Config.in            | 9 +++------
 package/python-txtorcon/python-txtorcon.hash | 4 ++--
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/python-txtorcon/Config.in b/package/python-txtorcon/Config.in
index fbea7be8cf..e96ba678c6 100644
--- a/package/python-txtorcon/Config.in
+++ b/package/python-txtorcon/Config.in
@@ -1,13 +1,10 @@
 config BR2_PACKAGE_PYTHON_TXTORCON
 	bool "python-txtorcon"
-	# python-pyopenssl -> python-cryptography
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
-	select BR2_PACKAGE_PYTHON_IDNA # runtime
-	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
-	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
-	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED_TLS # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	help
 	  Twisted-based Tor controller client, with state-tracking and
diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index 9c8e3599ea..b322eac23f 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txtorcon/json
-md5  17a84954a4ba13fa6ee443129bdc401a  txtorcon-22.0.0.tar.gz
-sha256  89a1b65e32a4b369d67e6c166387fbc468cc5d05227448d239a5e7e9718aa053  txtorcon-22.0.0.tar.gz
+md5  c3e9d8fe545effa09c0e43612c91ca17  txtorcon-24.8.0.tar.gz
+sha256  befe19138d9c8c5307b6ee6d4fe446d0c201ffd1cc404aeb265ed90309978ad0  txtorcon-24.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index c17d5da074..13a2454d6a 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 22.0.0
+PYTHON_TXTORCON_VERSION = 24.8.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/47/ca/7941660345c769637a97bdbaf25202460fbab35eead55c538fb1fe61b71e
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/b9/9f/7815b07d8bc775d9578d9131267bb7ce3e91e31305688736ed796ae724d1
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
