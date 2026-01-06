Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9DED0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A1F82FDE;
	Wed,  7 Jan 2026 18:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQOR9OZEvle2; Wed,  7 Jan 2026 18:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4FF183026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808947;
	bh=unSG8eJRiwXT0xmh0cVwl7+CXDOoo/rJec3tW8XdoJo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AY1W4P86Kd2A1NwOtJO8/P6EfMND941hXnau273Y7Namqz04vVfBqUwD6JYW1lZ+i
	 AQ8RZu7AYp3oYnKhk+vGZ7IzVLJK+Kw57vBQ7k37CkxEW9azWVlFjuf8qbppZ+70Zq
	 P5FvZieR2jix4Jsjljs/1vIidGWr5KAQjlQnLNX+Lp942ZXUM3gGcfxRQmAnWYcJuS
	 AOg0HQP9hddIPIo+7EnwmFD2p1U9upSBWX17ngxi7ca3PccV0KFxDpV/YUEt4UiIFG
	 5u5InHmEAXP5p1tvReloIL2b1U1csMICeWtOxFFFTnaTHZ1OE7ZINiW0OSn10JHNaH
	 a3nVTqlB5gf4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FF183026;
	Wed,  7 Jan 2026 18:02:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C4249ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96271608C6
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fF6q7Na3Yqsf for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 897F960895
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 897F960895
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 893F2811C5; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:07:46 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f409cf24525ad3d83437576c3bec5e5b0b00a21d
X-Git-Newrev: d7c3aa1413de33188bb3f0065183836edeb00264
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.893F2811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/avahi: add CVE
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7c3aa1413de33188bb3f0065183836edeb00264
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
index 870d7b0c49..d089609208 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -218,7 +218,6 @@ package/attr/0001-build-with-older-GCCs.patch lib_patch.Upstream
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
