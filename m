Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E685BC4167E
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 19:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6604B414E7;
	Tue, 11 Jan 2022 19:17:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwHf-dl3Ik5P; Tue, 11 Jan 2022 19:17:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A45D6410D4;
	Tue, 11 Jan 2022 19:17:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1274C1BF372
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 19:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB4BC82542
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 19:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ExSiXJe4M7vV for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 19:17:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E38708248F
 for <buildroot@busybox.net>; Tue, 11 Jan 2022 19:17:24 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h10so113464wrb.1
 for <buildroot@busybox.net>; Tue, 11 Jan 2022 11:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMZACRNV1aD2q/meSHwo3A2mKCgBkSwge8v8L0A5w5Q=;
 b=lmkm7xdUt0Ney/+Ssfz1aMwU8fStTlZt+j35H84wx4r496jACw/tA4oPTRKI+TzWef
 VSn0ph/HpZI8vm1UXoqhjGAzpbaAmq5qnCpkcJik1A2q1u7/7Yu6LLNyTfxB7XTKDbri
 elFN214Mco5WINa9FlKdt1RRinTGkuFazKDWFAhMU4RyWqq1/hI6ZmbEOgt4I6gp2crn
 bzLwqD6rHjwJn2qjvG+RlHnIAiwsFoA4Xj42ZD8kaXYklMfqXCFzl9sx8iD7ONh7gkB0
 ut9ueWURCe5/LIjsIpEBCK9D6nLwKKXax47+QylBJsJHXWJexRr+WlEmL5ZcOLbjngKR
 OmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GMZACRNV1aD2q/meSHwo3A2mKCgBkSwge8v8L0A5w5Q=;
 b=ihONNvzjM2A8rFmZ2Kxj6U0KPc4XhbX4bpxV3ILsAXbd9oYQAZ51oH6N3arBtqSQbh
 IvlRs5PHbc6zf01B1iXSpzBZF7I0qkgQ+QjNatPd34MqmXrWxfNhJIvKs0ep7sn0N2jk
 nNs/OnRFVkb3sgK0cw76JxUzozkcQA5yJa4TWACESypVA8p4fneDKFFBV80Me+RVBZGF
 /rAqmJLzoOpBPGzxrX5aZ3PrnhLlaqhRBScmVNzNVfubHj4mIgNdEIFF/z8duAG9WHA1
 ruHr4kc1YFQRbKHEv5C0FKiRjO7xJdHQjmdq+dz7TFgRTXz0gusT4/A23rp58oB5zuYn
 LRRQ==
X-Gm-Message-State: AOAM531v9+/qJfpsbfntAfLH1bXwNcnQxvZBOhAMMXPlW4jv+pBtaiuf
 pHq9uXugSjI1SbMPqO6ICPAKDf2jEBE=
X-Google-Smtp-Source: ABdhPJyQHXO3Z7nRGgsjqluhkAr5zxZ727sQsqekVXdNxYty8jpHg2rGxk6UHRq3j5N4rpHcM/0AHw==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr3937984wrp.90.1641928643266;
 Tue, 11 Jan 2022 11:17:23 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id p18sm3437250wmq.0.2022.01.11.11.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 11:17:23 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 11 Jan 2022 20:17:13 +0100
Message-Id: <20220111191713.11473-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111191713.11473-1-francois.perrad@gadz.org>
References: <20220111191713.11473-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump to version 2021e
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index f70627481..55346539a 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2021-January/000065.html
-sha512  7cdd762ec90ce12a30fa36b1d66d1ea82d9fa21e514e2b9c7fcbe2541514ee0fadf30843ff352c65512fb270857b51d1517b45e1232b89c6f954ba9ff1833bb3  tzdata2021a.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2021-October/000069.html
+sha512  c1e8d04e049157ed5d4af0868855bbd75517e3d7e1db9c41d5283ff260109de46b6fac6be94828201d093e163d868044ac2a9db2bf0aeab800e264d0c73a9119  tzdata2021e.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 922e7420b..9cf8c2ea4 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2021a
+TZDATA_VERSION = 2021e
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
