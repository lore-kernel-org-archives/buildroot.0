Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE4EEA3F0D
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 06:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76A1F60FE8;
	Tue, 10 Feb 2026 06:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCqbhwSb0r22; Tue, 10 Feb 2026 06:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AF1960FDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770705281;
	bh=k2lniRgX8USToyJjCDxzP4GgEYw9j72sJWhjVeXKrUs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rWf02Ggb84R6kVjowpIZS2O99z5qZLubU8JimLGKtvyKz/XQsADxp2p08bd4Ing+F
	 RyZuzMz3820FIm4SI1S4xRj/9sULHpBe4jfOyRhiPgyW9w20cOwqfBB6AuEtaSOWxh
	 wm7lZLxUDmeF1zw97uxvJ/6vv2YbHdA9m6phJ1vVaFIaycivqfQI1qms0iAhl6kp/p
	 vI72Ewnwx0vCz7uj9Q2MVzaLt6X+VP1X0XS0tue2GEvobbhHq6NtjNwnBV7URTHDiE
	 7ZnXE3RKMScbry5ueFZZ4peJB+BUNKhpFAQLb35VBwn3z0l/8VFlgf+gVcvEbMui7v
	 DdvY1Jk8uIslQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AF1960FDA;
	Tue, 10 Feb 2026 06:34:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDE341A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 06:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC11C60FDA
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 06:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iN20yNwJ4j6u for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 06:34:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1233; helo=mail-dl1-x1233.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12D6360FCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12D6360FCF
Received: from mail-dl1-x1233.google.com (mail-dl1-x1233.google.com
 [IPv6:2607:f8b0:4864:20::1233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12D6360FCF
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 06:34:39 +0000 (UTC)
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-126ea4b77adso5749879c88.1
 for <buildroot@buildroot.org>; Mon, 09 Feb 2026 22:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770705278; x=1771310078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4y97f8iovViz9bix0iLDeIVWLxKFedZGx6/wGA5xzI=;
 b=WQSRlnYHnSYb0NOdoXmcAKjDdTqcTuFF3r51r7ElUAJnKZ+g/4+a+KfDqjKSZjvCNx
 BTrJU5zsoELx2+MuQkxvBP9j2h6oI87XSgK7ZAoHskhEMrP2HHCdO5+wTVyI9WmI8htR
 blB35A95D3kiNI3wtF79GU51ik1FUyR/3k6w0z8aApusRNbhjVVkPncl4yclsRRBstic
 hXMCCdiyGjoLq0Evo2zxhtn53o5bAhJVDYqBR1OsYccf6N18fjD/r9yJazyP7zn+96G7
 eM3XI0eAXWv1Pwq/Em/yjYGJiIbqQAkx/D5k2KNEck78pVrtw/ep+G3OYJDajJqB0YV7
 wGbQ==
X-Gm-Message-State: AOJu0YxoVrJY4js02Gl2ILMUfK1Xz9QHgOn7lr8/56KZ0DfoMZnjil5E
 sOUv849KAYF4x3HApjxBZvhE/wXMqRCyyZbcN+tsvBCbrrRrE2fl0pYBc7JcosMS
X-Gm-Gg: AZuq6aJbvbXYYlGMMfAwSJOhhGahfzT7PoKoqVh0lECl2qcWsCxAE8AdrpRhT32s8B9
 8QY3sLJ9xmkGpBF0+A/GSjGbIcO04NdWVcvJg+Oh1McLZx+3bfq/J7iuErRtXw03qqJoashSN87
 BJs8vjlo/rhWTY9PqOKDTKDZVoQALUxpcHEXWNQyiWgyFA//thzEWAITsxi4l4hP30Qx/VC8Vc6
 4o7pXLTEKhjBIOHlQzdY7hBL3RLcwLNIR/7SyKTrMEW8pzQLp8uFiR8f8F2Xso6GpjJiHubk3u2
 o8FOQARVuP/BHdE+qMiZWeK6uZP4RBen+Z/WFXm6vUaVJ3BbTl1oWD7Gjc/ZkDJiLf3Y72iHJ40
 fykwZq7YpxTdjpKpOFrg+5HcF2hOMc6UCLOhF70xvdT291mPWsR5Jg6EtybpbQFVIYFJ6PQW+rW
 MwCVldkB0tHyqS+cckHf2BPR6Stgs8yvVI+v1KTztfQFhID1j5M9XT2G9lcH/dbgZX85kddPriH
 3r+gs80GgAZQvd7Xb745SdKNEJ1m/QU54SCewFbQ4ob
X-Received: by 2002:a05:7022:502:b0:124:9fd8:4ba9 with SMTP id
 a92af1059eb24-12724325451mr416702c88.12.1770705278207; 
 Mon, 09 Feb 2026 22:34:38 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12715c4dd76sm6730220c88.10.2026.02.09.22.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 22:34:37 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Mon,  9 Feb 2026 22:34:34 -0800
Message-Id: <20260210063434.10205-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770705278; x=1771310078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C4y97f8iovViz9bix0iLDeIVWLxKFedZGx6/wGA5xzI=;
 b=lNenLy4OEg97Zi90B372n1JOKvkMnV7R6POxpzA/3eubxh7ShgLxPOokvXB9iGVvNQ
 AujVqkNf/wD1TfXIbeLLOn1x/DpZbFUBJRL9mWi4xaCyVtHquXamQ0qL4OF9nOcftQP2
 zKxlWBv3RXQGs7uVHLv4vCbXJacrIbY/i6Fr1JiZUmU2tGjnMT4D5Oslc0zl5WCx+yc/
 mibpHm+nScFlhPQ/SMLiqyoss20Yx0P59D4SJJ7AQUVAAcVGMBRX/pjj+hm9Cn8ZGHmM
 jud+v22se36AJE5jin4djlb/3Bj+JJt5E9B6uLfFh1VGaJh6ZKUN5u42J2myoe+w5nts
 +MHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lNenLy4O
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.52
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/pikvm/ustreamer/compare/v6.42...v6.52

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index e2196b5b77..f5351e4f9c 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  40c10b522c34bcb95bda9844a5a2a06173fea9a5d948882d70740cbe1fe7a8b4  ustreamer-6.42.tar.gz
+sha256  db00adfa02acfbdf6682ffae8e418b582d623e1971672d5df19858e02e2f3b0e  ustreamer-6.52.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index bf87dc8abd..b699b30c84 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.42
+USTREAMER_VERSION = 6.52
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
