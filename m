Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B019C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 18:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08BF94055F;
	Mon, 14 Mar 2022 18:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U561b3ZHsaqw; Mon, 14 Mar 2022 18:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA462402F3;
	Mon, 14 Mar 2022 18:32:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8441BF31B
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B80760AB2
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9GC0idpWHurR for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 18:32:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 961F260AAE
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 18:32:38 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id r11so19348683ioh.10
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jv8iPxPaQu17QEFKY5kItQy0u+4kbQgs08xauIzlx3I=;
 b=I8s5EP8HGSyBVsXnEEPi0hqoVMiwe3Wc9PediPlxJ54Dcl34z0YXsfyz52YpRO7i38
 TeiJ1d6SrVMHRXIYJBjbH317gJy8hVU/vouz0zGMvItjbpRHcQaBVW/ypuGPoqaRLvod
 jzWgohQ8g5BEYP2+HucYqTP3zdrq3WQxL94nrp8/8HJuo/vMCcvTFU+0JctqohaiPjr4
 k0RlbLtOyJ8TQ8Lupzx2cv8etZd9fkT+Z1LDr3jpiiF7b6SEmClnjmGUbsfJwIdQufTq
 0eroDWh200oukQWRYBAg1urkMzLbsFhkKWfmOZOJp+Dtapyvmk+aJgNN91F8lQo9AFyQ
 qWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jv8iPxPaQu17QEFKY5kItQy0u+4kbQgs08xauIzlx3I=;
 b=S79t4HQ+5hXGYrc73Y+jTGGNLofrW8Xks0LR4PEekFI8tLg2xxsnNMycyb9XJJZSiy
 vw4BPtwet3x/Zr+Js2t8am4KA1TjZCbwbVoKsQNGUafCK7+UeoguIGG7h1HJ3tJ3BnPz
 y6tr+bxVTQj9k0kbAcV+sdwsF1cJL0UGb+DaeAy86n2U6A5sYIEdcvAEajxAXz/VQUAu
 8Iy/cRauEAjiXS6eJhIwZjkTQdV7SgtmYMgMZz3053AWHAuxvtCvrjvGYenqIGKsC+Qu
 d0dWiLNNv4rawrPgK7cMySARjgaWqD8JVd46nABi/Z2PTPG9h7teB1AgnGODFBs1cqkY
 SS/A==
X-Gm-Message-State: AOAM530bR2/F8sJyHHF4/DtW9TXPsC35UhJXEyb1dxp1IRKOMV8RnmMi
 wptDswzYw3Z33cG6cY5+NORlh6w4aAQ=
X-Google-Smtp-Source: ABdhPJylrcJSebCShjhVQzCEBincZGzEE8wa8ZhXuzU8G31GIxYVR0df221b6Bjxc5ojeSHdn2ekSg==
X-Received: by 2002:a05:6602:2cc2:b0:648:cadb:b26b with SMTP id
 j2-20020a0566022cc200b00648cadbb26bmr13903853iow.201.1647282757447; 
 Mon, 14 Mar 2022 11:32:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 p22-20020a6bce16000000b00640922b3699sm8647082iob.15.2022.03.14.11.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 11:32:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 12:32:34 -0600
Message-Id: <20220314183234.2174325-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.4.1
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
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 39ce16f8b2..af8b5c4de9 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  56a1e6542ea3627bdbc67f24abcaa341  aioconsole-0.4.0.tar.gz
-sha256  a30ad5276b85dd20a48d235111d0bd26c6bedf7b56d605ffc10ae27124b4b0b4  aioconsole-0.4.0.tar.gz
+md5  105adca78033ef1f0b62d8e81d3efcac  aioconsole-0.4.1.tar.gz
+sha256  0c0acb66b4e72d6606c9fa14ac9eb001a222c37c885b8fbdf65f41824cfa855f  aioconsole-0.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 44857054d4..a58fd33a61 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.4.0
+PYTHON_AIOCONSOLE_VERSION = 0.4.1
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/f2/7a/7628ec23f140ffca532c7f630e179503727b755849b5eab15576bbf7d3df
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/c5/16/a9de89d859eeaa0f9fdf5675a97ea1416265e1ebc039c7b9ea2c9e5433ac
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
