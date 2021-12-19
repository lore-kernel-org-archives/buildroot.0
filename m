Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FDFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 17:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FCFF4178A;
	Sun, 19 Dec 2021 17:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBKEn31jeW_J; Sun, 19 Dec 2021 17:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03B114164D;
	Sun, 19 Dec 2021 17:39:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 861851BF336
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 17:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CD0960B64
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 17:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3iFM44N8HEf for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 17:39:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 708A2605BE
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 17:39:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 a203-20020a1c7fd4000000b003457874263aso5707752wmd.2
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 09:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uhqk7Bgorlgvl9QdENAbDWDUkIZtF7SJY0zC48asCBQ=;
 b=DaWEZFetqBO1M6a3pu19LsIeLQ+C3G9tBz7R0k19EkcosYzNOlSV3JVHtscwDRw3qo
 a6+ZSqmTVGNSte73jYXdmTfRViJTRMoFO9NkeUeJi1X043R+ErUC4fVR4bGzgU3GuFCK
 Abi9EwyFgIISk44eWJPnNRd5juzpTsMqY71MxaRBT7k2+dxrUchWs4BwNrr+Zcu9dsbM
 rd98t6TYe7p0gbHGtPhNDHzLPYqf/Ip/f//DMg9+hS6OzPji10XGj9EirheJ9yjSgDwX
 Zj1fjBONnckafl+LIaYe9Op1b/U9X9VVVAWoQs3iihISydeg0q61P/xdX5Xigbag7tiK
 AM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uhqk7Bgorlgvl9QdENAbDWDUkIZtF7SJY0zC48asCBQ=;
 b=z2soZ/JWz0TtD/b9rDYtIgPTTjBsdY8/RZGzy0KoxTvamlI7MJ6yTeywRJ7MReF92N
 RJRQ98iK6lmWONtNNdoXf9hoyL/9VwidsOaEOTnQtF8v08+U9HvfZ7peF3dDkidKAz/e
 7fYD8sttJikQ/mWkeHDGxrTSwIoa5jxROrfRpBvnfgH/1tJGRXd1DtYPb0tIGxefOw5l
 OiYkbNiSnGwMbdMQmT+rDuHVqm6zSXBUS5XeM2IwV9Hxd2UzVXuqJdyjpd49g73L6dch
 V/k5+YjN258RRQwcTh1Dl4fELAGfrsEtQMqRk1wYUu26vMr+n9MubIO4kuzF4Ej56yWE
 vsig==
X-Gm-Message-State: AOAM531FicSC+96WqN/gIt5S9ZwBbZRL89dcnKoEDDRqdKLKBar/anFS
 mmb2Q6U103F2jp3q5ia0cF7DsH3E0XDqag==
X-Google-Smtp-Source: ABdhPJxgkBLuTpOA+LYLK4XfOFL4+fui7hMUSzzjB1xvU3fcnB2M2fJMP5X2GSPqQJNmo2C0To2BAQ==
X-Received: by 2002:a05:600c:5009:: with SMTP id
 n9mr6944507wmr.162.1639935545517; 
 Sun, 19 Dec 2021 09:39:05 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id az11sm1033212wmb.30.2021.12.19.09.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 09:39:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 18:38:30 +0100
Message-Id: <20211219173830.1364434-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: security bump to
 version 4.6.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- A vulnerability (GHSL-2021-1038) in the HTML cleaner allowed sneaking
  script content through SVG images (CVE-2021-43818).
- A vulnerability (GHSL-2021-1037) in the HTML cleaner allowed sneaking
  script content through CSS imports and other crafted constructs
  (CVE-2021-43818).

https://github.com/lxml/lxml/blob/lxml-4.6.5/CHANGES.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index dd6446e6cc..e33a8f8109 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  39b78571b3b30645ac77b95f7c69d1bffc4cf8c3b157c435a34da72e78c82468  lxml-4.6.3.tar.gz
+sha256  6e84edecc3a82f90d44ddee2ee2a2630d4994b8471816e226d2b771cda7ac4ca  lxml-4.6.5.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 0d3775a1bd..8c2e965af6 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.6.3
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/e5/21/a2e4517e3d216f0051687eea3d3317557bde68736f038a3b105ac3809247
+PYTHON_LXML_VERSION = 4.6.5
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/e6/e1/34b3ab08553fe9a30e15b2bb9d1803a49d7d907dd9f245638839190042f0
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
