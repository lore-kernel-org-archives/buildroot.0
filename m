Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C881C77B75
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 00:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71205418D1;
	Thu,  4 May 2023 00:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71205418D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c89e9-WtSZjJ; Thu,  4 May 2023 00:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67FD9415DA;
	Thu,  4 May 2023 00:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67FD9415DA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA551BF3DB
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 00:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60DF141889
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 00:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60DF141889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ulJDfHMv-L3E for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 00:24:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22EE341583
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22EE341583
 for <buildroot@buildroot.org>; Thu,  4 May 2023 00:24:08 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-24df4ecdb87so3200881a91.0
 for <buildroot@buildroot.org>; Wed, 03 May 2023 17:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683159847; x=1685751847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4UkUIWFL6Rm4YRue/1UpOOozc1rFvpUFGuP9jjvSovc=;
 b=d9cuYYNnlD2EljMpHLrbcy6CaxGTE1+MPgTYEsrq9g7P5GpVTOWA4jG2VzhK1m8Ukp
 /b3FqJUQ/OJPB+aJuCIEWW4+iye/Wq2UkFwI7ISlRcZVORd3Ry7tvXkNcwidLVgol+b1
 D4uXHg0kK4zkvdWR8tltrqOb8SizJddJ158QdFnswb/J1KjlGOqVJBCGcMniN2HrawCp
 YfIDz3s+Tf0e8pY2cgAJjDOiiAz9ni9jNm0o/cktv/g2NbPdH96eAh0Ir8up5yl77Cku
 RRJdLrscXtsAFm759ypqIsZiM0kroaOR3qpsWIh2fr7WstPDRj6b/UQbHPdViKmF2Ng6
 gxCA==
X-Gm-Message-State: AC+VfDzWGn/b/cV7YYmHnuxoSN8k7MVcse+BbZx4WyJR35LyJ5MmPySd
 x5l+OnX+sVWkDoK00s2XJUJ6hn6XvbdJ0CiKcxvNVDMhEsE=
X-Google-Smtp-Source: ACHHUZ4qKvC6tyg3s6KE1heu+idTclzrBiswBbACBWPD7nMSejrvRy5J/PYjavqLruunqGi0rEX/HQ==
X-Received: by 2002:a17:90a:5d09:b0:24d:faff:74f6 with SMTP id
 s9-20020a17090a5d0900b0024dfaff74f6mr428216pji.9.1683159847269; 
 Wed, 03 May 2023 17:24:07 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 pf8-20020a17090b1d8800b00247abbb157fsm1934440pjb.31.2023.05.03.17.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 17:24:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 17:24:04 -0700
Message-Id: <20230504002404.1463540-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683159847; x=1685751847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4UkUIWFL6Rm4YRue/1UpOOozc1rFvpUFGuP9jjvSovc=;
 b=nxcJHbx/AJPtTj6BQJ4oaer6O7qC73XV7mxbnIdvEn2lmkagcGl0TlmJZDdcHjNEv6
 88BB0XzPaIocVJoKf1vk1FE1MAHyu28rsysgpRALEK1lgRwH9lii6ZzDHInI5seKFSQX
 YkNA5/jTjfsweE2//e9DpGgX2eHgjY9XqjTFuSbAz+VxJ/kSVv/swDNF99sqHT1iCJUD
 b3b71R0gQ3rG2za1aWBXVprWvX/bcTystawsNK4LgQMO+oXrQNIHICjTkdS4VYpGmioh
 4V6pac+t1ZjmoK9Hf69jIxJM8XxOh7MyyXK5dDA/PnNR3icUxSgDmqyRGy6kyleylijX
 u+/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=nxcJHbx/
Subject: [Buildroot] [PATCH v1 1/1] package/delve: bump to version 1.20.2
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

https://github.com/go-delve/delve/releases/tag/v1.20.2

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/delve/delve.hash | 2 +-
 package/delve/delve.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/delve/delve.hash b/package/delve/delve.hash
index bf730b9047..105249f7f9 100644
--- a/package/delve/delve.hash
+++ b/package/delve/delve.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39d2e3ae965abf5e71f3d8efbef368b1ee1d7154ea6604ec71d508350d419d03  delve-1.20.0.tar.gz
+sha256  58ad7a7fb42ae2ddd33e7d52dad688b249ca8a358eb73b9e48f91eda79e862a8  delve-1.20.2.tar.gz
 sha256  778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index b43d0f03c8..f261d240b2 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DELVE_VERSION = 1.20.0
+DELVE_VERSION = 1.20.2
 DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
 DELVE_LICENSE = MIT
 DELVE_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
