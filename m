Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55259C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 18:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F305A607A4;
	Fri, 12 Jan 2024 18:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F305A607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhKviFTwMhv8; Fri, 12 Jan 2024 18:07:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56FAC606CB;
	Fri, 12 Jan 2024 18:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56FAC606CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEA2B1BF83B
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85FCD606CB
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FCD606CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wxs3EX0xj0JD for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 18:06:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC0E16058D
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 18:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC0E16058D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 981A985FCB; Fri, 12 Jan 2024 18:06:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 18:56:51 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3f600a144e6af6a604e505697d0601be6c78d3e6
X-Git-Newrev: 0204ecf5b15a318bde9e8ab3dd5a92563492a39f
X-Patchwork-Hint: ignore
Message-Id: <20240112180658.981A985FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/postgis: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=0204ecf5b15a318bde9e8ab3dd5a92563492a39f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
index 4148180adf..8d0eedddf1 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -11,8 +11,6 @@ POSTGIS_MAKE = $(MAKE1)
 POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-2-Clause, MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0
 POSTGIS_LICENSE_FILES = LICENSE.TXT
 POSTGIS_CPE_ID_VENDOR = postgis
-# configure.ac is patched so need to run autoreconf
-POSTGIS_AUTORECONF = YES
 
 POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
