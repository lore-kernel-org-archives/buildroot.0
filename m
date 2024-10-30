Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCDDD3A667
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 08:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C5B80D66;
	Wed, 30 Oct 2024 08:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHVfvVjep5Jj; Wed, 30 Oct 2024 08:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CABF480D6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CABF480D6A;
	Wed, 30 Oct 2024 08:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E8D05E50
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 08:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D0FA80D6A
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 08:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CG65OyZrWLU for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 08:58:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FE8C80D2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FE8C80D2A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FE8C80D2A
 for <buildroot@busybox.net>; Wed, 30 Oct 2024 08:58:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-431688d5127so59966125e9.0
 for <buildroot@busybox.net>; Wed, 30 Oct 2024 01:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730278704; x=1730883504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4XBb67pLcAUvcrPnemb2ZOQG4BSGANu9WjhSEC2A/k8=;
 b=kWRnIUa0LC4aAMGPJkfGNjMZCINqfwVY9I4suninhNYoA0t3UiyZXlJwwdrP4PHi9p
 2UOM7ZPtTlYbgkcWJxeM8OtbD1LJpg5kqnPRcbFxq0XHTgExhcCHGumyLEgFj5ZqMgbw
 vLbgEul0gqFdqYCMDzGTyyhIpHhC//rvRDLt6ipXv+KbPlovFTx9lfbAdep3O7zlHz/N
 G5wqosAiHeO97NgvwbRIYd2K/6vN+1N4Y5pB5w8LKGYIsDcBrc5K0BGkOZvsj8dGZ0uL
 rHZpoW6zJSiM25GOi1sEh0cUx3KljSIBGNf16HRwdvxDY8k8s2YXfm7Ezm6nN2QAPMfV
 m6qA==
X-Gm-Message-State: AOJu0Yz1lt+3SZyiIwTymj1NbFnXirgg+jcB/T+HoKkVToNpUT45PrY5
 eWzmobhEv2Z4teSMsKbt8yLBi+nhR++h6GtDRwAGIDT+EjDiqwjXH1XHgdY0ryEpT5S3JpsfK1E
 fpw==
X-Google-Smtp-Source: AGHT+IGDfwhftUProy05kqfY24eilIsEVHMFvEjHuc6Djw/LlYf8+Q7a8izC50y4h6BDSCevnAVVyw==
X-Received: by 2002:a5d:4bc8:0:b0:37d:481e:fca with SMTP id
 ffacd0b85a97d-380611637c0mr10950322f8f.27.1730278703887; 
 Wed, 30 Oct 2024 01:58:23 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b92963sm14785197f8f.98.2024.10.30.01.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 01:58:23 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 30 Oct 2024 09:58:17 +0100
Message-ID: <20241030085818.912555-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1730278704; x=1730883504; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4XBb67pLcAUvcrPnemb2ZOQG4BSGANu9WjhSEC2A/k8=;
 b=Ial8LhwzECXIGAujLghfTmKaMNRdZTRJ6EdhYb2BcMMhkodwN6grAi/Hs0Dcm+7WW2
 XRPyXZJVH1W1Z4RkHxpucY1aMAx7MBddP1nlAVvRdg5J7G/b5kXvbm9VtMo13nRJGsbj
 HXRxO5oUo1p7sWpuoRJAZUUiPgsdX/SQ0LnhGxaNs9KlB7Mtu0F5g20CY7e33VdzP0KN
 LyX2Or7MYw2p8TbCTmAUweHPCNuvX1Pbxh9pcsXfZnCNZgZPG2A+FtpIJsSgwepWo+5B
 x0OCGI0vLRqEyX4Esji+5RrOCjbhxnZxNVzgeUt+GPpZ+9mB+UYKdIwlpniDOlVwOgnI
 U32Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Ial8Lhwz
Subject: [Buildroot] [PATCH] package/lua-compat53: bump to version 0.14.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-compat53/lua-compat53.hash | 4 ++--
 package/lua-compat53/lua-compat53.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-compat53/lua-compat53.hash b/package/lua-compat53/lua-compat53.hash
index 1930063fd..cd2c35d62 100644
--- a/package/lua-compat53/lua-compat53.hash
+++ b/package/lua-compat53/lua-compat53.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  bff8e597384776de7c139bee7d6a6f2c05c3eb7315d08733473fa986720cec60  compat53-0.12-1.src.rock
-sha256  870cdff7e4db4c2e84a335b2b9e242b9f963830550026e2057a5885e945982e5  lua-compat-5.3-0.12/LICENSE
+sha256  987e286e63e568c2a7d50b6a66ea9d4189254be49ebd6477ed8945e23e195c44  compat53-0.14.3-1.src.rock
+sha256  870cdff7e4db4c2e84a335b2b9e242b9f963830550026e2057a5885e945982e5  lua-compat-5.3-0.14.3/LICENSE
diff --git a/package/lua-compat53/lua-compat53.mk b/package/lua-compat53/lua-compat53.mk
index 12ac5c011..048a52279 100644
--- a/package/lua-compat53/lua-compat53.mk
+++ b/package/lua-compat53/lua-compat53.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_COMPAT53_VERSION_UPSTREAM = 0.12
+LUA_COMPAT53_VERSION_UPSTREAM = 0.14.3
 LUA_COMPAT53_VERSION = $(LUA_COMPAT53_VERSION_UPSTREAM)-1
 LUA_COMPAT53_NAME_UPSTREAM = compat53
 LUA_COMPAT53_SUBDIR = lua-compat-5.3-$(LUA_COMPAT53_VERSION_UPSTREAM)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
