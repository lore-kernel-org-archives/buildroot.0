Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67141EE14D0
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 20:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E45082017;
	Wed,  6 Sep 2023 20:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E45082017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qEL5-QBnuJN; Wed,  6 Sep 2023 20:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E01B81497;
	Wed,  6 Sep 2023 20:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E01B81497
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E40EB1BF363
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAE70404B9
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE70404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAEJoejy0jCJ for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 20:14:02 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B331400D0
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 20:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B331400D0
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68a440a8a20so221598b3a.3
 for <buildroot@buildroot.org>; Wed, 06 Sep 2023 13:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694031241; x=1694636041;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G+28gLRYngjAAJSJmm+/RofRAEyMfhdTyoLMhh3UJ9A=;
 b=LbzkReUW63bU5BKc1Qk2QfHKU7ZFFawrpDPYV85ZLWVWcIYaLjq/IQY58xNZ07sWWT
 bDruQ2d9DGcgzK0srD1F3EsCMPhxq8DsLYlHlrEL3acuJILZVjpaQTJ+P0q/1Wryjdxk
 rixz+Nqf8gcwWEHSH5ybF92HJxHl9H6/Ksv4ucCXQohf6yfoMqUj/rZOVfZ4+xlU9t03
 aiJTK8M0ace1VISckwF7LE2TOIR1t0NsRG9l93PUkVuK/IeLswCwowcLHTGLE0T7NGwo
 g75LWblW+l9AgecZRl/u+rEHytM+1n6sSbuPZNXXovj1tV/TK57tKVY/mrnAEBC3vFqO
 b0ig==
X-Gm-Message-State: AOJu0Ywh+TOh50ZHSm7aBRv9iLVrrHzxkjRYGiqxV4MGEvI4Ai/zHFDP
 uaA64i3d4pfpWFAbI8ro2SYi1ZZI4EgGie1x0pIoQZ37
X-Google-Smtp-Source: AGHT+IGTvtxvEScsV4rbvbpyPLbv1dKjX3MaEcuCwI4CyAURUXgsQxeNKnWaXAPgRFQCz+9EiaeGyA==
X-Received: by 2002:a05:6a21:7747:b0:14d:c05c:6620 with SMTP id
 bc7-20020a056a21774700b0014dc05c6620mr15775272pzc.31.1694031241275; 
 Wed, 06 Sep 2023 13:14:01 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 q15-20020a62e10f000000b00687ce7c6540sm11566825pfh.99.2023.09.06.13.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 13:14:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  6 Sep 2023 13:13:58 -0700
Message-ID: <20230906201358.2714756-1-christian@aperture.us>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1694031241; x=1694636041; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G+28gLRYngjAAJSJmm+/RofRAEyMfhdTyoLMhh3UJ9A=;
 b=DyBvuJGHijOMjXimUWHyRMkmsoOmv4IlILSFGuCPJDpUxP/LKN0BmpCnrS1jq7Qbsr
 5N71b9j6Lg0coiq29aLor0DxomoqVerhLT/cuyMxz7VxR3YVTIZ35T84MoaLPT1Pr7hW
 8PbrOkFY6ZIVhnWjv/bUm3SWwx9voQpTH3LWyQpi/kRHGfXYAMw6en4gaoJHhgmb6gvi
 GmGLBzpiCm7ZnVKaNxqTW3Z7ZhRugPeO+zUsDwB5DbsTTWvllXdX2nokSukp6tDXMwzx
 A0r04/Az0Ygm2pMTfuIx2BYWm6FgSUgPb8RlpUuzourRAmMOOTOYkgszSU4x/UPc5Gfp
 fTaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=DyBvuJGH
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to version 1.20.8
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

go1.20.8 (released 2023-09-06) includes two security fixes to the html/template
package, as well as bug fixes to the compiler, the go command, the runtime, and
the crypto/tls, go/types, net/http, and path/filepath packages.

CVE-2023-39318: html/template: improper handling of HTML-like comments within script contexts
CVE-2023-39319: html/template: improper handling of special tags within script contexts
CVE-2023-39321: crypto/tls: panic when processing post-handshake message on QUIC connections

https://go.dev/doc/devel/release#go1.20.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 2298534d91..19405982ba 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  2c5ee9c9ec1e733b0dbbc2bdfed3f62306e51d8172bf38f4f4e542b27520f597  go1.20.7.src.tar.gz
+sha256  38d71714fa5279f97240451956d8e47e3c1b6a5de7cb84137949d62b5dd3182e  go1.20.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fc1d9ed681..c1e9f2f8f6 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.20.7
+GO_VERSION = 1.20.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
