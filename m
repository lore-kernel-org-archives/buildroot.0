Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70640C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 19:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BAD441BC4;
	Thu, 28 Apr 2022 19:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhNbS_H3FnWh; Thu, 28 Apr 2022 19:52:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D76C741BB8;
	Thu, 28 Apr 2022 19:52:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC5271BF3AD
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 19:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8C3641BB8
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 19:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_ni_8XwmKkZ for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 19:52:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7703741B7B
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 19:52:51 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id e3so3882389ios.6
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 12:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o4T0Gwr8zf7aIrM1Yusvsw+VLhdPL+U705re3DNjW78=;
 b=f+VahWABy4+ka2D/NCZde99o3hTZDiTh3bR1fj0h9Lso+mVivrbwFyL6Ctr+S3rZt1
 0TjAwNfNFzhJaOJJacKh1OhylwS/mOLvsyQ0kA2IxusUpg16eOTNBsMUj6tfMq/ugIp9
 5BC2x9HDbBaR2BzbL6FqoKGwcTTzjIQ7YWpVQHWZbZBSQXWNFpclF2n01Y8h+SV51dyZ
 P1LzOd6TuKh7IS77OjR0igaDT80Dt/b3BdNEMeIQGxJR+tzs7sshlM4SgqXbRJVwXBHq
 wV2UD/bPLlLg/mLiaosJMZ+ePZXSHTiLxgxz0NklgbQaqFepCmiUAJMAbNNGkKE3Sdck
 zjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o4T0Gwr8zf7aIrM1Yusvsw+VLhdPL+U705re3DNjW78=;
 b=ntzC+yc0utXtQBbm8Lk7+A17EWBNKW+pE0Y8HcjCQX+8fsm5oezHdAfF57I7GgqFcf
 7p9BMP/uNJSNVUhAPuPq7yhgCNCcrazeIPRmNRE+BaLgU2wuCeIIeBHFQMZUG/Qtcd1z
 ISmm6PtDhzybaUsCOtcD7IKJgUnXMWxZo1ikfqpTvjo+/y8n/8EFCbAbnEdITi0JP5kW
 qjDIm4JDhAmGKv615CpTwQgvFkVkJAtcqKcQb0EfZAFWYkXC88bok6bigBrzGol/a00y
 DXCS9Z5tdxkCHjDGBxint6gCcaLT59SLDy4lRr/sWbvcUAu8Z8PaBJotYJTE1MotAPjp
 ++ow==
X-Gm-Message-State: AOAM5318feOBn53O8pLD2wQu2NHBGEfOOoO9CnrQ/S2H7JXQPSOqvZ/D
 gAl2FNAWrEfXODoCvOfQjdJ+jg2rrAg=
X-Google-Smtp-Source: ABdhPJxtXBVh3YowfEqHyUUTRIp+/uc2wbxNmsFyqq4cKWKj1VOaqwSaYn1L9+eYcctsvRLFPJ+/Tg==
X-Received: by 2002:a6b:f403:0:b0:657:880c:f351 with SMTP id
 i3-20020a6bf403000000b00657880cf351mr8674694iog.131.1651175570302; 
 Thu, 28 Apr 2022 12:52:50 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 i9-20020a056e02054900b002cc1959aa6fsm412006ils.87.2022.04.28.12.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 12:52:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 13:52:48 -0600
Message-Id: <20220428195248.782790-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-typing-extensions: bump to
 version 4.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package now requires the flit setup type.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-typing-extensions/python-typing-extensions.hash  | 4 ++--
 .../python-typing-extensions/python-typing-extensions.mk    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index abaac77d34..f37a609adc 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing_extensions/json
-md5  ed80ecc8eac5cb15840535ca54eb43f3  typing_extensions-3.10.0.2.tar.gz
-sha256  49f75d16ff11f1cd258e1b988ccff82a3ca5570217d7ad8c5f48205dd99a677e  typing_extensions-3.10.0.2.tar.gz
+md5  197fb153e3720a3f6e0c85bb47f9c2b5  typing_extensions-4.2.0.tar.gz
+sha256  f1c24655a0da0d1b67f07e17a5e6b2a105894e6824b92096378bb3668ef02376  typing_extensions-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 668071e025..a664e5d3e9 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 3.10.0.2
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.2.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/ed/12/c5079a15cf5c01d7f4252b473b00f7e68ee711be605b9f001528f0298b98
-PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = setuptools
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/fe/71/1df93bd59163c8084d812d166c907639646e8aac72886d563851b966bf18
+PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
