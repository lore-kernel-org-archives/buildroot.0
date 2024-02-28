Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADA5C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 17:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C5B41766;
	Wed, 28 Feb 2024 17:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ae_fhZFXfkNs; Wed, 28 Feb 2024 17:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EF0541795
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EF0541795;
	Wed, 28 Feb 2024 17:35:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A83BE1BF841
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 17:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3001817F5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 17:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZpfTYpL5DRv for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 17:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E65BB817AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E65BB817AD
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 17:35:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB8AC87C9D; Wed, 28 Feb 2024 17:35:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 18:34:21 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: e149a7a994e10ec503e9401b077f099a8584b214
X-Git-Newrev: edfc7436427779ed7f2a2095f0d023df56950afc
X-Patchwork-Hint: ignore
Message-Id: <20240228173549.CB8AC87C9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/frr: security
 bump to version 8.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=edfc7436427779ed7f2a2095f0d023df56950afc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix CVE-2023-38802, CVE-2023-41360, CVE-2023-46752, CVE-2023-46753,
CVE-2023-47234 and CVE-2023-47235

https://frrouting.org/security/
https://frrouting.org/release/8.5.4/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c3cf06e0a8957e7ea6e6a01e4bbc3efb6f042d12)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 836f130b93..4a61084bae 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8a6b0e0fa1e89493ba84cf176674e55c7a814821fd02a7188095b76c37c3935f  frr-8.4.2.tar.gz
+sha256  7ae9d8bafc65bb5d0f21061ac61dbc6cf93b2b05a5dae9e5eec72ed42388551e  frr-8.5.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index abae784c40..19f346fd7b 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 8.4.2
+FRR_VERSION = 8.5.4
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
