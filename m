Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DA9C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 20:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2D7A4011F;
	Thu,  8 Jun 2023 20:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D7A4011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MutZX6VdhdKz; Thu,  8 Jun 2023 20:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DC2441563;
	Thu,  8 Jun 2023 20:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DC2441563
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12CDC1BF97E
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0AA061209
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0AA061209
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkJeH7PnhTmY for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7869611B9
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7869611B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B45508219B; Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Jun 2023 22:37:36 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5288721e8d059bc46ee9a87dfcdc710f47a2bc71
X-Git-Newrev: 999e55cea232603157c2ee39fa36bc39a50283e4
X-Patchwork-Hint: ignore
Message-Id: <20230608204543.B45508219B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/rpm: add more
 disabling options
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

commit: https://git.buildroot.net/buildroot/commit/?id=999e55cea232603157c2ee39fa36bc39a50283e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Adding a series of feature-disable configurations of options introduced
over the recent versions, but where never added.

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2a068781f1280f7f36d95678b3b359b1457f8dc9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
