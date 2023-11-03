Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55256C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 18:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 051AC41BEC;
	Fri,  3 Nov 2023 18:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 051AC41BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGmJOLXMFigX; Fri,  3 Nov 2023 18:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9C794189F;
	Fri,  3 Nov 2023 18:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9C794189F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6F181BF57C
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 18:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 477CC60648
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 18:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 477CC60648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_NmHiz4YJCk for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 18:27:50 +0000 (UTC)
Received: from mail-oa1-x42.google.com (mail-oa1-x42.google.com
 [IPv6:2001:4860:4864:20::42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15F44605E8
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 18:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15F44605E8
Received: by mail-oa1-x42.google.com with SMTP id
 586e51a60fabf-1f084cb8b54so345766fac.1
 for <buildroot@buildroot.org>; Fri, 03 Nov 2023 11:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699036068; x=1699640868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mpTiV5m+l0r3P/7aLBJjT1SO44r0PYLafjxbKLv2sg8=;
 b=cEyLa7Il3589ptEju5/CJKspeNj1FjUQ+dNp+st5AaDjMfWtK9j5JByNoQwHf8PKfd
 H6glG3zK0Pp8uCYMFir9SUT/OXQYis6zJXQBPLVgeJOy7dPqv3qEm2g1FutmgX1flop3
 ldPMxWCVb4n0jMSeCe2YvyZ4JIWEgTxpUAtfmiXXZOa1ZsEgpdRkJh/VcBuhN5dOlN31
 mnYOowyejHHBck+pCOUtIGFFH3gxI7a+LgJ5CzTjxVX7wh2nQF02hg6F/uaI4i9kC3y5
 8AXaMKhduzymZntbIKDm+qx2wUKcwH6xvKG0dW4r9A4Cq5inh2OlgTVy55/qGfN15wdJ
 5akA==
X-Gm-Message-State: AOJu0YzzwE9XsEooSqMNrPjljXcK1BSX8IdhhcCOn4P7n+sZRlDS+2TW
 krtMtd8dBReCc31w86zCzHdXUfgcU9g/1ILUo6Mhl/h7d+I=
X-Google-Smtp-Source: AGHT+IFnwG4W6gm5jdBmSd3PiShGHv9/02mGJRq2X5nVIgqLHQlb5nt5hzzY6I0ZMUKBIlYQMIiRfw==
X-Received: by 2002:a05:6870:d8c8:b0:1e9:c7cc:df9a with SMTP id
 of8-20020a056870d8c800b001e9c7ccdf9amr26895248oac.11.1699036068278; 
 Fri, 03 Nov 2023 11:27:48 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a636505000000b005b7e3eddb87sm1602164pgb.61.2023.11.03.11.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 11:27:47 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 12:27:42 -0600
Message-ID: <20231103182745.903344-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699036068; x=1699640868;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mpTiV5m+l0r3P/7aLBJjT1SO44r0PYLafjxbKLv2sg8=;
 b=D0kwJ4JzR5EXm6fTlTn9b06i+FPv30cxdxrYpyWR/+h9HyNCHlO287ph0oEXjenicn
 VKV9HlRQxgKTMESJNr5AtMmIW6CZZ/iYLdUBisXpKTBIgfjIfhANYi+w09NHtxJETHZQ
 XZKWxnzsrgKrHYarabvqC7C2Tl1K+tFO84ZBo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=D0kwJ4Jz
Subject: [Buildroot] [PATCH 0/3] Add tainting support
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Originally taken from Angelo Compagnucci's patch series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=64340

When the original patch series was submitted, Buildroot was quite a bit
smaller! With almost 1,000 packages added since then and more and more external
package managers being available for various languages, it is not possible to
package every single dependency needed for some packages.

Indeed, looking at NPM, for example, some packages rely on tens, if not
hundreds, of others. While this could be better and is indeed quite bad, it is,
unfortunately, the reality we must deal with.

With this patch series, we add initial tainting support to Buildroot with the
added option to turn the support off by way of the BR2_DISABLE_TAINT_CHECKING
option. This option gives us the best of both worlds: A sane default and an
option for advanced users to turn off the check if they understand the risks
and can guarantee their build is reproducible.

This patch series has two significant benefits:
  - Taint checking paves the way for additional package managers to be
    incorporated into Buildroot while maintaining reproducible integrity for
    packages provided by Buildroot.

  - It tells the user their build is tainted and what packages they
    have selected are causing the taint.

  - It makes support easier. If a user has a build that is tainted and the
    the problem they are experiencing is with a tainted package; it is
    more straightforward to tell the user they are on their own.

Adam Duskett (3):
  Makefile: add tainting support
  docs/manual: add information about tainting
  package/nodejs: taint the build when using external modules

 Config.in                                |  9 +++++++++
 Makefile                                 | 17 +++++++++++++++++
 docs/manual/adding-packages-generic.adoc |  9 +++++++++
 docs/manual/legal-notice.adoc            | 24 ++++++++++++++++++++++++
 package/nodejs/Config.in                 |  3 +++
 package/nodejs/nodejs-src/nodejs-src.mk  |  1 +
 package/pkg-generic.mk                   | 19 +++++++++++++++++++
 7 files changed, 82 insertions(+)

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
