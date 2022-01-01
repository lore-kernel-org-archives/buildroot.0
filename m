Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE0FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 08:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A1B460E0D;
	Sat,  1 Jan 2022 08:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-o-7DXWV789; Sat,  1 Jan 2022 08:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72CFE60759;
	Sat,  1 Jan 2022 08:06:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6BF1BF5A7
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 08:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2910F60759
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 08:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 44NU2SJ-pw21 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 08:06:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 544EC60596
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 08:06:24 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id h23so24747861iol.11
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 00:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ThJkjLo3GLx8BM//qfElv+Bcf/7CMxthffty2v7Un0=;
 b=AH5LuLJAuHbr9La4l4ZWby8oBT8ol/wXRkLRkOcmtOwupADkY2PDWI3wZyu/OVegGy
 4kGaUueldCIeJmjLlnLMxhizdiqJJKo44+fZu3qljt+8FVnZBV1cYteyTKcdRvLKMH/4
 lrf/iIEoUIoCKshiX4ZJr+CIqcw59IwKLF4gyCxMhSZP2jidW7mJi6//68pdxdrgwbuy
 8vi246+xN9OEKxEpgMtZ7a8sjs6POibB0O90l09Jsm4UXVX2+vGkI1fCUIUDFCCj6H+t
 x2cNobFEZ9tqSuPAorBheu0VYjhKOAthcg1Thib+hcPK8qB4cxYGDsenQ93EGbdDg2aQ
 P+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ThJkjLo3GLx8BM//qfElv+Bcf/7CMxthffty2v7Un0=;
 b=kUW9WkuWGUE1ZnnuihDjy91e9h8uD2IlcYt663opu0p/LNFG05bznght5EAA8wqCom
 FlGbmC+ayQH+fIzBs4IfEJM8CzrvtxGpaMZD/7NCZ7BAqdWY6CCN2ohjGf8KlfxPYWIC
 Hssk/YHfiz7d6koEDnmj0WPrxWd+sgbrO74Vlou7a+f91Imz0sgL/1KnjjXe6rBud0HX
 Muh+ydOHrcyTLYhqNCUHAh5NGQBqf05VIHuX+iLO/Muq4K9g+cjCu/k9TDpFfogEaeHM
 hW812fJK6BX1foB6NZcRNg3Udhot1SFsfXVP6vZKZ0egS3EYLW2Uw4OM0L7jaYnpI+Cs
 RXeA==
X-Gm-Message-State: AOAM530N3h8V7W7dXLq4TEunjcD9d8Eoa2D32qyY+6oNtNj8IiUc5ZVL
 ucdKn9QiWBjwoRYpHIZQ5emgkvYH7/A=
X-Google-Smtp-Source: ABdhPJxxnMkIu0m71lJacFwjgV+5TMiyOjQ401S4U2eVxu0SumBvbVanVTmlZUp7yNbu8KYM9RCOOg==
X-Received: by 2002:a6b:e917:: with SMTP id u23mr17042439iof.211.1641024383200; 
 Sat, 01 Jan 2022 00:06:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id g8sm16135473iow.8.2022.01.01.00.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 00:06:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 01:06:20 -0700
Message-Id: <20220101080620.1997183-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aioconsole: bump to version
 0.3.3
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
index 45139a6606..26a3778756 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  b8cbcb6e00d8e535256526dfe4f27db3  aioconsole-0.3.2.tar.gz
-sha256  9355b36d41d5fbdd3dbb01510deb2b985b508b2ebcd5b8bd85af61a707e2f6c8  aioconsole-0.3.2.tar.gz
+md5  f8b67330e631cfc45a9b2560a6e0fa98  aioconsole-0.3.3.tar.gz
+sha256  47df42d9f8cc3995bbe032dd5f01d32cc5b06639e9078bb9b4e3c55b237f5e32  aioconsole-0.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index 75ea3c2a2a..f06d91a550 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.3.2
+PYTHON_AIOCONSOLE_VERSION = 0.3.3
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/7a/b2/747ab3cb965596cd84c5159941613d901d8771acad3c51c4f5da362aa9f0
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/dd/f6/bbc451ba96c1e1da6aa253f254b181ceb03272b475b27b481b57865d7d7f
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
