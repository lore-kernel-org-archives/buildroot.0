Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2243C77B6E
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 562F460669;
	Sun,  9 Apr 2023 21:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 562F460669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2eGtxhtI11h; Sun,  9 Apr 2023 21:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E32B600C9;
	Sun,  9 Apr 2023 21:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E32B600C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44B111BF3F3
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19336414CC
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19336414CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpMOY3l6eLoO for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 21:08:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4508414C6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4508414C6
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 21:08:17 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ga37so8863281ejc.0
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 14:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681074496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KWyY0YQ+UCPD7B316wcXloMRNvsgpGuUl4FFGd9OB10=;
 b=7dJbveymzTcYs7FX9GWSNV8LHA5HQ6ZRQWX3UZQov7kcER+wlmvJlUQCQE/BPQZUbH
 DXN9NP94fT1dMMSac9aG2Ux38poEb2Fl6InJnwHikbzTax1uNhK4L/zleheJkA8sNiS5
 dB+QZM2l3dxJgYK5UjhM4oieiRy73pYtZfSUIOi5G6DlEoPBQbFm9lBl4ufmPJOvy1O9
 bZNO1JdY4/Q4oU+YpmFz7x6mYL1zvaOV6jyiEvBbDy7FelkGKIW8cKLuWw1A/TrLvlIZ
 r9/QkWGXfSMSvg2NxejrIzzKU6m8c6+vwyf4U0B3fPSveyh7jaPyxd9+ar1JgCaMradh
 gYKQ==
X-Gm-Message-State: AAQBX9dytg0OoarK37sB20bjhpRoLiA/3aPL4AGTidd9MIphKNbY9mxg
 jBr5IKaUfm1sQ4vuZN4EGPS7GEjWuunsDm6EG9c=
X-Google-Smtp-Source: AKy350YQPcXlkWEQgV6vLlVhpObXP3nq4P6Sy9zrGuCShs+HetU9Oizl1mEiaEhtTatM1ke5EQD+BA==
X-Received: by 2002:a17:906:2658:b0:878:61d8:d7c2 with SMTP id
 i24-20020a170906265800b0087861d8d7c2mr6112361ejc.39.1681074495911; 
 Sun, 09 Apr 2023 14:08:15 -0700 (PDT)
Received: from arnoutx1.telenet.be
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 du15-20020a17090772cf00b00882f9130eafsm4377979ejc.26.2023.04.09.14.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Apr 2023 14:08:15 -0700 (PDT)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun,  9 Apr 2023 23:08:14 +0200
Message-Id: <20230409210814.496117-1-arnout@mind.be>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681074496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KWyY0YQ+UCPD7B316wcXloMRNvsgpGuUl4FFGd9OB10=;
 b=IlJ30r1G5t3PRG7eolfzsIcrk9GfRpO/1ntDJO+hhQktvjWZuYE6Xj6jlUNFJ9ugch
 JXy21Pq0QZfRX/wQ9AzwsimyuT2SeK7oxTVZ803Uzy57Vxc04XjRLWg11atu4VjLehnF
 5YHHPW99E5EW+qYbazbNIfHFWSBdjFKjoKiMHor3qyzIEZaBkC7df0Xox+wPYBOS5pEA
 qV1dKW5g6xjLw5LHXMFeHWx5P3CBBwVr6LDaYeT6TMUnC9na3863NPsf1adld7MsunhO
 jU0sSRMGtmOhcYDKIVEW0Az1388fHAx4XJ+JhXGy2u+MSPn9Q6f7rJac5nPNTlXSZOwC
 6vgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IlJ30r1G
Subject: [Buildroot] [PATCH] package/skeleton: drop $(HOST_DIR)/usr
 compatibility symlink
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

It has been years that we removed $(HOST_DIR)/usr. Because of this
symlink, however, there are still packages that install things in
$(HOST_DIR)/usr. Remove the symlink so those packages will start to
fail.

Note that there's now a check-package check to detect such incorrectly
instaled things, so this should only affect external packages.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/skeleton/skeleton.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 634c76e437..186cb60189 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -11,11 +11,7 @@
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
-# We create a compatibility symlink in case a post-build script still
-# uses $(HOST_DIR)/usr
 define HOST_SKELETON_INSTALL_CMDS
-# check-package DoNotInstallToHostdirUsr
-	$(Q)ln -snf . $(HOST_DIR)/usr
 	$(Q)mkdir -p $(HOST_DIR)/lib
 	$(Q)mkdir -p $(HOST_DIR)/include
 	$(Q)case $(HOSTARCH) in \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
