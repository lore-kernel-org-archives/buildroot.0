Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B467E743C0
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 20:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B7EC61054;
	Thu, 28 Sep 2023 20:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B7EC61054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id thYULNI0iXzQ; Thu, 28 Sep 2023 20:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 666D260B44;
	Thu, 28 Sep 2023 20:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 666D260B44
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7B341BF287
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A310C409E3
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A310C409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJ5PFsQo42o6 for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 20:38:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9AE2404EC
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 20:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9AE2404EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D65F282B33; Thu, 28 Sep 2023 20:38:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 22:32:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d574e2a4f440903a0e32de6deb8275b1f385da2e
X-Git-Newrev: 9677f3a897c9c0ac125954b9a2d5d14a812bcaf4
X-Patchwork-Hint: ignore
Message-Id: <20230928203847.D65F282B33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/onevpl: disable tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=9677f3a897c9c0ac125954b9a2d5d14a812bcaf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tools are not needed at runtime, as they are mosty examples, or as
testing tools, the latter having additional dependencies.

Fixes:
http://autobuild.buildroot.net/results/059/059a8581fb809488ad6fa3183874395ebf3f0926/

This package is not part of any older buildroot release, no backport
necessary.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/onevpl/onevpl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/onevpl/onevpl.mk b/package/onevpl/onevpl.mk
index 2033f755c0..601e121a55 100644
--- a/package/onevpl/onevpl.mk
+++ b/package/onevpl/onevpl.mk
@@ -12,6 +12,7 @@ ONEVPL_INSTALL_STAGING = YES
 ONEVPL_DEPENDENCIES = host-pkgconf
 
 ONEVPL_CONF_OPTS = \
+	-DBUILD_TOOLS=OFF \
 	-DINSTALL_EXAMPLE_CODE=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
