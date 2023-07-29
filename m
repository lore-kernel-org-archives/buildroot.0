Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336E7C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 23:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B097C60D90;
	Sat, 29 Jul 2023 23:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B097C60D90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1aUWldzPdjdX; Sat, 29 Jul 2023 23:14:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBC560F8F;
	Sat, 29 Jul 2023 23:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBBC560F8F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE6101BF407
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 23:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCD9F409E2
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 23:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD9F409E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldX4uSUqtJAI for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 23:14:42 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AB21409DF
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 23:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AB21409DF
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so3603869f8f.1
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 16:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690672480; x=1691277280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5e5sohm/pmByEe1hDueezvc4tw1RxZ+6XDftbuNhLV8=;
 b=K8SimZdqFaW/iitW+5wrAGMfTUHmrT3tWaWFHEQLg/We96FM8ia6keocYj6nyQMM1l
 CPhpL2114jf7NzrsmegiSkqmnJ784MCHzD01jtsrE0ypYomJGkPqwdC4mQXw3g/9aVaa
 4VKieMa548+P5aMZPyMVyjX17DRAf/+6hCmNx/HR/jTnCoB8yJuf7UeM7OiEdQbr57nT
 CEKRrNDPQRtvxkoEa4Ptvxounm6MCtNNkKpv6ZYGKPZ5uEgezGBFf70z8bcpRvUrJi+3
 fU8YSQKz1o54GtD2P1VJKzEXNT+KX9dW6QizGPghMJmQR5stFywErtLhSIrl/Vh4CdSR
 nGEA==
X-Gm-Message-State: ABy/qLYGPImsudBdjakK0qmVIvcjg7Ltsbq0FRo1/fE0CbabwbNzgbjn
 hKkbZp8beM/oNjWoPZBZ+SFKuVFacsU=
X-Google-Smtp-Source: APBJJlH9H9k6dXNd4yjGxCfkjtZaMm9il+H3DZ1HPQoZkL7aBfwuvxZNFMOB5c5GV7gJvYtdmtlwMQ==
X-Received: by 2002:a05:6000:45:b0:317:5a99:a696 with SMTP id
 k5-20020a056000004500b003175a99a696mr4670105wrx.68.1690672480084; 
 Sat, 29 Jul 2023 16:14:40 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 y18-20020adff152000000b0031779a6b451sm8524113wro.83.2023.07.29.16.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 16:14:39 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 01:14:34 +0200
Message-ID: <20230729231434.299864-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690672480; x=1691277280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5e5sohm/pmByEe1hDueezvc4tw1RxZ+6XDftbuNhLV8=;
 b=HdUsU0J08cTK8qLPmspXvRq6RfZlQnSnjECphYh+AspoQldb5p72mm52w2AHoryTyO
 sjV0cCzkQv+TVhmrSQo7t9BLa9BzUw7tSCeoBZ8D2VqcTsmX6M+sxROUZ8/g4Qze49u+
 +rrWY8R8+cJvDQ1S8D++khMbedN3jkh/GhET84Oyu81/ZQ+Cz4jOnEFRt8emdUUwG6uP
 OKp/1IdmbtthzQGn+K9atSJYdLTHXSBxwjR3WdXFFAti/DwEQkZ1ZuNOThe0mJuT+Wts
 q7JzYhdSvtTDrbuz0I5157z41OUO2NGYjG5rhSpULjBDcrgrsDKjluTf3drTn1qE1bKv
 hhgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HdUsU0J0
Subject: [Buildroot] [PATCH] support/testing: TestSELinuxSystemd{Ext4,
 Squashfs} add midding libelf kernel dependency
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

objtool built by the kernel requires libelf

ldd TestSELinuxSystemdExt4/build/linux-6.1.26/tools/objtool/objtool
  linux-vdso.so.1
  libelf.so.1 => TestSELinuxSystemdExt4/host/lib/libelf.so.1

While updating the kernel used in TestSELinuxSystemd [1] we
forgot to select BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF to provide
Buildroot's host-libelf. Using host-libelf avoid linking with
libelf installed on the host or failing to build objtool if
libelf is not installed.

[1] 60b84fb7ce4612b2b14a675e28331111468e1f2b

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186370 (TestSELinuxSystemdSquashfs)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186368 (TestSELinuxSystemdExt4)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/init/test_systemd_selinux.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index 5f91243f37..fab23e3330 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -15,6 +15,7 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
         BR2_PACKAGE_LIBSELINUX=y
         BR2_PACKAGE_REFPOLICY=y
         """
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
