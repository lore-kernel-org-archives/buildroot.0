Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EC4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A4682CD4;
	Mon, 16 May 2022 13:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOxn4YNc0C3U; Mon, 16 May 2022 13:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 269B082C9C;
	Mon, 16 May 2022 13:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7C591BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4F6282C9C
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cR_1VILsPAFE for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:13:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E9F882C8E
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:13:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id f2so13460927wrc.0
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjNqkBwD16cS2zgxreItlMMN+LzUFcdy8M+i9idmRj8=;
 b=jWDJjqZw4BQummm/LUcyXvDqfqrXOJYFlhl82jU3u7axhz1SZJsPJ/A7bsy695tDRE
 yleN5HKhIq/t0YzaWfw04kIl7mb61pQ90RDJFAx0AbIzWxMnq8Suc4qUGvxuabuqb83Y
 vAPboZ19E7iDng5SZl7iMUmkiKZ9o6pZzBUl9Jg4uCZ1PdiuJoTTsWH6iohjGqU79Kgy
 IFQ0CmNI3kKJf5iLXE0ChDPMrG2X2bV2CNRciO9tI3r+cDTOEcSdXnbOeUdRZpIJx2oE
 YoDeT4Po/wDtzvz2PDjUZEugH56rKiYRpszrApm6T4a5hWP/qd0rFTfkavj7Q3+8aFfg
 zuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjNqkBwD16cS2zgxreItlMMN+LzUFcdy8M+i9idmRj8=;
 b=qTBgBLfL+DcO24XAwBDeXK6P3T0S1mEQU1GBV0q45lMKy0MpX4oW7vG6u5smkSgnkQ
 GeDanpmbB/Aocmoeaqkidz7BVxYF5Kek+41mN7Mmq38VLbYeIl+PlSr/VOHodLBYoiLX
 i45/zYNxkIX03pR4KV0uOLhI8dWp5boU3DXSgL/fFww4Fuhr5LBfHkSbotnO6sz5uqq8
 GeduEe3svxYf1hTIkIkFIRTTTXVWK2zI5Kkf+mV9znoC2vAjSrmGftNKZe6Q0MwEIzu0
 s+OhA/NB4iMIxFq3Groo+8TroAmN1713FYjDtWSdwKZR9uSPoSMX7zJkm+Mmh2ZEGjGE
 h8Rg==
X-Gm-Message-State: AOAM532q/H3MctkS6MmNvAL6TaW9W+3Akv9A6KctzrbHjJnVaGJkXpLt
 SQnqpp09zUQRao7M7GdE9pYZ/oxO4Dw=
X-Google-Smtp-Source: ABdhPJzjf55RPJ1XplKLFwTR4/d6Cy56A5y3aCkqKoumKsQtJFVIRYRSfzuTUoP/ygjNrGtvPrR3qQ==
X-Received: by 2002:a5d:6c6f:0:b0:20c:4d8b:c8a9 with SMTP id
 r15-20020a5d6c6f000000b0020c4d8bc8a9mr13960139wrz.458.1652706835467; 
 Mon, 16 May 2022 06:13:55 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:13:55 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:19 +0200
Message-Id: <20220516131334.1910858-6-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 05/20] package/erlang-p1-tls: bump version to
 1.1.13
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The copyright year in the license file has been updated to 2022, hence
the new hash for the license.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 4 ++--
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index 475223b986..32d90ef7a0 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  97fd0a398751fc63b28df016e92a08ea98d083f7d5e3f32380a92de1ee86ca0e  erlang-p1-tls-1.1.9.tar.gz
-sha256  6cd4871db940d055cf272c12c10e0c08febdc94362e404390758fde34b4ce01a  LICENSE.txt
+sha256  5377671fed74a61518a742bc52d73941039d6e3c6e192133c7feaf5a83e1275b  erlang-p1-tls-1.1.13.tar.gz
+sha256  a401e98a7eef1c741b3e8b1a46a21730b4a1bc7020e4ec1a8c2a44dbd7f0ba5d  LICENSE.txt
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index 9e7d4c7c73..1f79bf90c1 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.1.9
+ERLANG_P1_TLS_VERSION = 1.1.13
 ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
