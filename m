Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550FCC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:09:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB6961075
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FB6961075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCFF360814;
	Mon,  8 Nov 2021 16:09:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4FXRs9Kzd1oF; Mon,  8 Nov 2021 16:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51E456066D;
	Mon,  8 Nov 2021 16:09:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 709E51BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 132BB80E9D
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W0la5DsM18t4 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0932580E9F
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 510558B6B9; Mon,  8 Nov 2021 16:03:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 17:01:15 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 4485878980f4a4e6f0ab40718fd303acdb2d791c
X-Git-Newrev: 8e01b969823dae6d975f5ab35d88039cecad31ce
X-Patchwork-Hint: ignore
Message-Id: <20211108160318.510558B6B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/netdata: add
 libcap optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e01b969823dae6d975f5ab35d88039cecad31ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

libcap is an optional dependency which is enabled by default since the
addition of the package in commit
1d2bb469078b5818aa2390b9868cd632200f17a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 33160aeeb4c77fb7678545f07766d8a831beaea6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netdata/netdata.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 1c20c49dee..d66a9602e2 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -33,6 +33,13 @@ else
 NETDATA_CONF_OPTS += --disable-jsonc
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+NETDATA_CONF_OPTS += --with-libcap
+NETDATA_DEPENDENCIES += libcap
+else
+NETDATA_CONF_OPTS += --without-libcap
+endif
+
 ifeq ($(BR2_PACKAGE_NFACCT),y)
 NETDATA_CONF_OPTS += --enable-plugin-nfacct
 NETDATA_DEPENDENCIES += nfacct
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
