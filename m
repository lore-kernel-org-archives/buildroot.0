Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF19CD37AA
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 10:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBCBA615D6;
	Fri,  8 May 2026 10:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OH_Dtvoh-lWc; Fri,  8 May 2026 10:32:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5096E615BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778236347;
	bh=lDXcHB4mR0HZIiH2XgcJI01lgKr7MZK9ENuXd8Pfztg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U5DViHXlsZ5LuWkskDuXA3amcNeEdmSNpqr2ve3xN4xNRjmYC6Dx5KRpwzI6d+wMQ
	 dreMRvg4Bufsmw/m2fgvhFJ+usx4ZVPqhT8Vnjdo/zLWoUylDsxhQW+gJY9iHbHUzF
	 9RLgLvToNL+TfcJGlv25SvPVXYnZBzMqc92whWPuTXiGOseSEoPp60NRrbNE5Yc4/D
	 azYBbZT8088N7PFeU2QQrf4o5m3i1k3MIn1JRFBuNDKZrJ64CjZzi69RTbFRAzBf/i
	 tanbmwSSpBXdTV2Jx/GlaMgFtBk78/t7wbCnYb8V4tyvwZGBQb6IqBjQg4gInpclLi
	 2S6n5k+mWmljQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5096E615BB;
	Fri,  8 May 2026 10:32:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A54ED358
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9758F615BB
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBCoWNYkUt57 for <buildroot@buildroot.org>;
 Fri,  8 May 2026 10:32:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD139615B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD139615B8
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD139615B8
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:32:24 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2ba0714574fso10747125ad.2
 for <buildroot@buildroot.org>; Fri, 08 May 2026 03:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778236344; x=1778841144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ItwrZTo8YATZEyUsbNM+bp6baR9q3I1OeMzPtJnQMEg=;
 b=hhHRqkELqHuoJ/oQ13IIbGdaZBLjU7AXf//Bb5WFlALICas4tixv0l5uLZI9hytwpI
 +VclOEZo1z3tCo6fvAZxlHnujqROmt5qSqN8V0CzHcMxjdEgi6hzBng8sQG8PkwioNRj
 8D0IUfLAUqcK6jy4YCAYuMsRgW6l73Or+N1++iemMPli2MfUbVcFFI/ki2g+D8ieuXWA
 Mh2n57dmY5xTQN2GvUFiZgk1gENIfJkjMj8tj/PkVxA83Z5ausc2ZUaNf+ZJ2uu1HvNx
 v4SSCZ6nTDqumTTonlSSAz8N5LHUebqs+kH7LryQcOQ8Hi38lDB4olnWikQ1YTHmWzhi
 6YkA==
X-Gm-Message-State: AOJu0YxP5oLBdWff7iz78ZLTPVevfXSaqdIDFSnbtaWh33GPHiLrfceF
 v8hloRD0bXS6Jq1gyKFZP8jiypYHrm17l0oYov1CIgBcKlf7lHUWhsJNbNcuAewj
X-Gm-Gg: Acq92OFeQzLIFVYImRre55k6G5OWiznc8nXP+ATULqO0gYkhA/CT27KRUnoAXqC1yCh
 HnhEZU33UCn8Fj17uyKyouWbO9IHejjWlfNpRrfkhg+j4tMGOarvhj4gxloS8x0d3e9zHxGmHCR
 3O0Ed8/dDVlx8lsieZIDJGkaoL7OlPdoUbXOPuXANYnni3x12kDl+xAmVkDNlp4M/S3NNeG+0E4
 sir4isKalgEhEC9C0XGOHVRvBC2MVSwfOhBnPNVql/B2H3FS7LPwmbDCZFtykx2+1i1f8Ciy+lD
 j0kwAVeP1HnL0Q3fet4X0f27+xXXKLSDs3Vaf7z9x5Oydpp8r8tgqhUx7Weey0wtHd35FU3nv4o
 rXqF0bQ62F56V5oAWtapTVNB8TDEGIJ7pwSeV9j/TIWpEoegThXjXD7uxFDZ7+16vM+UqHupdcu
 ZA+6434lsHh+fFxk4Vvf20WBnEKlFTFBWeULxTFwSJdcXhCWAwGegp08Mb2e1R3dL0cj8Mjw35C
 FIySkEm
X-Received: by 2002:a17:902:cf4c:b0:2b7:88d8:efde with SMTP id
 d9443c01a7336-2ba78f4e986mr113931835ad.7.1778236343596; 
 Fri, 08 May 2026 03:32:23 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:4064:4e33:456:d996:1796:c8f2:159c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1eac3afsm18998145ad.71.2026.05.08.03.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 03:32:23 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri,  8 May 2026 16:00:06 +0530
Message-ID: <20260508103009.463932-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508103009.463932-1-chakrabortyshubham66@gmail.com>
References: <20260508081010.250838-1-chakrabortyshubham66@gmail.com>
 <20260508103009.463932-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778236344; x=1778841144; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ItwrZTo8YATZEyUsbNM+bp6baR9q3I1OeMzPtJnQMEg=;
 b=g9N5oS255wkJJBnO5SJ4+WMQiaZg9xWyR24MWC1qz2hypFNfp2B7Bckp1DJ2y54LcJ
 xvZsmUr9LFRMMccuNa0RM9e/UmTyTtsiXC/lfAjWMEZ47W0qVyKR3kt/FSB+tHn04fTC
 eUiwVahBmH/AY/VLLzG4Z/ozfJuohFCdP9OUGZ8v2WTDtMFsZmljVlZQ84j/EkLkyPGK
 aAwfoSrMP5sd4hp6lzBbkOt2/sGU8goe3PB02EMI0VgPiGGk2scRPQJ7RqywWQLd3Uie
 0YdWaCz+xjHiKg9GT1mUipJhU7vjTCpogNieUKxkJYQsa+i78ItfwSI0NNz9hylYnyr6
 ZsAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=g9N5oS25
Subject: [Buildroot] [PATCH v2 1/2] package/htop: bump to version 3.5.1
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

This patch updates htop from version 3.5.0 to 3.5.1, a minor bugfix
release.

Changelog:
- https://github.com/htop-dev/htop/blob/main/ChangeLog

Builds Tested Using:
- utils/test-pkg -a -p htop

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index f452d57a88..3d015c6a9d 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.5.0/htop-3.5.0.tar.xz.sha256
-sha256  b6586e405c5223ebe5ac7828df21edad45cbf90288088bd1b18ad8fa700ffa05  htop-3.5.0.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.5.1/htop-3.5.1.tar.xz.sha256
+sha256  526cecd62870aa8d14d2a79a35ea197e4e2b5317d275b567cee0574b2ddb2e9a  htop-3.5.1.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 2b99637366..f42d7bee36 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.5.0
+HTOP_VERSION = 3.5.1
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
