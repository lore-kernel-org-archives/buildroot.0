Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688C1D6E2AF
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E892F410B8;
	Thu, 18 Dec 2025 16:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljohSQYfWV8e; Thu, 18 Dec 2025 16:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 290D3410B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075715;
	bh=gg2BK9+Pdc8MlAOzV0Vp9AJt7EtWllFSCJ5G4mRL9Zo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YIwHfQfWC4xC5cFOImMfZ5E2Wyv931nnj7wa+lYFCskeT833c4Bx5miXErPfwTlRh
	 JWDn18BlneGhHHgLhlBQnEK7oLmxccjJuPYZRosEFVkplWcSw+b6F7jlDkJO5sq6Sp
	 GV072sX3DUm+10/gC+6gW3gpkfspeG/iE+JLtt8zY4KX8oev8peVRNX49G0B+JBAMJ
	 swo6rIIeDVaDyxjXgL9cB5bcTyhzgborjq62nlieKJ9lhpuAOoasr23tIsKUAvPIwb
	 mwkvCrjWOA1JAmpkho6bBv59iWBdMC8Wq3CBXFT7MGIJfduOFxHHsR1mKhmHCggCRz
	 tbjPcWy9Jyxgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 290D3410B9;
	Thu, 18 Dec 2025 16:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 519731A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 438B96115F
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3C_RdY-FlGIT for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CD9660D6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CD9660D6E
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F181872FB; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:54:03 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 16fd8b6b35b80fa7cf954704c251e890db0c383a
X-Git-Newrev: 765f70d59d72ecc6ee3d87f3f320ec6e7a84ad1e
X-Patchwork-Hint: ignore
Message-Id: <20251218163507.8F181872FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgit2: security
 bump version to 1.9.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=765f70d59d72ecc6ee3d87f3f320ec6e7a84ad1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fix two vulnerabilities related to SSH support:
* The external SSH execution code lacked shell quoting on repositories
  name, resulting in arbitrary command execution.
* SSH public keys were zeroed by calling memset with the wrong length,
  resulting in either buffer overflow or incomplete zeroing.

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.2

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c4debc99097b6da64cf64ca5009b595ebc95e135)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 8c9b210581..e8c155c994 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  14cab3014b2b7ad75970ff4548e83615f74d719afe00aa479b4a889c1e13fc00  libgit2-1.9.1.tar.gz
+sha256  6f097c82fc06ece4f40539fb17e9d41baf1a5a2fc26b1b8562d21b89bc355fe6  libgit2-1.9.2.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index f615484edb..34cb67929e 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.1
+LIBGIT2_VERSION = 1.9.2
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
