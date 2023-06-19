Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D140AEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 17:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4708B6122A;
	Mon, 19 Jun 2023 17:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4708B6122A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEPY3CvsY0kH; Mon, 19 Jun 2023 17:04:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D7A60E1B;
	Mon, 19 Jun 2023 17:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D7A60E1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8871BF34D
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 17:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5842681886
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 17:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5842681886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHqpnhWC0um6 for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 17:04:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6127781852
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6127781852
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 17:04:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0936FA4C06CF
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:04:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37900)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qBIIy-0003if-0e
 for buildroot@buildroot.org; Mon, 19 Jun 2023 19:04:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 19:04:40 +0200
Message-Id: <20230619170440.727597-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687194288;
 bh=QQYPEgWF+NjGr4/+FDF4cHcEg7NSJVJeCpzH5herm3Q=;
 h=From:To:Subject:Date:From;
 b=ZNY/Rj8nskLcXvjhP/LzKpxLUkmBWBr8sGwyRjCxcyTUMNCmgBivq3IXB5bWTM/mg
 NsTMnxI/SGa8k5HEmZnBSF8vbGGnVniS6+OPDcjXqkhcq73b5VOkmr6cfTjOwkpuVy
 qSnlc5HxzMPfPh17CxdngoMuw8NbfWYj0BWH4NDDxM27AQW/Im0NXPDNLgCIYFPeBX
 aLf9ZD9lsKpHtffvtA9E985mC6ME5euW9yh6ADfc2WsiLvS11NLMJ0pDAqetVdYVas
 HlTH3e2NSheUUQLouMQe2lwJ8/Xds5kU4l3NQ3KYGYaaG1qTdvRQqv6L/63hKb/hmt
 6mHjvDsK0Ao4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ZNY/Rj8n
Subject: [Buildroot] [PATCH 1/1] package/ccache: fix license hash
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 1db3f0f84449843476c2887d2ea09323c66f33a4 failed to
update the license hash which is needed due to various commits in 2023
updating package versions and copyright year:
https://github.com/ccache/ccache/commits/master/LICENSE.adoc

Fixes:
http://autobuild.buildroot.net/results/41b/41b3427e30b6e44352fc78b27360fdadf9e46393/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 2b6cd65a74..736122e0ab 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
 sha256  3d3fb3f888a5b16c4fa7ee5214cca76348afd6130e8443de5f6f2424f2076a49  ccache-4.8.2.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  56cf64f68b7b8150300acd79899941615523ea5c56c120e92f5b175b7cc78e3c  LICENSE.adoc
+sha256  55ce274f2b898dad70d3695ab13f82656fd455bd8fb6d1c85d6f7c453bef0b2e  LICENSE.adoc
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
