Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32459C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 18:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C81F5606CB;
	Fri, 12 Jan 2024 18:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C81F5606CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DA9qOhQB8YyP; Fri, 12 Jan 2024 18:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DB7860644;
	Fri, 12 Jan 2024 18:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DB7860644
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28F091BF309
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 017966060A
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 017966060A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZW6xsDh81rf for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 18:03:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36C086058D
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 18:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36C086058D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22C3985FB0; Fri, 12 Jan 2024 18:03:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 18:55:43 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 99ef2d04576843e95535593bbe1c285109a3c0e3
X-Git-Newrev: 29b6749994f4a576cd37748b05b3e3bc71d2d223
X-Patchwork-Hint: ignore
Message-Id: <20240112180317.22C3985FB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/postgis: drop
 autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=29b6749994f4a576cd37748b05b3e3bc71d2d223
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit 1718c2ba6a4db1461b2490aa42ca4f0a2112adae removed all patches but
forgot to drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e39b53dd03c1adf53e5bc204b22382a063b501ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgis/postgis.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 2fb98245a3..bb3955ec54 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -11,8 +11,6 @@ POSTGIS_MAKE = $(MAKE1)
 POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-3-Clause (xsl), GPL-2.0+ or LGPL-3.0+ (SFCGAL), MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0
 POSTGIS_LICENSE_FILES = LICENSE.TXT
 POSTGIS_CPE_ID_VENDOR = postgis
-# configure.ac is patched so need to run autoreconf
-POSTGIS_AUTORECONF = YES
 
 POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
