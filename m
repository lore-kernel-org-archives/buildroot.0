Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91168C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 20:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E14E613EB;
	Wed, 31 Jan 2024 20:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E14E613EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7I1VfHOPPV0r; Wed, 31 Jan 2024 20:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E76961485;
	Wed, 31 Jan 2024 20:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E76961485
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 951651BF5A4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DE788455A
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DE788455A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hmxueN_3Gwui for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 20:47:09 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D64C8454F
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 20:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D64C8454F
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50eac018059so204154e87.0
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 12:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706734027; x=1707338827;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GwljteCDgu82sg2ZiSI3dsW/jBFLttbvB5ucr+sBDCo=;
 b=YY1S05h4koONGPIgTqQQtn9y7h49I9IHNLLb0pqzPjazcRWbVHxz+CFc8quRl3GSdJ
 UejkzRcjjk6OEAaak5gfXVVG8s+PJvVp8RcaAxP5fOAvw3U7empe+d1YGI6Bz2LeCxKb
 O7Ggg8RkKsGjNEm+/NbsTE8fMeHbrQHwGqaNBf9hB+8X4IgOr2535OccLxfWEeNw4Ckx
 Ya61Or6gEOqo/YTdzO/rHE9z0TUU34DFT5ICnnCQGpfF4QAHcKSWv8knLmHTTldkCcIG
 6mE8HRW6j50nq7hXtgIVvZlFLSneq526P10qk+ntSLRaE9FeWlLyNs+xODFpsxnFbsZe
 6Duw==
X-Gm-Message-State: AOJu0Yyw8gv+boF/WMmj0f9f+kSSgg3NP9GlN1mmxkIy+fD98YqMwAPA
 r7NYuOKvLWV1CwWYaw3cp8233h7qL52wNNWo5Za4pW7zr7bNYh6fbCR5dtmYJD8=
X-Google-Smtp-Source: AGHT+IGNCgRkYSuXXgdByObWf5tnArqouv9lNZ0fYBjpeMlCv8ryplFtJQD5RoZKqhj9ZKtB+V+Ogw==
X-Received: by 2002:ac2:5e8d:0:b0:50e:8696:1718 with SMTP id
 b13-20020ac25e8d000000b0050e86961718mr402627lfq.37.1706734026240; 
 Wed, 31 Jan 2024 12:47:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bj26-20020a0560001e1a00b0033ae6530969sm11634236wrb.85.2024.01.31.12.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 12:47:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 21:47:04 +0100
Message-ID: <20240131204704.2099316-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706734027; x=1707338827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GwljteCDgu82sg2ZiSI3dsW/jBFLttbvB5ucr+sBDCo=;
 b=D7h6UUEp9MaolgQJPf+/vsm3HPtYPCTMDsnbY+7DapkqauaMQSWK+FPbi9NFpiMPZb
 NSO3ErUmk8OGejr10Me71RD1lQo/u628lXHebGM0+lZ45MlW4M1Go95HOn5BAjK11A+S
 Hf86Ncwv8PzhW1vNnFi1EhCoLwFP0nI6f0qYI5TQ2DNowWV+r32G2tMQWYRV2QWLcT/0
 1FJMQVVRc2nGljICBvlJl6HPeDyMmaVKBjHXYGo1O/XZ8CK5E3arETlsV19fvNTrwYA2
 1qH8NMhCegWv+WbHVRQjKwwehxFfnvCghirLMerHGuhoITCZqrs3rSXbTJPpw4HYGwiR
 g86w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D7h6UUEp
Subject: [Buildroot] [PATCH 1/1] package/libpsl: fix legal info
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 863131cad9fec0a54a4b4281f5fa3cd5ed8ea462 forgot to update hash of
COPYING (update in year with:
https://github.com/rockdaboot/libpsl/commit/80c17cc237861318a680ae170995d44a11029dad)

Fixes:
 - http://autobuild.buildroot.org/results/2b09ca88a08fdba8ca75153688ed5dd9362c7520

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpsl/libpsl.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
index d800ba6a77..caf760c496 100644
--- a/package/libpsl/libpsl.hash
+++ b/package/libpsl/libpsl.hash
@@ -2,5 +2,5 @@
 sha256  1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208  libpsl-0.21.5.tar.gz
 
 # Hashes for license files:
-sha256  776cd11d54f0ea3e5efdd25ff1a0d952a1744215bb5858ea7aeb91808e70c9f7  COPYING
+sha256  322392e6001b2b3b0fca705dc9f11f26e12441188ecde50eb1d22909980b2925  COPYING
 sha256  1d7f52747a9169751cdf2641a8299c0098e9ecdf9429296ffd55bdb14c9ed5b3  src/LICENSE.chromium
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
