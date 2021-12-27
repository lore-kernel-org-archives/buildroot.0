Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC02C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 15:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A51F402F7;
	Mon, 27 Dec 2021 15:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGV77ah5FD-r; Mon, 27 Dec 2021 15:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7476A402A6;
	Mon, 27 Dec 2021 15:03:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A6A31BF3ED
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 15:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 567CB60E5B
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 15:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3W1ijs4WRHXh for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 15:03:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23F4460E3F
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 15:03:21 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t18so32777710wrg.11
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 07:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GqoHsUlaIDU3nLNVjArPlZmOZO9uQ5R1er7tPi68Lx0=;
 b=jMlxYgjPjpQei9TpaA8u5sTwltSv84/WsSKFgafrjaBp3lMpK77jk9t4PQxXqN1HTJ
 V2Xxg0KLYr8Oh4Ui7eVVbi7ndx+obC7TRap4LQCEFh3yEJk5j+j+j/JPdeuKLdJNA+Wf
 R3L0+GCZkyOkTA5FGeexyu1KVJSugiGzHurQ9ozFbqzQbhI1cQPN5JHiDMeeyz9Vtf1R
 cpB6pBGHvLepGU1KxVIAbwPpe1swUnGMdTwiPrhQViCLl+LzJISic0t9uPphzfeOjFtx
 rVwApCTG9nffJvpazUBmmYZIS+LR/vzxkc1jZZ4IN2DHBtPAdjGY4REaLUbVj6y5ae6R
 RG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GqoHsUlaIDU3nLNVjArPlZmOZO9uQ5R1er7tPi68Lx0=;
 b=zBNk4z9gYMkrkUTy1pTHtpWQidlmYRzVFEBoXNyl5GMqQwNyxkgjItsAp11l8k3mec
 MKl4C7oGqVJKAfmg5y6+C/QpUpEEbodA/5hzAzEkDsNeCLsm7a0B/LtNOS5jDFxVoyrq
 11uZFzrgLgNSHbxtOrxUG65xwPa0pvVNl2PwePq/9akQ9v9vRhViMkzSR/gd9QKXAiZW
 hOWYnTqmp/Z73g3fhPuoQBHN3NwbzhzUcZ54n//lPEnjQpaXZWuEzVYix/6KeohV7iAq
 rtDbYgAPNXgwioT2/uXnENYvgo7jER8HUoOCxBASDQ7W7c2+G45PS5i0hpHYOi0+edyL
 8VbA==
X-Gm-Message-State: AOAM53023PHMPVB9cHRdfaPcIyZX4za8GLDN5Zt6zEdtKvu7TAOs4TCK
 5vtBRZyxJixkqJ8nIjzO0PFC5wdrAIU4pw==
X-Google-Smtp-Source: ABdhPJw3E8WddYjnJgqIumEyh+SXKDNaKdu6h1tH8MNRgrR7sgPweDscNcJ6nG1PgD2vX/Xj0akQAQ==
X-Received: by 2002:adf:e0cd:: with SMTP id m13mr12641511wri.128.1640617399337; 
 Mon, 27 Dec 2021 07:03:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l25sm15462294wmh.18.2021.12.27.07.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 07:03:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 16:02:40 +0100
Message-Id: <20211227150240.1978522-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/davfs2: bump to version 1.6.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://savannah.nongnu.org/forum/forum.php?forum_id=10067

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/davfs2/davfs2.hash | 2 +-
 package/davfs2/davfs2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
index 88a314d1c2..a555779dbc 100644
--- a/package/davfs2/davfs2.hash
+++ b/package/davfs2/davfs2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2e6b675685bd917772be60f0999ae098c80f79ff20dc131e8fec4547cbb63b50  davfs2-1.6.0.tar.gz
+sha256  ce3eb948ece582a51c934ccb0cc70e659839172717caff173f69a5e2af90c5c0  davfs2-1.6.1.tar.gz
 # License file, locally calculated
 sha256  0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index 9b96140fd8..42192faa59 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAVFS2_VERSION = 1.6.0
+DAVFS2_VERSION = 1.6.1
 DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
