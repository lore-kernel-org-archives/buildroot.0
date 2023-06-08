Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2298C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 680E9420F2;
	Thu,  8 Jun 2023 23:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 680E9420F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y_KuxnrIZt2k; Thu,  8 Jun 2023 23:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47CA94245C;
	Thu,  8 Jun 2023 23:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47CA94245C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF6B61BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 896C44064F
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 896C44064F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2r8TXYLdjBx for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A9B401C2
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2A9B401C2
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30c4c1fd511so1148441f8f.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266945; x=1688858945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBNrepenAjPUyfB6kwvm5k2NdsOtOQBRdbWy1mhaC5E=;
 b=TaIQvYIa3exw9mKrjAREBm8j1szCDqmZm9MPB/HgqouN2CSmWT6cofZu4MAo8vtqdz
 s2KKU9HJn/+y0R6I8ePs5S0g+oDXE7LMrytnrKfqUSL8EsP33gwX+GR32XpMzuuccFEd
 xK99oMS2xHNRpKIIvilFKKmfVGPVrGj4PHm7sHaVmVmY1kCOim75nlJoknF/XRS3t1Xz
 92AZ78b83C/0HBZiGVuMPSyZHf34m5hc8Dw7QvIlFkFa9VQo4wHDwwLwhEyIyLB86+C3
 3kTeaxWB45CPLDZMpSivKZVJ7EUV5aaHCYOfcaKgprAcU2eRCzXNOK6sK9PlUnn1Zoia
 7Z6A==
X-Gm-Message-State: AC+VfDz3UF/hYnzz8E0hO0Hrpii3NidUcsQFHNXQ/R04ype2zQWrdaJX
 bURb6BGwKyGq5fZGXgT4nDhihASySMg=
X-Google-Smtp-Source: ACHHUZ71xnasRx7qQ8yFjmMeNwl9R3pAPZW9v4W7heiAKbjV7TQA0CXdSYRQIevuIPXc61TwlvX6eQ==
X-Received: by 2002:a05:6000:1964:b0:30a:f36e:72a3 with SMTP id
 da4-20020a056000196400b0030af36e72a3mr11942565wrb.0.1686266944704; 
 Thu, 08 Jun 2023 16:29:04 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:04 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:45 +0200
Message-Id: <20230608232859.1245497-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266945; x=1688858945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBNrepenAjPUyfB6kwvm5k2NdsOtOQBRdbWy1mhaC5E=;
 b=LFsYy5H5IPlxnEwvnrgNY/+LGy00jHeDAhBGAWg4DJdMZgLxkxkDuZBM4nYzp7hDwh
 1ibfyBq74p68MB9MRPanEs8bRqIEg8hyrcbxpmpVDZCavsGcC415qz4VMPdcUuSCz4IX
 ee31o0iBkYmxBnXAbZr+8pMXmkGA6pmcL7SMlxOKYZ+8MCe6eLc0c/MDcm2nax43vY5t
 uv5z2CKDgjjs02vehi6yD05a8zCFqmaB9/aGYTroCmo8PVhQpwWDPYcdHNl89/ebY0H4
 2BSU18pWFan9rOyyw8/K/rJHzNqRbA15srzPO6xkYVGJtZxQSjLWm5h7xGxWTorPDy0v
 wtMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LFsYy5H5
Subject: [Buildroot] [PATCH v2 03/17] support/testing: TestPythonPy3Boto3:
 increase ext2 size to 250M
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We are going to update the toolchain used by the Buildroot testsuite
and this update will increase the size of the rootfs over 120M.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_python_boto3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_boto3.py b/support/testing/tests/package/test_python_boto3.py
index 126ddae63a..02a1f69d40 100644
--- a/support/testing/tests/package/test_python_boto3.py
+++ b/support/testing/tests/package/test_python_boto3.py
@@ -9,7 +9,7 @@ class TestPythonPy3Boto3(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_BOTO3=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         """
     sample_scripts = ["tests/package/sample_python_boto3.py"]
     timeout = 10
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
