Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543DDCEE330
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 17:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F040940232;
	Wed,  9 Oct 2024 17:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYqKJSlTAntx; Wed,  9 Oct 2024 17:19:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A832B40243
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A832B40243;
	Wed,  9 Oct 2024 17:19:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C2821BF3E8
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AE1E40243
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRgeiMDjra3G for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 17:19:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CAA240232
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CAA240232
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CAA240232
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 17:19:29 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a3a213efc2so391485ab.3
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 10:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728494368; x=1729099168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qWesfnfqaOcPUIePdYTV6NSXKxYDm5H2Yw5+yIwBxEA=;
 b=v9p6GxK+J+g6BXW/SmEP8a0ksoyh6T2CoxCtvFxgki9As26EcaOEuyPWvZN2ezYTUk
 RbzJK7TUWtu4V1eeMffudq4ZpOqu2sFAJLw2xFuoezfdhxZojKnmQxyV3bsqDqWIgHXP
 vKfrlfdCqciKktsFvRU6oE3zd8r7hD+i0p1c1gcopuJ7ZoZxcdx59VlyKkKdudCQC3/w
 N7CMkTSAkfqV+R0vqFY7JkQR9oa26BpTz2KdWYyi3MxLM+4MGRVbsgPL74GZPLGZeXlO
 sBqMjayr/p4AOYj6ZYuzHR2lVGxLc22IbMurRt/xZjNYOEcFIm0XLX/zwhG3uEN3Waq8
 GFjQ==
X-Gm-Message-State: AOJu0YyD/veKR6KqOr6pr7LksJcw+LZDujm9+tSIMemZtxgK2id/Ykl2
 Q9N96vMc27ACLWWxFKY86vCR+gGCatDg808lnXTQ2NBTvUlX5lqcUVt1RCuH
X-Google-Smtp-Source: AGHT+IGx+PjDVnl4MvynEh8fLT3PAKzfoktO3ikIs9ODLXn1eW2gW5hFBtSER/qSpH33X39FSSLJnA==
X-Received: by 2002:a05:6e02:16c6:b0:3a0:a80a:997c with SMTP id
 e9e14a558f8ab-3a397d10ad2mr34142135ab.19.1728494367934; 
 Wed, 09 Oct 2024 10:19:27 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a3a38de67bsm1443545ab.19.2024.10.09.10.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 10:19:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 11:19:25 -0600
Message-Id: <20241009171925.3841884-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728494368; x=1729099168; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qWesfnfqaOcPUIePdYTV6NSXKxYDm5H2Yw5+yIwBxEA=;
 b=d5yt6Xe7YT18zFxG8DaOMqzbmkCn621o4CdpIo4VSbCNR/BK/jwYJh8cOHa7Ygptb6
 5FneVbNTjKxFu1/yBJ6AI30EAiz8aOUuPJ9iwFRVCuKqRFUwrcDOfpU5UuZ2m+gK68vP
 6cZXMEtRKTCDyXMfCEZsfDF72IjSV4nz2b5y9SpnC4hvipLS4rsZQneLQ8+J+0IkmMzg
 byEAg25ywdutwLhifPdpVl9ne+f7feJDuV2JSQxOp5v0xJh7jmlr7XO6as+WXD8b+nuP
 voCfjGRq/0kngwApEi0vG1Lz98xVOM2HLLPLcLiZ4Qr5fHo5vmxvg9lecxTqB+0XmOJW
 e2gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d5yt6Xe7
Subject: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.2.1
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
 package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
 package/python-pypika-tortoise/python-pypika-tortoise.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
index 629762f4f7..5c78509af2 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
-md5  98c9677516f06f61f211f834d51949a6  pypika-tortoise-0.1.6.tar.gz
-sha256  d802868f479a708e3263724c7b5719a26ad79399b2a70cea065f4a4cadbebf36  pypika-tortoise-0.1.6.tar.gz
+md5  69e74ea7ee7236de921c662a3b0940bc  pypika_tortoise-0.2.1.tar.gz
+sha256  979bbb9d60fe9f6e4129a25c44ee008aab4a4e97b296350be9983dcaa2766354  pypika_tortoise-0.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index 84aa19cfbb..751c7ad6da 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPIKA_TORTOISE_VERSION = 0.1.6
-PYTHON_PYPIKA_TORTOISE_SOURCE = pypika-tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/86/55/1bfd4150f664d2e07b36c8f442178cc1f717bb9ae6cae20f21e851c208c6
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.2.1
+PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/30/af/b4a6035611cf6f3990879385cf6d077013c1bdf7ea294d6ceebfa14c8d08
 PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
