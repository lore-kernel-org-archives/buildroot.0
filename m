Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE9FC369C2
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 22:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C3881183;
	Wed, 16 Apr 2025 22:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwpvyzuMsAmK; Wed, 16 Apr 2025 22:02:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FB3B81218
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FB3B81218;
	Wed, 16 Apr 2025 22:02:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D1A6159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 22:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EFDC403DF
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 22:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_f4RgYfMEOo for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 22:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D86454086F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D86454086F
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D86454086F
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 22:02:09 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 5ApbumBZVvoVF5ApbupSHw; Thu, 17 Apr 2025 00:02:07 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 17 Apr 2025 00:02:06 +0200
Message-Id: <20250416220206.3284271-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMi3kv6atC9RfsWCAp8tOkkU3q2dVUdX37DkY1F5nzsk/YI3Qs9xmRB3Sht57YYAxCHNggiMQJ0hyMufu6Rc45km+TuxoLXHg2i40syqWrBgfNSSZ15O
 bCNxUBoVaT3tHGAHckYzNyG7GqPZardXDgTu/4mJlpACpIvGeHXBTnK3sm1iv0y8av6bTTHkZL9AdQ0Ng3YA68zjuwkBQGELzPaQx0fIRG3NwDtLfQ9qsEoH
 ZLnDEqxtYDB2Lp+kFqbne5yn4fdjCiIr5/2xaTctRdw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1744840927; bh=qHJm8+Lh+e1KBlh33rQojAxcXRbwWRZXJAX/ga2O/5U=;
 h=From:To:Subject:Date:MIME-Version;
 b=XijZCE3xp8IO1uCAUjyrPfk+7CRUroaY8P59jKjwOGkrCiA0yQhPY/lBHUS3ZjkZE
 lsw5ZZTfeWdxOP3Qhbx6O9xKES5i9CR61fn6f+bY99tGDKvxVeEQootLSmtzmkVchG
 xpY6wJB97hfKLNvoY7iMauRxRh0D7MdicRV089NrtcLOtGjcbF+nKL2WCagyTXZbXm
 X1/MkeaUJTWdeOMWajU7gMYUCVz6n/Ou3oKDXGKLTM5DNteid3Fh1mqGfEOTRmWQkM
 geelF0/3LdBQv2z0fNoe2+vHjdQ08ONmt97XIM04pqINhSHYfcmoaTtYaAn5CXbp8O
 8Jwja8faQvM3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=XijZCE3x
Subject: [Buildroot] [PATCH] package/swupdate: fix build due to lack of
 limits.h header
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

Add local patch committed upstream that add missing #include <limits.h>

Fixes:
https://autobuild.buildroot.org/results/a779bf2429782da501b80a74c1a2eeb25ad24044

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...001-lua-add-limits.h-to-set-PATH_MAX.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch

diff --git a/package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch b/package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch
new file mode 100644
index 0000000000..489565b332
--- /dev/null
+++ b/package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch
@@ -0,0 +1,30 @@
+From 3de6491463f4b1ddf2e792771831acfb705e246d Mon Sep 17 00:00:00 2001
+From: Stefano Babic <stefano.babic@swupdate.org>
+Date: Tue, 11 Feb 2025 09:08:15 +0100
+Subject: [PATCH] lua: add limits.h to set PATH_MAX
+
+This fixes github action (debian slim), with other builds the file is
+automatically included.
+
+Upstream: https://github.com/sbabic/swupdate/commit/3de6491463f4b1ddf2e792771831acfb705e246d
+Signed-off-by: Stefano Babic <stefano.babic@swupdate.org>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ corelib/lua_interface.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/corelib/lua_interface.c b/corelib/lua_interface.c
+index 02d48259..ffe62d88 100644
+--- a/corelib/lua_interface.c
++++ b/corelib/lua_interface.c
+@@ -16,6 +16,7 @@
+ #include <sys/sysmacros.h>
+ #endif
+ #include <sys/types.h>
++#include <limits.h>
+ 
+ #include "lua.h"
+ #include "lauxlib.h"
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
