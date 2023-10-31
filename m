Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25527C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 14:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA9FD6147D;
	Tue, 31 Oct 2023 14:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA9FD6147D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2cUZQlwLelk; Tue, 31 Oct 2023 14:59:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E85D761474;
	Tue, 31 Oct 2023 14:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E85D761474
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46C281BF25F
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 14:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D05D83C52
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 14:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D05D83C52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uf0j3YcQkv7B for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 14:59:09 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2800B83C4E
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 14:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2800B83C4E
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-407c3adef8eso47297595e9.2
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 07:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698764346; x=1699369146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2a9FX8o1WmpdAAD7yWV9YIqOt2XLi//v4CyBQaZn9tI=;
 b=hsC+KzBO6EKNwUxiHHlYbBKZo7Xtsw8TmPbpfGUfqWWnMHeFqSTod2YtMuUtGTKC9z
 z5lYpS0QzHVXWPfoVXrgKpHiEijw4kV2AwFrqVLUOBxkMUzid/E4jtzMyQQTNjgCjtQR
 8Q2+rhwGMVbLD1j4ofCTDTeYU5dVg1m/g2tIHS0RPq48HOpaO/JrlPb7bkfiXpeWJV48
 Io/Wj3gEZhAHo3TchmPoelf9DuCRC44kayMRz+6DXVwx+gLocpUKDhmGIlNQcTA3Spun
 jsGq9wXOeVINP1Kkjshfhl88QR7c8IcRXDl1zqkbsBiZLxfdirHY8H5sfCQgIpggqjEM
 JD9Q==
X-Gm-Message-State: AOJu0Ywjri6XZItjRe6qfSq4YcKo5sLA3mxPgkppKQ1cjX/xfsnEn6ZO
 C/RORBmqMjipoYseYXZhErFigRtrsI4=
X-Google-Smtp-Source: AGHT+IGg1vMDJCO/EZOmG+HfNBgYpxsoxfb7nkRMOEYL2tcFNyvVttoXkK/XNywkc34a9FRayDkp6g==
X-Received: by 2002:a05:600c:1caa:b0:405:1bbd:aa9c with SMTP id
 k42-20020a05600c1caa00b004051bbdaa9cmr10581366wms.34.1698764345441; 
 Tue, 31 Oct 2023 07:59:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c3ac800b00401d8181f8bsm1968164wms.25.2023.10.31.07.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 07:58:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 15:58:30 +0100
Message-ID: <20231031145830.14831-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698764346; x=1699369146; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2a9FX8o1WmpdAAD7yWV9YIqOt2XLi//v4CyBQaZn9tI=;
 b=kZawbQYtUaxzjvN3EzHqvFEUk/Y59Oo5ygB6s6cE7Cluqlgm7F+grgtnMJZSO++HpI
 NviRwVEJQAouLS+NHTqCYwxg43ah0e/K4/xo2Tki8BJ3arafc0YqxacCknOgDT3+A+e9
 POGJr4ECRl35etSYlXN5HD/9Bz/m4IwOFQudw2X6H3jDVKr82BZUWD5j4U4X0MstkV5s
 0ahq+mnzjtUh5/MfYLsa9tGTxRBL2eDPdufYQennwciiWfTq934zlWY+s61drJJA0q/p
 zAwagTP7W6TBpu2RFddPRg8JK2k7D6VEKMQT0wGsn7FM8YTelpG8HH05iT4Pvxk2f0Ms
 FvKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kZawbQYt
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 5.6.4
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[Medium] A fix was added, but still under review for completeness, for a
Bleichenbacher style attack, leading to being able to decrypt a saved
TLS connection and potentially forge a signature after probing with a
large number of trial connections. This issue is around RSA decryption
and affects static RSA cipher suites on the server side, which are not
recommended to be used and are off by default. Static RSA cipher suites
were also removed from the TLS 1.3 protocol and only present in TLS 1.2
and lower. All padding versions of RSA decrypt are affected since the
code under review is outside of the padding processing. Information
about the private keys is NOT compromised in affected code. It's
recommended to disable static RSA cipher suites and update the version
of wolfSSL used if using RSA private decryption alone outside of TLS.

https://github.com/wolfSSL/wolfssl/releases/tag/v5.6.4-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 3407586edd..fb5a570de8 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2e74a397fa797c2902d7467d500de904907666afb4ff80f6464f6efd5afb114a  wolfssl-5.6.3.tar.gz
+sha256  031691906794ff45e1e792561cf31759f5d29ac74936bc8dffb8b14f16d820b4  wolfssl-5.6.4.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 9b35a6a84a..17452fdcaf 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.6.3
+WOLFSSL_VERSION = 5.6.4
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
