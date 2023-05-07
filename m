Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265DCC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3A1680F57;
	Sun,  7 May 2023 21:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3A1680F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5V6HURVMV6lN; Sun,  7 May 2023 21:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 006E980ED1;
	Sun,  7 May 2023 21:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 006E980ED1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0541BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 511C980EBE
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 511C980EBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6MISnxP9NFqT for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:47:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86A7680E91
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A7680E91
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 727DE860D2; Sun,  7 May 2023 21:47:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 23:44:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7de8417e1b8f36da2b002a7adb9a633cdcc0ac4
X-Git-Newrev: 2a068781f1280f7f36d95678b3b359b1457f8dc9
X-Patchwork-Hint: ignore
Message-Id: <20230507214721.727DE860D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpm: add more disabling options
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a068781f1280f7f36d95678b3b359b1457f8dc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding a series of feature-disable configurations of options introduced
over the recent versions, but where never added.

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpm/rpm.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 08bcb85ae4..38e4ea2160 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -29,7 +29,10 @@ RPM_SELINUX_MODULES = rpm
 RPM_CONF_OPTS = \
 	--disable-python \
 	--disable-rpath \
-	--with-gnu-ld
+	--with-gnu-ld \
+	--without-fapolicyd \
+	--without-fsverity \
+	--without-imaevm
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RPM_DEPENDENCIES += acl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
