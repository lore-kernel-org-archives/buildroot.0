Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ED5C54E68
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 12:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19D714091F;
	Thu, 14 Mar 2024 12:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abwmu8xwe1dH; Thu, 14 Mar 2024 12:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9C7B40883
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9C7B40883;
	Thu, 14 Mar 2024 12:41:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4991BF3BD
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 12:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AC98416EB
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 12:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qT-LVubLUQq for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 12:41:23 +0000 (UTC)
X-Greylist: delayed 459 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 14 Mar 2024 12:41:22 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17400403E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17400403E5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.73;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17400403E5
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 12:41:22 +0000 (UTC)
Received: from evilbit.green-communications.fr ([85.168.41.102]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1MTAJl-1rNFtM0SCN-00UWpu; Thu, 14 Mar 2024 13:28:35 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 13:27:34 +0100
Message-ID: <20240314122748.27704-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:PuhMH/q6TrYJP5y57mU47C4ukUmR5XkDOv7pC3su7WsXcsVpwRV
 XyQlKreZYEgWWNfbymCrpCuDUI9EZ8l/UdxHmOa/DqoIGFiFS6YaCat+EN4ty2DzDIblEmO
 4H/KKARqunF7S2+bi5hl7VssnZBWT63+O+TVlbFqwPdOztFPSAGwB6WJrpetBXsOEdO+BSv
 zbiu+1GQKiJjQQfw6szAQ==
UI-OutboundReport: notjunk:1;M01:P0:OyBsn+jAbhM=;2DdYlouvVFmynbI/q2fatOEkA/2
 uBmcm+YOYcTi2IMk6dcF4IJrswkz4DCgX6N6lMRQdm8OyDO3PZkiJ5SStcrw46vpsNF1HHPu+
 qMnwsc1mXRR9xtenrtuKuAGb92BhcPrT2AoMcb1ppUVwGWpcaZizq5XsAstSObDh1d32E3Chv
 dp2c8pA/asx+iwhSXlGNAsnogeAa7TedstOjY8xeDDoLDyaNausvZ4CaHrDXnl1wox9NI5/RC
 AJCeFE4pPt3slFdkc/+g0v35tYlxqB0YpYeLqOswaEFbv8SiHURe3bjTrqJi7S11zo8BxmWlt
 zvGsAgV3KMNqqH6q4REglQCNZjcNi+lRaOchQjAmBkOSWosgATltYyxOWRBeIkMB9fFvomWZL
 /gA2vMbmVkpvHorSOaiPkBewPo1JatONiiIW7XQ5JuJRtblTl67ddDkEpVbfakMWDmq9gDJaz
 shRJ8+DTc6VUHnR8jQE6kAQFdo6f5ttobyhJB1uXZ3bPBWFeNpJ1wDQJPOrBu7PWTdJ2Wjjey
 8xr/a0ynSlf57oLtr7VuvFhqoveZ6zkUKHy0T8EHe7PKNc23VBhwWC0IFN9YG7tMQvpEWaa4K
 uL+3cp7XnMLsQpLSsVhqJtrCB2R3RF2MkndcY7L3AoimtI8KIlHawKuKA1phhRy8uaE+bmi7v
 eKbnLNwTBAKvaOMZ1GdfaipEBWr992H11Wkjb5WWNZudzBJ/yL//74b3ikMPlPMdxyBaaxn0S
 bLFGvfEduEDfy+O9/TuO8tpgb3ddsPZpXecpQzq3A+xE5E0d7BuSpQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.7.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2024-24575 (infinite loop DoS on revision lookup) and
CVE-2024-24577 (heap out of bound write on index update)

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 76d599b81e..022fb35a9c 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  17d2b292f21be3892b704dddff29327b3564f96099a1c53b00edc23160c71327  libgit2-1.7.1.tar.gz
+sha256  de384e29d7efc9330c6cdb126ebf88342b5025d920dcb7c645defad85195ea7f  libgit2-1.7.2.tar.gz
 sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 46ccc1e517..498b665808 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.7.1
+LIBGIT2_VERSION = 1.7.2
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
