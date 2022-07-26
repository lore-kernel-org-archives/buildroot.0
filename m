Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2D9C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 08:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6B6F40BD1;
	Tue, 26 Jul 2022 08:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6B6F40BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIJAeGJQoaHU; Tue, 26 Jul 2022 08:15:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D73A64055D;
	Tue, 26 Jul 2022 08:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D73A64055D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22D761BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EED8C419E2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EED8C419E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEUfP4I7GbHk for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 08:15:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E514195A
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2E514195A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6005685E9A; Tue, 26 Jul 2022 08:01:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 10:14:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef321ff4a90acf2133ee29d5fd2a65fc9906c748
X-Git-Newrev: a830961a589c793b4350fea5bd17b6210ae7adf2
X-Patchwork-Hint: ignore
Message-Id: <20220726080142.6005685E9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avocado: fix license
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

commit: https://git.buildroot.net/buildroot/commit/?id=a830961a589c793b4350fea5bd17b6210ae7adf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit ef321ff4a90acf2133ee29d5fd2a65fc9906c748 ("package/avocado:
new package") the license information that was introduced was
incorrect. The license is GPL-2.0, not Apache-2.0.

According to the LICENSE file:

Most files in Avocado are released under the GPLv2 with a "and any later
version" clause (GPLv2+), but some files are explicitly bound to the
version 2 of the license and therefore that's the official license of
the project itself. The header on each individual file contains
information about the GPL version that applies to it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avocado/avocado.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avocado/avocado.mk b/package/avocado/avocado.mk
index 282cb34fd3..b308a37b37 100644
--- a/package/avocado/avocado.mk
+++ b/package/avocado/avocado.mk
@@ -7,7 +7,7 @@
 AVOCADO_VERSION = 98.0
 AVOCADO_SITE = $(call github,avocado-framework,avocado,$(AVOCADO_VERSION))
 AVOCADO_SETUP_TYPE = setuptools
-AVOCADO_LICENSE = Apache-2.0
+AVOCADO_LICENSE = GPL-2.0
 AVOCADO_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
