Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BC6E77188
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 01:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C0BD60905;
	Thu,  9 Jan 2025 01:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEaalR6D-ffZ; Thu,  9 Jan 2025 01:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4926089A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4926089A;
	Thu,  9 Jan 2025 01:18:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15C4E7AA
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F8B260872
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpRaMIAwhTtg for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 01:18:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1318606A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1318606A7
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1318606A7
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:18:11 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21634338cfdso6982685ad.2
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 17:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736385491; x=1736990291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7WULmLBnSokjZT3tAKB8zbGvtdKBjltDICSopZq/kRk=;
 b=GwgGIkbf8W/OsSoDVptYo3NAXsNH4Xl6BdzNI5Y1k8hkrtD8p/7JrY2jpbi8oVVDew
 W44hKC75qenM7fqOgmKt9bf6Mo6PswZA3obiktXeJTdna+TZQGpCNlEPhZmYiTfwMcNQ
 5U2xEa2za6q+cNakhsxg0DEFbnZAL4mOAbUPSflcv04k12CmKZMTV+vZRI6gcAE17yiM
 y/OC3fKgekb/dQQpl/LJi4V8q33i61tOpR/TBkKgV7qGj/FWasCcW5jyJmz3iYso+cxX
 Uw6L7q5wrszXJbsyl9VwjZc/cojz7pgpDn9qpapTbSvvqV+wjoxB/k2FYXa5W7mJF35b
 fyUA==
X-Gm-Message-State: AOJu0YzBq6JGhg03P1r+IobvPFn1izUewGJ0Da8wqiFbZw3XKjt6G2Lf
 W6mne/zLXCY5djifk4O68t/OJa1hLi2TdvvoF+LpUDCJGULLV/R8xThYLw==
X-Gm-Gg: ASbGncv/JbzU07Hl6erVSdSJRr5QwS7qTqOjtKEK3ubTOqV36YHc7rWKMeLp+9hvjvo
 TAc4IPflIqRDsL0pm51rfDfPfaBPmonwRE//rlMe7TxNWkA+OLaKsFdPgkyiJWjN0a5ppWax6qL
 r967v0Hh7qn6lsIiNfEaMKOqD05kCIO93qvIYsgsYLFXj3JwThnGNavLuR2SCI/qdRPpZARvdw+
 yY7ZLfUfCHfNAERoMlcbdTn0hbe+IGFT6iFwviYku6ypzVD2qQ5SaZ4DMP8yb3/f2qYYfIwG2fU
 U74fAeRSW5n4DHVWab6Wx6+MfwNW1ws0z7oEDJaE
X-Google-Smtp-Source: AGHT+IG9l0P+CpQbeFqy5F5DTck39IN8ZU8fkeyMsAAK4bzgItM/SJC9jT3zIfIzMNQXYsosaylWMQ==
X-Received: by 2002:a17:902:e84f:b0:215:b5d6:5fa8 with SMTP id
 d9443c01a7336-21a83f50246mr85122835ad.22.1736385490844; 
 Wed, 08 Jan 2025 17:18:10 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a91768c05sm801355ad.14.2025.01.08.17.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 17:18:10 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Wed,  8 Jan 2025 17:18:07 -0800
Message-Id: <20250109011807.28041-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736385491; x=1736990291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7WULmLBnSokjZT3tAKB8zbGvtdKBjltDICSopZq/kRk=;
 b=BMeeRB+AcKzUTQjLxNqFn3JSvhSxtz6K2c4S4yVoK9/+5epTHrjad9OmDcyC+1Y6Mp
 gonNqKLMvj4FZQeBDUElhDCbcGnyFUKTPl05kiI0z2+NPFnpJUjZNj97pfESCqOiWaMK
 h+5IRpo1a99XWjVwcgvepDevSBH06WM2I005e87k+RXxOb4HEBQ3ECoMuoAnh1glZN++
 wrWCEFznJFCHbLPgtAKnfEW4rDCQWP/4Hv0R5tGqd8P+l0vlNlkrBuZuU3FVN6ss777C
 8EXA6Nn0CbLh6F2xzYPavvdziZz9FsMsl3ZIq7NOD65Bn+eT99rP9yPXmib6PXEsQ4a4
 mYtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BMeeRB+A
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: bump version to 4.4.37
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

Release notes:
https://github.com/besser82/libxcrypt/releases/tag/v4.4.37

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 4 ++--
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index 9bcf119077..45e2df6d4f 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,5 +1,5 @@
-# From https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz.sha256sum
-sha256  e5e1f4caee0a01de2aee26e3138807d6d3ca2b8e67287966d1fefd65e1fd8943  libxcrypt-4.4.36.tar.xz
+# From https://github.com/besser82/libxcrypt/releases/download/v4.4.37/libxcrypt-4.4.37.tar.xz.sha256sum
+sha256  902aa2976f959b5ebe55679b1722b8479f8f13cd4ce2ef432b0a84ae298fffd0  libxcrypt-4.4.37.tar.xz
 
 # Locally calculated
 sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 60901988ac..c16b3baa74 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.36
+LIBXCRYPT_VERSION = 4.4.37
 LIBXCRYPT_SITE = https://github.com/besser82/libxcrypt/releases/download/v$(LIBXCRYPT_VERSION)
 LIBXCRYPT_SOURCE = libxcrypt-$(LIBXCRYPT_VERSION).tar.xz
 LIBXCRYPT_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
