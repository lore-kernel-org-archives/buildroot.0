Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0507BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 22:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94FA460A75;
	Mon, 27 Dec 2021 22:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pIm2vx4RG9hI; Mon, 27 Dec 2021 22:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB8C660A6F;
	Mon, 27 Dec 2021 22:05:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 970F31BF2B7
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 22:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 924B14016D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 22:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8S1LfUWbA2lw for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 22:05:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D8694014E
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 22:05:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id g132so10462231wmg.2
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GnBKFm7VJCphn2nSPBjTqltbyUKIKPhHGhmt65dBi/Q=;
 b=ZsHE0WK3ZmzH6qF5Ua9NBXhYzV3BNjgnX3YlF0Il8c5MMXedQK5DsaalcIXzY0prfM
 i4VL6HYATX4XT9kj4eUwvavV6iXWNG4zsh2oEZdTD+OU/J5hWv4hB3aV1tqSBkvykwX+
 H6avQGMbHkYG18kQDPrkJNhHTrCmkCRQep/gwkWY/ucLf2k8lEiD4mLfIp5d8uN0mlPo
 2VgyL1J+HV3jGb4tfrfCWekdfjoHQMK+HRu+V5AtgcDGDCSmITmi+XUV1WaR6JHXADvL
 hXyhosWMQdUV3agBR8/7+g4/EqbCKczZDWlnx0xzTlAKN/79rCIZ/BxujoUMGjm9liG/
 2rSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GnBKFm7VJCphn2nSPBjTqltbyUKIKPhHGhmt65dBi/Q=;
 b=Fy7Q2WL510c4lox72HI1qApcgZ8LA4Tb+ndk1NHZw7vFUCnvIa0Umrc6mAEkfD5WJb
 e8t2ioWdGTmgZMJ+AUIMr4huh23Mvkfe7Ta3u43ps1qLX4bw3bb2GoQSa+vYge5+t46f
 utpojwlVStw5Rx2alxJ4j1beQHIEYdncsh3RsKJ4d6MfES4oOphW/c/tkW5O5tbjrnCs
 CmRehJlrn99JioUiBAjSh+BDj9TwDFmVUA2a2yydYF7BQVhrC8wXoyulq7xM8GVuzLuK
 jstwLJjB3XwjStzLfN4tn0Y9j0aV/BPuGFjEhwz0Xxkm9E/9L2Tdw+537QrqhES7nmz/
 LEJQ==
X-Gm-Message-State: AOAM5315YbIDF8E1btZ2f14BNJ3h+yewS1JEIeeZOvnDigSSGaff60Y/
 1IKKheW4VfamsDv2Ct83469Ecx0S8TqT9Q==
X-Google-Smtp-Source: ABdhPJy5L+1iZ1LdcqKUcxzkokENGMyt36a5+tfYsVjmZ5N/WYCi5zFvrMk6qWZwXBITUxuPU0/jjQ==
X-Received: by 2002:a05:600c:1e12:: with SMTP id
 ay18mr14545366wmb.14.1640642707321; 
 Mon, 27 Dec 2021 14:05:07 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id u3sm21070199wrs.0.2021.12.27.14.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 14:05:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 23:04:22 +0100
Message-Id: <20211227220423.3121507-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/daq3: bump to version 3.0.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/snort3/libdaq/releases/tag/v3.0.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/daq3/daq3.hash | 2 +-
 package/daq3/daq3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
index e4cf4ebefe..a97f81833b 100644
--- a/package/daq3/daq3.hash
+++ b/package/daq3/daq3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  a376c7625d1442ddb7e3c75954c910cc9d64440e2f8f345981aa5fa6999ea206  daq3-3.0.4.tar.gz
+sha256  4281464c5502037669e69d314b628df863420f590c4999c5b567c8016cd1e658  daq3-3.0.5.tar.gz
 
 # Hash for license files:
 sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index 1de7e53a79..ed97615e61 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ3_VERSION = 3.0.4
+DAQ3_VERSION = 3.0.5
 DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
 DAQ3_LICENSE = GPL-2.0
 DAQ3_LICENSE_FILES = COPYING LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
