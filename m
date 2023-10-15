Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2857CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 12:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D08660F2E;
	Sun, 15 Oct 2023 12:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D08660F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jPaDaVjQHXRt; Sun, 15 Oct 2023 12:35:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4209460EDC;
	Sun, 15 Oct 2023 12:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4209460EDC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8419B1BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 12:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A58460EDC
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 12:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A58460EDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtMUqtA6X_Vt for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 12:35:10 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B2F060B13
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 12:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B2F060B13
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-325e9cd483eso3518574f8f.2
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 05:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697373308; x=1697978108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=btWyLaHGnpf5HMGrxlmwIyDIRqgRIUIOFVedwtg7Pg4=;
 b=V97yYxI/SYu9OwLjANLtQcvtrvQzKLsEHmL+glW8zNMOPB5fRkLRsJ2R2UCnAs4yHy
 Uez30y9Oq8evi6GddktpnjUBfw9DYi1l674CyvwVl5JIR+16rljRoHA/6WxJMXUaECUF
 KxSqEYrKO4aRqh7XsPz0uSFFg82C5UUXEjCZcIxWXvVfNWhpgH8VY8iqgJKirOllWqeX
 75ww2MXYQJSkbWe6YYK45wEg8VEId6Tf+x1pw9rolDTeuLreZ64ylK0ofRcJZzIYxAuB
 7U0LNDMlbuLHLF1VUA/gE3BKVr+EprzKCKt00RzO+kKq7wGePW2XWX6UQwcLadcaLwTn
 9gPA==
X-Gm-Message-State: AOJu0Yz0F/+SdX97kqWbjS9nljW0Qu5JEhKKQvSJ+1bXzH0w2SansIdQ
 U50DNIziTYZq8aXXE8516kpuylwPBUU=
X-Google-Smtp-Source: AGHT+IFfy2xLjY14TXGUmQG9Ppf/Pf5fXpj4XNbbSQNijSG5oes68HMxheLd845z+qn5hvGiPKDXYg==
X-Received: by 2002:adf:fe8b:0:b0:32d:967d:1bae with SMTP id
 l11-20020adffe8b000000b0032d967d1baemr6272274wrr.0.1697373307641; 
 Sun, 15 Oct 2023 05:35:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i5-20020a5d55c5000000b003142e438e8csm5927798wrw.26.2023.10.15.05.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 05:35:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 14:35:04 +0200
Message-ID: <20231015123504.189034-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697373308; x=1697978108; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=btWyLaHGnpf5HMGrxlmwIyDIRqgRIUIOFVedwtg7Pg4=;
 b=PO637XcLBc3vPMF7/Boye6WxtMXbjobVnUTCwLczrFyMx+FQSAuwMF7NSnOE1AQGYL
 oxfWHxIQSIZ/mOqG7/1nyasTvBv3B9zhe+or0+rilRpIsz9Qx4SbWiQ+0fbqPCKWvWsW
 hjfpdkdr11exo1Y/9PgXfXiRw8EUQsO3P7H5dIPvNkm49RcCLSAMzsHzMr8nPqv31rOV
 gNq3KIjgPdRVSym6s7LdNhhX2tZC4NjeOU2mQrsjtsX/h8kbJivU/5T7id3kvjTDn7bh
 q/QHLTqsN2H9oSMpxaVVZRTy8y8XRw7NWwKEuGNSHmsEw+kCFRFAaF+fFbe8c4zCdGRU
 pKmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PO637XcL
Subject: [Buildroot] [PATCH 1/1] package/ksmbd-tools: security bump to
 version 3.4.9
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

Fix two security issues that reported by ZDI.

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.7
https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.8
https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index b31c66bbe7..6f7064c6eb 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  09ab343e9bf10ddfdd3216f400b19740a391645bf3645fa6f136b8da36306559  ksmbd-tools-3.4.6.tar.gz
+sha256  418c7d87e8359355d150bdde6784612cd2ebd48ec87765852169e289d9de67e6  ksmbd-tools-3.4.9.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index c4f9c503e6..c758c17bf2 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.4.6
+KSMBD_TOOLS_VERSION = 3.4.9
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
