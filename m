Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC50FC54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72F68822EA;
	Thu, 21 Mar 2024 21:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pt8GxqAhBv8h; Thu, 21 Mar 2024 21:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9906382245
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9906382245;
	Thu, 21 Mar 2024 21:02:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0F291BF980
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB5B6409C8
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WUOzEJumPCV for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13B86405C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13B86405C2
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01DEC83751; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:26:38 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: acf013b600aa860794bd20d09881453fa6a80d6b
X-Git-Newrev: 9c9796d8778791fa4e3f8d0f15cafd91cad3251c
X-Patchwork-Hint: ignore
Message-Id: <20240321210221.01DEC83751@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/expat: security
 bump to version 2.6.2
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
Content-Type: multipart/mixed; boundary="===============1729678390449888388=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1729678390449888388==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9c9796d8778791fa4e3f8d0f15cafd91cad3251c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Security fixes:
	- CVE-2024-28757 -- Prevent billion laughs attacks with isolated
	  use of external parsers.  Please see the commit message of
	  commit 1d50b80cf31de87750103656f6eb693746854aa8 for details.

https://blog.hartwork.org/posts/expat-2-6-2-released/
https://github.com/libexpat/libexpat/blob/R_2_6_2/expat/Changes

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1dfe980b19b83ee695e51e92aecb0c8cdf202a3d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 980a9ab6a7..63890b54df 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.6.1/
-md5  84d0ee1c554212dc8f068e538de5b823  expat-2.6.1.tar.xz
-sha1  1a1804b7c565a8b21abbd3433ef67ed8a4476960  expat-2.6.1.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.6.2/
+md5  0cb75c8feb842c0794ba89666b762a2d  expat-2.6.1.tar.xz
+sha1  d9e5f953dcacda3c9e69b4886382c3d8847b81bd  expat-2.6.1.tar.xz
 
 # Locally calculated
-sha256  cb5f5a8ea211e1cabd59be0a933a52e3c02cc326e86a4d387d8d218e7ee47a3e  expat-2.6.0.tar.xz
+sha256  ee14b4c5d8908b1bec37ad937607eab183d4d9806a08adee472c3c3121d27364  expat-2.6.2.tar.xz
 sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index e09fcc673f..c6b7fc8b44 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.6.1
+EXPAT_VERSION = 2.6.2
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES

--===============1729678390449888388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1729678390449888388==--
