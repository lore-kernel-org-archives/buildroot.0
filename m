Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B0DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 549BC81493;
	Sat,  3 Oct 2026 21:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJ0l-0GiuwtL; Sat,  3 Oct 2026 21:08:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 75A5C8148F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061730;
	b=snxrrdsQNpKtBT9O5lLvYsaSP1T0mtwCJwo/0x+NGhFkQlzdmbZOgTzkO25svDAJyPQY
	 OHrdYsPPSbARDeTGAKFopRR+7T0CHfPMEWlLUJ9SlT71cJdp+T2AlRbKlkJxg6uoFPpSX
	 W/MCuFORlkKGmTRi0H9454MWeB0EJ8/OrfW4BivxuUY9hOYrUJqtwVyxXbljTtvisVj5N
	 VjwLNPuEo+kEWTzsTAaqwSjjzyWY4G2Eaa4KKhvVs35Hogzco6sNE3yRGB7AAuDtA3ZhI
	 kA5Ob9Fs0LuJ9Cu+dnEml7yB8mNFMrtvHhpcHUOdvG31DPd3QcKmrIMiXruQ75nlsig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061730;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9cpF0tSeyEcTpO2fnHn8qaC85PF+hVHjJ8KqHmBMthE=;
	b=YZjm0DC1zEGls5qJIDbD/yoLldc2g16QJJDPsQoOj2PoW0eygVuD0Z578M6pGPUqR56l
	 Dlxs9Zv1FRqWVp6zxUymDTJp0yQufOWu8+VmSQJJWRn1g47x+wmDgMc+zYTtCA9xb2kB6
	 8KWwUCqKt0sECrF1Qun681m12f3XyIUsm2wjmY3iibDK+xLEBDBnyEDl8hoH2S3RHp9RJ
	 ydNGkSblJFJRemqqvLgdq5za5pzfsF3WK7K2xAjmcJyP5oeKK9ykGZUq2NyQqCWdPPJ5T
	 Z/2WSem5m4SgP0L4nEJWQ6Cxz+j4fMdzVZ26Aw3sD+kZOR5UwjUeziw+G8+cjhz3znA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061730;
	bh=9cpF0tSeyEcTpO2fnHn8qaC85PF+hVHjJ8KqHmBMthE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gg3OVCQh6DJ1ZYZnkekQUi3wedQaYzB7ojCceGHIvWDOG7DAlp00y+XaUefjQPR3T
	 QpsR0aY/aXOOaUjN6vRWx/QlycB4aTKWkWb3w/Vim1zWsbDz+Y6CqlDGb0KNTLqy/S
	 cI7jIpkCpckgYAwkXyTu2pSij8Run2mUdwMCBZv4aKiomSTLmc6Sce4fNeSf6OpYsh
	 qHC/F4ynIQ11dbp97Usmtn/pQ75kC8ts9nP/ZVLUI8qHP6OUKd4HkX7Cl4e8OLHbTv
	 gMLalEWiDAHPiU9BE3URSHvBm+4xidsz3tSK6joyet7Evt71JUE1B96zoov/GFqKTy
	 OyYecoXtlKpWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75A5C8148F;
	Sat,  3 Oct 2026 21:08:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42CFC2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32D8160E54
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scqUFMErGWCR for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B310D606E8
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061727;
 b=nPpD/4awafJ+Vyqb3Bo/KKOt5eYfuq2M7pvuZ9nkvOQJzqOC8XF3ROyBPqNd7eGU0Dxl
 qlVWPQJO8gJab/bwGluGqm5EIDbY4QgAi5mqawACHgmyy9JWxhCEDyJfT4Rn7EFPn5Xwl
 dB8nNEjuXVg+qDuP7mPvQ0gYxTi081xHA50LkktLD4ogygHGsRCYFIFXP0kj0o5U1njmS
 aoGZbOkWP1JZeUuJKxiwTA1avG7sJ3o7MdjYL1qgnodWAt++x9gEQTMaK4R0lzQ3ZIRI0
 y38EZkmlIfTxFlndk/f9nNE37FGCB8cVb4TK7jKvS6jvklb5EOhPxhSrNM6yh6DC2xw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061727;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=6Y48JLcyN0sXrOze5mam0DDR+lkl0EltfbpWbNJ+CQU=;
 b=ip7h/yGCn/GWRTVjqTNgFjd7PVR5NavvTbo/78DAdJlx3KBXdxjh88GqUREiu3OU90KJ
 U+J7ax8hUYyGpOi7U5rPupHAjXIZgIeKzUoh738rR/MkADdsqbfZFzRjf+m4PsUlAKbqN
 nIOM/muA4mEMWM+ZE7a7txFgeGDYiqNxFtWYrG4ljg0Ppe/y3f2lX5j9/zGybQctXCNqq
 LAVe4FsO5iQiuHwtYCPl75A5PNKcBQABkOOEq6g3C16qV6Y8kSkrOjouYuDcFl/zQS5eH
 zkNRBEAaaBFFGoPqKyn9XugwrRq1nabZ4jMwPzQLGf2Ul0OcTqPOUCC8pczwKJQb1eg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NxgZyIYy; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NxgZyIYy
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B310D606E8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:47 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-823b938464fso816066a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061726; x=1791666526; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6Y48JLcyN0sXrOze5mam0DDR+lkl0EltfbpWbNJ+CQU=;
 b=NxgZyIYyTmix79Vy72nh0N2bgengG8pzAAzC0NJp5CMvtopwrukJhJLHU2VlYUCzFE
 TgoRxjFotmx97wed8VQd9DJKpkxmRECDyPlBDeca0IOcofbZI2Abzw+RYJH8686JoDhs
 kfrH1dT4M1gqKygPGlSkq1G2U8uIH0xhY9Qm6POUDYvg1e3zui2hbBC33rna/q4D3vaJ
 K7FNtb3yR82WTZCcyALkKVjC2UOh6q6i3ZbAEot7vTJ0aWNPGXBVbGySoZG7cvSnZI9k
 zxPC8cI2zfc59cq8s9qHQ+IC7ss5/KKSgG0i34XgBtIc2Dcvg5epWvfqftac5ZEYqOr5
 yMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061726; x=1791666526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6Y48JLcyN0sXrOze5mam0DDR+lkl0EltfbpWbNJ+CQU=;
 b=S7b8owgNBFtLiKA045pDPrU1JyRLnHtnUFhIWh9x8FZ1T/V8Y/Grcq0I3Jd3ASFZpb
 SDK//eD6svcUguxVmslfNul0JiDgNTgztoX0fiMBkTrSqVonk0YUmWtQmLEpArheJ+FT
 VuEHFKC5yuChah9PPLjKCzAZfxq8o57UJB2pJ+0qCbHdAbwj/KSAl6YZo6tYzcDblup5
 waorQrUoHnbMDTe3thLzkl6ctxeP8aEsGIK+rQGieVze4mjMQU8OY4NiN2RGe7QX07wW
 7sAmFR8x07i6s3zAcDyBKVhrY9mpdEk2Gaf9Tk+cIgsKKRjxqPH4mPctSOO4Y4Ke7wAa
 kuig==
X-Gm-Message-State: AFuF++keNCCcRJUVGK/E6/WEy+1fEkw2q9YksX1TRtHddt6PQSxrvkyA
 lfQY7Y2cvWHcXiQ6ZGuyzbAw9Wgv2NAbpnAY2zwx2KqZxmpEaukF1Q7e9hk0Xw==
X-Gm-Gg: AYBFou3Bx9XlsuzTAuFlC7iRqt71+SSts7MRq5OKH7RtRKpatF7jVMqqluJZbx67nm6
 5ZpyHRGGWcgEx+yZh4RTmmEMAFCQ9EV82V+wvPAO266Y2YxQEs6ap7R14JDgOvLIikR4bWnKtVk
 U8a8V0DRYYJE9VI2t0p/KB+pu5grIFumKVk5JVg3bhEZKLjgYNsk/pHhaGaB9JmqC89YdsOHSUv
 PngmJMCQhiMCakH/3RvnAVGzmlezkuQnYzIsmsBWC/3zJkYJ3dVSYMPMjQ2GOGpKdQF/SrakigP
 5caUngVXAQkaWOeHrCjyCNiKqr/lpiQ0swXPP2TgT7JPtEp0Z/Be+4lJyKvW5L5Xi5BuAEkuKzI
 Kp7Av+zmBBzkTnEQKamkqIlMI4tns4q8aZS6791Koape03xtmHZi64z2YLB7c521BLi6lGEkLNA
 RfIRtUtV73fzLDG0fZ9FYnAQdoxjqTIywR+UM+UO1UcJbZ44/rgUI7ps1oa+z2p6e3pNoJiiRPr
 moXl/fK+1+hcvO3yjNA8xs/QWdaC2BUKNwjOU4NcUVkNzN91r5a2N/4kocF3te2q8CrgJXiI0uF
 4UE3FI7DUwZOoIkWo8L8hn8tYoVRNMezcpt62bQgpda5uO6CjaRR2dh8r+7qsMUapAD5G2ahpGF
 a+WYbw2XrtQXQv4GE3ic4SVL2jbxzh2YBU4jtIgJmlUGG9kRseA0/
X-Received: by 2002:a05:6830:6d43:b0:7fa:ac4f:793 with SMTP id
 46e09a7af769-823fdf0b126mr3812663a34.31.1791061726360; 
 Sat, 03 Oct 2026 14:08:46 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:07:56 -0600
Message-ID: <20261003210833.735937-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-google-auth: bump to version
 2.59.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index af30f9dff7..e157a5aa29 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  9bd25191c4cf31e6bde58788a297e8fb  google_auth-2.58.1.tar.gz
-sha256  1480461d8b2347e679af758f4003700ea79a59b603c9134e18bfa95e8004ee70  google_auth-2.58.1.tar.gz
+md5  5340972cded7915412d049bd7b0de69f  google_auth-2.59.1.tar.gz
+sha256  ce50fc533ac02f489a2b183a0c156672c376ecb2091b1127bc7efba2975fff27  google_auth-2.59.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index c3d6d3ed13..7131da6532 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.58.1
+PYTHON_GOOGLE_AUTH_VERSION = 2.59.1
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/52/aa/8055c583f8eb69dd4544f0d6a83e22d2f01ab38bd2ce848ea599c259a2d2
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/81/e3/9f752a968e487fbc10b2c2a1dd561b62489f923972911009577bb88fe7bb
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
