Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DF6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 09:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 265F660F5F;
	Sun, 15 May 2022 09:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RvZvZIN-FY_i; Sun, 15 May 2022 09:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4148860F5C;
	Sun, 15 May 2022 09:05:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BC6F1BF588
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 09:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE2F740A65
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 09:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zr2VGJ3asThP for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 09:04:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C9ED40A42
 for <buildroot@buildroot.org>; Sun, 15 May 2022 09:04:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r23so797728wrr.2
 for <buildroot@buildroot.org>; Sun, 15 May 2022 02:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MLd+pZkN6zjECDA39wcFLitxFZRDdT9yzqF+4wwC+vU=;
 b=LxYzwAs/ATU7HtHCzjUBpT5bg+AurwLJZH1WG0HKDmNMUBWygyFgzQ5vdef94icL8+
 S2lQrX+LWV6oAKeoUsFmSNeH/QF4hIv8ifo7EsSRTV+IaL47zeOTdSYIuqdyR5mhX/Sm
 bu3VOqV91xcSUROgxke2C7uriK5WavpQqXMCEcN0JcWgCUan1T5rCViDoNWnOpvTqQU7
 KkIBchnvVWq8MJmjFJUuyLfPI7QUkKhx9CTX2oybkSj8QR9dmmzKrnas/A5ob+4cF6Mn
 HMjsf6H7mwxXcWq2ATDeLZFLjn1JhH84S4Gj1XWPuAYH1icDaKuxIKpOQvASccLJkaV8
 yWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLd+pZkN6zjECDA39wcFLitxFZRDdT9yzqF+4wwC+vU=;
 b=CwCrEhcsZOSvWI5824B0GdL+F5cAEuqZByrG3R+5mZrw326FZjBMJDk3iznWEc+yyH
 N78YqJAa3Mq/WmVaPy4SV4x4iGEVwGJ37LNsQL1Z3dhCjKNweDzP5ZvRNI/5NAoIDc6B
 CECqLIc26hZdNeGuTwIOgs4xanXb8vM37HxoGMqUbYVfTGgzaHw9qnUhZnr4RJrW7BtZ
 kV8tb82exaitrZVqwdGVyfi5a+tD22/0heypBhLvdWcTArmHx9mGqILJhrjK60i1o3ox
 /GFH5/B05+aN/asj9lu1nqab7S9n6whBAB3OjJMjZojKAvnHcnHM5PVUNomL848lxxqA
 +Wyg==
X-Gm-Message-State: AOAM5303Xt7yZ3dsrEn2abQjRjdjwmgne3wfaD3rBi2ls09Lpu6urLMc
 3NAbpwo8TmyywqH0J4HMCxsTcfp1cgw=
X-Google-Smtp-Source: ABdhPJwcW2fwzl12XT3LgBgMEytytgAu8dwkKcNBJkzPSIo2FgesP002qUreVpAFIsrIjMUrOvlBhg==
X-Received: by 2002:a05:6000:1f9d:b0:20c:87b6:e775 with SMTP id
 bw29-20020a0560001f9d00b0020c87b6e775mr10096213wrb.253.1652605484095; 
 Sun, 15 May 2022 02:04:44 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o28-20020adfa11c000000b0020d03c14b9csm1889736wro.1.2022.05.15.02.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 02:04:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 11:02:29 +0200
Message-Id: <20220515090229.395668-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220515090229.395668-1-fontaine.fabrice@gmail.com>
References: <20220515090229.395668-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 2/2] package/glibc: can't be built without optimization
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

In file included from <command-line>:
./../include/libc-symbols.h:75:3: error: #error "glibc cannot be compiled without optimization"
   75 | # error "glibc cannot be compiled without optimization"
      |   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1ba20982d5ec0edc751a11a2d5639f5f6477b9bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Force -O1 instead of disabling gcc

 package/glibc/glibc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 45155fdc28..5772c3355b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -118,6 +118,11 @@ ifeq ($(BR2_nios2),y)
 GLIBC_CFLAGS += -O2
 endif
 
+# glibc can't be built without optimization
+ifeq ($(BR2_OPTIMIZE_0),y)
+GLIBC_CFLAGS += -O1
+endif
+
 # glibc can't be built with Optimize for fast
 ifeq ($(BR2_OPTIMIZE_FAST),y)
 GLIBC_CFLAGS += -O2
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
