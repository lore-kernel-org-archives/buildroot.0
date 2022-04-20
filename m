Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2B3C433FE
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 18:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28EBE419F8;
	Wed, 20 Apr 2022 18:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKXfB6aYEwoq; Wed, 20 Apr 2022 18:16:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC543419CC;
	Wed, 20 Apr 2022 18:16:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48D501BF3B0
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3665D60D6A
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:16:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F8srYNFgX-Qy for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 18:16:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B83160BD6
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 18:16:29 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id y16so1518982ilc.7
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ebcby+xkg/v/x5/0qG2VhYIwgIpOiFuayUIHa7sPWII=;
 b=K/DAFnMn+ogJN/4X95iJd3qSVikFGongmSEPx+XNXeHnZHGpCYk203OE19o5I4E/BZ
 cWrTJWmToPqCS5dA9pLb4RWjQoHWt09TGOoNKz+xZI7P8V+kZNwL5xq9FTpfHckoi3JX
 TI50qG29nvlCJfqTX+nJOE4K4YLCA5chi58qzPSal5mgjU4/Ql0D7Ec4dyL4amKcPysg
 6wKj6qtqoJoxwED5ZIowtTf2fFo0hyZKE/APcN8ipS46L3+TJeUlX3/UMscusNnON6kg
 gZeTThK1r3Gh2YoZMcwrJmgv2cQPc6arPMLrYu15bMI/SEUpfqbKXV/imiUGr1EDtJc1
 FMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ebcby+xkg/v/x5/0qG2VhYIwgIpOiFuayUIHa7sPWII=;
 b=ZVonSlMysyFlqaNsZCJ4rWk4vPkjXxysJ75duxKe3C200B5B3+irSz7/gXjTh3WYCu
 WjyqTF2i1ZTmQNyKcttvBX4zk6xeaWyyKNROrpQBXw9iqB1hFsp6SfcOUOMRZ/UVvxCw
 TEbpuKWd/nif5Z2OTrPeyoGxecybBwVq3s2ruAkp16RZdRiG2+muyPymblw5uoqqGP5M
 ORKdfmrd0SGOAH4K65U9K4jE9FxxrYQixFvnmSv1bZzZU/cOAsZzig3MkmItIzLLp7LI
 LzP41VyIGveTkPBGx3zYZCJBM6YPoTnaRZvbuasA057tABMdwyx/rXc6P+H3shGyyYGx
 RyyA==
X-Gm-Message-State: AOAM532/xquHEBjovsl7L3wgaLJXz54XUCA9f8/Ygbv4GcIKU8KCae0n
 glK2wuzoqXv82aCpOE5F7WBCAQ/V0y4wqw==
X-Google-Smtp-Source: ABdhPJzf0PVtAGlT6mjQcCrh1FEfJwJFvfRWOAHRsjUndCPypyzsMl8C5669m2Xp6pqGdFov0YcBww==
X-Received: by 2002:a92:ce87:0:b0:2cc:4400:4133 with SMTP id
 r7-20020a92ce87000000b002cc44004133mr4312813ilo.202.1650478588209; 
 Wed, 20 Apr 2022 11:16:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 y12-20020a056e02178c00b002cc2cd7409fsm5384967ilu.48.2022.04.20.11.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:16:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 12:16:25 -0600
Message-Id: <20220420181625.762383-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-bidict: bump to version
 0.22.0
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

License hash changed due to adding dates/author name:
https://github.com/jab/bidict/commit/b5c9f346ce0e3450a9df41c8740c32ed8b62f7f3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bidict/python-bidict.hash | 6 +++---
 package/python-bidict/python-bidict.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bidict/python-bidict.hash b/package/python-bidict/python-bidict.hash
index 59229f96d9..fe9a94af53 100644
--- a/package/python-bidict/python-bidict.hash
+++ b/package/python-bidict/python-bidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bidict/json
-md5  d9342771969dd0d42092a669ed6f3241  bidict-0.21.3.tar.gz
-sha256  d50bd81fae75e34198ffc94979a0eb0939ff9adb3ef32bcc93a913d8b3e3ed1d  bidict-0.21.3.tar.gz
+md5  da3d37ae93c740c191b5666918c3164f  bidict-0.22.0.tar.gz
+sha256  5c826b3e15e97cc6e615de295756847c282a79b79c5430d3bfc909b1ac9f5bd8  bidict-0.22.0.tar.gz
 # Locally computed sha256 checksums
-sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  LICENSE
+sha256  be0487398bba08e7772b4077b637787b94973b53c44b3cbdd6c7dab10ed15035  LICENSE
diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
index c6b7b862ea..7ba15db605 100644
--- a/package/python-bidict/python-bidict.mk
+++ b/package/python-bidict/python-bidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BIDICT_VERSION = 0.21.3
+PYTHON_BIDICT_VERSION = 0.22.0
 PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
-PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/3f/81/7221b28d692af5c5fc180c4850b8e4a48c7db92b3d529b430488f67db74f
+PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/2b/84/159749556b9c49ea4489dadeb94d44f05d6033d1db3af4c83120ecac5b15
 PYTHON_BIDICT_SETUP_TYPE = setuptools
 PYTHON_BIDICT_LICENSE = MPL-2.0
 PYTHON_BIDICT_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
