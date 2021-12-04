Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B128C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 10:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AF4F403E8;
	Sat,  4 Dec 2021 10:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5RR0N149-pcH; Sat,  4 Dec 2021 10:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BF4A4017E;
	Sat,  4 Dec 2021 10:26:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86B351BF5DA
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E68181CA5
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ulN-n9wYZv7 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 10:23:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4075F81C71
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 10:23:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3AC8A8B7EE; Sat,  4 Dec 2021 10:19:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 11:15:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d2888c7c0e5afa30789325700d1c2ab51c5c6ab
X-Git-Newrev: 349159c43932c68430e82e5de7680f70dc6e8f5a
X-Patchwork-Hint: ignore
Message-Id: <20211204101906.3AC8A8B7EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netdata: add NETDATA_CPE_ID_VENDOR
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=349159c43932c68430e82e5de7680f70dc6e8f5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:netdata:netdata is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetdata%3Anetdata

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/netdata/netdata.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 34365cbf56..b20d5ea37b 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -8,6 +8,7 @@ NETDATA_VERSION = 1.21.1
 NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
 NETDATA_LICENSE = GPL-3.0+
 NETDATA_LICENSE_FILES = LICENSE
+NETDATA_CPE_ID_VENDOR = netdata
 # netdata's source code is released without a generated configure script
 NETDATA_AUTORECONF = YES
 NETDATA_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
