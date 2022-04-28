Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CD3C433FE
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 20:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 778D141BE6;
	Thu, 28 Apr 2022 20:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6VbIfrVRgVq; Thu, 28 Apr 2022 20:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F06341BE3;
	Thu, 28 Apr 2022 20:51:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AC361BF36D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4526141BE3
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 20:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTjkeAAqfdMe for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 20:51:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5242C41BE2
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 20:51:33 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q23so8305210wra.1
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 13:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BxZckL9q3AKZlvVKNeuP2bvYYu3QUmStRc0YP/Mn6nE=;
 b=CXX6yAx4tyXK2XdnNzQo9//kimPpHlgvxpysv2uWJK2/hIMLtS3TGaI4u9+uKrjvRZ
 3nJoKWXUZGYRtliQrXt/0ud+mDxrLpKtTp7UCjD+ZYQr0mT9/o7wQcnGUsNlTQe+gPOU
 efAdzbwP/V0lHq5gW5CWx7FGhzA2TERQexJ5Bq1UUbfjQbfpGgsR8GG6UnEzjr1FWFpl
 60Gr0BZpKSm8icmmZ8rbvbYGxco38xeDqp/2/kMlU+LvAFD6Ap4B7j5vGznOSkV8jXYy
 8dYk9sOCykSzl8AEErWPw+vcpybu4s7Kt1l/aTnNGMZ9VL4rPKVvz/GV1wr/H1OVv/jX
 jHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BxZckL9q3AKZlvVKNeuP2bvYYu3QUmStRc0YP/Mn6nE=;
 b=QC6TCvYZDJmfzYeqggmw1uwQLzH6/zwcXTAJVbyn43AqkAAaEXmphfFOjJHxYQbOBP
 ACG6HFyitxxDeP3t6tWHLYkRW6oLWwvL9MqCam87QWgt2IbK4Q83J++HyO+NhyJJbUkk
 gSGCzcOLIwzX4gERJjuMHFhu3X21REn6xAa8w/CxCaPxEVgofjI7ad3WPpLDY27l9SpG
 ++MZvhvnwA9ITejZ2fWH8+3NP3M7pGHIY4sQZ4TcH678g8+WmxpRr6SfSiehESVOm4uc
 Cq1edHS8HEEyUOeGATgtpG79/cRvtzWQi171/ot9WV89q6bcJ2y5mL+FwKg97HbN81qu
 OTMg==
X-Gm-Message-State: AOAM53046NkW5dW9+eIQcCLCduBruRo+W/W/h4s0BzFL8nmtprv9wC11
 8XeZaeOiEkIj7ujsOpAVpqj2369CsLo=
X-Google-Smtp-Source: ABdhPJzKZWmDBiEIpiot2vHp1QmQCLsS8RfYu2z02b0D6DEm4yRjuMB3DdA8GZDhkQF12EJBGQ7t2A==
X-Received: by 2002:a5d:5707:0:b0:20a:c768:bc8 with SMTP id
 a7-20020a5d5707000000b0020ac7680bc8mr28272116wrv.565.1651179091014; 
 Thu, 28 Apr 2022 13:51:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfbb42000000b0020ae057045csm748344wrg.28.2022.04.28.13.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 13:51:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 22:49:32 +0200
Message-Id: <20220428204932.948797-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4843
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

Fix CVE-2022-1381: global heap buffer overflow in skip_range in GitHub
repository vim/vim prior to 8.2.4763. This vulnerability is capable of
crashing software, Bypass Protection Mechanism, Modify Memory, and
possible remote execution

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index d55b1ea355..1cd0de9991 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ccd57b074326b2faa15591eba3c86dcc07e53781079c44a0354436b8c4fe9b70  vim-8.2.4732.tar.gz
+sha256  f2755fca3b2f47052166dd601a38411b9adbeca0d43885194db8ada4d1a171a3  vim-8.2.4843.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 4eb659fd6e..be96a08d09 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4732
+VIM_VERSION = 8.2.4843
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
