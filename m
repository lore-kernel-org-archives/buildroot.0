Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1750FC7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDD14207B;
	Thu,  8 Jun 2023 23:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCDD14207B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FyZiv85WbNG7; Thu,  8 Jun 2023 23:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 860CA42445;
	Thu,  8 Jun 2023 23:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 860CA42445
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B46D21BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B52C4202E
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B52C4202E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRNgqq06KFP2 for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE8742037
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAE8742037
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:05 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30ad99fa586so1154898f8f.2
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266944; x=1688858944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+kkLY8SOuNyK4F6Uz3E3lyYpZDGmpB+3VwffrqGTKI=;
 b=Gg/x/JOFNFDfqgqL16OoW4ffN8HDQgqWMYgocmrHOoM1KYOYtUSb8j5h3QzLxx6+/e
 dPTgtD7ZCLxmZlbb2inn9Kb5/kAZPic5z1gnxmKdtUKalVydErwhsqtV8gxjN20RKSU7
 Tm5d3kUdfaTWei1DeEr+X1dfXe6PCl+14JnGxp/s6Fr3UkxUWcBIlpojpcqKXMTmmwVQ
 1lA64J6DCmG7Gid79PZ9H6iP2yQI2FyZp5S9ol2tsJt+TqUynyRL+zk6vtjYZZtvw4+/
 MIoeHjmoZKRQRrloxTCvTIc0EPVHKJ0iABJioXZFBYkYj9xW7DgU6A/r27wkIH2fXGRM
 jjzw==
X-Gm-Message-State: AC+VfDwgCjVypafSnBFZPbG6KnGTMWUFl/VH3EurTppA22/UeU52mggW
 Bv7bDdMYS6uqFyzJ5rdS943ORDgL78Q=
X-Google-Smtp-Source: ACHHUZ6lbeeLajZMKcz7NGPZaJK7qeNOlbkv8SGafmv78iW5OpFKWAz/Cn/qOkg4VoS1T0cxo7TSeg==
X-Received: by 2002:adf:f0c3:0:b0:30e:5bf2:ef1d with SMTP id
 x3-20020adff0c3000000b0030e5bf2ef1dmr5143672wro.43.1686266943777; 
 Thu, 08 Jun 2023 16:29:03 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:03 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:44 +0200
Message-Id: <20230608232859.1245497-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266944; x=1688858944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+kkLY8SOuNyK4F6Uz3E3lyYpZDGmpB+3VwffrqGTKI=;
 b=lygF0VFsOFloiCgtivH849dB37B6YmWZiiTC4/pTJGjWpIFCS2V8MHYvNnEY5gJPHB
 WHgC8/xiJNHssrNTVpB0AdBSy2y0rtdT3Mnz9AosxbOOTI610QnTuL58AJ1FguoVEqnn
 kVw4oGCuXIOosMtvWmfPsiBNQZi6v1bwPxzxPMfRXEWMMUgiqJ8gixA0JQiIpjPZZwbQ
 F3s3zUwZpDxZKU2AVxzYX1VlA1YZxTfX0zeCis9Cuiq4TdRzpyHP89Q7OSwjVX/WmfGe
 stCKTR6A+LSBEuZH/AfU/9yf3h437fDMDE5hjLlkzlOR2HvrOAgQTNMfd6r6TEv+Wpjq
 92xA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lygF0VFs
Subject: [Buildroot] [PATCH v2 02/17] support/testing:
 TestPythonPy3S3transfer: increase ext2 size to 250M
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
 support/testing/tests/package/test_python_s3transfer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_s3transfer.py b/support/testing/tests/package/test_python_s3transfer.py
index d81560aeb1..1578f3aa74 100644
--- a/support/testing/tests/package/test_python_s3transfer.py
+++ b/support/testing/tests/package/test_python_s3transfer.py
@@ -9,7 +9,7 @@ class TestPythonPy3S3transfer(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_S3TRANSFER=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         """
     sample_scripts = ["tests/package/sample_python_s3transfer.py"]
     timeout = 10
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
