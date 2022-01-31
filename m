Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFE1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 17:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB016402BC;
	Mon, 31 Jan 2022 17:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KV1bfc5zdpF3; Mon, 31 Jan 2022 17:42:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3DA940156;
	Mon, 31 Jan 2022 17:42:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5F41BF4DB
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 17:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAF5583E08
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 17:42:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08q_wSo86EcA for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 17:42:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 647A183365
 for <buildroot@busybox.net>; Mon, 31 Jan 2022 17:42:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h21so26928343wrb.8
 for <buildroot@busybox.net>; Mon, 31 Jan 2022 09:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LbpFxx3FE7k0PJYjetpS140/1MkVheTdHQcQdVpmEds=;
 b=i7Vqv0WBg/pM3AOyE9jrlfUSip/PgAysbGd/XEc5PC49oVi9cFCds1ttxOtA6pYc4n
 V//2SS0UbuKgv0qpDpVIRsKLCeQ4eMAudsVbUK9wktVCS2t9Qf0Dr6RhBvzfcmJ3viQn
 ZwleQt3j9Id1hJ1MkbiGwCD6bsMtfEl4BBxq/XNq6x5tcg94Pxn9m2yuOV8AdvtI/LZM
 crAlPU4ULkU9AaOpHZWJ9ITCrMUcoBbxcsAJyA1cxMFUuNgdaL/br9HF0eo2ATfTYdem
 PDFOW9u8yrtkZ7/wNgLkunz5wrOKbJlQL7UFtwp9KUlzFUfs2DRxw9S55OXMGlFIJ04A
 v0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LbpFxx3FE7k0PJYjetpS140/1MkVheTdHQcQdVpmEds=;
 b=qylxbURIlKjzO4lXesH2KzwAD+fU6E4AELQqHeH+mjU/Z6csjIKfRxhA23+263/84o
 iVgAl3iDKfsVA31BM7CNPBDXU+97YmggYKHEt2AUO7KyFPWfcHMYZYLQrgMsQd6F7pQD
 NWQNidogppqVOiWEJS7WOVo/2BaFcvcR9Y34JQrGjX5cJMlMgT/rRtK719vb1fOIiK+W
 lsmkG/nZ+1L19Wt7GXrtX/F4zjVnFFybEW1U9ETT3Bmt5pPgCbWxz+m8AsS91OXEDJyb
 hofoCTw6RKnB7Me6Z+o0oTPfJubQ7I/0XNF1vNl5NTi47laALZW7Ep1fprYY9ZYMqNEG
 LUcQ==
X-Gm-Message-State: AOAM530w43hWhhwIUukSB1G3AeUPczSeVWsGgLLPhTW3qj1M5d9JHdnz
 bdMB6QXd6LKcXsYe+sFzuGfNK0EsZoM=
X-Google-Smtp-Source: ABdhPJxWXixDWsDtpyPw+LFVvFRehlXLCv1czLOvXw/572xQ/lNEjY2802t0+mdM97x7/ac0KBgweA==
X-Received: by 2002:a5d:64e6:: with SMTP id g6mr9305403wri.184.1643650947532; 
 Mon, 31 Jan 2022 09:42:27 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id a24sm9393315wmm.31.2022.01.31.09.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 09:42:27 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 31 Jan 2022 15:47:34 +0100
Message-Id: <20220131144734.1199549-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/prosody: security bump to 0.11.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

see https://prosody.im/doc/release/0.11.13

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index b6fa6532a..3a3a363a4 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  64a99571a5de84ace24d8142a1556d68  prosody-0.11.12.tar.gz
-sha1  64c918439c2df130204dcd86398832cb7a481eb3  prosody-0.11.12.tar.gz
-sha256  56cd52d820f5b3ed37e02d8a2577aa064bbc04db8e87fd18a6020eba0c10560d  prosody-0.11.12.tar.gz
-sha512  cd03ee8b02ffaa478b5329d9942d833cfed2d8bf720bf580a2082d681e7d333bc34f45041cea7234bee75f1a0e7c07983a685fe2ac9b31d51a0dbb36e87ba5d2  prosody-0.11.12.tar.gz
+md5  7214ee57d4702585bd0d3428e69790b4  prosody-0.11.13.tar.gz
+sha1  1cc5a72d98738872d0c1a4c34b1fcb8878348c7d  prosody-0.11.13.tar.gz
+sha256  39c61b346a09b5125b604cb969e14206cbbcb86c81156ffc6ba2d62527cf0432  prosody-0.11.13.tar.gz
+sha512  7616785536b7b51767a26963a80c961ef2403609e1e78dda3f88cf68c00d5bb899278c70a22b006b58c36c62cbb1bbd390a9298bad5b8d6524928a1cd5457813  prosody-0.11.13.tar.gz
 
 # Hash for license file:
 sha256  bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index d697c8556..62ba073b9 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.12
+PROSODY_VERSION = 0.11.13
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
