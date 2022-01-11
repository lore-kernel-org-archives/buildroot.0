Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D96CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D05C414C9;
	Tue, 11 Jan 2022 20:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lV4m5YZHlMGd; Tue, 11 Jan 2022 20:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9360E414C6;
	Tue, 11 Jan 2022 20:12:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 253941BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EF7E40517
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PgUeXANMMoIK for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:12:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB281400D1
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:12:45 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k30so288017wrd.9
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 12:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k92gWNXNgV5DumYVJS7nK0761yTmT4j7D6M8pOBprQI=;
 b=FXbGHvFTM50JH2LfNt9zB3siwR3pLikepSttgF7kBr9/2XZDT55IQm2uoxfny2AbRf
 weL1a7uSUQ+BMp3+n0YiUiL73hRFfowfW3gHcmExkqWke0YXHmhJ83Cizj8F1lhW3v0B
 w6xAZXdxqHIE7e4XDHttYE2CN+hUmdDfy/ehJpII7w9sZgUIZvED/DdtO1YBC35ZzyXO
 ZI8O/VLpbxSOl+NIpqIlawvnvhl7T5FOSluYciBUZWi7YyDSL3Qc2nwlKMGTMGI9dUOl
 UQBIL0TEzrtM05cVYU1ezd63BjD5F13ENkuSvQG9gPdEdqzpuVNrpSnS2OrasH9VzRy+
 3npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k92gWNXNgV5DumYVJS7nK0761yTmT4j7D6M8pOBprQI=;
 b=cdkSwcuvnna25WZOYtgzRHEXVXkx4V6B9rGvKYlA5glEMC29XV9o5zm6IM+ZbucDTI
 F5AJF0LzlNXYK6/7CEZmz1UnfrRD2kalMOy23nudgO1oBHzdlrOHkqPjyrvAJGifQ0nT
 aZ8Qxp6sDajxVaUzYAdGp7Gcl4HEY5pWkIOZQVYf6vs+yvm9+sCAQ27w+L/O0VOMxRHV
 cqjtq05KrkzahWMNpav+caZ5yWJOwk9eY8+ohZM/HBzw50uuxD7cE8sdCailKGc0DX2r
 g6cYkw+n35wNTZdhqrFr385kTy6g983osoq8nF5+KgjG5m7HZ9WrMzZFcO45RhWcsBzL
 Ak1g==
X-Gm-Message-State: AOAM530uHgrTgPzMtYOOvdHKOPwFghfVj/200lMKUG2sOlO2p4AQ5ewj
 T13wgv47Po86Olse6zu41RtOCNfsVrY=
X-Google-Smtp-Source: ABdhPJy7JMlxKHXMB6A4FJ78V+yz4nAQ9kAQRPSyFgEREVU8MEh8N3amWkAGEIe5uaevq+qSHpL7+g==
X-Received: by 2002:a5d:64c6:: with SMTP id f6mr3856647wri.702.1641931963796; 
 Tue, 11 Jan 2022 12:12:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id u14sm9811115wrf.39.2022.01.11.12.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 12:12:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:11:29 +0100
Message-Id: <20220111201129.2568175-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libglvnd: needs dynamic library
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libglvnd needs dynamic library since the addition of the package in
commit 0378e2e5d9ce9d5676975dfbff501360094fdc1a:

/libglvnd_pthread.a.p/glvnd_pthread.c.o -c ../src/util/glvnd_pthread.c
../src/util/glvnd_pthread.c:33:10: fatal error: dlfcn.h: No such file or directory
   33 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c5e92f0b355c91cdcebe0070499889473996f337

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglvnd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
index acf6247e94..2d99be8632 100644
--- a/package/libglvnd/Config.in
+++ b/package/libglvnd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGLVND
 	bool "libglvnd"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	help
 	  The GL Vendor-Neutral Dispatch library
 
@@ -42,3 +43,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "libglvnd" if BR2_PACKAGE_LIBGLVND_DISPATCH_GLES
 
 endif
+
+comment "libglvnd needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
