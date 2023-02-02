Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C378C05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 15:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD67841CB3;
	Thu,  2 Feb 2023 15:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD67841CB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XObGzqe8FDxy; Thu,  2 Feb 2023 15:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFFEC41BE8;
	Thu,  2 Feb 2023 15:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFFEC41BE8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 727D61BF405
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 15:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C62140C93
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 15:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C62140C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzSkrMLaV-zU for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 15:42:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA2D640120
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA2D640120
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 15:42:44 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NbjUpSrPB75JfNbjVpfspy; Thu, 02 Feb 2023 16:42:41 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 16:42:39 +0100
Message-Id: <20230202154239.325711-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202154239.325711-1-giulio.benetti@benettiengineering.com>
References: <20230202154239.325711-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDFUlPgWRi24nOlHc3zg9LtExhA1hQDQOKnZXbOr7Xvp4jXQTwJ4GfqYRsJl/CJfk+z3FBj1V5zcUJAlAhEALIqIA69nBDJWsLpwNH7HD7marjI5eoMr
 qbFu3LiEs2WcwfmiyonTg4sb2fdlXpKPFBZGzR+179WqFB957F2OPeiVAt4a9wjJA7s55vy/X0HVdS4hxoZ5XWEpHbgLu7+5cE9fClQ1ddOdQoCojSnk0McI
 7mXdVy2dbEcQDQloac3wl1ixgSxHiVOdpyhgEVI2hZV99EBV7vkzOq+BTcmoaxj6m6dBBC1ZGkP59gkIZ0PVLggWrCAOM+uDxot3kZypJbwmIWE4UBa2oIH6
 z3CZh3kqVywgZHtWKBk5uHJ2VrtyY2dzzma8u9H1VSUzXV6dRVvMHKsTSZ1IHKb6e70XldZmdGREPWxwTEPcms6O/i7WGg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675352561; bh=TyBOoR/PS17oY299vmyWim+bpocN030dufpfIxYd4jE=;
 h=From:To:Subject:Date:MIME-Version;
 b=LXIT4Vsg1ca8vuLxa9B5/GhfDRqcZcxkdrx7W5zZU15ksdXMSDbTVEBasyPGYqPn2
 vmSUYhFD2yyvSsGG5Ggj2CZtnYfsH3Y4Nq9arXHVwXllGEWthMDjCieVyCjN0zWr5t
 lZMMm9eeZMIT4OOMDNvTMNz943SGnPJSNkY9sxNVXosu3pUP7AI6YFvcF+1NBJlcN1
 o2zJF6Pvvok+CEbu07impdpPCN+8msc6Uuet6iYY8IYU22gw0RfBnPweAgylXqaBLU
 yXJMgDApEj+FIIIcYQX6vOs9Gn5RDNo//x7aGDoLLy3OjEo7XyMVDL8acABWkrxXyx
 UHJYbdzQm9maQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LXIT4Vsg
Subject: [Buildroot] [PATCH 2/2] package/postgresql: work around gcc bug
 43744
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
 Maxim Kochetkov <fido_max@inbox.ru>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package postgresql suffers from gcc bug 43744 other than 85180, so let's
work around disabling compiler optimization for this gcc bug too.

Fixes:
http://autobuild.buildroot.net/results/cf272cdc5be2faf4070de3d235ec7a0f7190867a

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 5313e03b12..2ffcac6595 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -101,7 +101,7 @@ endif
 
 POSTGRESQL_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_43744)$(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),)
 POSTGRESQL_CFLAGS += -O0
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
