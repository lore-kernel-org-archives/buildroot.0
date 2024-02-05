Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BB4C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 16:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4559F60C05;
	Mon,  5 Feb 2024 16:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4559F60C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elAvoBAE0vJh; Mon,  5 Feb 2024 16:30:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96FA960B23;
	Mon,  5 Feb 2024 16:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96FA960B23
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECC4B1BF2C6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C599841840
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C599841840
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9qsd7ATwEkNi for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 16:30:28 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBCE841829
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBCE841829
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-363b6c3bc1eso8217205ab.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 08:30:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707150627; x=1707755427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uiKGU7r1k2BDVpP+x3zJHuiP3fccnqOz3EoL5FhnB3w=;
 b=nYtjWppsWZdgzl0qq5SLEGo597m4g3bsrNkbk1qI4QVJFdf1faeR+EXjiOJzjNQJRN
 KBKLZl5SxRktFDr72OAWWQblzGcX1SJQDt+0vGPNxqjRpUyNDNkqFcvYn8t9j/wOVBzr
 IH5T489IkZFY3USrxZLfJ8Kv6Tw5JY/GQ9DPWeca3AmZUULq9sPq+F4ojsyZL7TIcrd5
 PphgJKrlDvnSxzYEiiNsm/dVEkDeyBr+OiJ9WS0fyWeNBtfqcmIEHr0HvoQdLyu/excR
 1atCyrpJOhDYSdUki2AZIxqBvMDzDFqwuoRHjadai3Lf4KgJZ5+c8zdoYfX7G6nL/IZU
 gFqg==
X-Gm-Message-State: AOJu0YwZuepURn4CrVe1/lYrHE7xetx1QGCPiVyx1ecHrQUogoLoZVpQ
 sIE7frGgGn52CLvP/OubpgRinIBpEfvixmdtMZKc5Rhz+Nx+I+y1ELVM2IyH
X-Google-Smtp-Source: AGHT+IF5DiuPe9a4TEAuviHSwDEXokK1YVTGbg5jgfq2MkvuXDnNYRuuOW+hf7jMobCIbD7PiV54Dg==
X-Received: by 2002:a05:6e02:2196:b0:363:c00a:e02e with SMTP id
 j22-20020a056e02219600b00363c00ae02emr247376ila.21.1707150627385; 
 Mon, 05 Feb 2024 08:30:27 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV1hIlhOT+F/6y+5pD12hwFaq9vuB3TrobB8dTbIu8m9Us0T6l0/AX4Yv4wCFfwmQyBI5w0lVem+2lWUONJ4fheEMG36XrFBGTSv8LclDH95nFtwKObBTazteFZ/7g=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 bt10-20020a056e02248a00b003627c2f5377sm1086ilb.16.2024.02.05.08.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 08:30:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 09:30:24 -0700
Message-Id: <20240205163024.500599-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707150627; x=1707755427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uiKGU7r1k2BDVpP+x3zJHuiP3fccnqOz3EoL5FhnB3w=;
 b=N6PqoLobXwgOi1/iZ+VQgY8CVePsP1EVCmSgvCvtkA4q81s249FyTNGinY5OG+TI5J
 KjRwthxXH15EsuQoNwbmPYjv7ZUlKMYR58nxCqokRb0KeyWTwnroYypYsFMsC44ohNDU
 3WR5q7T7VF4JfxZLnxnkJ43Ok6buciqUyIO3ZA/z5nFSjqZwq33L3yW5jsVNi2nHrorQ
 pe0INi1oZ4BLguFmOg+rbq1Be/f44ddGAHVHQ785pudZDKsHMviGEkGPdHh6kk3aapC7
 XN+wyxgUvm4cN0Fj6pI0gG21oYMkaz/Fw5ksacjfclgg7HvLndgbrwZLejw3aPYwJVGD
 7rOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N6PqoLob
Subject: [Buildroot] [PATCH v2 1/1] package/python-ruamel-yaml: bump to
 version 0.18.5
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

License hash changed due to year update:
https://sourceforge.net/p/ruamel-yaml/code/ci/56b3e2666fb275deab3eec99193c103e4edf93bb/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fix package hash typo
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index 29852a51ed..b614c01d79 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/rfc3987/json
-md5  206bda0f33ab2c2f63777636200748b7  ruamel.yaml-0.17.21.tar.gz
-sha256  8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af  ruamel.yaml-0.17.21.tar.gz
+md5  24fac3544a3c7bd7eeaf6e4f704a056e  ruamel.yaml-0.18.5.tar.gz
+sha256  61917e3a35a569c1133a8f772e1226961bf5a1198bea7e23f06a0841dea1ab0e  ruamel.yaml-0.18.5.tar.gz
 # Locally computed sha256 checksums
-sha256  ab837b032c5aae84503fc0c733a116a26fd272e90dc4402fa68d3c9e51aed3b0  LICENSE
+sha256  ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index a6fed3bc2c..bbdac591ca 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.17.21
+PYTHON_RUAMEL_YAML_VERSION = 0.18.5
 PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/46/a9/6ed24832095b692a8cecc323230ce2ec3480015fbfa4b79941bd41b23a3c
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/82/43/fa976e03a4a9ae406904489119cd7dd4509752ca692b2e0a19491ca1782c
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
