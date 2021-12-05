Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ABFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 20:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5A7B82F99;
	Sun,  5 Dec 2021 20:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNNmXNB1Nm0m; Sun,  5 Dec 2021 20:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B10D82F77;
	Sun,  5 Dec 2021 20:48:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90AF31BF4DD
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 20:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E32482F77
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 20:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id th_CzTOZKL_5 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 20:48:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9EF7827D2
 for <buildroot@busybox.net>; Sun,  5 Dec 2021 20:48:02 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so8949191wmj.5
 for <buildroot@busybox.net>; Sun, 05 Dec 2021 12:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qVCpu+PGBcGucgp8cAx8+Ry5mw3sp8skrxoNMnRE+KE=;
 b=IqR21YD3+mHqERacj5Cu9Pmy3xcPpqHsz8VNnSJyXebSAq751hNgpqyRVe3tbArHfh
 XHOeZkZP13138ZudmYi8aq5jdwVh38DoLGmNRzkcv1kbgJWTVJv7ZlEG1ys9cvUqUQWw
 lblG+s8/9csdd1fhyT/T1EjZez7KP3kon4U1RB+vvlxtifw3SX1QNwBMfL8JRpUWAjNx
 RP01bdjrYeyN7y1Qdks6H3M+FGHvZK87QqxMxqJGjuG2Vk1pDo8W+TDjRRQ7OU9W/tNs
 LQxKCcen9Wy1SbOf75H+IaDs2ELJl2DWec2/9AoIION+/l7p/Fik/dLXLJaWAfwZIGE7
 pZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVCpu+PGBcGucgp8cAx8+Ry5mw3sp8skrxoNMnRE+KE=;
 b=EnuBsAUv7uyqGESrczjK3ZrEgE2JHrjQqNoGqblhulhlvS2BDqkAqsWxFdygryvZjy
 UpkI5Ec7GQsf3at2vfEeDFcGLE44c/ahG9BljCcBEHRE1ZX8xFs5VsvpfOSx6j3woiF0
 Tqf+aTG0Wo2pEdn4x2z0No2EuvDgFDWirTPGl986VopW+A1iW3w8ZpVfnQlEQkKZ2qgK
 GgPB/boCrddpgqAhtRZVnLzNcXJiyBV8VdVQ6X0cbF7W6otmWBEtTuOWN0M4XLorQVRm
 Z3SRvrp3phe/JVNLckaO9gvZ4PmHYBH9WSWaa01SYYpZczRV9LHuwPeSLYWYK29v6v5A
 jRww==
X-Gm-Message-State: AOAM533mMOefvMDhTmDDRkCJ9UZdxIEqQugYKGlvXVuapmSFCk4tuN33
 mSJpWeMEIi69Czn5QRpQThuZWN+7rxf8SA==
X-Google-Smtp-Source: ABdhPJxDYmT02m/Egy2Rb3EA0MC9uTW2Pw7WTV5aOO8H8My07dwtbpbig0GV7U8C2QzCvQIQXoz0Dg==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr33133633wmi.2.1638737281101; 
 Sun, 05 Dec 2021 12:48:01 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id c10sm10420080wrb.81.2021.12.05.12.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 12:48:00 -0800 (PST)
From: guillaume.bressaix@gmail.com
To: buildroot@busybox.net
Date: Sun,  5 Dec 2021 21:47:20 +0100
Message-Id: <20211205204720.2831-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211205204720.2831-1-guillaume.bressaix@gmail.com>
References: <20211205204720.2831-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-pybind: bump to version 2.8.1
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
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-pybind/python-pybind.hash | 2 +-
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index a68ac846e2..e1d86a4494 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  cdbe326d357f18b83d10322ba202d69f11b2f49e2d87ade0dc2be0c5c34f8e2a  python-pybind-2.6.1.tar.gz
+sha256  f1bcc07caa568eb312411dde5308b1e250bd0e1bc020fae855bf9f43209940cc  python-pybind-2.8.1.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 080586a877..5519e80527 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.6.1
+PYTHON_PYBIND_VERSION = 2.8.1
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
