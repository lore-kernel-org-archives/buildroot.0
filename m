Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34596EEAA71
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14BF60F3A;
	Thu, 14 Sep 2023 21:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D14BF60F3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ym0nCyDOfz3V; Thu, 14 Sep 2023 21:02:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A8DD60B8F;
	Thu, 14 Sep 2023 21:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A8DD60B8F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 381091BF368
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10EC660B8F
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10EC660B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UbTiUsJ0vYiN for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CBDD60709
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CBDD60709
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1437386FF3; Thu, 14 Sep 2023 21:02:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 22:55:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b169bebd7ed4f3f6246f5ef2f3c6228d4e4e9978
X-Git-Newrev: b7e57785d0ec8827012b122db1651c58192ccf19
X-Patchwork-Hint: ignore
Message-Id: <20230914210236.1437386FF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firewalld: add
 FIREWALLD_CPE_ID_VENDOR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7e57785d0ec8827012b122db1651c58192ccf19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:firewalld:firewalld is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afirewalld%3Afirewalld

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/firewalld/firewalld.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 4a13579fca..13edba6d24 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -8,6 +8,7 @@ FIREWALLD_VERSION = 1.3.2
 FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
 FIREWALLD_LICENSE = GPL-2.0
 FIREWALLD_LICENSE_FILES = COPYING
+FIREWALLD_CPE_ID_VENDOR = firewalld
 FIREWALLD_AUTORECONF = YES
 
 FIREWALLD_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
