Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C66CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 22:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D24240302;
	Fri, 11 Mar 2022 22:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4-RWMZ942wiq; Fri, 11 Mar 2022 22:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26457405E7;
	Fri, 11 Mar 2022 22:56:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CFFA1BF33A
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 22:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BFFD60C05
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 22:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2d8bax9kEaq for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 22:56:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 597E260ACD
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 22:56:12 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id i1so7016375ila.7
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 14:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x93+k8SWQSh/kT0LMiXYA+/EjEr7QOc2rR8so5TnnHA=;
 b=NtmK2k4P1gTLiwvC7kfljlCeWE4jG6Zi71UAQ47LwIuIld3do02jSpwuK2TZusTGsI
 LuVB/gPAlGEPmoXwVy/eRUmlIzG99rb4EEVWBtQasSeD7F/0KQZq8Y7741dyatySNYwY
 OorXtE2Qu1/uapgtWaCf/khEicQSuuarCvajVRCZhlu9yUNa9Xi9Y3TPZs7ULNoHnXwj
 aqBikFn7tHRJBrj6l1gT6/rzYh21q9Tng53dTNYiEjttwwaSpQUvAGBX1/hnASwnrr41
 L+1qUyxJC8BksBW8/R6xhQRHvx33Y3n77P7X4mPFpZoeODz2p/mOs9YYIRXPY1xCGsCY
 5a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x93+k8SWQSh/kT0LMiXYA+/EjEr7QOc2rR8so5TnnHA=;
 b=lVi0LIryFhRjdsxKI/Ybw3tLL8uqo9t6P+e6dD0K1VwUp/aFFp2ORGqmmDpOcBs3Kg
 Zz2cjj+FiMQUSff8vhyghMYdnMAhfNCY7xq8LLT1xv4HIlupUlYr2lt+9EiLpMazw+sP
 fik86Pj3ZywnkIcgSFcRI2BZ1KgSBFRS8LqfGDUcnV9WwjbQypICO3XBiq/AzkPRq/uy
 mQjeaq6gg42k0iR5GAeesYIQVq64d4zIVyGnp5YaK6rsAzDqq+Yw1MijCiLZsjHLQSCS
 /IIKC/6fibrw94ZafQ+BSVRa5uHn9FPi8fvFc5SXdQT/CV1QStFllwCObmY8NQ52ohEv
 3CXg==
X-Gm-Message-State: AOAM533oYPi5SN3SolZuf5neteMwI0PYPlJBZSikSoRb+PC1gLEVqlqA
 8G2CPKqsnmvNYmEHrMqE6bEIN5cv0tw=
X-Google-Smtp-Source: ABdhPJwHzRbZJO4zGl8B2ctyEFrdoUYMSsGeTIjBx2EvPleFwRLs7WKrtDSjUfFx05y+Op5RDNWXHw==
X-Received: by 2002:a05:6e02:1a8e:b0:2c7:6e36:e154 with SMTP id
 k14-20020a056e021a8e00b002c76e36e154mr6683643ilv.180.1647039371268; 
 Fri, 11 Mar 2022 14:56:11 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 k1-20020a056e021a8100b002c64cf94399sm5588591ilv.44.2022.03.11.14.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 14:56:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 15:56:09 -0700
Message-Id: <20220311225609.3975018-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyphen: bump to version
 0.12.0
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
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 75ee909351..14938de9c4 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/Pyphen/json
-md5  f8ec095e4fe30dc2b518a918788b33ed  pyphen-0.11.0.tar.gz
-sha256  e2c3ed82c3a04317df5102addafe89652b0876bc6c6265f5dd4c3efaf02315e8  pyphen-0.11.0.tar.gz
+md5  99a01a3806cc750c242cae330429a90f  pyphen-0.12.0.tar.gz
+sha256  b7d3dfc24b6f2178cdb2b1757ace0bd5d222de3e62c28d22ac578c5f22a13e9b  pyphen-0.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index 80f67c77c7..ac0bcf8aab 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.11.0
+PYTHON_PYPHEN_VERSION = 0.12.0
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/9a/f8/af869a4983c1b3159945479510260985714265d48baf27d61f72b1ec8cbf
-PYTHON_PYPHEN_SETUP_TYPE = distutils
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/0e/21/9e0841aa76db69e2d74cd64ea2271151d7332fa627a5f03eb0d9ccf3da87
+PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
