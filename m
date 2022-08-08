Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C826C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ECA841505;
	Mon,  8 Aug 2022 15:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ECA841505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kw2SHHYV1d_M; Mon,  8 Aug 2022 15:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB9B74099B;
	Mon,  8 Aug 2022 15:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB9B74099B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF4911BF2FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B83E14059B
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B83E14059B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeWYrcLtp09h for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:06:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 100D340222
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 100D340222
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:06:49 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1M91Tq-1oIKWH09va-006ACA; Mon, 08 Aug 2022 17:06:47 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 17:06:40 +0200
Message-Id: <20220808150641.19475-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:I9Zb4dNw00tyLTkCO+9WODiVbR3szOxXa68Cye6syXYm2NUlTdR
 bnGNOOi+BzyPfvBLYhAqI5D9ZJop7+DY8ydsJy4rru+NnZdIpJtYXl0C1O31iqIUBtHLwio
 JRVQONMiHUUSz4otcbL3IYCNEQSGRmCvYCf24daaVD5AOsaxlEwBJNKgnOvfeLuAPmwEpKW
 lY/XLc3wDvw3Y6KKXX5Fg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rnxQHUyxoo4=:Af8sWNTlOKwtzDyotXYU0C
 cbMTlr/52YMdMZRhzEg9OaZexvHvzDgK519cOtkL8q9KfokyiDQBVh9dKDDnxmcmqFjdPdDN2
 0ucwogrKD2csy31D2zhzwrq/mkgZBudwyihqrq9TsZxhyfg08mOm9yA5zZqbaU3oevtvMChhY
 Ye8TTphEw79UQKEu4x52jT4PbPr2Xd1wmNB7xWAB64tbh3WW8X+s3KmMFFbaWHtfZdJP9zyO/
 RlUGlwH0nn0IM49qp9JgAML+nJF0eD0e99X28Apxm4Gb6b5FUIDhp2NAlqQDfqFdY3r3hzLI7
 Rh8FWJ/7aDgwx2E2JnfWAP8X/MiAulGBCm6K415BSEXrpIo+0Rp7BK5wnMatOzIq/iuuiMIAh
 zxJ/oESv3oEdOPimA8wRig+gVpG4U2+XCl7HfrdsGORYQ+AO6gF0z5j0xtl8V5DNMuXDqnIin
 fXBmmafZJZkB7DQTKgY8yA0OsSg3HZWghYfRdjYuQ1oa92nE4WViexg6Jj/Cl+QifQmkOWzoJ
 DGdzarNegAlF1R8JbipIujguGfeFWUpqCxyVv6ycqA1ghOZZE/kNK/Hc4nvIhyms6B8ya+0WW
 eD41B3keJ48BH7NkFU1cy7iZgB7EFiX3dJsMUGvNIKXzkVfob5kgUL7zkORZAZ8VXD3ri6Yrr
 kN1rKKhN1dubN+iKFlv7apHb9DevDSQdRFAv3IWMZN59fjZ6s16n1XoYc7CGE+e2KdhTj2ERT
 b5VZrc6XdrW+xNDNJClad7Da8HBzjrhm5vVP84qbjXWbxv1HW+NQGxvTXO21C48YSdwQWOfAM
 7AlLDNx
Subject: [Buildroot] [PATCH 1/2] package/libgit2: depends on native 64bit
 atomics
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

libgit2 does not know about libatomic_ops.

This wasn't a problem before because it is a shared library, so the
missing symbols were simply added as undefined, and no project currently
depend on libgit2 to expose the problem.

The next version of libgit2 can also build a binary, which will expose
the problem.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgit2/Config.in b/package/libgit2/Config.in
index a6a9728ff0..9c97676c4a 100644
--- a/package/libgit2/Config.in
+++ b/package/libgit2/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBGIT2
 	bool "libgit2"
 	depends on !BR2_STATIC_LIBS # libhttpparser
+	depends on BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_LIBHTTPPARSER
 	select BR2_PACKAGE_ZLIB
 	help
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
