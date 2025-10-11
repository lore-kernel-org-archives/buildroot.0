Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EA3CCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 18:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77F9960B09;
	Sat, 11 Oct 2025 18:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpOFKi29_A8c; Sat, 11 Oct 2025 18:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A195060B01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A195060B01;
	Sat, 11 Oct 2025 18:12:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F698119
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 18:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C0AC80C1B
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 18:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4-qQjlfWUUD for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 18:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 833F680BDE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 833F680BDE
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 18:12:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D93B86B11; Sat, 11 Oct 2025 18:12:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 18:36:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02684f4625ed597e40633274b376326b1127a86e
X-Git-Newrev: a843be3451a07c5ebbaae8f5ec605f6d0162e24d
X-Patchwork-Hint: ignore
Message-Id: <20251011181222.7D93B86B11@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: bump version to
 2.20250923
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a843be3451a07c5ebbaae8f5ec605f6d0162e24d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The update makes some warnings about unknown classes and permissions
during boot with current kernels go away.

Upstream changelogs [1, 2] list as "notable changes":

* Updates to support screen 5.0.
* Add labeling for bcachefs.
* Various systemd updates and fixes.
* Several updates and fixes for systemd
* Add new permissions and policy capabilities
* Drop reiserfs support (it was removed in kernel 6.13)

Plus a number of new modules.

[1] https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20250618
[2] https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20250923

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Julien: keep a new line in hash file between sources and license]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/refpolicy/refpolicy.hash | 2 +-
 package/refpolicy/refpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 76bbf482ae..1ebb57e480 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  d2487c49420e8710e999b18bbe699fbff033fe5adc5127e3f0c7dafaa9b4d209  refpolicy-2.20250213.tar.bz2
+sha256  e5b435c934048d01ca4415a1f2670a51e113f26f5d01ad4227c98fbe8dea8d5b  refpolicy-2.20250923.tar.bz2
 
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 127faf793a..698f38f738 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20250213
+REFPOLICY_VERSION = 2.20250923
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
