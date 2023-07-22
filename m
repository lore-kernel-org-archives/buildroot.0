Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D15C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C816181467;
	Sat, 22 Jul 2023 21:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C816181467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BT_RII5zKMGK; Sat, 22 Jul 2023 21:54:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18E3881970;
	Sat, 22 Jul 2023 21:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18E3881970
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 108011BF869
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB8C281404
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB8C281404
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AuoFqjtFoCl4 for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:54:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8895181424
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8895181424
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76168822CC; Sat, 22 Jul 2023 21:54:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:50:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc7d74bc26f70f3334c9b07ea2c063c0bcc028b5
X-Git-Newrev: 2b22627f7598acfad07032e9bfefca9283baaf7d
X-Patchwork-Hint: ignore
Message-Id: <20230722215427.76168822CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ejabberd: remove useless _SOURCE
 variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b22627f7598acfad07032e9bfefca9283baaf7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit fd29a61f019146b52e0056c7ae8a2bb9bd7c086c ("package/ejabberd:
bump version to 23.04"), the EJJABERD_SOURCE variable was changed to
"ejabberd-$(EJABBERD_VERSION).tar.gz", which is the default value for
the _SOURCE variable, causing check-package to complain. Fix that by
dropping the useless variable definition.

Fixes:

  package/ejabberd/ejabberd.mk:8: remove default value of _SOURCE variable (http://nightly.buildroot.org/#generic-package-reference)

In:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/4718833134

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ejabberd/ejabberd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 3f79860a3d..574f9492e8 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 EJABBERD_VERSION = 23.04
-EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tar.gz
 EJABBERD_SITE = https://static.process-one.net/ejabberd/downloads/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
