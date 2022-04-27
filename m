Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99A7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 08:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74DAD83E0A;
	Wed, 27 Apr 2022 08:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhFL-cQ53iHT; Wed, 27 Apr 2022 08:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8817D833CB;
	Wed, 27 Apr 2022 08:32:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9232C1BF947
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 08:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C5E660E41
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 08:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKJ6H1UcEMYe for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 08:32:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DA5A60D75
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 08:32:43 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id r12so2064508iod.6
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 01:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zuBsBlyznAIwKeIRq2IEWqTfB1a9oKgpQ4XYm/IXv6s=;
 b=Pi9XsOZphG57ClbtEc9dNy4oTC9CX8RK3W88QuYtNGI6bsrrleaUZvMNLeqeMZurvw
 ev29JwPhzVhWwpAEmA8I7a0hsIaJpbYJd0/cRyN6TsjZVaMshHZVb1l0vjvTSw+J4Q1g
 ejSpwKZ066q6nNtW+KhwQMaA24G2XXRMWo9O/iZQJfni4F9KyB+2exkvw+/OqNij2SFh
 UvxD0g88dAGXhWTUkgrqsY/sXGZeTx4DUcsYZwRClMyH8Qby+aM6XCbqutpKCnda+3b3
 sUPT14Xthgl+HwC0q930cuagvcsuhILkszN7fh3wSIhKUh6nsPWMzAHmfsuDdQVQJ6D8
 2O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zuBsBlyznAIwKeIRq2IEWqTfB1a9oKgpQ4XYm/IXv6s=;
 b=Z42yt/MEdU0vn4cEqhOkWBeLGGPApujdEH9THrCF8wYFjVG315RRehG9eEB5WM+u8F
 VdU/jGtjhaXjo0heEEMdI/PCtyqCTHcmPLtyCglh1oX0w4tNupLq3v/lLKJd1SZBhOU+
 y8N//QEmj4X54fpaKBPx1rD67gima95IUFQwKabRyxfGqiiJfUxfcUtejRzjtCG1I7vr
 cHFhhgxWKK0lWSheZRJx2GTbqf1emrPOEpMkwjZ5+1B3NCcn2+2mGndWxlYJxNFX7zNg
 xah2C0ZKHMs7u8lICV2Lgobklx+bi7Pw7vBCk0cxraF2ZXg9NBySfiKWGM1HKewjkF4S
 PFXQ==
X-Gm-Message-State: AOAM532SXy6LcAHJ3Q5Z7ddaAAo0nNznCo+9Z+ZEqBxvb6y2eOu290bt
 G7ZnQmfOg7vYG0U+YKNMAAHijFJ4hec=
X-Google-Smtp-Source: ABdhPJwE/wugcLW32vGjwCyehzfmWvOj0v6dO3pc7uBJ/o6VrUR4O4pp/NvQwSFYkw3iQwhbrYU4Xg==
X-Received: by 2002:a05:6638:3051:b0:317:8a78:7be5 with SMTP id
 u17-20020a056638305100b003178a787be5mr11672679jak.142.1651048362439; 
 Wed, 27 Apr 2022 01:32:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 r12-20020a92d44c000000b002cc0b7b043asm9239747ilm.28.2022.04.27.01.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 01:32:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 02:32:40 -0600
Message-Id: <20220427083240.1081081-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.62.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 38fa43f6dc..2037c46bbc 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.62.0/meson-0.62.0.tar.gz.asc
-sha256  06f8c1cfa51bfdb533c82623ffa524cacdbea02ace6d709145e33aabdad6adcb  meson-0.62.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.62.1/meson-0.62.1.tar.gz.asc
+sha256  a0f5caa1e70da12d5e63aa6a9504273759b891af36c8d87de381a4ed1380e845  meson-0.62.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 13adc2f2b1..6d55f19402 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.62.0
+MESON_VERSION = 0.62.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
