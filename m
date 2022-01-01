Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35130C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 08:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF70824CE;
	Sat,  1 Jan 2022 08:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vr8mAm231rcz; Sat,  1 Jan 2022 08:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E164482496;
	Sat,  1 Jan 2022 08:09:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 926541BF5A7
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 08:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8874160C1F
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 08:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pd4vHbCf-0fQ for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 08:09:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF04160596
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 08:09:56 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id y16so22426547ilq.8
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 00:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mMuPtOkZzctanXxi+jZ6HoWeGm89PiGNiGoJK1k+XJ0=;
 b=gvOWaa6XtilOswmLnmHtGIpa6TTQJuwJ8VDRf0PVaA0/WOTy1gcX/6/FeFlxSZmUmK
 a2lesxMqKLssHMhgmUzrwDRFAZ5RSHIYTN9KT8xp1SN67oXBeEB5JUxpmQ3bFKb8W4F4
 Qx2Msw5jWMnYCYGitGCNf5a5YSOW6jogDImEYtQu5G8++0asVhnqLbMBXOlKxpoi/qFQ
 /KRX5VFsk8hWYeGam1QwRPpgbizLF4ByJM2r3x/VS+IeEZ8UCTnKgJKWAVyGgvecUd6Q
 kVAcE2V41HIa0o/E0pNXVeGt51erdzt3Yr1VQKrgrUeKpv/2jCLgesEaiv7/fcD0f8Kg
 6t/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mMuPtOkZzctanXxi+jZ6HoWeGm89PiGNiGoJK1k+XJ0=;
 b=6WHraqBlly7vm5nnuhAtQSRQoqc4uzi5fXyWBskWBXu8sUIiDaNEdprHApdDvTXBtq
 j0G+iDIuAW2VX270qlCBENSiobD1TJdXuTc1bkr0QF/IRdPBAg9EgGq4pav7R07vtRB2
 h4YhJN5+1EFcMdGtwCRMn57+1Xdm3OGTGwY+uva04/BvzRU3nVjFLc0++QnNuYhT9OY5
 6iqLERFNEwuZcjIY0sElDRqH2Q2PGrKpe3w90tdoaqB3uiPxg4v8qX0QqRPgqEepzrGv
 PGUyWseudOvC171YqAJHgCJswJGgadiCJRfGL9L9sXfFm2LMFnII9KebhkqtsdXzlMHx
 X+Qw==
X-Gm-Message-State: AOAM533pofCZ275DigN27G3SA0qsPJubJ1V8soS/kyRBO6zFWLxynkFz
 g5bpxDPgyo7iyNK7WXq1r/HoGBFSDHI=
X-Google-Smtp-Source: ABdhPJzQrCRnoNhnZbh0f3d/dCUM35tdCQWVGq8kJ5Zh1nGYl++QB7/xNHI0lYDeM0GQ3iy5R7FuWA==
X-Received: by 2002:a92:6e09:: with SMTP id j9mr17740174ilc.282.1641024595683; 
 Sat, 01 Jan 2022 00:09:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id c5sm20046348iow.13.2022.01.01.00.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 00:09:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 01:09:43 -0700
Message-Id: <20220101080943.1998115-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiofiles: bump to version
 0.8.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiofiles/python-aiofiles.hash | 4 ++--
 package/python-aiofiles/python-aiofiles.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
index a5c140606b..268136a406 100644
--- a/package/python-aiofiles/python-aiofiles.hash
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiofiles/json
-md5  a2dd24e2ca8d7b7e7dbacd6381da748a  aiofiles-0.7.0.tar.gz
-sha256  a1c4fc9b2ff81568c83e21392a82f344ea9d23da906e4f6a52662764545e19d4  aiofiles-0.7.0.tar.gz
+md5  697deeb4fdcb620c45f114f173ed7c0d  aiofiles-0.8.0.tar.gz
+sha256  8334f23235248a3b2e83b2c3a78a22674f39969b96397126cc93664d9a901e59  aiofiles-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index e43cf9a484..996e5eb6c0 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOFILES_VERSION = 0.7.0
+PYTHON_AIOFILES_VERSION = 0.8.0
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/06/f0/af90f3fb4066b0707b6a5af3ffd5fd9b3809bbb52f0153a3c7550e594de3
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/10/ca/c416cfacf6a47e1400dad56eab85aa86c92c6fbe58447d12035e434f0d5c
 PYTHON_AIOFILES_SETUP_TYPE = setuptools
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
