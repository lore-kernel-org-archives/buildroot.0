Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F4BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 12:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 978A641A44;
	Mon, 30 May 2022 12:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDC1Ql8xW4jj; Mon, 30 May 2022 12:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C1E841A38;
	Mon, 30 May 2022 12:38:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 172BE1BF425
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 12:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12DCB41A38
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 12:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9wszbOUyA5D for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 12:38:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F05841796
 for <buildroot@buildroot.org>; Mon, 30 May 2022 12:38:46 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id i11so18801065ybq.9
 for <buildroot@buildroot.org>; Mon, 30 May 2022 05:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xs6vBu8/MZ4U8BIthEDtL06HGgvPEsP+BXMxjUFQBH8=;
 b=fkxxrSIQXruKSwEju8EsfoJsUZ04igsfpk0mRyBXbYfHn5Q1a3GJ+7cJki7zVL2ME+
 B4KGaH0bwncyNoBbDEKU2McPNhJQNXYaRQ3hy1jyr6uol5Uc3weATUNf/ChTdreHMoNp
 BahyZjK5mK7zTG3NdHW75MDAPFqMc/S/KyRueN6WiKyQrHpHUs3AZ6qQXDAquWxFDCnO
 c6MbQut/ZeX77CUKooTejbvXNjDHHq+TrYd0R/DTqjPR5BDWQBuvJiT40XYI0j6qF4dx
 wEh5XwxaZq/vyUthJNw1QYqroBHczXLN/7pwUu0VmKPVIcGJ91i0alUoAgoncSgmIhf0
 bQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xs6vBu8/MZ4U8BIthEDtL06HGgvPEsP+BXMxjUFQBH8=;
 b=ODktbbB3YPrzgSuruZ92L74DfQ1JD1xLT7JjbrV7xx8jKiI4kfCYdvVQNn1RhAeMQQ
 +cZdBeSiQSvCHylGlkrNtJZ4YbOOSVMiAVAgBvvuGQwreYYdg3Pou9Zq23h0YYj2a7fI
 ohDMPuwd5Xxf6LcWQh/XkLSo8IBdSEtFhmpqa1a1GLm+LrofmvCaB4apcEWy2tJIjfOa
 Z5i0wVWR9tqUbNTx0LhXAIHb5KcmRaB6c55t9ShYf55H53EW93k+Bx0alU44JssoRHSG
 Xw94MQYQ7kQ06Wq5deuzhFZ9IlLjneYmsduYHZdtG7p0+baXSN5OnM9JkcSKKVy7ZKjN
 KqtA==
X-Gm-Message-State: AOAM5328pmGlzpzeXHqt8wxKvYsGndev1EH+HQS9Egx4J7KGqPxcEshT
 /4jf4ywnrgCYuJ+RZ9FcuIG+hAKWOmQaPNhiAtQ=
X-Google-Smtp-Source: ABdhPJxn5LmFFvabYfVsYybik9uRRYBTHd3chyusZ/H5H5DUbT+TO+sKokfRgxvjXnd3Q5j8phoWR5y6tu7g35B7pwM=
X-Received: by 2002:a25:dccd:0:b0:65c:bc72:75bf with SMTP id
 y196-20020a25dccd000000b0065cbc7275bfmr6515435ybe.315.1653914325128; Mon, 30
 May 2022 05:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220329145904.63900-1-andreynech@gmail.com>
 <20220528213306.GL301044@scaer>
In-Reply-To: <20220528213306.GL301044@scaer>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 30 May 2022 14:38:34 +0200
Message-ID: <CAOiXNkCGcqXo2dy7Ae=Ne8SP3c1ANnSP57cpPocBMoXVwRGAVw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 3.20 is the first one where the following issue is fixed:
https://gitlab.kitware.com/cmake/cmake/-/issues/18299
Was affected by this bug and decide to bump the version to the
latest stable

Signed-off-by: Andrey Nechypurenko <andreynech@gmail.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index da514a6d6b..1749db8c27 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.18/cmake-3.18.6-SHA-256.txt
-sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600
 cmake-3.18.6.tar.gz
+# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
+sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0
 cmake-3.22.3.tar.gz

 # Locally calculated
 sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d
 Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 4177b119ab..053658fad6 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################

-CMAKE_VERSION_MAJOR = 3.18
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
+CMAKE_VERSION_MAJOR = 3.22
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
--
2.32.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
