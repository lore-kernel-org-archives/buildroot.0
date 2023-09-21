Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB491CD494B
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 04:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6431260C0A;
	Thu, 21 Sep 2023 04:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6431260C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ceeE2zHuC8aA; Thu, 21 Sep 2023 04:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B170F60BD6;
	Thu, 21 Sep 2023 04:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B170F60BD6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E53871BF34C
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 04:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C711A41FAB
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 04:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C711A41FAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJD2g6C3qKzG for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 04:12:18 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5734641B31
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 04:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5734641B31
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.97]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MHXFx-1qw9c70mlF-00DWTb; Thu, 21 Sep 2023 06:12:14 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 06:11:51 +0200
Message-ID: <20230921041152.71616-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:dwKi5j6TJXqBj0SHt7gvQ0YL8VZzXtEqIbVWi3B0nkXQv9QVZm/
 odJ9nBeYBbQ0VHHvG1Na2unIJaWcQbZoswMPT+ttVh32+/IVjH1L8T9YzR41TjmvUxt5Ys2
 VS167tt8q/kGjXxJyYBHWAklJrigc47At+tMrRO3wWvI246Ca6zSvyGLg1KgAkQEwpkB/Mg
 u9XaFTpcFCS3D2Wafc1cw==
UI-OutboundReport: notjunk:1;M01:P0:iLzEp3Z8p6c=;A0fZAi8T6X0mpTtePXu/snNE5tc
 Nmz9D6jjcBxKXTdYZpsQuUxfsK3XCgayiiao364Pyye17gx9OJFrqrgHy5VPgHRsWPOJrczaj
 hwMDcVkwczxmo9/5CWBtkNi6ksoxvKfPQdo+gnh5NogF77G99lU5SjTq5z2jpRPZrAnpo+ErK
 /lSlzYM4D+15ZlT2oQEU1yFbdWdWzCy98sJBd1MrnsIVFsfoePrDsX3HP6VqN391JxlwdnVFN
 4kHgbSxK7t5T1J+3Hu4uUYKUWlZWXZtBKWgReDYF7GO/GXc0XvEOTYBzFtYfUv3QyuQoeagA8
 RpRcFhMpgvxjV8j5X9KcLPxxopcin0YXOh6m6wq2tfpipC65pK7CtN9b/Y7U0b1KlhzItw/S/
 yTawwdB9ZYFyjfQfZ/tUIV0JytR/dvggsXznnBoLTjH+K1UHychHlIccLdkGbLFeCjZFInZ/A
 UYbI+BnsZ9B1ae2mksg2ickkNsaJ3R2lP2ZdBAOzuY6sMz2BGZ00F0pHaRF8SHFD68sdC1wOt
 gFBWED6+hcE4JAt2flhA8VlfEbeuJUH66i1AF/CsC9rk7POpQCV0aEARaqF07MQ46HkKLxmUB
 cbS2f5y481qY6aWw9mHdVe7SSPA3f+kIPT2ty0XI41xp2WfoL1oMMuSh69MWNcxmTtKIHZy3a
 hVvYCrBMdhEcMOrTmSybDoZux3FOsNolxvfnWzXr/a8jwsrIt1ita+1xfa90iNkji59Q4/0F1
 xGvQrkBXu+JZhl21E9arL0SdxJ8AruCyqM9CI4pFaMu9Un6PF1PTSi+CgbBoqm2SPNJo3PVHd
 H81XNTNx6bG5C1xg9SNSVeofdSqqJhDMqEzQRyguH874aaGiMO9csAZx/1kq5L4G8d2eutUxC
 laFnHC2Ovhdn8tw4Y6GJlFW9rhzy30CFVg0Fzy7qIuaCriYec/qNk6NR12slYmFVYwmHmq0ig
 e0x6ac11FKzQjFvEqrW7UOokp1I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695269534; x=1695874334; i=dalang@gmx.at;
 bh=vdSRdoDEHMiY8mRP9wvyYF/9CgAfG88q4v3W7r2iY6o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=p8mUNtUuI7OrqKmuf7cM60mSNmGMRy6rxo9uQobBWKL7tMnBkctuj+TOlHEtGORC4ZtjTbMr+cQ
 bNZkuEEN12UKAYf9lm1If3qX3gQOFTA/FEATKzEUfjJ1leYZyIlIqCWMRH7xC/5G9Lucx/KErdRXK
 0VpLUoIQwcc0J+ZUi01VGDCIhuBJkw5ViR3QkJLMAjpAw7oYpG6YwJAZ38dLPypEH0/6zCB8bRfC7
 PuIE3xeb71akoRh9ObE4J8EhjWYhn4TEN5p1Pb9BPAt4eyEsaK78IlFnzc9XTy6sdl25rGoT7Rf2C
 +C2zbVx/dt9VKr5D2KnXyjoZ/Y9Oqrx7UalA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=p8mUNtUu
Subject: [Buildroot] [PATCH] package/python3: drop CVE-2022-45061 from
 IGNORE_CVES
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CVE-2022-45061 affects python <= 3.7.15, 3.8.0 through 3.8.15,
3.9.0 through 3.9.15, 3.10.0 through 3.10.8
The mentioned patch was removed in c38de813 when bumping to 3.11.1.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/python3/python3.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 5f8fa5b58d..cfe5e1ee6e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -13,9 +13,6 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
-# 0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch
-PYTHON3_IGNORE_CVES += CVE-2022-45061
-
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
