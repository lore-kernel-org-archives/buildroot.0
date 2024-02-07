Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F13C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 02:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E135401DF;
	Wed,  7 Feb 2024 02:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zueWm-Sih029; Wed,  7 Feb 2024 02:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE7DD40364
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE7DD40364;
	Wed,  7 Feb 2024 02:32:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 491761BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42B2081F21
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t29wBzOOWK-u for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 02:32:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E5F981F1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E5F981F1E
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E5F981F1E
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 02:32:28 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-363d942478dso487295ab.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 18:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707273147; x=1707877947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aiPcJkyZMEh06QCi+/k1LcNTxm+0aKvBZrsbN1kCj9M=;
 b=d5W+5rm/nZhtejuJYdr4Tqey6qflukQTAasfWROHHgSZ4NKI3u+rBQoUoCtzNcSUck
 x6/nYlsTwKuGi1S+2zeIUsbG1PFOFDtlkTrcga8iJXmkuTV6FtjRJGoHfInn/w5l8SUb
 OznxIyo8IZvQeBUkf4/7gZ1M1bSvIkBwQysiloxhkac39+Ba8JC7JD70RE3QJEVSdmRj
 yaRe+K2p98iza/kfwXP0AK8Tg+qViWQa0T9eFTELKjayFb15OfF7sAGvqu7dCY+bAQnG
 qY7s9g1ydrHyF/7n4K5roJhcu+NM8b0oPWbboFnbKi8OFh6MeG39Y4IVnKkH7Wyk5XWv
 nT0w==
X-Gm-Message-State: AOJu0Yw8G8Lfwc4Q0jEDv5aXoK5ZpJYERLFcLPFwT44mfp8b7d/efZPc
 sIARxkH57Ac0NZS+TTzB7p9YpVLqZU3CBuXF40JFB2oTay66KKA08IdMih7mUZtDRFIOQMAA8ID
 x
X-Google-Smtp-Source: AGHT+IF1S6KApm3KCSUfBhAl5NOoQWOM2BuGtuGJ6U1/lIQ6pXddb8s+YqCf3lJXMxsFlnfJVwf4IA==
X-Received: by 2002:a92:b70b:0:b0:363:d9c7:a7e6 with SMTP id
 k11-20020a92b70b000000b00363d9c7a7e6mr1453694ili.4.1707273147281; 
 Tue, 06 Feb 2024 18:32:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXlQn03j9RHTIeEmmurq+rdDe0y5kGe0nbh72JEYxSkoLhsP/g6Fn2theCYsCc/uxlDUvlFqGi9rL5YkY4jbnT3K3nTsul6wJgG+SvOfN/rFoTgaQoC9H+C6GtZWTUuzQnwTTGlHQjMXsLYdvEQawAMY++RXg+R8GXXusYh4GMvJLQuu2uXlGM0bFKYN560CCa8Pw==
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 m4-20020a632604000000b005dbe22202fbsm205859pgm.42.2024.02.06.18.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:32:26 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 18:32:25 -0800
Message-ID: <20240207023225.2572189-1-christian@aperture.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1707273147; x=1707877947; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aiPcJkyZMEh06QCi+/k1LcNTxm+0aKvBZrsbN1kCj9M=;
 b=KDlyyqVluIlKn8d6wiem1IJYsES5SMLGfPnwwXjswKpEsVA7R+Tcj47CZlFY7qJ4Km
 NyMDIWPL5fVBxh2SPqT7PHGkDsTuUbnxomGc9vhbcNG5YFJQTtcoopdvWCVAFDUCw59G
 xmPhf/LUfR332XqJSGQhmFBPwEDuqTK58zd1PrflR3az/Yk8HQCClM/Wt5GYAlEpDeST
 QoD7OgS/igduT8cYu44YDdp+qAh9yERsftbOSDOFPLa3Tl+ilmKAaak7lw4hZGbc0sHj
 jOyHl1GyebiW59pI5Bo50AYtR85kdGO0x2nSdhD/pgmnSYKQME42SMxtjydprcmUtQTG
 Vd7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=KDlyyqVl
Subject: [Buildroot] [PATCH v1 1/1] package/runc: bump version to v1.1.12
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/opencontainers/runc/releases/tag/v1.1.12

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 5ffd21a5dd..d6eb27d352 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  509993674481aad7e14aedfb280e0eb160f3a34c0b77e2e98c4b3c0b1df76894  runc-1.1.9.tar.gz
+sha256  be31b07d6a54a8f234016501c300ad04b6c428c56588e7eca8c3b663308db208  runc-1.1.12.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 62e117685a..273509b860 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.9
+RUNC_VERSION = 1.1.12
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
