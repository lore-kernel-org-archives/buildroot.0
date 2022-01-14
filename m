Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B4FC4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 10:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F02BC40A93;
	Fri, 14 Jan 2022 10:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJsz3DA0mHHI; Fri, 14 Jan 2022 10:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2B3B404EC;
	Fri, 14 Jan 2022 10:55:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC5831C115D
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 10:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C92E483EDF
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 10:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcPj2pFRT56E for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 10:55:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id DACDC83ED7
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 10:55:18 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8KEinfkKIBBmw8KEln4i9g; Fri, 14 Jan 2022 11:55:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642157717; bh=7TlIdSlawAcT5lIi4iv9G35qu0UxquoYZ7ndYQjtI6U=;
 h=From:To:Subject:Date:MIME-Version;
 b=J3dBruxw88YZKBa1qwOk4LeSkWjcvn6yT4vpkIR1B8jP74/NwquWrTE5otCfEraB6
 4wrY3aU33LbrtyiyQfJHG3xNuwKq6WcdODwMQiuab8WhYmVbZs1nDbi6h+Tv+PBtAs
 3OEwHb7xad8WAdblkeBp+XYdm2UeYuORNihR9QVyqqKsDb6jsBftw5eb8xj2hjbCuD
 eXyw1qyCgo2wSsg5FJW0iH+7nbQSMHH6f417pQBBGLLvaQ3YJypVKcZmQ0bunEQM93
 Pw6z7s6yrmBq84oQGVawBduif+GK3tkntR3/6QcMhN9x636QbxBSc46aXUS0l3PiqQ
 +Rfy3L20H/1mA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 11:55:11 +0100
Message-Id: <20220114105511.1010113-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114105511.1010113-1-giulio.benetti@benettiengineering.com>
References: <20220114105511.1010113-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJ1Qp+0WJMOxnIWoBlNaD8vRmBVs31TWe7hK+Oj3WRC7n3SuY6lYhju1MKDOPqFNZLz1Nuu+oSyhHzQgTJ7IdFUtK1oWFdaNXJVwLC4KC4uU8HXYhzfo
 z+Ut0iIwwogkw7PmJ0/WdtDjE1eypI7Bn8Zw7AmBVh7OMWS8XBuonbnOFpjAoI8WAFJDTaKwjUI0eCcq100qx2qqKlPuZTPin36lJMFWl9ToxS7eIhn6huWq
 MVhMsOayFJ+noF4MW9J5QnqhZVJMrr6+4XcmPxx5IXqveOMOy2NBbXnVgxgC7QWRMkHiC0694PjFR71ng/HAeXeXS91HFQZMaNkqyR+IAHpI9wRh0ySUgdId
 DcIUVA/w9JXUyoNUGGZvmCoewJ1u5BQ3Gl12WcbyIK0Osmy3q2SIkFmdRPKKu0DPrv2sFfy106LdUGZNnHVT68SumQAzDw==
Subject: [Buildroot] [PATCH 2/2] package/sg3_utils: fix build failure due to
 gcc bug 104028
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The sg3_utils package exhibits gcc bug 104028 when built for the M68K
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_104028=y like we
already do for BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y.

Fixes:
http://autobuild.buildroot.net/results/c49300d12a209b18f41d389f092324592b881277/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/sg3_utils/sg3_utils.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index e357fc1dde..b291bd69d9 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -24,6 +24,14 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 SG3_UTILS_CONF_ENV += LIBS="-latomic"
 endif
 
+SG3_UTILS_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
+SG3_UTILS_CFLAGS += -O0
+endif
+
+SG3_UTILS_CONF_ENV += CFLAGS="$(SG3_UTILS_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
 define SG3_UTILS_REMOVE_PROGS
 	for prog in \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
