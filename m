Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF528C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 22:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C8C141FEA;
	Fri,  1 Mar 2024 22:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KWjyelRCvl8S; Fri,  1 Mar 2024 22:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87AB341FD8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87AB341FD8;
	Fri,  1 Mar 2024 22:03:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BB1D1BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 22:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9017B83BB2
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 22:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RALq7lbtDh0i for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 22:03:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EF1B83A67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF1B83A67
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EF1B83A67
 for <buildroot@busybox.net>; Fri,  1 Mar 2024 22:03:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33e2774bdc7so116707f8f.0
 for <buildroot@busybox.net>; Fri, 01 Mar 2024 14:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709330619; x=1709935419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GVeZfXIlWx0QLGpCmkv5rLVKTYloMG8Jf2abakdxVH8=;
 b=ZK3g0r6LNzK83bLJbNBpQCgSxKDBzocYFuweVumcD12osMjhGl7qzFCIPMM6/5kdd+
 YG1KtpzYN12pRQOUu72AQCtiZaLcyzLlN7bbz2K1LAw1WwQdfOuTt1ixwTTtfSdShLeV
 V1VwszPCFHSQQSF2LUN/rvwzVzxXNf9IAauoewJ8IXnAq58g/6NzDn+MOPp8NOUlQtM6
 TKrSJ6nt8u0PsfbDAFzsYcSJIJp02usvuFjcd8VHe9IfkAcwBxzyHgvIbWWnMys6AWq7
 EUXH+8IvNzSIQIK45+bu1qp38absWSfImSAKF3+eQP1O2AqQO84lo/d4fvNwZqF1GvDf
 Wcwg==
X-Gm-Message-State: AOJu0YzGhHjSih8CfGhFk5svnHIXiasb3g4LUZmE1f+fzcws8hI+3K/u
 4VTgxLpNSlLN/xC7SiB2rFEkWbDnIsRRCsrCeGPEp3nj3UWzDtJO3M3JKyXK
X-Google-Smtp-Source: AGHT+IGukS3jov37H1MmUl+V/VDvfYLh9qo1lwc/QoiuGFC95ssCHof4zNKKgMzuaL7C90G2KECDsw==
X-Received: by 2002:a5d:5108:0:b0:33e:21a9:ee9e with SMTP id
 s8-20020a5d5108000000b0033e21a9ee9emr1990230wrt.2.1709330619308; 
 Fri, 01 Mar 2024 14:03:39 -0800 (PST)
Received: from xubuntu-23.. ([37.66.33.127]) by smtp.gmail.com with ESMTPSA id
 h8-20020a056000000800b0033d2ae84fafsm2291588wrx.52.2024.03.01.14.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 14:03:39 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  1 Mar 2024 23:03:36 +0100
Message-Id: <20240301220336.315114-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709330619; x=1709935419; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GVeZfXIlWx0QLGpCmkv5rLVKTYloMG8Jf2abakdxVH8=;
 b=g1ZAiJp2JbWnxdtofyQC/OquK/2bOB/nIsDJBac4x1iju5NzfIHauN5Nd4te5y7LMY
 HkvEAhSJA88FsJEh8V+jjtM3jMnqCu9LAFx/VhLB2YVgX3h0bp9aK4wz0ih6dmFeiQkb
 zADcMFWN7TRHtuNShmX7tpBJUA9CoQcKr+XKnRasHfGkpAWRR68w+ZEKiHyczLjsF63H
 u5X/+8mu5gAgwOUih35soo9FTUz2+vNa8k3BOiUCDY9aIDI9+28CnF1MVWCb1UzrYfbE
 GgCKxGZ3KXZEeDg7EPY0r1eQGjtCMl2OQ+ExJl+4FGbPuoFneys1I3VIUn/w6VaygYjI
 9dHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g1ZAiJp2
Subject: [Buildroot] [PATCH] package/pcre2: bump to version 10.43
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

diff LICENCE: update copyright dates

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pcre2/pcre2.hash | 6 +++---
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index f609bdaee..f2e17df75 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.42/pcre2-10.42.tar.bz2.sig
-sha256  8d36cd8cb6ea2a4c2bb358ff6411b0c788633a2a45dabbf1aeb4b701d1b5e840  pcre2-10.42.tar.bz2
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.43/pcre2-10.43.tar.bz2.sig
+sha256  e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096cc9bf1b728c350bcb  pcre2-10.43.tar.bz2
 # Locally computed
-sha256  87d884eceb7fc54611470ce9f74280d28612b0c877adfc767e9676892a638987  LICENCE
+sha256  030087e2e8dd7c1bdd26057d25d4ded8f45bbf01ad458d68665ad04b8b0fbedf  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index c35056f8a..9641f22e8 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.42
+PCRE2_VERSION = 10.43
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
