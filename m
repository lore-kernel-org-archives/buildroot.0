Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0286EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FC282560;
	Wed,  9 Feb 2022 20:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dm3Ma5UTTSsU; Wed,  9 Feb 2022 20:28:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED9908247F;
	Wed,  9 Feb 2022 20:28:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96ECC1BF42C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E8D98247F
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzjwCqbnzIgB for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:27:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40AB781980
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:27:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d27so2222895wrb.5
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 12:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oIrr7nOIURc7WU4bvIHydFVMAAxMeFemWg7FKlTTWPc=;
 b=q5P/KUCRMwcQ8kCUsvkIfaNBPHPEAjSKhXZZLNx8/pIwJOmdl2cha+1mwff/9xPdx1
 xX2B+VQs+JGjSNuJUHnJMqUH0uJ9U7wlNvSH4SpUNU//wiVIpNT1HGaBkI/QrtFAwmI8
 AAAx+r+D9GO3DwhmhSJrK8tl4jx+xZFhgHnNzQ4aj6pp8lzMOrz90RVDZbpURcBvzSPA
 +2wUXz9HxwKcEMrlE6P6HxyCYOSIpBYgtuqS158BKE1S3uisNgB6BfN2J8siwbOVqotw
 wiylRI7MQqsX6AEZitLLIjSfswssk8So7wQjXOBW2GCfTn3UzaQSNY+JbWQbLl7RNHMN
 iLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oIrr7nOIURc7WU4bvIHydFVMAAxMeFemWg7FKlTTWPc=;
 b=2daI9FkGL+g6wZb1X9xBxMLVUgtxZSuZ2+mN0+/YTrGVipVgdDPjhQtJ2/+VOp4CNY
 8C++ASbDB2LncCaxiAkMUJvGfw6QLwdQw/fCYLFFjiB1fBnUSPmhg3yFi1O7yDdK2rHT
 Gfb0Zqt6YHSPEWViKJHUtQcIM6A4k0YVOi1rXWHQ/UvXcq+ZnAxwKuYFCzqXuB6r6M+B
 CWNLCKXlnwf1h00qNMVa0Nv/31XE8Id63AMnWogePnvisy5RgqYbGPwl1iMREv2C4bvm
 CYIPRL90s5tejZX2E6NJMUSeyGvgYAk7vtZOZWVR314BB915YiMzmvHYkxS6F9LYFlmk
 xdRA==
X-Gm-Message-State: AOAM530SKHRbY8QxQjGrtYCdKnkTPX8SdJqw7pKPM1XM4YSmcthTROr0
 ePbfALkKIityG1oE5SWFS/Klh1ll9do=
X-Google-Smtp-Source: ABdhPJwHly60C5RxQ2IhxSky5leB+z6Qy1OAS0BdVBcG3hCdk9Ub5w35/VkkNpY/wGuQFSsKs3yz3g==
X-Received: by 2002:a05:6000:3c3:: with SMTP id
 b3mr3517738wrg.102.1644438477335; 
 Wed, 09 Feb 2022 12:27:57 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p27sm25484wms.1.2022.02.09.12.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:27:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 21:28:25 +0100
Message-Id: <20220209202825.359811-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmodbus: bump to version 3.1.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/stephane/libmodbus/releases/tag/v3.1.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodbus/libmodbus.hash | 2 +-
 package/libmodbus/libmodbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index 2931f3f3d7..b676d261de 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d7d9fa94a16edb094e5fdf5d87ae17a0dc3f3e3d687fead81835d9572cf87c16  libmodbus-3.1.6.tar.gz
+sha256  7dfe958431d0570b271e1a5b329b76a658e89c614cf119eb5aadb725c87f8fbd  libmodbus-3.1.7.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 52eb318a99..46eb860392 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.6
+LIBMODBUS_VERSION = 3.1.7
 LIBMODBUS_SITE = http://libmodbus.org/releases
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
