Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633B0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 18:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1E4940650;
	Sat, 19 Feb 2022 18:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vEyLfxG9gkQT; Sat, 19 Feb 2022 18:16:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F760409BE;
	Sat, 19 Feb 2022 18:16:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFC711BF576
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 18:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDB51823CB
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 18:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KO1o0U9od9LG for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 18:16:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6C7481B0A
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 18:16:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m27so8079212wrb.4
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 10:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VQXb5txRS9Nh3nsycZA3SlIEe9DvsuzO0VXTOl1LUio=;
 b=D1ygdsOjnip3cphR9zGnaTzZzVq6BGRM7HOAVYhMqknHls+v6ivTQ6cejN/rD4uXzR
 o+KozE96mh1hPEguR7rHzWQW+6iun/y6gxlSBxaSh/wwyfFWCLpAV1rIOiX2St3QO6jo
 fLLgnsX1FzzgweCHX9QfTxxhOxRoZEHuyLuSEU/+g6kyuqalr/nGPTdWhKRAAd2042Xa
 eU7y4QLQkUhFtJWEGJQZTH1aICIlANuzojDx7QjDySAvgkKyDP1TAqbia9TNy5vXGAk0
 tosTyggUxtOx3RQ19N5RZ2n9cu8e2F9VA+jEmgaiVvAA1P07G9GXOs6/Dvcmlyw4DfMB
 fc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VQXb5txRS9Nh3nsycZA3SlIEe9DvsuzO0VXTOl1LUio=;
 b=V/sWXZx2VXAZ94TkaCckKYiNVZBMOdLewCgo+wdJKy5oEwk82S3S2glm3U7TzMaBc3
 HviJ0RmAqrXsy780K+en1tsDAv5w/Mtb6GHX4F2YdHvEdtPt526FDJkvlPlJ0z3iCMI9
 MZ25uXY4v6yRd7OBwL+iJiLAGvD+6ls8R8PIEeQUjftYFg0cpjcHUq6PD27eVo4vq7N3
 zYgGmUMmf4G7mroI+3pcRpxrA7CO8Q+D9WxBlP42dbML0sdxSdKlGJrvAJOcqyS5UVNv
 PIVwLx/8zg/PeGHfQ72yCyT7Z7NO9OdsWtROdTsk43UehjNLB5HCOrz2Ecb/iZiJFJD3
 XMcA==
X-Gm-Message-State: AOAM531XP9qju9fVQS/o1STePHajunQUQslCJBJXn7axGul1PETsDM7A
 u1w6Y/enN8IuZDvcNQKhgfGtVLW2RgBgUw==
X-Google-Smtp-Source: ABdhPJz9ce6l/CrQP0GJiGgkdIlla+yNrKCklaeT0Y52KuFH++1ryaE870nWOqlPQMpuh93VV3bpDw==
X-Received: by 2002:a5d:584d:0:b0:1e3:2157:d85b with SMTP id
 i13-20020a5d584d000000b001e32157d85bmr10052125wrf.451.1645294562632; 
 Sat, 19 Feb 2022 10:16:02 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id
 129-20020a1c0287000000b0037bc55c8fabsm3039397wmc.12.2022.02.19.10.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 10:16:02 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 19:15:54 +0100
Message-Id: <20220219181554.32204-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-joblib: new host-only package
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joblib is a set of tools to provide lightweight pipelining in Python

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

---
host-python-joblib is a requirement of python-scikitlearn,
which first requires the current python-scipy work to be merged.

---
 DEVELOPERS                               |  1 +
 package/python-joblib/python-joblib.hash |  3 +++
 package/python-joblib/python-joblib.mk   | 13 +++++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 package/python-joblib/python-joblib.hash
 create mode 100644 package/python-joblib/python-joblib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ac702d8d0f..ca2e6e81e7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1148,6 +1148,7 @@ F:	package/libnids/
 F:	package/libxcrypt/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
+F:	package/python-joblib/
 F:	package/python-pybind/
 F:	package/reaver/
 F:	support/testing/tests/package/br2-external/python-pybind
diff --git a/package/python-joblib/python-joblib.hash b/package/python-joblib/python-joblib.hash
new file mode 100644
index 0000000000..5023ba872c
--- /dev/null
+++ b/package/python-joblib/python-joblib.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  4cda464ca712a4814849c9477d7551b696ce215dc05d79fc516460814ef48f4f  python-joblib-1.1.0.tar.gz
+sha256  42612911c1872c5e4b43f6ae0e8ee59467cd350332241cf72ce90640264fae6a  LICENSE.txt
diff --git a/package/python-joblib/python-joblib.mk b/package/python-joblib/python-joblib.mk
new file mode 100644
index 0000000000..27289a0a2e
--- /dev/null
+++ b/package/python-joblib/python-joblib.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-joblib
+#
+################################################################################
+
+PYTHON_JOBLIB_VERSION = 1.1.0
+PYTHON_JOBLIB_SITE = $(call github,joblib,joblib,$(PYTHON_JOBLIB_VERSION))
+PYTHON_JOBLIB_LICENSE = BSD-3-Clause
+PYTHON_JOBLIB_LICENSE_FILES = LICENSE.txt
+PYTHON_JOBLIB_SETUP_TYPE = setuptools
+
+$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
