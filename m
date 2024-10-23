Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE780CFA474
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6089E40024;
	Wed, 23 Oct 2024 21:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 207oZZjUHW71; Wed, 23 Oct 2024 21:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C180A402D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C180A402D7;
	Wed, 23 Oct 2024 21:15:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F046827ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE80760844
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWc2dm4KEHyl for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE7360837
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EE7360837
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:15:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A49D8643F; Wed, 23 Oct 2024 21:15:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:14:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91696fbcf1cefe35bf7134b981cdcc3175eb0770
X-Git-Newrev: 385729e6098ef3b6c5546aa743b2105376de6377
X-Patchwork-Hint: ignore
Message-Id: <20241023211538.0A49D8643F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acpica: switch to github
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=385729e6098ef3b6c5546aa743b2105376de6377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in [1] the traditional acpica.org website releases might get
delayed due to website publication process, and indeed, on GitHub, the
latest released version is 20240927, while in [2] the 20240827 version
appears. Furthermore, in [2], explicit reference is made to the GitHub
URL for direct access to the public ACPICA git repository.

[1] https://github.com/acpica/acpica/releases
[2] https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/download.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpica/acpica.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index a3d682257d..5b1dfbbba2 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -6,7 +6,7 @@
 
 ACPICA_VERSION = 20240321
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://downloadmirror.intel.com/819451
+ACPICA_SITE = https://github.com/acpica/acpica/files/14718333
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
