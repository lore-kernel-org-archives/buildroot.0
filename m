Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19A8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 09:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DB40402CE;
	Mon,  4 Apr 2022 09:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Juf9JwoZUMHO; Mon,  4 Apr 2022 09:13:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02DA140265;
	Mon,  4 Apr 2022 09:13:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E177F1BF281
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 09:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA2A460D88
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 09:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yj6UHXHdYcNJ for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 09:13:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26F3760C1C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 09:13:13 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id w21so7822198pgm.7
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 02:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RpXYEwes15ZYf5Zj3nzZHeyGT8AtQLqZtbtae+c/C0s=;
 b=fi1bUuSVzrshFZB+069gOom9F66icJEXnlXl6vCL38V+u7CZN6TntcGeeXNpNut2iE
 L8a4dMl9/Ln8a9YfHJxunBJyd6TI+QiioliYXGNsXEiqvNULbEnf1dALW3v1V4ZxiDOw
 xSNBBpyLhSAAcPZsrwZwn9y1UTuKHkRnpUsBCIWee+d2UWJfq9Gz2Ef//aLtrniiGLCN
 HyYYJjS8RDeMXVoM2uD5gCR9lJv0SJvHgqSljiANSbhhpf476sGmBwEJW0IR+AHEzYgK
 4jq1Ta1uz962pvBi9wtn2WfHJxSEj5QN4ZGWom6Gv4bCgAhkh7Px/K9hCW4qsrRd/PLC
 oCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RpXYEwes15ZYf5Zj3nzZHeyGT8AtQLqZtbtae+c/C0s=;
 b=YJrlJtWP+Y755QHaub4sEzi0OIGKwotr3hDvD409axG9y3FLM3ika0crjIaeuz6BSv
 5HfW26jaJHavvC1LWe7qoYRkAMod4rSV1u/6JSBASWBEXJItU5UcHx+aHjzECMchsCRL
 AIPhRHy9fLov1HBxuygOL9x7vhVgT918PvrKeG9MhOFJqhl5W9myC7POUIDvq/nYBrZD
 F1RAu5/DroVz7PvGCEHNGJDGRMhLaSahhfmTmq9nXCbspvthVV7/ywsanwnfm3LMwTSH
 GorbmQFELb4IGyrq6RYakhB6yclh1HQF3um7qGONWbO2n0jruv1kkWscag6/D+UGdFP1
 8aWA==
X-Gm-Message-State: AOAM530FZIl63Nt6ToX8PCdSs0nJRJ7j320vASoYxBj0TBDpAyXwBwxe
 U4J6ICuEA+9FwqHWotOtMFtuVlwXu+8=
X-Google-Smtp-Source: ABdhPJwJc6E3/LNd1xmA4a55FwyJkGFzx0TNYvnBKLFVL3Mr3vAtF7bvL4mSYyn87+oZZNnLZfVBfQ==
X-Received: by 2002:a05:6a00:174f:b0:4fd:aed5:b5e4 with SMTP id
 j15-20020a056a00174f00b004fdaed5b5e4mr21728794pfc.39.1649063591809; 
 Mon, 04 Apr 2022 02:13:11 -0700 (PDT)
Received: from voyager.ibm.com (cpe-172-197-129-163.sa.foxtel.net.au.
 [172.197.129.163]) by smtp.gmail.com with ESMTPSA id
 d21-20020a056a0024d500b004fb0e7c7c3bsm12082091pfv.161.2022.04.04.02.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 02:13:11 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 18:42:56 +0930
Message-Id: <20220404091256.683581-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zlib-ng: Backport patch to fix linking
 on powerpc
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
Cc: fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 192dfc68c0e4 ("package/zlib-ng: fix build on powerpc") turned the
Power8 optimisations off to fix a build issue. Instead apply a patch
from the develop branch upstream to fix the issue.

This patch is not yet in a released version of zlib-ng.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 ...rd-for-vec_sumsu-to-prevent-undefine.patch | 27 +++++++++++++++++++
 package/zlib-ng/zlib-ng.mk                    |  6 -----
 2 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch

diff --git a/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch b/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch
new file mode 100644
index 000000000000..cc103215de3c
--- /dev/null
+++ b/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch
@@ -0,0 +1,27 @@
+From 677f56825f7080403e18e57ffe8177f3df290f20 Mon Sep 17 00:00:00 2001
+From: Nathan Moinvaziri <nathan@nathanm.com>
+Date: Sun, 23 Jan 2022 12:59:01 -0800
+Subject: [PATCH] Use static keyword for vec_sumsu to prevent undefined
+ reference error when g++ linking.
+
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ arch/power/adler32_power8.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/power/adler32_power8.c b/arch/power/adler32_power8.c
+index 029aa3a84c57..fc4086322efc 100644
+--- a/arch/power/adler32_power8.c
++++ b/arch/power/adler32_power8.c
+@@ -44,7 +44,7 @@
+ #include "adler32_p.h"
+ 
+ /* Vector across sum unsigned int (saturate).  */
+-inline vector unsigned int vec_sumsu(vector unsigned int __a, vector unsigned int __b) {
++static inline vector unsigned int vec_sumsu(vector unsigned int __a, vector unsigned int __b) {
+     __b = vec_sld(__a, __a, 8);
+     __b = vec_add(__b, __a);
+     __a = vec_sld(__b, __b, 4);
+-- 
+2.35.1
+
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 938acd4181a6..fb497b8c11d0 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -23,10 +23,4 @@ ifeq ($(BR2_arm),y)
 ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
 endif
 
-ifeq ($(BR2_powerpc_power8),y)
-ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
-else
-ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
-endif
-
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
