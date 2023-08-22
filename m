Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DD9EE4996
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 04:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD81861145;
	Tue, 22 Aug 2023 04:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD81861145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6WsgD6w6uwP; Tue, 22 Aug 2023 04:51:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31B7D610F0;
	Tue, 22 Aug 2023 04:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31B7D610F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7EB61BF2A3
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 04:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87FEE81BA8
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 04:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87FEE81BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3jY_UsgJEvq for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 04:51:13 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B4FE81B70
 for <buildroot@busybox.net>; Tue, 22 Aug 2023 04:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B4FE81B70
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 7F1D64403AE;
 Tue, 22 Aug 2023 07:50:31 +0300 (IDT)
To: buildroot@busybox.net
Date: Tue, 22 Aug 2023 07:50:44 +0300
Message-Id: <311629eb6d15475f7a1497dc10b1e3b6c84051b8.1692679844.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1692679831;
 bh=2imHf77O533HP1Y68/4Vbqn22Z6KsfVHFcCs5Pmm+sc=;
 h=From:To:Cc:Subject:Date:From;
 b=Q+7oc00i1qkQdyYbtS+zbvN5XzFtoisb1aOM017Mi3VJ0cEj1l5CgnT4+2+/Wjvr+
 84yuHnTw/cHaeFQTTcp2YhjJhO+nz+QqiMLZ1pHLSm3QjSdLbDMXb1LdhCL8+ANeiB
 na93ZeUxW8Mz1zrkriTlogKCbnEOqsHUbJDaVoITIE9rqTOXltZu40g3Tuwd/cHXxK
 NUjmN0c86m+PTvsU14lPi8KwTrQJaolNTuvo3LyZZk7m1GjZImCYjZnE9ASSEawT4x
 MNSvdUJZIv3gpuh243Z7fRMB4/7qKpmHZvBdpoRx2qdI4KFlxeCdwHc94q0nAKoFy5
 SyXYDj54749KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=Q+7oc00i
Subject: [Buildroot] [PATCH next] package/libassuan: remove stale hash
 comment
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 0e19425c774fd ("package/libassuan: bump to version 2.5.6") moved
the sha256 hash below a link that provides the hash directly. The key
check comment now appears to refer to license hashes, which does not
make sense.

Remove the redundant key check comment.

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libassuan/libassuan.hash | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 89e3fea956f9..084a09848c3c 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,8 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
 sha1  b1e8754dbf89b3a3eb175f5df75048dbca1fce57  libassuan-2.5.6.tar.bz2
 sha256  e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426  libassuan-2.5.6.tar.bz2
-# Locally calculated after checking signature
-# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.6.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
+# Locally calculated
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
