Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4157C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 22:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA7542077;
	Wed,  6 Dec 2023 22:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FA7542077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LjyUZ4Bim_JS; Wed,  6 Dec 2023 22:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B649742036;
	Wed,  6 Dec 2023 22:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B649742036
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A54A21BF296
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 22:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74B1A4360B
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 22:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74B1A4360B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V64aeo3dip1M for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 22:44:27 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44AED400CE
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 22:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44AED400CE
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c039e9719so3715955e9.1
 for <buildroot@buildroot.org>; Wed, 06 Dec 2023 14:44:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701902665; x=1702507465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IqL7lMYNeGqnlg8nmuVKynUy0mvSq/aesW1ugIkv4PU=;
 b=fVTPz+iPiKXtD8hkJkBcysh+EDBHjG43YXB8l+y9cZFpqEIeq0CosbSxEkRlPca60I
 0NEKlT6i0Ab604u/5eeVllxhWoGhkk+4Ojh9LMO7lkJshz7Y83gCWzko+KWh9bd19yaI
 +P+B95f8xIyXUMeL0C0DIIaDc21y3xLwdtgX9BDkkeF4v91n153jhWuvG4Gioxe3agIG
 c3QEtbH+shCsdMvqM6Ys2wQ8eEuZhIM4Fu7VlETFCi58wHImcnCW8780VQ2cazufUrlD
 qmFoJmHZMG6glpXPNH6RYgGZEdrdrIM3oDw7tjxZPp+3KaDEFrBj46PfmVvlG7FiPoz9
 teWA==
X-Gm-Message-State: AOJu0Yw84poqhPcExTRhVfJNmnBccFXTWfyC06QdM+PwBK+9WGSK8nEG
 QDVHJkhsclbJMd6mabvMSkqWP1XsOKMIEa+oLkc=
X-Google-Smtp-Source: AGHT+IGxRnkhVjEES37eU3NG3z0JlQZCarHVPaePTzO++s0jFsrOAri77KMCLgw0TpiPOcqW7gBNQQ==
X-Received: by 2002:a05:600c:3587:b0:40b:5e21:ec1a with SMTP id
 p7-20020a05600c358700b0040b5e21ec1amr934986wmq.76.1701902665355; 
 Wed, 06 Dec 2023 14:44:25 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a05600018c600b00334b1564f0esm668567wrq.89.2023.12.06.14.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 14:44:25 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  6 Dec 2023 23:44:21 +0100
Message-ID: <20231206224422.16063-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206224422.16063-1-romain.naour@smile.fr>
References: <20231206224422.16063-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1701902665; x=1702507465;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IqL7lMYNeGqnlg8nmuVKynUy0mvSq/aesW1ugIkv4PU=;
 b=uOEnN27QJgIYZSUM/4g52CYtbzksaffh+8tvUc43K3/h0002Ud/7Ywpkg6ue8hLIcs
 DIwDJ4KQzkQNC7oNxMee3y1h31jjMI4ST6hDj9vLUSIhNrA0pVbzwANVqqsXkL6YrJ5x
 Lyyg0R8avSgCkKSIc/DcYoIeGJ7xTu4OjIhcgKoGJSyWFCeqoy9TAR1QIoxKdpDLznTr
 2egLuTWtfKVnjHh18VaR3XA0r2bBI0Py4oVV4BP/jbjheO+ZGTYvlsHIsMiFwc45LsXn
 LpsFlwhUjEYx+YHwoD1lgz2+7yeopdPENFylQbsxIFYozb4F8u6Y4BpldB4DF7tsKbYi
 EOBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=uOEnN27Q
Subject: [Buildroot] [PATCH 2/3] support/testing:
 InitSystemSystemdBaseOverlayfs: bump kernel to 5.10.202
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The prebuilt kernel has been updated to 5.10.202, sync the kernel
built by InitSystemSystemdBaseOverlayfs.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/init/test_systemd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 79061a86d7..7bbc112a56 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -286,7 +286,7 @@ class InitSystemSystemdBaseOverlayfs():
         BR2_ROOTFS_OVERLAY="{}"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
