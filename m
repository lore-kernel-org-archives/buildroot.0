Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33905C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 08:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 987CB47B15;
	Sun,  4 Feb 2024 08:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 987CB47B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkcxzJQGHegO; Sun,  4 Feb 2024 08:51:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3AF147709;
	Sun,  4 Feb 2024 08:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3AF147709
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26A951BF484
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 08:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE4AE851D3
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 08:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE4AE851D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvDwoZuTK770 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 08:51:43 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA4EF851CD
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 08:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA4EF851CD
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56002e7118dso1900656a12.0
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 00:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707036700; x=1707641500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SIk9hmLGNwBbshm6XCXuuDE2UkKL0pc/s3TOcnrYA5c=;
 b=ZoSkefPTqkGKo6O10pvQg+RiXVmpldmE+/K4rgDGa/S4SWHhSxP0v9Wq5cuZwMThpc
 6XZKAC9VVjuSXd7NcqE/JLSJ8xh1groGI7x6NKjqrd0NPspQ2rPV4kMpPWpimks1NNMj
 uosnyTWaFmtaiMkav5Ap86gi+kTSWi0s2ayhsStMTl2KQzR3w47uC12SsI1/Nhu51O7b
 DCh9BoY6PWCDXLLwbOM8sBOUw4DlEGtswVpUpW0r75DWAo4adGunYUPapuAnLSWkp2L8
 mREZ4D4dqQOHE5+zmgx8T+nvVv2UtOguAgxblNFy/u3trhAztih07TZm4swjpDEO6RnZ
 dvnw==
X-Gm-Message-State: AOJu0YyzCWRPjXpipAiZ4CkB6NXPG3/YMm0QRBrV3OW1MUpPIMD/nr86
 nqrOP3G0Pe5rVfGL3EIJv7UNNc4W1yf9CP11F8AVVhDrUowM4SWlUjA77tXjp2c=
X-Google-Smtp-Source: AGHT+IFMR1Pc7Q63q/FOk3PpWgPokLZvASF1Gz2zx93xn9Ion+ubr0BMyZZYWeB/XHbuL2skvOZg3w==
X-Received: by 2002:aa7:d8d3:0:b0:55f:fb63:1c49 with SMTP id
 k19-20020aa7d8d3000000b0055ffb631c49mr2632851eds.0.1707036700066; 
 Sun, 04 Feb 2024 00:51:40 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWNFQFhvt0AGZazmkuuwaKXEIuB8dOap2aTU+Wuwq8YZbjTzMnNKN63qyMX1AqX3kGn/X3S42INY9GB4RZdhIuJuULciyYp3JmgoF6WijMHMJoDC2g/kv/6a+2WMayYCrQGIpPU7jnbG6NUJdAkbjRXNoferYZoBBc=
Received: from hp15.localdomain
 (mm-122-32-213-37.mogilev.dynamic.pppoe.byfly.by. [37.213.32.122])
 by smtp.gmail.com with ESMTPSA id
 n8-20020aa7c688000000b00560060fd0e9sm1838065edq.67.2024.02.04.00.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 00:51:39 -0800 (PST)
From: WiseLord <wiselord1983@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 11:51:28 +0300
Message-ID: <20240204085128.5059-1-wiselord1983@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707036700; x=1707641500; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SIk9hmLGNwBbshm6XCXuuDE2UkKL0pc/s3TOcnrYA5c=;
 b=VNc3Oh5+8tp8RwYqMZkB2szA2uv868WGn9cWecuZMvvwmG4rxAOtI+sTYk6tliyW1Z
 cgnJBkFEIJHVh0qXGjdybo5yucf7dIl4fs2GB/Lt5GqyKZSuMKrBz7TWiWmwtO42cmSf
 PjX7R88PaPfscc+T0Qd8i2+ESnhfrWj2dLv0RiS2pxbqWa0s5XtnourpBt4o2nuhYuuq
 q38TZA/AXDaToKLtC/Lu14XiXSPsN/Dn6ZuGYksIVU7sXweHTdM9yi47GIpIMG8wwvbI
 MPdBnzwfYzm/CZSRrUH39mKLEO05/OxX75zXUP/AqdPmpBKBmWoXY7hivf6BfZc7Sr8u
 sn/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VNc3Oh5+
Subject: [Buildroot] [PATCH 1/1] package/python-mpd2: bump to version 3.1.1
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
Cc: Uladzimir Bely <wiselord1983@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: WiseLord <wiselord1983@gmail.com>
---
 package/python-mpd2/python-mpd2.hash | 4 ++--
 package/python-mpd2/python-mpd2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mpd2/python-mpd2.hash b/package/python-mpd2/python-mpd2.hash
index cfe5a7c0c0..0e5d9206a1 100644
--- a/package/python-mpd2/python-mpd2.hash
+++ b/package/python-mpd2/python-mpd2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-mpd2/json
-md5  f083c107b28525bb4c2580140861d86e  python-mpd2-3.1.0.tar.gz
-sha256  f33c2cdb0d6baa74a36724f38c1c4a099a7ce2c8ec4a2bb7192150a5855df476  python-mpd2-3.1.0.tar.gz
+md5  b218d6f233c23da0bc82c372308bbf8d  python-mpd2-3.1.1.tar.gz
+sha256  4baec3584cc43ed9948d5559079fafc2679b06b2ade273e909b3582654b2b3f5  python-mpd2-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
index 124ff57db0..2d2784e89d 100644
--- a/package/python-mpd2/python-mpd2.mk
+++ b/package/python-mpd2/python-mpd2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_MPD2_VERSION = 3.1.0
-PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/59/32/e57725251ce3117d2ed2a7b76d9722ea9bea26f54b2cc8981d03350e4103
+PYTHON_MPD2_VERSION = 3.1.1
+PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/53/be/e77206eb35eb37ccd3506fba237e1431431d04c482707730ce2a6802e95c
 PYTHON_MPD2_SETUP_TYPE = setuptools
 PYTHON_MPD2_LICENSE = LGPL-3.0+
 PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
