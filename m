Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E50C4706C
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 22:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3551543633;
	Tue,  9 Jan 2024 22:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3551543633
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUYS0aXNnjZ2; Tue,  9 Jan 2024 22:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DDEE4364C;
	Tue,  9 Jan 2024 22:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DDEE4364C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E77C81BF3A7
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 22:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD37342E9B
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 22:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD37342E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBZWO1Dg4Zon for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 22:51:51 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBCE842CFE
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 22:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBCE842CFE
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-28c0df4b42eso3097727a91.1
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 14:51:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704840711; x=1705445511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8QLsuRc0yvsRmy7q7rLzEElYCa36Gzb33Re0CnGSoR8=;
 b=aZMDROopwVbFxJD51r5yPgmBmt3oP78n3GaSSOGzdTCXk0482cVND8/SXu9Yx2cnbm
 r7X1kFlF+Pr4urirAtUKyPJvAIBoindtoRGhiy9LlKCrFoyGQp7IFtN6G8HWeRjgmsRF
 rrmq3lZbMoL/TemSanX9O3n4yYFiMpG1JvheOFAI3L9vv5K/g0BbgJL1f89aasaKhfgA
 f9chT6xjbhaOK0mHEaS+AqBUkSxMCmhP9dG/+d/mBFLdyMsc2ajvS89eU0xQ4bcJ5NyS
 qHl2pxpB6wdkK1slcOlmyR7LonN4onVusbAc9gwTS56QCjkba2VHHAofAbbOuXxNF9Vg
 bzPw==
X-Gm-Message-State: AOJu0YwHa9gxnEE4BoKDi36W8rZRQiu9xukLfQsaOSoUSAory48bKSRg
 Do03v8Y4bfF2Y/7qJYCfQxUT4m2xnOjcMZZ/PVuHzTCdNja59Q==
X-Google-Smtp-Source: AGHT+IHRe7aesj1Uqhva8bU0YqgPYLCr3kM+LmI8HmkrpTvQJMJVCqf+8QUJj3yjCjMfggOhSrEJfQ==
X-Received: by 2002:a17:90b:3c04:b0:28c:e54e:8676 with SMTP id
 pb4-20020a17090b3c0400b0028ce54e8676mr1708547pjb.42.1704840710915; 
 Tue, 09 Jan 2024 14:51:50 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 4-20020a17090a1a4400b0028ae0184bfasm9226pjl.49.2024.01.09.14.51.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jan 2024 14:51:50 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 14:51:48 -0800
Message-ID: <20240109225148.79257-1-christian@aperture.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1704840711; x=1705445511; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8QLsuRc0yvsRmy7q7rLzEElYCa36Gzb33Re0CnGSoR8=;
 b=iTKQf/9+4Li/QoFboarTdk1yP5MWHtid20ziMzPuPEnYyOivyeqG1jWp898fY1fwQT
 KmHpiRcGTFT4L2pMImn3ijewuhwovI9r7tqUE1c+Gcb9Tblqvgm9ZseVNNzzYgKG+Ef1
 8s9nzEDZ0y/flvun6w5IleNg7Q7L2gsm//81Kwtr5mIHNZUR7Fw2vMr0VlcZ0CtlFGka
 1WCLSIYnszpoGhCXYZzBzSyJ0ZsbDhSCwsKKpGxhk4cVnXdS5kcwnMMFv0FNZxGgsdae
 my0fhzGGHtvAVvCb7pQx8euOPFkDR9JF5tJNhKXhU+FldxwDk02Wxxz8VozYUxEarR3u
 EgWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=iTKQf/9+
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.20.6
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
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.21.6 (released 2024-01-09) includes fixes to the compiler, the runtime, and
the crypto/tls, maps, and runtime/pprof packages.

https://go.dev/doc/devel/release#go1.21.6

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 34822b7537..bee10089a7 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  285cbbdf4b6e6e62ed58f370f3f6d8c30825d6e56c5853c66d3c23bcdb09db19  go1.21.5.src.tar.gz
+sha256  124926a62e45f78daabbaedb9c011d97633186a33c238ffc1e25320c02046248  go1.21.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f3747b6473..f9d31aacac 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.5
+GO_VERSION = 1.21.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
