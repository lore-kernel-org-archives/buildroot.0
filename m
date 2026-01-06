Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC566D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42F140C51;
	Wed,  7 Jan 2026 17:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-kYkyp1QLKy; Wed,  7 Jan 2026 17:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50ADA40C46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808116;
	bh=wCfPaBjd5te6FOgm4JhgFtp97VZLYDhy8wqKSsb3K80=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i/A+G0t6zPVER7im0Bu7Ro3aRO8Y3/HwUqSxmp/EIBjx8dvKgslbeF3+y6lme2GgK
	 CjR/1qPUerNrP4wsdQSv4syiD9nxOV6GcPAMN1KntradFoePBnsFr4gW9BqZr/Wrhp
	 jjZif/Qqq0zslZVPnyikjivugDaH3zAKm0on8wmdcobLwCGS3/fPOkDtZOsinZ9Hhq
	 Fmm5HcpYVx4CAO7gY7xbO76vE2crsRAha3qXHfUA3DcsP7hV7IAJ+ya+8uNgVyx+iN
	 amBw3VMTlHitSLyp3zQtrP/ZlBR4gsaprDWMgI6aRV4ppaJKRS9XrnYCc0Oc97+TQD
	 +sZ9kOEZAwbYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50ADA40C46;
	Wed,  7 Jan 2026 17:48:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48B5025B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 140D060A62
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stPh-Dl_v8oA for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 906716089B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 906716089B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 901E481917; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:36 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7f97279529c3ff4ffd3b746beef3c532d70bea4a
X-Git-Newrev: e278e4a68ed5a70db56e24cc83ee27e69bde8217
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.901E481917@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libconfuse: add
 CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=e278e4a68ed5a70db56e24cc83ee27e69bde8217
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ba51d53019bbc6f862b87389a90695a3dbe0670c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                                   | 1 -
 .../0001-Fix-163-unterminated-username-used-with-getpwnam.patch       | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f555bec09e..2053988215 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -566,7 +566,6 @@ package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch lib_patch.Upstream
 package/libcec/0001-cecloader-h-fix-null-return.patch lib_patch.Upstream
 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch lib_patch.Upstream
 package/libcgicc/0001-disable-documentation-option.patch lib_patch.Sob lib_patch.Upstream
-package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch lib_patch.Upstream
 package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch lib_patch.Upstream
 package/libcuefile/0001-fix-static-link.patch lib_patch.Upstream
 package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch lib_patch.Upstream
diff --git a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
index 9ff3f5ec1c..44e15468ac 100644
--- a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
+++ b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
@@ -5,8 +5,8 @@ Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
 
 Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
 
-[Retrieved (and backported) from:
-https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
+CVE: CVE-2022-40320
+Upstream: https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/confuse.c | 10 ++++++----
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
