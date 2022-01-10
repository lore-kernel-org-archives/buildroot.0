Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C18C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 17:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 173BA4061C;
	Mon, 10 Jan 2022 17:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2Xx83M9775V; Mon, 10 Jan 2022 17:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 463AB405C8;
	Mon, 10 Jan 2022 17:37:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7E8D1BF355
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 17:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBD624060D
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 17:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DAK8zUYgfBb for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 17:37:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6E6E40018
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 17:37:13 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so328801wmf.3
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 09:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XjEYjHPyxY7GP2YeSV/S9S5RQ0sI8cRs2aOpFkU7C+M=;
 b=IvxdzrJwcb42Y0iwejLFHqoBnbVpWpSatFaleLUgtnMaFFVoCZuhut6JlvT6JqHeSW
 yyTG+Breogb16OSEBvcM2waNwo95CpmGqBYa3HDitm/w7apC7lnICe6zKYnDWdQ/jdew
 ss3n/AGl/V7C+3qAvztsXVRWH0O/Ax/XedWoTz4kQ4HR9jF06iV+pjAdIOqwu2AtjOiS
 2N8vCtVEVoqF/1RNiY/niKXEztGbY4WQ85bzM6seQz7Ow6YNlDYo0enag5+h06UHO45L
 erPRhMhzCHSGXC49JL1zD5uPcHwr3GyJHF4WlB1kdVNwR7ib6xk/NWKHOsW394AeZAGC
 aJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XjEYjHPyxY7GP2YeSV/S9S5RQ0sI8cRs2aOpFkU7C+M=;
 b=tIrKJbaql6DEH6cfPnQqbk0MS79kFtWS9il2xcSxK/TivgDj6ugNykYw7rO+0GC1cq
 WrNkFTApl3Pb41S6mCQ+lkmmqugxlknaD5eTanZO0naAFtj2nST9eORvWNqJO7iNCKtQ
 Nq9kuh1/BnuqtRhA2IrC2qYw3Ypjcxs0zhU3UFQ2b1vcX083ichoFb2uu3ebgm0NEpzs
 +q0AAVtyA5UP3nwm16DlNb/HbeIE0B+K9X14mylAfWE3AHVMartS+K8vYE0IzBaXnnvF
 UyuK/4TzdeFzo6ORpXeSZijKG7ptnn0vBg8Bnpf8RQDMCLWOdU+GQsJZzyD58YRR/qlp
 w8VA==
X-Gm-Message-State: AOAM533VFs9/Qmxj8+1sYacg4VmewmrBZRhvqt5bffskfKf/FJS4xdFL
 ZOl6Tp4ETa5yb280b2hR53suSbDtKAs=
X-Google-Smtp-Source: ABdhPJyRY7P3/sjc3oAANW1SRYmGjn6/9/gTtaoukfKlaNdSi/8iClmHeYOX3f1FQoXX3TAP+o+7Vg==
X-Received: by 2002:a05:600c:2904:: with SMTP id
 i4mr23086451wmd.61.1641836231710; 
 Mon, 10 Jan 2022 09:37:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id a8sm2849590wrx.57.2022.01.10.09.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:37:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 18:35:42 +0100
Message-Id: <20220110173542.1748804-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: needs wchar
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
Cc: Julian Scheel <julian@jusst.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
bf4cf9de833e2d571d98d1ca935ea08a3468e463:

In file included from seckey.h:11,
                 from 3way.h:10,
                 from 3way.cpp:5:
misc.h:1528:6: error: 'wstring' in namespace 'std' does not name a type
 1528 | std::wstring StringWiden(const char *str, bool throwOnError = true);
      |      ^~~~~~~
In file included from seckey.h:11,
                 from 3way.h:10,
                 from 3way.cpp:5:
misc.h:14:1: note: 'std::wstring' is defined in header '<string>'; did you forget to '#include <string>'?
   13 | #include "smartptr.h"
  +++ |+#include <string>
   14 | #include "stdcpp.h"

Fixes:
 - http://autobuild.buildroot.org/results/174fe03da7a40dd152703de93af6a213d9cac698

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptopp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cryptopp/Config.in b/package/cryptopp/Config.in
index 4ead5339ab..feb945db2f 100644
--- a/package/cryptopp/Config.in
+++ b/package/cryptopp/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_CRYPTOPP
 	bool "cryptopp"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
 	help
 	  A free C++ class library of cryptographic schemes
 
-comment "cryptopp needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "cryptopp needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
