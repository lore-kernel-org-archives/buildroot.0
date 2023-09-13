Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54662EE020D
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 21:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95D34416EE;
	Wed, 13 Sep 2023 21:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D34416EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuXGt7W4KA5c; Wed, 13 Sep 2023 21:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBB6B4095F;
	Wed, 13 Sep 2023 21:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBB6B4095F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D15181BF5DF
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 21:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA645416E8
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 21:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA645416E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qR1SLyhXChbM for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 21:21:17 +0000 (UTC)
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97D6C401A3
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 21:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97D6C401A3
Received: by mail-qv1-xf43.google.com with SMTP id
 6a1803df08f44-64f383be0d4so1808056d6.3
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 14:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694640076; x=1695244876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8e9X3R4jrilm78nmZ3/V+zRrWyRGeIZjwQmVT3blEg0=;
 b=HJA21EGJXQQ/u0hoyVIlEwi6Ss466QoJj+YAYN4oHp7ayU+vVpl9T1GIAW2rlfz+jw
 wSNSGgW82fTSzZeqm0aunLv0tt9EHk1aA+oFpDkbGnMNjHN96rUZMRmqdRulFW1b8Sgh
 GC4Y6HJQWi6zY9OsdCxbZl9eHPAvuk6pxAKVKmeEb5sF0othvlESD8ZbUsuQMbOR37GQ
 uzEik4dlVRQSAwCDQUcz9QsbfuOsDkI0Qa8TSVVqQHxJ72hjfKdou9Vk0zcKN04+EbE2
 ft6qEyLKaYHYokFFzxCyatSzdGGAq00tQYR0WfMETBq2SNNGLFgq2mMxi3pnBqJtiKZk
 KJaQ==
X-Gm-Message-State: AOJu0YyTqK+YGjGjZYUCKWSWqp/0uXBwI5U8cuXtE9rZCsegcDu6RjUb
 w9JJ0nxwB2p7eQ1tNbZb9gozTOkZFoDmXfMoKkkEmeTE
X-Google-Smtp-Source: AGHT+IGN6bL/SNh3katR/AkLIm5185UxoD+ArKZlVyphMdD0WkSLa3HieSOcwQVzOsvG9dTlFaE74A==
X-Received: by 2002:a0c:8cc1:0:b0:653:5b5e:7a96 with SMTP id
 q1-20020a0c8cc1000000b006535b5e7a96mr4123249qvb.1.1694640075706; 
 Wed, 13 Sep 2023 14:21:15 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 t29-20020a0cb39d000000b0063d162a8b8bsm37824qve.19.2023.09.13.14.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 14:21:15 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 17:20:01 -0400
Message-ID: <20230913212000.987236-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1694640076; x=1695244876;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8e9X3R4jrilm78nmZ3/V+zRrWyRGeIZjwQmVT3blEg0=;
 b=C4Z4BCTEOU48ajiHXtMuQaGURd+K1MC9zEplI2X3iCPsqGNkxCJ4+zDnS1UsZE0RZ+
 aastvq7pCWZBbQ/c//UVKGVxbPCAige+CuazdSEEu1nmrZQdw+/Rz0LwLO+18lwX9KZh
 R5Jt7LyDpzVHj0qvZ61VL8T7ZqBTmU/OT5uKgzCMZLprqKpG2SfCrKVzYF6ZBJQocKfz
 ZKwTTYPtazXPkLgkyHyhnsMfvXWcC1ud4XStZQP4LzTP9EM++40N8g0n4xslYgBAyj5w
 6jP0dvlA/wq4COL7EoVmPWv+ma9cabekzF5zT4gVYajtXeeDvTWDYM0mWNzgeSP0+n+4
 kHHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com
 header.i=@hefring-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=C4Z4BCTE
Subject: [Buildroot] [PATCH] package/gptfdisk: fix bug with util-linux
 (libuuid) 2.38
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Ben Wolsieffer <ben.wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following error message by backporting an upstream patch [0]:

  Warning! Unable to generate a proper UUID! Creating an improper one as a last
  resort! Windows 7 may crash if you save this partition table!

Additionally, now that gptfdisk uses libuuid again, the build fails
because passing LIBS to make overrides the default value in the
Makefile. To fix this, this patch adds -luuid to GPTFDISK_LDLIBS.

[0] https://sourceforge.net/p/gptfdisk/code/ci/6a8416cbd12d55f882bb751993b94f72d338d96f

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 ...to-deal-with-minor-change-in-libuuid.patch | 40 +++++++++++++++++++
 package/gptfdisk/gptfdisk.mk                  |  2 +
 2 files changed, 42 insertions(+)
 create mode 100644 package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch

diff --git a/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch b/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
new file mode 100644
index 0000000000..6e4f5253e8
--- /dev/null
+++ b/package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
@@ -0,0 +1,40 @@
+From 6a8416cbd12d55f882bb751993b94f72d338d96f Mon Sep 17 00:00:00 2001
+From: Rod Smith <rodsmith@rodsbooks.com>
+Date: Sat, 16 Apr 2022 09:32:04 -0400
+Subject: [PATCH] Updated guid.cc to deal with minor change in libuuid
+
+Upstream: https://sourceforge.net/p/gptfdisk/code/ci/6a8416cbd12d55f882bb751993b94f72d338d96f
+---
+ NEWS    | 2 ++
+ guid.cc | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index 9e153fd..9ec7e63 100644
+--- a/NEWS
++++ b/NEWS
+@@ -6,6 +6,8 @@
+   (commit 740, which is pre-release as I type; presumably version 1.19 and
+   later once released).
+ 
++- Updated guid.cc to deal with minor change in libuuid.
++
+ 1.0.9 (4/14/2022):
+ ------------------
+ 
+diff --git a/guid.cc b/guid.cc
+index 1e73ab7..d3e4fd5 100644
+--- a/guid.cc
++++ b/guid.cc
+@@ -141,7 +141,7 @@ void GUIDData::Zero(void) {
+ void GUIDData::Randomize(void) {
+    int i, uuidGenerated = 0;
+ 
+-#ifdef _UUID_UUID_H
++#if defined (_UUID_UUID_H) || defined (_UL_LIBUUID_UUID_H)
+    uuid_generate(uuidData);
+    ReverseBytes(&uuidData[0], 4);
+    ReverseBytes(&uuidData[4], 2);
+-- 
+2.42.0
+
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index f3fc930202..4a15780bae 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -22,6 +22,8 @@ ifeq ($(BR2_PACKAGE_GPTFDISK_CGDISK),y)
 GPTFDISK_DEPENDENCIES += ncurses
 endif
 
+GPTFDISK_LDLIBS += -luuid
+
 ifeq ($(BR2_STATIC_LIBS),y)
 # gptfdisk dependencies may link against libiconv, so we need to do so
 # as well when linking statically
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
