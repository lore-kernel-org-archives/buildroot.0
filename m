Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9558606A32E
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 14:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G62p2ITv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BfcsfBrc
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3F8E40E7C;
	Fri, 13 Nov 2026 14:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fQNX3boGUDy; Fri, 13 Nov 2026 14:17:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 53C2840E6E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794579473;
	b=VtsOcSMwEUtD2J9j9ulQDU8JUI8WhboFXrr6d3FnE0uGuFPaAqziFeI2w1GcMLkz14rR
	 ns+qRoD4FgDNfI7Iv32ePv2dcy9a+d/RsU8g0eGbPrQ/x5JfzAskE7myZY22Y/zLjJOzE
	 VtztGjFrewK/4DK7YK8CMLyarhmAeL5zr/PRftKw8zM9+o6KicvrFjDM2XxS7AuZYx8ky
	 VbTzaycciUStpJm8So8jGlTInTp25qGecWNLRTr2D+mv4HzSl6pJQuin5Bu/E8udduhEV
	 cohtFEF41GEdlmjenHQku8TZp9mSaBvOoAbFDaFZpvjqyh446cAOjvVvkJxdOjUPQNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794579473;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xpBZK3CBLuAg2JONzsiTlgApXBDNqnpl31L0ugC3elw=;
	b=MzYREwPot8Wv3PMO8+mll78BDL5e+hYgOoF6QVpzCqlpgPuF3YBdmltiJoTzjaG3Kclq
	 cJUgVOACj5rJq47A08YXq7lC573Na43SDoxvn+0FoWR5dGvbY1jf+oen5ThaMhdsQ49ST
	 doV2um77EH9nZUtutnI4IxzY9w9RFpXYc586ZeNxgBoJSMPiHKPo/89x2LYesTTuvovw7
	 UbH5ds/qbngXHlWc0h+nCr7vywd0cg7GPLjKZNCRYbtZ7cbzKxfQX3Z/KIT2js/HPd6kJ
	 oX+ZWPEBuEhQxy805Zcc0BdUZf34Sjc8QN4js5pw6tj/8Hlly4C+xZT/ao2GhcKRkAA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794579473;
	bh=xpBZK3CBLuAg2JONzsiTlgApXBDNqnpl31L0ugC3elw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G62p2ITv/9dFdDwCB19h9xmdqI2wlgndEiYRf/BHyZxKEqivAdNNxG7D/17oEXdw1
	 /VXmUu2nyb2rKoR8T/Pi1+Lw5dqtdgBZ+clRmBfhVSJu7KlB9Vw78QEtTi1Bxmsxn5
	 fkwCYH30HXSK+djQ+vt1ORMYs4XeHPKB+mU0fngdBscqB4AM0o9B1gjzNFtlEIpWZh
	 Rog2nTMgAtqJ8uJbE2Ldk50epDhggKaypdduWstyU44R1BCzLx37oEFD+q2Z90yaWt
	 oEgjuEJ7w7U6y8SmQpRpx0wZySJJqGKoc286fifqtzmLTOWf+iFwCU7pA5gkNGHjSj
	 0iBrnt8Pn0Wug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C2840E6E;
	Fri, 13 Nov 2026 14:17:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F6712FE
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3554660B0C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PKun0FxWlcp for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 14:17:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8D552607F7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=leroys.fr
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=BfcsfBrc
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D552607F7
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:17:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso1412974f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 06:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794579468; x=1795184268; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=iKU2wYhNxSKjaLsjBFGYd2/MjHbIHXY4LJwzbMNcsHM=;
 b=BfcsfBrc3EmBAEZT//oHevvHILcK1M09kR5ha7P7ZirDeGrm9eBqlNi8QW8v8YCndK
 Ona4qTStpaYaLtW3OpB/0YYFftTVBr/p09AsXkVvR1Hof+BPqR/UA/RbZC/0pZ0GunYC
 JLONcEMqKFi26uRSaDdfrmVM+IwSup2Mj9/BbK5ipDIkUg9rniSXqH4ipdxF/uNn+Yij
 heGkan99aYjEBSmLCK2kq+keKyDzw8iN4uUoOBKXDwVGlMAHaAWOvduw9hbS2xs1+GV1
 5Sh6b8bhAAl4pV19WxiDoxRK3t69Jn6pabZJ12OUJFOZNT26fiJP3dNl41xfBO/TLf0U
 gaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794579468; x=1795184268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iKU2wYhNxSKjaLsjBFGYd2/MjHbIHXY4LJwzbMNcsHM=;
 b=yB7SWftSdvUvOtVP1ZmkmoZgPaZL4acA2BYnYZv35atIniQ6zrlIbaPI13/31VtLi3
 o7g2Xu2fCW7ayROb4TEVMX4WxxzkVjsDAeKqms3Dq1tARqXhZl/8JotnXRXvORxHwFPY
 P+ZwTwuHovbCqsfaPnhkATq0FSr5cS3nY2//eiSmqBqk9PZu8GYQiMGU9/XVnHvxqDnm
 In944y6VcPK5N1XeM4NTu2FUR4wsUZoFW7oFQzU9svSqOzfv4Xvxgl90jANDEcQ8evFz
 qBPtBtopiAvJPeLuX+HPty7yA45UCxFbquzrppuW16P8UQPDJOm/jIUYPSRE9HO6gtW7
 f2Cw==
X-Gm-Message-State: APuU4Z9x6rLQfYZn5MgNoA+NFU4qr6EwZejmoQSm9VW5UkLi7yRuuwsw
 cdwxnUbxqpV0V0Ec4Klh8C6cCMCG9F8keUb390CX5nIyWh7OzBXtJpRnRG5D/4yt
X-Gm-Gg: AYBFou0kx3CW80uBJXPHHmL9YLqrX+ihkJadxzs12SPS6pzurnR37UKb1YRWdRHFN0K
 +AQd1yaEH8iQdbwCBvTfy8GdFRNq9Kh/OK0oxAU7rAvbh9qohlQkzuZaeqSB9WjkdTanmHfpnWX
 J3/GFDu+Ij4xZwDIONhw7Sfw7VuSHs1Coz3jXltXJXwzkx623NTCS5Iku58xZWyNJO5ddpQ+N8I
 78TR+oMAMv9x0I61jx/q97XByxSC4vUOpduc/CoGhgJuF4uksNDVQBesDK9O382D6SzMYMJW8i5
 EehBC5jNabixBa7XFgmPwTMtP7QNISSy/pZhRbsGDXJbQytnQGWF9f2pXBlDo4EX0jaEGdA3bue
 qoQw8njJmahsXwRyxyYc0zKAvSRtJ5kGICJu7q/2OHKhSV+mKDYwy+uDTdRxylo82PocL+X7kjU
 4X3TNkL2M0pB9Sd21A78jpybloK40v5KMaXsExpQxajswNFUC6BpvvGMrBYRGc11h0AikPohgEc
 13hBANMklqtsxxtSrRp7PJ8wWEbSwPuc660BcrPohp8ZIKAGpMoC5KWNEIpmOCgGg62ruHtIZKQ
 u096hU1S5v1fub/0KAPwaInkbryayrSZxXhiWmFqIH/bsgIy4PJqUu8Bw9U=
X-Received: by 2002:a5d:5d86:0:b0:48e:43a:1d84 with SMTP id
 ffacd0b85a97d-49c712ac267mr6020740f8f.23.1794579467904; 
 Fri, 13 Nov 2026 06:17:47 -0800 (PST)
Received: from freepad.home ([2a01:e0a:1248:bd70:6e73:1fc5:d018:513])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c603f4d29sm5418903f8f.35.2026.11.13.06.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 06:17:47 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>, Vincent Jardin <vjardin@free.fr>,
 Maxime Leroy <maxime@leroys.fr>
Date: Fri, 13 Nov 2026 15:17:42 +0100
Message-ID: <20261113141742.209508-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dpdk: security bump to version
 25.11.4
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

See the release note of the new versions:
- https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#id4
- https://doc.dpdk.org/guides-25.11/rel_notes/release_25_11.html#id7

Fixes the following CVEs:
- CVE-2026-86561
- CVE-2026-86562
- CVE-2026-86563
- CVE-2026-86565
- CVE-2026-86566
- CVE-2026-86567
- CVE-2026-86845
- CVE-2026-86846
- CVE-2026-86847
- CVE-2026-86848
- CVE-2026-86849
- CVE-2026-86856
- CVE-2026-93683
- CVE-2026-100236

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
Tested in GitLab CI (all jobs passed):
 https://gitlab.com/maxime-leroy/buildroot/-/pipelines/3063567560

 package/dpdk/dpdk.hash | 2 +-
 package/dpdk/dpdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
index adafe2dac6..f5197a7c51 100644
--- a/package/dpdk/dpdk.hash
+++ b/package/dpdk/dpdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  418bfe3212640ee95a1cb10af6ed360cad2387686fe2721f8a3a9cd02d5ef4f2  dpdk-25.11.2.tar.xz
+sha256  50272f214b2e7fd23dc9b6b4d5408b54798021b19611339298784faa5a189b43  dpdk-25.11.4.tar.xz
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
 sha256  ec514554f1b9e90c4f55167267c22da9d511f884877c32a5b18bee6b7c8b18cd  license/exceptions.txt
 sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 968a5a877d..e624eab62f 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DPDK_VERSION = 25.11.2
+DPDK_VERSION = 25.11.4
 DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
 DPDK_SITE = https://fast.dpdk.org/rel
 DPDK_LICENSE = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
