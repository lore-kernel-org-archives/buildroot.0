Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D7CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 21:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DB054112C;
	Thu, 31 Mar 2022 21:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_z8wulTfmpd; Thu, 31 Mar 2022 21:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 938C94015E;
	Thu, 31 Mar 2022 21:31:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1FE21BF35B
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 21:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D02A984048
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 21:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CfJG2eyvmp4Q for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 21:31:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E812D83FEC
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 21:31:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u16so1546845wru.4
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 14:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gNgqh9f6Tz2oHUFKATgsBmTcIUYT9dpuLunq0xg+zBE=;
 b=g6WSlrRN/0zMl1d7Zo4k9ivc5Hevmj+fdVMUXuNBxJUhc/Uvr6Jrd0DB4XWVOm6Q3J
 vZON1oASO1oDMNf92rZH48ZUmOon9zwvgadYHCokus0qJSZfk/eUd3B+FunuaSeLjAqx
 MENujLLb9YXIRSDVjYsgYfC4JfOQ6GqPtc+X0Rj/mIw12zmILv4JumwAWy1NWw1SayzX
 lPCQFJLv4uMwhJsZ5srxLDQ/2HiXGaJK3vZ0E4l9BDZmPfN6JS3/qMcr/eSLLPoka9Nm
 p7p/pdz9hMJgJg7zm6iSpVQGWInK9dM1iOt63ocvvlAlull3W60LJLyB1JIlvSp5Sn+X
 1tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gNgqh9f6Tz2oHUFKATgsBmTcIUYT9dpuLunq0xg+zBE=;
 b=B+akA+EbUnVfZqeLxd2BBl8HdP2f1VZo1zJCVTw91ue6lxnQ9cfM1aAm1XYDv3BFxQ
 LmHIIXLj8P6eRlWJpGovUsB/D2ZTzGNi+QeMC6I5UK3IgRKwP3kT9WmRi86oTI4e5xQe
 3HlPNWFojpFImXaYKCipYxnmU/Sxmb1tTJk6OXxQNlhMseoX4RgvjiTti47eiqPFz/jg
 MaL3iAB1O7PtFE/yWonpKj6xjjjsnBWZ9h5RogbfYs7jXiYGpc2oVrneTwxxktlQfQam
 mU4ijF4utehreBXqEfpsayg/htwQ70LlASVTFgmctFSQfmq62CKjM0j4c9N6sBUnGZil
 2Izw==
X-Gm-Message-State: AOAM532i1w+Qlj+ND05p/hDm7r/2xjQCkTGe9FBUek8sv63lyzotrwe8
 JMhsAbanTDe+1x/eeNAY34l/1JieX2E=
X-Google-Smtp-Source: ABdhPJxX2LpodkfQxMtArnGYSZMFTIBlCuVWxSyAOyMo0wajqOBqV5Ec/Sfj4wbB5YopdQZBcTNiUQ==
X-Received: by 2002:a05:6000:1acb:b0:204:1ce4:7c2a with SMTP id
 i11-20020a0560001acb00b002041ce47c2amr5300127wry.234.1648762264756; 
 Thu, 31 Mar 2022 14:31:04 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a05600c224600b0038cbfb9cfbcsm8034800wmm.47.2022.03.31.14.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 14:31:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 23:29:25 +0200
Message-Id: <20220331212925.39676-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ed: bump to version 1.18
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

license has been switched back to GPL-2.0+:
https://lists.gnu.org/archive/html/bug-ed/2022-02/msg00002.html

https://lists.gnu.org/archive/html/bug-ed/2022-02/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ed/ed.hash | 6 +++---
 package/ed/ed.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 90d467d1f3..36f9b9c1e4 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2021-01/msg00000.html
-sha256  71de39883c25b6fab44add80635382a10c9bf154515b94729f4a6529ddcc5e54  ed-1.17.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2022-02/msg00000.html
+sha256  aca8efad9800c587724a20b97aa8fc47e6b5a47df81606feaba831b074462b4f  ed-1.18.tar.lz
 # Locally calculated
-sha256  f03a12bef9dfb7281864a0dd965166d4f4ec7a66633df2bc72fa4363e57de02c  COPYING
+sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 975cf3be10..645cfb7696 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ED_VERSION = 1.17
+ED_VERSION = 1.18
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
-ED_LICENSE = GPL-3.0+
+ED_LICENSE = GPL-2.0+
 ED_LICENSE_FILES = COPYING
 ED_CPE_ID_VENDOR = gnu
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
