Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D8606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 12:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mVhF+xdL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E2AB4087E;
	Thu,  5 Nov 2026 12:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KVItl6TZlW1; Thu,  5 Nov 2026 12:20:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1823840870
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793881248;
	b=ZEocsoN3IviAvVHFGMg+5BX+CyLepIKfTw1CEeVJXrRmu6KD8JdDlRmQML2YoWpWggtL
	 NDfeTOoI4CUiCn/g8Uo7T2zo8/PV8uRISf/Zra3AroDA4TajnZEyu4cPm/e3dhD0vt1FM
	 GtBaBE8vcqXGhM7v7t+XqJNXc5eQgulaQS8IykupxQYF6E3SwRDH+rt/v3BXf7HgIGxv/
	 D9xb2SFPiYcJY6IUmk/kt+sbhsyXNo7Gc/AA9TthUxWNdu88XbBE+XVgXcZU5d2MTq6u9
	 jBWY4lf+jlKbocLU5SmMz7SdD8d2FZyCJ0IdwLAP3BNyv2NQKGbWHOxoxXTZycBEWEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793881248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MQq9OQn5GF+HCZOpILrNaC8oN01chIHih7SRGgOI+fI=;
	b=VtPl8hewUWh1c5/Y3A4l5W/VAVgZQlfJrrz1YQMzXy5ge5xJ5Wm6spr9LVUVUzd8PwQm
	 gWm+Om2PuXwSDAP89j5cW7dTgZzZERfXjNzW4RwW5epSk1JG1oHNGlWrzhL60ooSRo676
	 Qw65GYdPGiUyKK9EJTxmIr9igvO/OGNWL39Zqrdq1jw5ZAthVyiYbsd3ncdwPTNK9sD9Q
	 Ob1yLkFfKlrMINyxpD8JeAhK6tXeFRadsuKhWMtPZGrwQYJhg2GCnJS0qCrJ196zR5u27
	 Apg2vuPY0gljH0ihtLY+FW3tRtH3ABMwMWnZICIp8hhN1yj3QYZjYAVwip2p6AhO2WA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793881248;
	bh=MQq9OQn5GF+HCZOpILrNaC8oN01chIHih7SRGgOI+fI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=mVhF+xdL85olqjNqSgrGCiScyobO1KuH380Ccj32yWcVhxm3HTo0pPIIjFjQAOMtF
	 TTZtMGSEEnFMBDor3rY1mFfHwBPnBIyhfdLvXqSgRkMgZDyhNISY7BvsVlR4tlh6HQ
	 smGdIqQe/hpvLL8zvVfSDtV4T0FlFM0UCZjF3aBddcdpmIJXlaaz7xDhkPlv2rzpJj
	 tSWW/ceTn8dd6FN+8RH+AClBkjl4yEuBKn4yX5KIONqYMv9z9+b3ZBoBmLDaOlZH/o
	 dMU6K+0DVyLval/uQoBsnWhd/76MdPMiQKCqnVALMOKp6Sd+fT8gAvoyK39yquQWE2
	 hoEVLn3YaiLsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1823840870;
	Thu,  5 Nov 2026 12:20:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 117B652B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 12:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB9374008E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 12:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyyrejKLzG9C for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 12:20:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D4A894007E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4A894007E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 12:20:45 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b579003f29so1052895a12.0
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 04:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793881243; x=1794486043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v88Y2LobEseqSEUt5LRvlXomWYVGMoOD13l48fsJbvM=;
 b=VIWh1EH5X9UVBxFtStJIPnX/ONJ43Smy7b5BdXzTUpAecBvgiBRP2LKCFX22retmIn
 4aDE+EACjdCH2jemyc+/rE4mswOdT8jk/aYQB0KDIVeaM9vryRHrvlwEBpQYAvtPwWDW
 CTJh+0rapI6rtSnA38OgoZ/ntGAjY5+NXNQIE3jRX8/0nnzgAPiDBt7sOSTXuCk85a3R
 +qyEIiXHnjIldWhBb6+soxESd72onIWcguM+uaDcTN9iarKoG/6lHyUcO4qhwgyJzT7I
 dq1TZlLqMkceZuA3DvbFX1jdKt/2dBhcfs8Q6H+80vkC9DNmp7lWeYGqbx2QDa7bIHJZ
 9HLQ==
X-Gm-Message-State: APuU4Z/i9eWXHSaZj2Zg1ak0OZFWbuy9sNqsebDqCbGEyxXISXDbzRhY
 25MEZAooXCDmp6SLFL+VTuv8HQAIzoRUkW4XyUTlzTjInCbjLnxNSDL5d0g/qA==
X-Gm-Gg: AYBFou1Zwdb+XGMYuB2HORaTsFutuZ17rkJV+yOza2fyMriIuVv+xk+veki3FC2uvtO
 mHEGmXkm/y9Nw3bLv4oH+/wuJNjEs5WmhnW3A8lb8lTyUCmBV+kY8JuxsaQK14cQGoHYkif/6D6
 bFvR9jcvuUZaNayAqcTibWKSGVXMCm/2vZo3MAkdfXXfRb7uYDGOGBP1QbCVhc+7Js1zUFCDhvb
 BNJlkNG8U8mJUvXBSxY5LWlXkBM0cWbdlk95h1gVyxPlk8j3qxNThRur38gpDIsd7l8fRobCeNs
 vYv+t8BXHAqkRAlArfSF2+QMe6V8hB3o/7UQJ2wOELwdiBZ97XfDDBYnGTWm7S1qwEhj6vvCO4M
 sAqNxJGmLfnhk6ei/ktp3j0rSIUMXVt4tJ0eswsVyYqM1nX2JYqtBw9Gi+dihO0cDPPfXW/ZUgc
 7SpgSbuARKjGF3S1Kwags/kX7anxtSPRWupaqiofFDV8+zr/KUxEmTro+HyL+pVSA1xOCDbDVK2
 jFd1crIvBXLtiZClrxOUARz3/ZNSsAC4rzMbRRff+st0vse5fS0Dn4mtu7MN7rOt4U2S6/VEG50
 wDiKWQQ9bIMk+0t1uzN6rTRVp5iQoyCgex+S1C1axXSz5ep5d4kQIjvLms4KDngV3g9U8iB78xX
 QytSGvAsD
X-Received: by 2002:a05:6402:4505:b0:6b4:8d16:f026 with SMTP id
 4fb4d7f45d1cf-6b4d3391cd5mr14612020a12.1.1793881243211; 
 Thu, 05 Nov 2026 04:20:43 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b57e26b0ffsm603885a12.32.2026.11.05.04.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 04:20:42 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 13:20:42 +0100
Message-Id: <20261105122042.1167294-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iproute2: bump to version 7.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For the changes, see:
https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/log/?qt=range&q=v7.1.0..v7.3.0

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 691e87bb43..645b1b5d79 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  fd9fa1b95809417157ca83dd72957e3261bdbce896353cb936f80af0b33a4b5c  iproute2-7.1.0.tar.xz
+sha256  5c1789d290bba048a6135ed1ab81b0402dd0fb528d1f1421765c42b1fc3d6289  iproute2-7.3.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 344a6fa8e4..aa0a094db1 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 7.1.0
+IPROUTE2_VERSION = 7.3.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
