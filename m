Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8F8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 09:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5D8E4090C;
	Mon, 24 Jan 2022 09:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ems5mOe4qBQE; Mon, 24 Jan 2022 09:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B9040951;
	Mon, 24 Jan 2022 09:36:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7091BF3DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E32983E1C
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFqIhIRQmKKe for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 09:36:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC66D83E1A
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:36:13 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id v17so13323107ilg.4
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 01:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DjmhXFyJpjdbPKp8QXVtG8sQDxasGqy+Aa9IvcFw5uU=;
 b=mVzHwQLw9QUuEUF9vrD1goxCX423x5EDHyPAI0ZBB0Lj7rg9khBMHyZoklrPA3BV1H
 JuL110wA1KDxAGq0w/FHsTiw33ZpRCms7vIyOFxkl3BXuLUmCcbg8lUyYf2VMSor28e1
 dz0H250gHBysJeBwJusXX76y5yHyl6NKrnm9q/ycgkQqSM71Yg3XX/WpgQr+QO4zN7aQ
 ZqvF00EZHk6E9hOEiche3WMFzQ+YS6HFQAriI10A2HCeAnG9dVxxFAuLEItzuyRKapzi
 fXAYeJB8BLK0j31GXS/FQpAk5Ln4BxqVGQy9Fh4k2TEiXexDQNZ19hsb+Ee01tZVSzD/
 eOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DjmhXFyJpjdbPKp8QXVtG8sQDxasGqy+Aa9IvcFw5uU=;
 b=WdfF2sYfFZMaxD6xCDDXzx5LBpzlIQZXrqoqu0/qiykYWxuy+CmkVx6/qyGWqGcSBM
 7/G8oQlLr/0k8XANy/LwiybG1qB7/XUzm0Dc4vM9w7F6ZQLrPJGPDI0268vjEXPIDV45
 8XK4ccxHwx7EJ3huil50cG7pL6yswjFCBYmPg4t6I/OL8FiaBAtOTAXm5LOTH1adLFUe
 uLGu+JLF0khc2SfmaZcx4ZAp8uJPuaXK+x0zxnjTSmJJYVEEExQFRytvxpItea77Za9C
 DnJ2yQrvYcwUcWyJvKPKPHGp7LxAcNslqmtT6fvO6aGfA4QEx//72SBLbVVLLbtait68
 CaCg==
X-Gm-Message-State: AOAM532PsaH13ix1DDqSQY7Nn6i/7NAZLSIWeNYlZPiGC70w8VHvFVKn
 mkw3nOm566XPnM25OvFB0Dp63JYIuqE=
X-Google-Smtp-Source: ABdhPJxB0/C+AhTo8bQ1GS0tEhBVpknhepmPJVuSavvgeBIQqFbTXy34OedDyUHSFTIYrQ5bovSh6Q==
X-Received: by 2002:a92:c9c8:: with SMTP id k8mr7491528ilq.2.1643016972938;
 Mon, 24 Jan 2022 01:36:12 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id k9sm6338796iow.48.2022.01.24.01.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 01:36:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 02:36:10 -0700
Message-Id: <20220124093610.410365-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiorwlock: bump to version
 1.3.0
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
 package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
 package/python-aiorwlock/python-aiorwlock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
index fad7079789..15584a8a41 100644
--- a/package/python-aiorwlock/python-aiorwlock.hash
+++ b/package/python-aiorwlock/python-aiorwlock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
-md5  f0fac247fd884f59d53f6deeb866a52d  aiorwlock-1.2.0.tar.gz
-sha256  3626ed72f92a57e71c685d7fc0329578e5d2dee2ab80805beec8b5119053146d  aiorwlock-1.2.0.tar.gz
+md5  28e4812a1d1d67a2be4370209ece5528  aiorwlock-1.3.0.tar.gz
+sha256  83f12d87df4b9728a0b8fda1756585ab0d652b107bab59c6084e1b1ad692ab45  aiorwlock-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fa99ee9d7727194a9f8994c67d1948dc42e8e00ab809fd4a47acfae119d11403  LICENSE
diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
index 4ba4965eb5..a5e7eeae83 100644
--- a/package/python-aiorwlock/python-aiorwlock.mk
+++ b/package/python-aiorwlock/python-aiorwlock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIORWLOCK_VERSION = 1.2.0
+PYTHON_AIORWLOCK_VERSION = 1.3.0
 PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
-PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/22/84/98ef7b69764b0ceee7afe2139f45f9cbba21c849b0bd8a6eeecb11ee650d
+PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/77/fe/7027595f5e635ac1f597f7160a420e1f642a474576efb697001efea16bdc
 PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
 PYTHON_AIORWLOCK_LICENSE = Apache-2.0
 PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
