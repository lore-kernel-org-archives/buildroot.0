Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62618C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1247860E16;
	Mon, 24 Jan 2022 10:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HtuOWfa5jnqI; Mon, 24 Jan 2022 10:49:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DBC460E1D;
	Mon, 24 Jan 2022 10:49:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 662091BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5342640469
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0-2Fupyq8py6 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:49:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77F98403C8
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:49:17 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id 9so3288173iou.2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 02:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wy2ECp1fiU4ZHylELCynOaNApc6CJWHHyDbh3QWcxws=;
 b=YFVmqqGJLXf0aQYmEg1hADg8zhEFVFtfS1TJUo25DpzyCtes3OA88GZeqToCAVpRH9
 hvoDEbQeic9ope+uuEjQLDvCynKGNGWB0kXQnL/M0NEHlo2rr0j1dHESDah53S7WzkZe
 qbjr8oJPGg4aQ61f/mdlYJtYSsDBoZJhBRK+ef9eP8yCOOu7u7/SRMj3Txx+qhQnIDP0
 1XSiPAZGn1eggDlzwLcLlhRwNYZgGQRtAAvmBgVoTTnGLfHYO0Za4iSU8cs1kaNrfgkb
 EPc9O9ilKXTDGkfCm0+cf4NbfhtZShXLHcbnx7IJ1143d7h4THtXSduZCpEzarsbQglv
 ZB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wy2ECp1fiU4ZHylELCynOaNApc6CJWHHyDbh3QWcxws=;
 b=ovyPfkVQtSW0PK4Q41OyiJeT4b2hO97qnXvPA8UCpLhSvCkkns//MtUj4VysHVHnq1
 hMIZXmAC10NzB4dPb87faFQb5AGM/dSwWF1NJ8QktItKtqNDIZx7u4VcMSvgF06I9+xg
 yk9odgGZJoM1SqhNpeBYGucBPxKLld/Sd/R+w2IhEZGmieMFK5eu3zVI4G8S1zIkW7KT
 AqUyx8gba9Ju6DTdJS15JlCGF+OOnCTQwyUP7AGJOvZTlvoMlh0HEJlGd+9xU3ig99yJ
 3cqmB2S8TdL114dgifHqIM1kqD0uiGsOArJXyxyaeinu409akmpi1nuD1gpSWdACChsI
 ZXRA==
X-Gm-Message-State: AOAM5320QCdWfjBZDuKbtLzUWbwyyXEs0aZt0mEA5eiJkpLVrae0AIEj
 +idy0QjTWb1INWiYw8lU1rTzdkmq9ko=
X-Google-Smtp-Source: ABdhPJza+TIcPzJmOecA0z2NXswlXqH2WTq5WLaBIZYxzmLROSMDlLUPGsWJmjekXCbZA6B4MFrTNg==
X-Received: by 2002:a02:b707:: with SMTP id g7mr4860960jam.111.1643021356237; 
 Mon, 24 Jan 2022 02:49:16 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id l6sm7000191iln.16.2022.01.24.02.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:49:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 03:49:14 -0700
Message-Id: <20220124104914.533634-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: bump to version 21.4.0
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
 package/python-attrs/python-attrs.hash | 6 +++---
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 5d4c46304e..823a9459bd 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  06af884070d9180694becdb106e5cd65  attrs-21.2.0.tar.gz
-sha256  ef6aaac3ca6cd92904cdd0d83f629a15f18053ec84e6432106f7a4d04ae4f5fb  attrs-21.2.0.tar.gz
-# Locally computed sha256
+md5  5a9b5e9ceebc380a13fb93235b11bbda  attrs-21.4.0.tar.gz
+sha256  626ba8234211db98e869df76230a137c4c40a12d72445c45d5f5b716f076e2fd  attrs-21.4.0.tar.gz
+# Locally computed sha256 checksums
 sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index b99a98501c..4877d62285 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 21.2.0
+PYTHON_ATTRS_VERSION = 21.4.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/ed/d6/3ebca4ca65157c12bd08a63e20ac0bdc21ac7f3694040711f9fd073c0ffb
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/d7/77/ebb15fc26d0f815839ecd897b919ed6d85c050feeb83e100e020df9153d2
 PYTHON_ATTRS_SETUP_TYPE = setuptools
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
