Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D01C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 17:34:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BB5A61104
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 17:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BB5A61104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D4382A7F;
	Thu,  5 Aug 2021 17:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1Nd539H8w2e; Thu,  5 Aug 2021 17:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A070D82B94;
	Thu,  5 Aug 2021 17:34:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21BB91BF3D7
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 17:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11C36402A8
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 17:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYMVWRZEhDxp for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 17:34:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20DAF401F0
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 17:34:43 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BhGSmetShp6qUBhGSmlnVA; Thu, 05 Aug 2021 19:34:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628184881; bh=oA45KpV3F3mArxVcD62uBIyf8ekq1FjJ14/0AmCH/DQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=KMv7udR2GxAbqgZ0cwD6NJ+c8DejNN73OZAOsWUa3+Y//jpHpLwbUpH1H/7lUGXOa
 DUZaJys2OZEGojILLtFAgo8yf2uZNBVhnKGKJqMo3KyGhdP8cs/mqjaup97Zvs+4oE
 JTgkyC4hat7RqOBffd5E9ZsdPxFYvaJvdOU7k5a1Y/O1QLqo5MsPLINJeOU92msyG1
 8zOejFTaodjUJr2ENTciNgv+mGtvHRwvaHmByCzBUL7uni7iSBd31Dzi4Y8PBVUWXg
 D5/NZ97hYqMidcwTjIiKN+43yI7RzyeEI8mOptpBtvBCmFVrrsfqi3GH6W8Td0iUgl
 IxzlNVSw0+YbQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 19:34:39 +0200
Message-Id: <20210805173439.4172080-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHY9we/pwGIWQYi07OI24jTc0vKQ+bXnV9p5mwUTY3D4nx7Re63tqPiNzDms/zWbGAEx45qUB+r61ZfdvahbHlV0FMWAZSMVE0xfti1wIlEzHZNUfvDv
 w7h2QvMEtGeMI4zG/H+z3dE/xdTfCx1KOCHe8mpwCgJbTAH1XP3RT43RzRpw6AzkXat1ChpB1xbguq+S2zRtkkv7Hfar9HURTxJ9lYKk+LJwrF1bxd0cH61A
 7Qcf0Z21NbyFJxTcMlkKegEfngpdKAuWFiA+Gqe/wbA=
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to libfuse3
 package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add myself as libfuse3 package maintainer.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1547ff123b..bb39abefab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1052,6 +1052,7 @@ F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	package/at/
+F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
 F:	package/minicom/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
