Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F22D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AEDA82291;
	Wed,  7 Jan 2026 17:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFfoppKSCutg; Wed,  7 Jan 2026 17:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65B748227D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808110;
	bh=eA97ftIVmA5CJTKwSsS6/Gx7Ej2pVUw8BEMpLB/Ik/U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lRnG1+ohV8YG1+F9ySog94iMXm3TtOISaBVQ3CjSaxfYgDry1SEZ0RZcu11YIBmRg
	 HhSTG9zlNLKdmjhN1PrTkLmbXnxs3eO88fyKTN0KLTzVv6rJLcFTsCcc7+X7fldJQd
	 0FKCPjBGGFKBAEjlyVbrjmN0RLvWuPpDdSChB48fYOpC1djfBi60QLxIBXIAFtSZ9b
	 Gg3X+8+qQcYjTglNQT6Wwq8nij9ki3UKWOOF4nbDugbHb0TVRGJVX7efV1/k4O8LHe
	 sDQ2pZmEXt+8W1UUepSUJOqtJbnTyg0P9GXVMQMl7sN4MdASnazVOguV0PrY+vmnBB
	 DWUZDTYmtURvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B748227D;
	Wed,  7 Jan 2026 17:48:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0327025B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE24580C1B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heLskSXpbHyo for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E6C480C78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E6C480C78
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D9938225F; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:32 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cbe5ba25c004fbc2462224a04f84744fcfcb3d5b
X-Git-Newrev: 608cd4193162bf217529dfe3c08271bf0d11646d
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.7D9938225F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/avahi: add CVE
 trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=608cd4193162bf217529dfe3c08271bf0d11646d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cef136b5f09827a8d1e98a0dce0380449ed61cd4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                        | 1 -
 package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e5fe7400bd..f555bec09e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -235,7 +235,6 @@ package/aufs-util/0003-no-strip-lib.patch lib_patch.Upstream
 package/aumix/0001-fix-incorrect-makefile-am.patch lib_patch.Upstream
 package/autoconf/0001-dont-add-dirty-to-version.patch lib_patch.Upstream
 package/automake/0001-noman.patch lib_patch.Upstream
-package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch lib_patch.Upstream
 package/avahi/S05avahi-setup.sh lib_sysv.Indent lib_sysv.Variables
 package/avahi/S50avahi-daemon lib_sysv.Indent lib_sysv.Variables
 package/babeld/S50babeld Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
index 7e191e8da7..c2c6434196 100644
--- a/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
+++ b/package/avahi/0001-Fix-NULL-pointer-crashes-from-175.patch
@@ -9,8 +9,8 @@ Add missing NULL pointer checks to fix it.
 
 Introduced in #175 - merge commit 8f75a045709a780c8cf92a6a21e9d35b593bdecd
 
-[Retrieved from:
-https://github.com/lathiat/avahi/commit/9d31939e55280a733d930b15ac9e4dda4497680c]
+CVE: CVE-2021-36217
+Upstream: https://github.com/lathiat/avahi/commit/9d31939e55280a733d930b15ac9e4dda4497680c
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  avahi-core/browse-dns-server.c   | 5 ++++-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
