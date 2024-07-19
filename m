Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB93C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 21:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1837C83ED8;
	Fri, 19 Jul 2024 21:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BkDDav-DShP; Fri, 19 Jul 2024 21:46:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25F4D83F02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F4D83F02;
	Fri, 19 Jul 2024 21:46:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 828A01BF4E7
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70C8583F02
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stsKdbDrcYaf for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 21:46:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8474383ED8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8474383ED8
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8474383ED8
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 21:46:14 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4272738eb9eso16138425e9.3
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 14:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721425572; x=1722030372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4wQKm3LL/EeeOgHGE9lA7YnpKU5k5SdHeRRw8SQmsrQ=;
 b=pZX29hXOHfmEpo8wl7k9xOfFACi2dmt+P05oIaMi+ElxYe5lH8eXjqfsb0aMYUtVJs
 b9IVxS9vpZjDnrPW66n61q4n3oLG+MvW4CcOYMGypK+Ym1Apy3JNNZMedfwAIx4sHs3o
 7An3fvqg+nhzhPI0d8+sSazR4neFnWk8T/jLVF1C+HkDbvr4hjsV52ESo8hdw99Zg8f5
 OiQi6dr7yy5d7tjp1l1s2C///hqx8nekoYIInQ1src8onU+R4Jj9PpjtJJhVFFiakyW9
 QyLLkHc+DD1KkPcq860nPYUEW3HZZWy2da7EVLDUfNhDj59qnHKCimRQmG3d4sNhgmEL
 q9Ww==
X-Gm-Message-State: AOJu0Yyq30ziKlNEJ8G1WGr5cqZ1uMUvspHxn8Oq684pHB7z9AYIeWdr
 YBSLjs52jXZl0HllgPCYtHgLVN06G8VJlRDaiT29Ra3MFfwFa7Pv2iWGSQ==
X-Google-Smtp-Source: AGHT+IGCGyhu83qab4YF1w9un/cuOViFgu7mYKvSt5/TUUcs9EY5YSPZIVliDr5JbJmHYSRFcpBKhA==
X-Received: by 2002:a05:6000:4020:b0:367:9792:8bd4 with SMTP id
 ffacd0b85a97d-368316fac1bmr7148468f8f.43.1721425572010; 
 Fri, 19 Jul 2024 14:46:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878684230sm2582483f8f.17.2024.07.19.14.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 14:46:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 23:46:10 +0200
Message-ID: <20240719214610.370192-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721425572; x=1722030372; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4wQKm3LL/EeeOgHGE9lA7YnpKU5k5SdHeRRw8SQmsrQ=;
 b=eAYy+CaHRPigbAAVEmiZB9ZDnu9TSrGTPN85uPqRTpc26uhdfANwQ0QSTWiTZ+uq0Q
 JzU10kMixklwZzJeF5pdl9xPwsu7I/S0Bgg8Ks4CaxZi5AKCCqjhZYf2W+nZCJI/gDz1
 yED0HwO8dOnwQ0CnCWAAZ3p3zFj5EhbSiRWvYBnW/dg1BMcYa5yCdDEujA8kRkui4LG8
 2knP2QlQPq0vmpfuD5adDfaTO8aWsquakiH+CHk0iSFK9xQo7zQur91poEKB+MRcc7f4
 8lco362OTFpTfFzRaMm/GpZNPdEy4RU4+5c0g/kkkb8p0i08FMgWuyUlK5OYya+hzlEv
 kWCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eAYy+CaH
Subject: [Buildroot] [PATCH 1/1] package/ksmbd-tools: bump to version 3.5.2
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

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.5.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index c3e6ebefe5..3367886d55 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ab377b3044c48382303f3f7ec95f2e1a17592c774d70b2a11f32952099dbb214  ksmbd-tools-3.5.1.tar.gz
+sha256  5da7fb4cb4368f9abf56f6f9fbc17b25e387876bed9ff7ee0d6f1140ef07c8d7  ksmbd-tools-3.5.2.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index c56c6e10bb..261eddad7c 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.5.1
+KSMBD_TOOLS_VERSION = 3.5.2
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
