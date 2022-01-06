Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6D4C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5162E81911;
	Thu,  6 Jan 2022 22:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HpUIIlKOOn47; Thu,  6 Jan 2022 22:31:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04DC8144B;
	Thu,  6 Jan 2022 22:31:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1B0E1BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B17C640108
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKdpf02cvqIf for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:31:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2E704297F
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:31:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 v10-20020a05600c214a00b00345e59928eeso4459484wml.0
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 14:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9HqTYLXWTklgnJeY0ZcT0I40Or5EKSoSV98+h050AqQ=;
 b=lmkLOnh1AezCiG3RhD7997+wiBZhLtkvZZmcvIudEqiBU4pRCzMYrZD7uVBW8Z0Pqj
 Por4HTvsZhZck9OXYAJOMhrdh+fToa8UbGcLNgqtOYJB5LywitmO+L9a7CglmP3yc/oe
 tyiOgCIo+f+NFxQih0eu4OiN7Ihj6optQGIr9IfDV8udOJz0fxbaG4RcyMmbB6nsRxw+
 4JlNkdV/guTCB19xedovVI4UoyVW/FRVLcSIfg5iraZWtR+ZBQUrAGBm/CqGQVC2YThA
 Ho/VD7HvI/FTL9r84l1KEh6u5AnnxwknQ5gKcpz4kjogOVTmSxRtXsp9D7BESNEfe9C6
 Vpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9HqTYLXWTklgnJeY0ZcT0I40Or5EKSoSV98+h050AqQ=;
 b=Jh3elD2HyUp6YELNVXa1N3fqhublszR/A5cmJ2ZDV9Rhhw4gO9qoxV+GgNmDPv0HPQ
 OOER0bVpaeE7fvhNP61piMybxE5BM4uE1t9OlPYbenF9nGlxK5p2WL/TgLfugSAI5DVF
 orkw7RiRvvg3AU7qv/71QZb2PK0UvGVba8oR1If0xYVk7gd6FLdhhPuEK/gzP26U2z8G
 +XQ1gIjzMKHEH6lYkq/NP3BI24e906FbC/adhG2BzhsXCF+OogI4ayb+QEz7J/AXgFoS
 lSV3KtUmzNgP/bEz0drTYuQXrZ6d0ca2rcLpRN6H5qZyGyky7p5hzImk6onxzmLt6Mpq
 ukLw==
X-Gm-Message-State: AOAM533xo/KUOO7jtBaGejDFqL8fEob8g4F9iZFobtmOc4QmhDCS4Mhs
 Gc8UalFbFm3Z9zaQKnnDyrB0+OW0tuA=
X-Google-Smtp-Source: ABdhPJzfoB5pQAhvzsh/ZL7s5ZM3yjqYPZ2xdeGbbo91imQZoNa0BZo5UZZ0wko5lCV191K7j16z3A==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr8789738wmk.11.1641508301820; 
 Thu, 06 Jan 2022 14:31:41 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id f6sm3092948wri.115.2022.01.06.14.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:31:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 23:30:39 +0100
Message-Id: <20220106223039.1065153-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jitterentropy-library: needs threads
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 3.3.1 in
commit 3965f09cb427af411055a783cd14b501b2b28285 and
https://github.com/smuellerDD/jitterentropy-library/commit/1e94512db65450ffd950e04fac61408b5efb7e2d

In file included from ./jitterentropy.h:98,
                 from src/jitterentropy-gcd.c:22:
./jitterentropy-base-user.h:74:10: fatal error: pthread.h: No such file or directory
   74 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7b01eca8f1442318dd35282605fc8815e6afb0d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jitterentropy-library/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/jitterentropy-library/Config.in b/package/jitterentropy-library/Config.in
index 02f8ff6164..f9ae1bac5a 100644
--- a/package/jitterentropy-library/Config.in
+++ b/package/jitterentropy-library/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_JITTERENTROPY_LIBRARY
 	bool "libjitterentropy"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Hardware RNG based on CPU timing jitter.
 
 	  https://github.com/smuellerDD/jitterentropy-library
+
+comment "libjitterentropy needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
