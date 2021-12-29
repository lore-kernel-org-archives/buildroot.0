Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8DCC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 10:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E869340196;
	Wed, 29 Dec 2021 10:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l98pUFXs44CO; Wed, 29 Dec 2021 10:30:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8EE040183;
	Wed, 29 Dec 2021 10:30:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 380CA1BF424
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 10:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 250294014D
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 10:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NzOfCEvQkY5h for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 10:30:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4CBF40022
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 10:30:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i22so43473186wrb.13
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 02:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ulEoqoz80er2KReKT8SVqxCw7dlpZil9DO0oI4aCqEE=;
 b=koblxiJntrygMtzQFqWJdWCTAjkZAD0UJpIh1+whSbnU84TzMZ+vAaK/o5qDbL4gEt
 Cv0wbsWACo5uNHMqRfXMbW3BIzMym76wjp381g5yLLX7yOGCQLf+1NAXLbHVGhkE5Hpq
 ATs9AJl0PI5AhKcyqi9BD3FfqLfWRy8cArcDXjqdL58qiy3M7pbi8//Ju0DXk7Y61xMY
 HnAtYNOFskH6xMO/s2X/RLCmVc2gENlQVYTG5stanV0ANMFHQRhZX+/Bq6bdbdopvLES
 bzbqPWqHIRniiRn37BLiVP8IvtadDv9450nwStX3dYKq90cUrnakMPQgjm3w6qHvyYvE
 ykcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ulEoqoz80er2KReKT8SVqxCw7dlpZil9DO0oI4aCqEE=;
 b=Xtz/RjCm6Kijm/Nb0dLLqB1mf81CanMU6lRqbMxJNUHkMeYR6nKRlec0YePPDH2KYf
 Ah5HyzGVK1fdl8w4sgggdN8v4bowlp5iWWGrpg5Su7IMyi9XvAx4i3Az9ZzrKIcEh8Ou
 hwc2zm5+58zTTYWb5XUJDO+o4IeJ5JT+ZXqh3ofh5pv9quTvpxar7NDUiobITgLyWnpc
 bNSyLu9brorqhhuTT/kcEyj2GjOX2AUTygwrYISS9oNIZ0IlbUBO6j751QX388t3vyOn
 L+37lGmSNCPKRWRhwHBLIuix5zNKev4OCN5tWQRSNYJR6EIO+Fx37SSE1wfk0aYSUdnL
 46lQ==
X-Gm-Message-State: AOAM533AoAdHDIKR/7YuAMDVQ1wZ6H9k6hIpVqSg9P2FPaO5L5Gd4jzA
 HdiZcc3/Cv4cCq5IhM0q7pnSyO5WMAA=
X-Google-Smtp-Source: ABdhPJw0nG4uCPyrJdBbA/ShCHVLasE/NyAb7G9Gjkw91IwskzPLa5OVEwmEx6N5jKeameYnDpCjzg==
X-Received: by 2002:adf:f001:: with SMTP id j1mr19582580wro.431.1640773810928; 
 Wed, 29 Dec 2021 02:30:10 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id ay29sm22937678wmb.13.2021.12.29.02.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 02:30:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 11:29:27 +0100
Message-Id: <20211229102927.535401-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cycler: bump to version
 0.11.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- python 2 support has been dropped since
  https://github.com/matplotlib/cycler/commit/2a8831489b8ea05614459afb3135db3248890268
- Update indentation in hash file (two spaces)

https://github.com/matplotlib/cycler/releases/tag/v0.11.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-cycler/Config.in          | 1 +
 package/python-cycler/python-cycler.hash | 7 ++++---
 package/python-cycler/python-cycler.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-cycler/Config.in b/package/python-cycler/Config.in
index 813bc69dd4..39ff23e45f 100644
--- a/package/python-cycler/Config.in
+++ b/package/python-cycler/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CYCLER
 	bool "python-cycler"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Creates a Cycler objects much like cycler, but
 	  includes input validation.
diff --git a/package/python-cycler/python-cycler.hash b/package/python-cycler/python-cycler.hash
index 8255458b26..cef416a86d 100644
--- a/package/python-cycler/python-cycler.hash
+++ b/package/python-cycler/python-cycler.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/project/cyclic/#files
-sha256	cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8  cycler-0.10.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/cycler/json
+md5  4d0c25f418956e91c47163179682e0ef  cycler-0.11.0.tar.gz
+sha256  9c87405839a19696e837b3b818fed3f5f69f16f1eec1a1ad77e043dcea9c772f  cycler-0.11.0.tar.gz
 # Locally computed sha256 checksums
-sha256	f1218143d766da3fea66f13396b7f15df46a83303f29bf96ba6e98eb4d42f408  LICENSE
+sha256  f1218143d766da3fea66f13396b7f15df46a83303f29bf96ba6e98eb4d42f408  LICENSE
diff --git a/package/python-cycler/python-cycler.mk b/package/python-cycler/python-cycler.mk
index fcdcb148a1..03155d7241 100644
--- a/package/python-cycler/python-cycler.mk
+++ b/package/python-cycler/python-cycler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYCLER_VERSION = 0.10.0
+PYTHON_CYCLER_VERSION = 0.11.0
 PYTHON_CYCLER_SOURCE = cycler-$(PYTHON_CYCLER_VERSION).tar.gz
-PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488
+PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/34/45/a7caaacbfc2fa60bee42effc4bcc7d7c6dbe9c349500e04f65a861c15eb9
 PYTHON_CYCLER_LICENSE = BSD-3-Clause
 PYTHON_CYCLER_LICENSE_FILES = LICENSE
 PYTHON_CYCLER_SETUP_TYPE = setuptools
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
