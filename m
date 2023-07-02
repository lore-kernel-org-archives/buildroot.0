Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B3EEB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 16:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD15C40309;
	Sun,  2 Jul 2023 16:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD15C40309
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8BMH2Q7qf_h; Sun,  2 Jul 2023 16:48:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C129040235;
	Sun,  2 Jul 2023 16:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C129040235
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AAA841BF280
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 16:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91BE440AEE
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 16:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91BE440AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id maY5dylG1X6t for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 16:48:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83932401B2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83932401B2
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 16:48:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A484FA4C00B2;
 Sun,  2 Jul 2023 18:48:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38474)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qG0F3-0006RA-1G;
 Sun, 02 Jul 2023 18:48:05 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 18:48:05 +0200
Message-Id: <20230702164805.3469254-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688316485;
 bh=qpRjk7fn9XLRPPs4ayLB4s8Uuk5eIc5ZRZI8SLpF7FI=;
 h=From:To:Cc:Subject:Date:From;
 b=Wy9/ztwowJeT4mHK1XcfrGhsPb70iR+/YE+kVdK21e1UrrjJxPh1A5dRI9m65WkZq
 MRDqeC+9tl5GY0GOytYV08n9rQ9gqsQG2Tyv8pv4Qd/8ZPr6V1pknTqECpJ8XJ/8NS
 Hl9gGddKPljqzPTdeVpQfcupvAueD3+8D3bnIEwiQ2u67JfGgvTijZ3tG+8HS+Voxg
 gYEsaxLMlDR1gwDuDBqnbVfBgyadLh4TnlR3AV4a3XzB1QPNcJBdB4V8B5w2y5JI+6
 rFojoOSGJWLEhYt73PkrVwNzukbfN/QTfgaFtwq6YW+oaK7dkdcH7YzvBhn9YqmMaI
 sWBttsyw0wPEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Wy9/ztwo
Subject: [Buildroot] [PATCH 1/1] package/dos2unix: bump version to 7.5.0
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
Cc: David Bachelart <david.bachelart@bbright.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt

Updated license hash due to upstream commit which update project URLs
and copyright year:
https://sourceforge.net/p/dos2unix/dos2unix/ci/c5acfaf73db3686cf49a46705f00ad8eeb3f7151/
https://sourceforge.net/p/dos2unix/dos2unix/ci/59510e21846bb9c7c2efdf326dd33d573883f611/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index a16c1aecac..032c8ea2d2 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.3.tar.gz.asc
-sha256  b68db41956daf933828423aa30510e00c12d29ef5916e715e8d4e694fe66ca72  dos2unix-7.4.3.tar.gz
-sha256  275ce1371734904b275e83bf760e3e6d2a520614545a3850c9568d1892b940fd  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.0.tar.gz.asc
+sha256  7a3b01d01e214d62c2b3e04c3a92e0ddc728a385566e4c0356efa66fd6eb95af  dos2unix-7.5.0.tar.gz
+sha256  6009a35c7aaee9888fd4844972c37b84bce22e7407893727c70f4f3560ae3eac  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index f16a527f2e..6d1e70cf26 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.4.3
+DOS2UNIX_VERSION = 7.5.0
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
