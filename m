Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B82C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2670D403A9;
	Sun,  7 Jan 2024 16:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2670D403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0BZ_QcpdQSAg; Sun,  7 Jan 2024 16:25:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C0F540443;
	Sun,  7 Jan 2024 16:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C0F540443
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3687A1BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55EA940424
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55EA940424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7py7qrG4Y3_W for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 299C940462
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 299C940462
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13FF5847B4; Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 12:18:22 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 81730dc4eaaf5ecaac98b95e043fa9c8a73504f3
X-Git-Newrev: efdcc3f4d33f9840c6b3b7b176000cbce62dd219
X-Patchwork-Hint: ignore
Message-Id: <20240107162342.13FF5847B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/openssh: security
 bump to version 9.6p1
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

commit: https://git.buildroot.net/buildroot/commit/?id=efdcc3f4d33f9840c6b3b7b176000cbce62dd219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

OpenSSH 9.6 was released on 2023-12-18.

This release contains fixes for a newly-discovered weakness in the
SSH transport protocol (the "Terrapin" attack), a logic error relating
to constrained PKCS#11 keys in ssh-agent(1) and countermeasures for
programs that invoke ssh(1) with user or hostnames containing invalid
characters.

https://www.openssh.com/txt/release-9.6

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3c047ea463e27ceaafde76d64406862c3322daa0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 2 +-
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 4060b95e9b..618b13133d 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
 # From https://www.openssh.com/txt/release-9.4p1
-sha256  3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85  openssh-9.4p1.tar.gz
+sha256  910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c  openssh-9.6p1.tar.gz
 # Locally calculated
 sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 358ef42b6e..ec9e6613b0 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.4
+OPENSSH_VERSION_MAJOR = 9.6
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
