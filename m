Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB06F99C72
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 15:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CEBE60F69;
	Sat, 18 Apr 2026 15:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJPA6Eme4CLy; Sat, 18 Apr 2026 15:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D72D160E90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776527746;
	bh=9MQp96kAfOdFvVL5jLDx6EiqPM40I8dANpXT+X9TCHo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DnL4kA+BhIDWVPToTDZ8PAd/YRty/LcXJxEs4LDlws2+o+cUEUBiiNVgTJ8zvArCO
	 pYUnw66kYHKqNCpp7rcp0Ztse2opJtBbJvu2Sc/nCsbHTAd9lidcVDvSwATLw2+dE0
	 he8OZBXxa6uvF9PFhmOBbflfAPAVaM9Ermwn1+8kaakr5inVNAZ0gFEY5LFvQ+cnH9
	 mz9uhQ5DtUq3nron9evz5Sm9sNaZtnOjcMbEHwaTI+WcZ859on+O18gbPWBROhAte8
	 gO1OVTfzhLpHSq0XsaCzHZ5E2Ia7t18j//TAnDuMM4SqEO3p6OMd/yhKIhSXYQ9pty
	 NqGQK4AaIdMLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D72D160E90;
	Sat, 18 Apr 2026 15:55:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5D3C369
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3965C4002D
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZSM-CYhmIiN for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 15:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E9A340108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E9A340108
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E9A340108
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:55:42 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-82f83bd32efso1284360b3a.2
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 08:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776527741; x=1777132541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7rCvZrLtggBIIuefhgwprHfASFcTJic2MlgtD/jvohY=;
 b=P74dsTz20uIZlY7fe+DfJj6i77eXNnVe2E9Yd25ah9fg+z2ossh9gS7aIlDOh3FMOZ
 ZfsAxbwplzmgrnd1vpr9sclB1Kh3K/rrtxekbhQMwhE7qAFstdb+8eqfFwNaT2k7moqV
 +Ss4jL8IvFE6fH+vubBxQtQ8BPczpZY9aDFf/qgKQQjkwvZqYn20uhdqlrEEY1KdOUYm
 eF5GgbRggbqoD/P27+5OFZL2/B+LW3jho3RZ6u987Pqore3tfcNco6ESvHk46PpJ0LPc
 fG9RGMHN+KF6UOD4Zqm+88E/sY6IbgL39hku/VFRlYZ2CDTENOZxddiLw4VUUGMt1e34
 pWIQ==
X-Gm-Message-State: AOJu0YxdC+NY3kd9FGEOxYvL3CnjDReK0z2xBvQ+CCncO3y9OQTUYHCa
 U20BkzulR9yZhPNLBIO8Y7h5F1PdTFD8bWEwZOKl0XhOCb/P/WTRdY1XtjLqS1vg
X-Gm-Gg: AeBDievyyyrpSW9/mfgobswsPKTXIyC5uaP9uT56BHJr/PGBZG7u58NNVwgxJ9BHwny
 Z8GQQ3yRgauGSHZ1isY2eZS7/13ahwVra7ToCNSKb2SYq6IkCauvx9LLoP6XbbGRTNgRtBSpn/e
 mLyaZXGiz2cjLGNTl/rcd//JRemeSV4OwRYOaKU7q82+86yh5a8qV1aenZojfHSCngYnTGwvn9Q
 gz/OD9vXnwbI6KS2FePbRbdpzEx7XA7mp2l78Qt6N2v/92BtXsPqS/M6Bn9KITlp8W9cJBD+ZDZ
 mMPZrnsfi4Lub4MLpoxK9ZANi5rSiQPl9M0I0Rl+LO9g8TUbfTPfRRNRGjf29mkBF+/+7+9vs1o
 HPu4eFv5KcWIJ45mkgswdxaKIMuM03PT8+0rNG3laGGKRM+xVNPxMK+SsWy634LyLcBUUbVOXyD
 szcw4ZkIHVsNrq5Ssf3ot60VmJb1Yah84kXWB/NN/LA9QE8O8DXeGyOwKs
X-Received: by 2002:a05:6a00:1c96:b0:82f:1d38:f692 with SMTP id
 d2e1a72fcca58-82f8c7db39dmr7142609b3a.6.1776527740932; 
 Sat, 18 Apr 2026 08:55:40 -0700 (PDT)
Received: from fedora ([2409:40e5:112e:daba:4994:b597:7615:a059])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8e9cbb1dsm5959033b3a.14.2026.04.18.08.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 08:55:40 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 18 Apr 2026 21:25:12 +0530
Message-ID: <20260418155515.9980-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418155515.9980-1-chakrabortyshubham66@gmail.com>
References: <20260418155515.9980-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776527741; x=1777132541; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rCvZrLtggBIIuefhgwprHfASFcTJic2MlgtD/jvohY=;
 b=FfUmMEcuAKXVmz11dllfmAn3jwtwG/TDt+jS3iLwSRnsCoBUf44IFRLwhKqsKH02M+
 SB9PVut9yuG3WCbSmeh+aT+PVXh9H+psfUD38JNZ0IUsVL3i40sfJn4yrUN7cJ3qrEv5
 fHmGgTY2FF/JpVr9/dMdE6s0tibIk2FVkSayND1SZLbdc67xTQ9VOpyNTEX/lSPF+nAH
 X8PQe8CIxOFAuzN28PI7vSKbrFCL8PKXsZ8BNauWbOzYJs6BEdXXQxCvJaY5LK8U1MqE
 nCbI2zbMKwCfbOqM9+7qIM/+KnPoLwS6cvDVX0oVrBSMjZPiaayQtPZF30L1Li/i/BOY
 9gXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FfUmMEcu
Subject: [Buildroot] [PATCH 3/3] package/libenca: fix C23 compatibility for
 getenv/getopt prototypes
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

GCC 15 defaults to C23, which removes support for K&R-style
unprototyped function declarations. This causes build failures
with strict modern C libraries.

Add proper function prototypes for getopt, getopt_long,
getopt_long_only, getenv, and _getopt_internal to comply
with C23 requirements.

Fixes build with musl libc and GCC 15.

Upstream: https://github.com/Project-OSS-Revival/enca/pull/97

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...atibility-for-getenv-getopt-prototyp.patch | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 package/libenca/0001-src-fix-C23-compatibility-for-getenv-getopt-prototyp.patch

diff --git a/package/libenca/0001-src-fix-C23-compatibility-for-getenv-getopt-prototyp.patch b/package/libenca/0001-src-fix-C23-compatibility-for-getenv-getopt-prototyp.patch
new file mode 100644
index 0000000000..74e92ce677
--- /dev/null
+++ b/package/libenca/0001-src-fix-C23-compatibility-for-getenv-getopt-prototyp.patch
@@ -0,0 +1,69 @@
+From 1782ea5dd749cd66b38b03aa02bd0c2f9d558f83 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Sat, 18 Apr 2026 14:25:27 +0530
+Subject: [PATCH] src: fix C23 compatibility for getenv/getopt prototypes
+
+GCC 15 defaults to C23, which no longer supports unprototyped function
+declarations (K&R style). This fixes conflicts with strict prototypes
+in modern C libraries like musl.
+
+Build-tested in Buildroot using musl libc and C23.
+
+Upstream: https://github.com/Project-OSS-Revival/enca/pull/97
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ src/getopt.h      | 16 +++++++++++-----
+ src/getopt_long.c |  2 +-
+ 2 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/src/getopt.h b/src/getopt.h
+index 2eae587..91647ae 100644
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -144,7 +144,7 @@ struct option
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int __argc, char *const *__argv, const char *__shortopts);
+ # else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int argc, char * const argv[], const char *shortopts);
+ # endif /* __GNU_LIBRARY__ */
+ 
+ # ifndef __need_getopt
+@@ -161,12 +161,18 @@ extern int _getopt_internal (int __argc, char *const *__argv,
+ 			     int __long_only);
+ # endif
+ #else /* not __STDC__ */
+-extern int getopt ();
++extern int getopt (int argc, char * const argv[], const char *shortopts);
+ # ifndef __need_getopt
+-extern int getopt_long ();
+-extern int getopt_long_only ();
++extern int getopt_long (int argc, char *const *argv, const char *shortopts,
++		        const struct option *longopts, int *longind);
++extern int getopt_long_only (int argc, char *const *argv,
++			     const char *shortopts,
++		             const struct option *longopts, int *longind);
+ 
+-extern int _getopt_internal ();
++extern int _getopt_internal (int __argc, char *const *__argv,
++			     const char *__shortopts,
++		             const struct option *__longopts, int *__longind,
++			     int __long_only);
+ # endif
+ #endif /* __STDC__ */
+ 
+diff --git a/src/getopt_long.c b/src/getopt_long.c
+index caba753..a55fe2a 100644
+--- a/src/getopt_long.c
++++ b/src/getopt_long.c
+@@ -199,7 +199,7 @@ static char *posixly_correct;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *name);
+ #endif
+ 
+ static char *
+-- 
+2.53.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
