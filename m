Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEFCC04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 20:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02458814C9;
	Tue,  1 Aug 2023 20:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02458814C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QSiG3ihM2ep; Tue,  1 Aug 2023 20:48:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20006813C0;
	Tue,  1 Aug 2023 20:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20006813C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 188ED1BF476
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C4E760EEF
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C4E760EEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCJeGJtVAyFY for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 20:48:34 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF20060E6A
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 20:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF20060E6A
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-686bc261111so4434083b3a.3
 for <buildroot@buildroot.org>; Tue, 01 Aug 2023 13:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690922913; x=1691527713;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+7xFgCpPtq98b8Fuw+AeAMGQd+7xgWK/r72wgxhO/7s=;
 b=WSHQJSsyrT1ryYcXcpEgKRHxuPFLUlit5vb1YLzkbEMI4m03lxUgPjouB+2aVn2HKP
 tVOk/s23b4vw6FnSRaTIUkyM7hjMoM1mAT4MK9m0//ppT37ZsWKsyM4Z3Svr2aaLVxTC
 7xmzNiBo8iN5ybvbEc7nUsKhWYT7xwY89N9ZIRGsgLS9hFOIk8nMOFYIQtoT1buEpL3x
 IEXynVXE0yGGAlNjAmJOod1jnm5lGbcX0fstRyy/HR8qmiyWCbQ8J5K23M68J9d7qrlF
 vvYVf5mPmvyMNZyjit4w6ZGJGq6V1UfGB8Hx5bpoM0lap1Ov7K++1AjPPBh1r/31wdVV
 E6pQ==
X-Gm-Message-State: ABy/qLbC1vM9ArOHknT8/uHpK3XLkOBO47melTts54wcwHnDoDqj6JbF
 SKvnHznNGnMMNVCQqLHd4Tu3NNOsW7hB0lfWJj+GvA==
X-Google-Smtp-Source: APBJJlES9eW9wOVEHbSNI6Sxx7yB3dgLk3+TVPYqPi+pRq4LcsFR2grageS9SFKVmU2ntBaCSwvYfA==
X-Received: by 2002:a05:6a00:2352:b0:687:3d65:7792 with SMTP id
 j18-20020a056a00235200b006873d657792mr7312454pfj.20.1690922913086; 
 Tue, 01 Aug 2023 13:48:33 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 x26-20020a62fb1a000000b00686e6e2b556sm9658681pfm.26.2023.08.01.13.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 13:48:32 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  1 Aug 2023 13:48:30 -0700
Message-ID: <20230801204830.175727-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690922913; x=1691527713;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+7xFgCpPtq98b8Fuw+AeAMGQd+7xgWK/r72wgxhO/7s=;
 b=OKh78rqk3wrm6RJJxT4AeJGn7FYrHfAWnxQemvK/Ah8TGXytJdBh72EQ8O7qc/OUMW
 TZDIB/nj4wJcGutCd0jw76wPU/Ahwuj8A5jHJh3nUBmFOg/Nno0YDe/uMVfb2xE286UM
 wFK4a7aScdicgIfkU2wKL9Jo3XGfqdNQ3Fb4S8f0ATH7tA4GLm8iKQSjpVrK4lbRLHCs
 lqrRUmzJymP8/PXdkjVtg6LC7pLwGHrLr1UFms36y4B0YVRlzjwjZJfGjvQ2s8uK46k8
 0DNp43kV0qTihO9fJzVsKtMVlbvVV1YIng4ewiGMRmfzQkAS/FjdeO+0bRyfS7GywI1c
 rlow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=OKh78rqk
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump to v1.20.7
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.20.7 (released 2023-08-01) includes a security fix to the crypto/tls
package, as well as bug fixes to the assembler and the compiler.

Fixes CVE-2023-29409: restrict RSA keys in certificates to <= 8192 bits

Extremely large RSA keys in certificate chains can cause a client/server to
expend significant CPU time verifying signatures. Limit this by restricting the
size of RSA keys transmitted during handshakes to <= 8192 bits.

Based on a survey of publicly trusted RSA keys, there are currently only three
certificates in circulation with keys larger than this, and all three appear to
be test certificates that are not actively deployed. It is possible there are
larger keys in use in private PKIs, but we target the web PKI, so causing
breakage here in the interests of increasing the default safety of users of
crypto/tls seems reasonable.

https://go.dev/doc/devel/release#go1.20.7

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 135d1ad37b..2298534d91 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  62ee5bc6fb55b8bae8f705e0cb8df86d6453626b4ecf93279e2867092e0b7f70  go1.20.6.src.tar.gz
+sha256  2c5ee9c9ec1e733b0dbbc2bdfed3f62306e51d8172bf38f4f4e542b27520f597  go1.20.7.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index efa47e5781..fc1d9ed681 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.20.6
+GO_VERSION = 1.20.7
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
