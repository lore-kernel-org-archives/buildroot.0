Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6077BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:26:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AAC46023B
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AAC46023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF2B16F925;
	Fri,  5 Nov 2021 16:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-olauqRsnMt; Fri,  5 Nov 2021 16:26:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6449761739;
	Fri,  5 Nov 2021 16:26:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF151BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 366C582730
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRjj3QQUlOQ7 for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:25:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C9818274F
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:25:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A6A188AF44; Fri,  5 Nov 2021 16:22:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:23:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33160aeeb4c77fb7678545f07766d8a831beaea6
X-Git-Newrev: ab721dc46028fdb2214a37592d5e8d1820ccf40d
X-Patchwork-Hint: ignore
Message-Id: <20211105162201.A6A188AF44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netdata: disable unit tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab721dc46028fdb2214a37592d5e8d1820ccf40d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable unit tests which are enabled by default if cmocka is found since
the addition of the package in commit
1d2bb469078b5818aa2390b9868cd632200f17a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
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
