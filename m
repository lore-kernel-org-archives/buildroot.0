Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47562C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 10:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 005BA4203F;
	Wed, 20 Dec 2023 10:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 005BA4203F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ct5uLsH7DKJq; Wed, 20 Dec 2023 10:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF9941E95;
	Wed, 20 Dec 2023 10:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AF9941E95
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 499D41BF95D
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2473641E69
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2473641E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ZQsER46HP2R for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 10:50:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1262141DF1
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 10:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1262141DF1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED87487BE7; Wed, 20 Dec 2023 10:50:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 11:42:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c4bb1abb9102140b6f4726915fa7555e21b96b4
X-Git-Newrev: 3c047ea463e27ceaafde76d64406862c3322daa0
X-Patchwork-Hint: ignore
Message-Id: <20231220105004.ED87487BE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: security bump to version
 9.6p1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c047ea463e27ceaafde76d64406862c3322daa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenSSH 9.6 was released on 2023-12-18.

This release contains fixes for a newly-discovered weakness in the
SSH transport protocol (the "Terrapin" attack), a logic error relating
to constrained PKCS#11 keys in ssh-agent(1) and countermeasures for
programs that invoke ssh(1) with user or hostnames containing invalid
characters.

https://www.openssh.com/txt/release-9.6

Signed-off-by: Christian Stewart <christian@aperture.us>
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
