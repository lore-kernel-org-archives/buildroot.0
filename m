Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB99C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:09:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8335D61075
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8335D61075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6315E80E71;
	Mon,  8 Nov 2021 16:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90qa--yuW2x5; Mon,  8 Nov 2021 16:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEBAF80E9F;
	Mon,  8 Nov 2021 16:09:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4F31BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C1CE60814
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9qJJDAF_VCO6 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07C596081A
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5DA5B8B6B8; Mon,  8 Nov 2021 16:03:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 17:01:22 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8e01b969823dae6d975f5ab35d88039cecad31ce
X-Git-Newrev: 455a9fe82e8ff0449ee7b2ded87563cf4867a260
X-Patchwork-Hint: ignore
Message-Id: <20211108160318.5DA5B8B6B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/netdata: disable
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

commit: https://git.buildroot.net/buildroot/commit/?id=455a9fe82e8ff0449ee7b2ded87563cf4867a260
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
