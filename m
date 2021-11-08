Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FD7C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:12:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC946134F
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AC946134F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB891402FD;
	Mon,  8 Nov 2021 16:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OwnUNUhuNtP; Mon,  8 Nov 2021 16:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5354940307;
	Mon,  8 Nov 2021 16:11:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8EE21BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 809B9402F7
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGTVNnKlOhso for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91CD4402F8
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D79238B6F3; Mon,  8 Nov 2021 16:03:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 17:01:31 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 7487f0fc77e028e15357d90db6838c2a4ad175b4
X-Git-Newrev: 029b7a2356b75c69ca0c0627c8e8ce252908decb
X-Patchwork-Hint: ignore
Message-Id: <20211108160323.D79238B6F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/netdata: disable
 unit tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=029b7a2356b75c69ca0c0627c8e8ce252908decb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Disable unit tests which are enabled by default if cmocka is found since
the addition of the package in commit
1d2bb469078b5818aa2390b9868cd632200f17a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ab721dc46028fdb2214a37592d5e8d1820ccf40d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netdata/netdata.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index d66a9602e2..34365cbf56 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -10,7 +10,9 @@ NETDATA_LICENSE = GPL-3.0+
 NETDATA_LICENSE_FILES = LICENSE
 # netdata's source code is released without a generated configure script
 NETDATA_AUTORECONF = YES
-NETDATA_CONF_OPTS = --disable-dbengine
+NETDATA_CONF_OPTS = \
+	--disable-dbengine \
+	--disable-unit-tests
 NETDATA_DEPENDENCIES = libuv util-linux zlib
 
 ifeq ($(BR2_GCC_ENABLE_LTO),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
