Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BA6606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 19:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iZhAiTW+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OW97n7pM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CC5F60684;
	Mon, 23 Nov 2026 19:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-bfjryRuGRf; Mon, 23 Nov 2026 19:58:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A99D60608
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795463925;
	b=OJwVbkt4qGPfo7VUthJkcylFHJFnM/LDMwhfrlrj2kMXaY8nQZmQuqRbsJWERlsYFoaw
	 0M4PkaJbhe2yCpyXvTqMM8jqPjP7hlue0C0uSJa3ML9NlyCA2Gp9AE/S/8KBExuovFzIY
	 0o4gobjyub1lHc/1KqniQUHvVEwEjRymilie0SswohdgLnJAM89Y6ZnGlXxgIbJCMksQd
	 +QyOcNC1KSMkbV89fHfgpOS6zrK7ENmLAl5rCP0G7EP1prEpMkN6QKwCG8aw4jazNVMOw
	 /kmhoYw4LWltRFnRhKMyrmVa4LpMriaFscKjSRP+nGle4N75UPOBRf2Fw0M84vO4kUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795463925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5leOr91SMLipH2Bxk2Bw7r2ODWLZ53JIFKGbmBGpEJc=;
	b=Uoem94IdDdbyjafUk+79VPOIPZCikqkpugDPsMY78uhyIHxp7O0/8OFJMFWRUZhtSBmp
	 QUgz5kYv8DC6GWiyZ+jO43DDSS9EWj6NON3hScKsahNJBYPeHjPsTalobtueZ96cLrCZ4
	 DXtk7BxOvF6KqpujS5Z1En8U06ltSvYY3vqxIpKBKkEqv3O7SUtPQkASyFWQzpFoq1rg1
	 IiMqlRwFiDqG13kaOOdDVTGnFNnpvSzPKHEgikcXK3O2CtGqe+wxdycTWz6+grYfMoh2H
	 guHs7LoCu15l3SllTKwi/A/zEgCD47VRXNAJukTCbKGiaDbNVfGaZpzcuG6csShc1Gw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OW97n7pM;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795463925;
	bh=5leOr91SMLipH2Bxk2Bw7r2ODWLZ53JIFKGbmBGpEJc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iZhAiTW+MSW7VWL0hCyiOlo47y0U8SQNXQ6kYHSmy2ZzQjmH3Yk2R8fij0HOiOCSg
	 u59/HTu9WQxHXCK0PsO7zRDDO7EH5r1fmH/TlGgmqNqhQQYhWyZgQWge+gljUQghsP
	 GJ+z+WMkjQ4C+zqENaVt1qZK8PLy82RkXDtfYYMygBz6sPFP779e6539RDMa2YSBtk
	 qwLmquno9aEIG8orJleSe4cq/hPL1ZQYh7S7zeIs7znLPxpfsTMG03ZBwkYZv688pK
	 bg6YtYBHAyV04lB2iryCneFQ8B1yucrEyq+XQsnPUY52rk1pbz3aSLDDKO5I4L23I+
	 Dmbi3aByD/69A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A99D60608;
	Mon, 23 Nov 2026 19:58:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C02943A8
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5BFB60608
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3UHYKXJovwD for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 19:58:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7B7A7605E9
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=OW97n7pM
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B7A7605E9
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:58:42 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso1738300f8f.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 11:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795463920; x=1796068720; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LpGKt5rm+uN5w2ev/dQqrDRn1iQ7GHB3lTrobLokEvE=;
 b=OW97n7pMhWqNsHxPqyjm9iLPkJb89q4xCHwokZkuesdeX1+XNnPoPaMzcoDpZw6scl
 Xq7hVOGBGxsVbUUTCyDyH2sTcPV/Z6cX3FjZ1sQXURIproyUci6D1WKNPxz/yC9MP7l/
 /Xckcs7z0rw/2G0vo0Da/a8sb3xrladgmy/tQbJe8+i29XsGhzR7g5mdF5gfH8/JoUmt
 Pp34B2+XqwkLTTrTG+2biETCfRdNToM7kr3kS9eAt1xGrd9vS4db5ppQm446+ccKfvZT
 4NBB5m+O4LDYex+tvr6o+Ysg/aXwvAZgeXChf6ZeOxfgJbMG6dA7QzC7wAyoYWCI61to
 VRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795463920; x=1796068720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LpGKt5rm+uN5w2ev/dQqrDRn1iQ7GHB3lTrobLokEvE=;
 b=lU6QmNRXeXU+Ixt77FjL1jbUQTwfh23oeFmzegcum/3Lseb+9+xvq78bvTtXg9wMho
 A/zHeiKYf/ygMUBxossEDCY8fYGpz5xyNvL2nWp8fRWEJlr4zNF2VRBcQg8MRm3hHBQF
 lG1J6s0YWDCIAK2Wb3n1ou7hbVKFP16OXUPnFcFPWCednFgvq4y7MBP4pIGuM1pRQHmg
 RjAQ+g/MwUc4IoidEXpjm3ue/mumrMbey77s6b12z7Sktq4zn/Eekd/5Xze1lHzfXXk3
 VhotXB9SMqSCWYXW7jtZWrnBvhfyzLFpuIInkwoiqPsplTxSDC9JbvV7hmGgMWNLnOKi
 V/dg==
X-Gm-Message-State: APuU4Z+oF8M4Fi9rPrc8N7tn1bqJQEOiCpgWcD1Ie9yxdqlDsVb06aHI
 +qc6XQOWgSbSoq/S2rJT/dvLBJabYryUJM6mSZtMupk/732E5nAIYDvv5CggDAIY
X-Gm-Gg: AZFdTZeRGRrLIRGCIkXuGR7+esdfv3jQnMlNT2laVjjc+BbnQQNhRNeDKJs386+Bsnf
 IS/5q3ZQhRvJzTgj0akK93c3eUsZbeDqFSY7WvJQDKPs6vRZ5TIvHggB6SnkGvSIx6ExsoQcJMd
 /rLsOfI7gDJzbYE3jtl7oFbEdgOQkzpJIeodpKoUdBvHqriSCu2r2e0kutiK8rR4ZDIc1eVoD7w
 rIe4ybQhfTYTaupscrjwtvdFWgbwgk+i+FMqWhi5VPUncoM5/toEaHo4Lh9Iqg/XSH9LII8iPd8
 OEOt5AGcJTLcscoHlSqtWC/5/+zeT1pTjWruPnfFUPZxb/mUdjzBFBPcm4qHcjlUlRKqA9jPPwo
 QZVygiRTnjLwIFxV1oDrAg14jBnv2JgAYmS7ivQ5Rw9RKcDvQMCrsL03cNE1j4KjXSXb4WpiexL
 Vi+yvQZYRklyZQDACzcnpdXG1R4JctgGFE6mvLWVavORUdrnotbqHlmH8FEM4kv88ZqTXxi/N6a
 W1GKOgPLTJPZtM7zxlCEbCKrmsYHCD6I2XhynZauDC2dwDQf8u1YN+CRRtIv1agII63meYgoAyp
 2tSOc0ycF5kD/ZZWZiJN5Y4BuCU8DBd2LSKlnA8Y2xzW0qrhw7I=
X-Received: by 2002:a05:6000:4a14:b0:49d:7e8c:e89c with SMTP id
 ffacd0b85a97d-4abb6a26cfbmr24251352f8f.42.1795463920168; 
 Mon, 23 Nov 2026 11:58:40 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b9add26sm24194005f8f.44.2026.11.23.11.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 11:58:39 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Nov 2026 20:58:38 +0100
Message-ID: <20261123195838.3045677-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240326163750.2211753-1-christian@klarinett.li>
References: <20240326163750.2211753-1-christian@klarinett.li>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/zic: enable installation on target
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Hitz <christian.hitz@bbv.ch>

When we configure a time zone on our device's GUI we use the standard
time zones. This gives us the usual benefits e.g. automatic daylight
saving time switching.
We also need to support an API that wants to set the "time zone" by
specifying the offset in minutes from GMT. The given information
is not enough to reliably selecting one of the existing time zones.
Instead, when the time zone is set over this API we dynamically create
and configure a "Custom" time zone with the given offset. For this
we use the `zic` tool on target.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - pass TARGET_CONFIGURE_OPTS as make arguments, like the host build
    since 9139159d39 ("package/zic: fix host compile (needs
    CC/HOST_CONFIGURE_OPTS set)")
  - rebase on master

Changes v1 -> v2:
  - dropped adding hash for patch
  - dropped installing header file to staging
  - added rationale to commit message

Supersedes v2: https://patchwork.buildroot.org/project/buildroot/patch/20240326163750.2211753-1-christian@klarinett.li/

 package/Config.in     | 1 +
 package/zic/Config.in | 6 ++++++
 package/zic/zic.mk    | 9 +++++++++
 3 files changed, 16 insertions(+)
 create mode 100644 package/zic/Config.in

diff --git a/package/Config.in b/package/Config.in
index 49659b007e..dc683e7486 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2327,6 +2327,7 @@ endif
 	source "package/volk/Config.in"
 	source "package/xapian/Config.in"
 	source "package/xnnpack/Config.in"
+	source "package/zic/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/zic/Config.in b/package/zic/Config.in
new file mode 100644
index 0000000000..11a8c99a66
--- /dev/null
+++ b/package/zic/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ZIC
+	bool "zic"
+	help
+	  timezone information compiler (zic)
+
+	  https://www.iana.org/time-zones
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 43e74e64c8..99d2080ac2 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -11,6 +11,14 @@ ZIC_STRIP_COMPONENTS = 0
 ZIC_LICENSE = Public domain
 ZIC_LICENSE_FILES = LICENSE
 
+define ZIC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) zic
+endef
+
+define ZIC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/zic $(TARGET_DIR)/usr/sbin/zic
+endef
+
 define HOST_ZIC_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) zic
 endef
@@ -20,6 +28,7 @@ define HOST_ZIC_INSTALL_CMDS
 	$(INSTALL) -D -m 644 $(@D)/tzfile.h $(HOST_DIR)/include/tzfile.h
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
 
 ZIC = $(HOST_DIR)/sbin/zic
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
