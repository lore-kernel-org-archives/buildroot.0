Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CBED10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4547A405F7;
	Sat, 26 Oct 2024 16:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncJKMhzjP0xi; Sat, 26 Oct 2024 16:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEAEA406FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEAEA406FE;
	Sat, 26 Oct 2024 16:07:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EFC15E29
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3C3581FA9
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILxYBDRugMrn for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3019581FB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3019581FB0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B1C783E73; Sat, 26 Oct 2024 16:07:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 18:01:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35835703f8d6e8bdf71b2adf28da309435a8382d
X-Git-Newrev: 35593203802acc18687cdcaf36fff3bb62347015
X-Patchwork-Hint: ignore
Message-Id: <20241026160709.2B1C783E73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: bump version to 125
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

commit: https://git.buildroot.net/buildroot/commit/?id=35593203802acc18687cdcaf36fff3bb62347015
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, change the url to https://github.com/polkit-org/polkit as
https://gitlab.freedesktop.org/polkit/polkit The new address of the codebase
for the polkit project points to the github URL.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/polkit/polkit.hash | 2 +-
 package/polkit/polkit.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index 5eadc89753..a3855adecd 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b69278f6ea0eac406350c45f5720e2fe5e4beaf9f53c16d9902e025965418864  polkit-123.tar.gz
+sha256  ea5cd6e6e2afa6bad938ee770bf0c2cd9317910f37956faeba2869adcf3747d1  polkit-125.tar.gz
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index cdbbf8f9b0..fb49f6ce2a 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 123
-POLKIT_SITE = https://gitlab.freedesktop.org/polkit/polkit/-/archive/$(POLKIT_VERSION)
+POLKIT_VERSION = 125
+POLKIT_SITE = $(call github,polkit-org,polkit,$(POLKIT_VERSION))
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 POLKIT_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
