Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9BFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E5240308;
	Sun,  6 Feb 2022 14:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDtMn5cP2lio; Sun,  6 Feb 2022 14:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9C6340301;
	Sun,  6 Feb 2022 14:40:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F46D1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 186C560B75
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:40:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAbgPUsRhCoV for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:39:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0852D60B64
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:39:58 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r29so2533232wrr.13
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 06:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wvJX98fHWoIbUKk8H2/AD2PjDqthILGE7efpsG5w+AM=;
 b=NGLB/fpQ8RYAJvw3p/sHBhwXdP4octJ1/xCUEZu571Bn0QlUjybIJ6bWbQyRN3a9v3
 pKp3dV8e1WXa6KFHpAqscXiY4MJgsUwcHgwq345hBKVEKtOXSX5jtPn8vHsMML0q9NWa
 VcsNt2Zw/FhfonfaVfdQicrSIBvlTNGmsk7YwnyYbUARMi+LQVyRfC7Txjx/BzZeEvow
 qkAEbwYT8ZqCgo8GiWkiu8bUf+Mr0Q+GEoMuebAYtLLjfPgsDoLXEMfaU88I2oQwIsQo
 s2tnX+G2j9BHnObXiHOjKhXt4lW3miKlU4JfjgIr8C7Ze0zbAdSIDXAaOv7Wu3OBXZhu
 Oh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wvJX98fHWoIbUKk8H2/AD2PjDqthILGE7efpsG5w+AM=;
 b=Avphc+YejRXSOTPZIApYKHQoMMfccl18EKefC/gZ7GMYWX6tF1eZuRcyiDpPRdncs5
 kY/H2NOMuHn9i7KA1jDCJ5dMQZymgpIsRFyblU0AfcOqjzZtbpI3gGx5Q9c/k7rbJhBk
 xRGoGkwVD9XmiR3hsJSbcf81KXQGfaLYDzY4vNIpO6Lb/TJq6yrNRe6zCC2VwORMSiy0
 nTSOxhXwqdvZH17OfA3jWlCEY6OnNmtxSAchLTW+Bq/WtFPOBD4SCjKNseLNpqJzXOAf
 th4mQyzJ90jRUoIoIChLJAooP4LyA/kqtbTMwxXhF37lHcCgE9vqaxEGR3qSwq7Cbxq/
 HTdw==
X-Gm-Message-State: AOAM530uANske9tFuf6fENYAgcRS2HFtYDr7CxtVSAJPKCpLGnASzsNa
 UdFAhCWMd9q+kuBV7DiYcVRgqpDDzjA=
X-Google-Smtp-Source: ABdhPJyPuybXDh+WobSyCmPfzmm5ydVPmUhjNqnQXXUfDbE6w0MLsXCOG9YjJIVR20NHVzjoxEN23g==
X-Received: by 2002:a5d:5888:: with SMTP id n8mr6702483wrf.224.1644158397049; 
 Sun, 06 Feb 2022 06:39:57 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id r16sm6547149wmh.30.2022.02.06.06.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 06:39:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 15:37:49 +0100
Message-Id: <20220206143749.1754530-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pysub: bump to version 1.2.1
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/pyusb/pyusb/releases/tag/v1.2.0
https://github.com/pyusb/pyusb/releases/tag/v1.2.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pyusb/python-pyusb.hash | 8 ++++----
 package/python-pyusb/python-pyusb.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyusb/python-pyusb.hash b/package/python-pyusb/python-pyusb.hash
index 9c634ef722..f08b212b3e 100644
--- a/package/python-pyusb/python-pyusb.hash
+++ b/package/python-pyusb/python-pyusb.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pyusb/json
-md5     a9db479f1fb914e91d3106e67a13ae09 pyusb-1.1.1.tar.gz
-# Locally computed
-sha256  7d449ad916ce58aff60b89aae0b65ac130f289c24d6a5b7b317742eccffafc38  pyusb-1.1.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyusb/json
+md5  880008dff32dac8f58076b4e534492d9  pyusb-1.2.1.tar.gz
+sha256  a4cc7404a203144754164b8b40994e2849fde1cfff06b08492f12fff9d9de7b9  pyusb-1.2.1.tar.gz
+# Locally computed sha256 checksums
 sha256  03e39fdcee9c18f2f9d0c3500a993ddeac050695eb81070ea41347587c76a7fe  LICENSE
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
index dc81efde9e..2f4f9581b6 100644
--- a/package/python-pyusb/python-pyusb.mk
+++ b/package/python-pyusb/python-pyusb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUSB_VERSION = 1.1.1
+PYTHON_PYUSB_VERSION = 1.2.1
 PYTHON_PYUSB_SOURCE = pyusb-$(PYTHON_PYUSB_VERSION).tar.gz
-PYTHON_PYUSB_SITE = https://files.pythonhosted.org/packages/b9/8d/25c4e446a07e918eb39b5af25c4a83a89db95ae44e4ed5a46c3c53b0a4d6
+PYTHON_PYUSB_SITE = https://files.pythonhosted.org/packages/d9/6e/433a5614132576289b8643fe598dd5d51b16e130fd591564be952e15bb45
 PYTHON_PYUSB_LICENSE = BSD-3-Clause
 PYTHON_PYUSB_LICENSE_FILES = LICENSE
 PYTHON_PYUSB_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
