Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8B5D30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FC7340C49;
	Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zRnGQ0ovk84; Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F69F40C5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337934;
	bh=QT4ZNX3UJnOdipX/su3jYv+8W2LicVBagJtULXcIN6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XTZcviuMHyGZMsWmw/sdBAuBfg7I355EYfix7KVq4HBfWMnKwQpDoyiF11DmDvKe4
	 FV3bzdjfS+0TPMkEW9FbKYySGf3k6K4Dm4VKmk38qrtwL4v4jA1FAhzbTngL7P5b7g
	 JhewtJvVA+r+uoByKj6jrAHOY+XDwcgwSbeNI9P+ayDCNzN93+w6eo9/mKQDaJadCl
	 LFttraCkKqg4CCx5vykBQyZllJ6RCO13vWskRWuLJ0tOwfKU8VOJyyPW9gasv6lisy
	 hR7nsTm09P9i12Bf71BlVsx7Kmw2LLyXejOmz7dEjBm/ClhjqjZZOqUQI/1UmCDqYi
	 6eOOEyPjixVVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F69F40C5E;
	Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73094231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58F3180FFB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KeGQ_DreS33q for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 976FE80839
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 976FE80839
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8884188570; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 734eb062b463565a0ffb53d15eaad2387035515e
X-Git-Newrev: 4f4b9b31e7b5fd0b3d8331f0093b708242e9aa4e
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.8884188570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_sessreg: bump version
 to 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f4b9b31e7b5fd0b3d8331f0093b708242e9aa4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-May/003601.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/sessreg/-/commit/498db3a831ac76b487cfec86492ebc54e0e25bb4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_sessreg/xapp_sessreg.hash | 8 ++++----
 package/x11r7/xapp_sessreg/xapp_sessreg.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.hash b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
index 1f1b54b877..7d12d7617d 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.hash
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003246.html
-sha256  022acd5de8077dddc4f919961f79e102ecd5f3228a333681af5cd0e7344facc2  sessreg-1.1.3.tar.xz
-sha512  bc1e83afc598ac5b4c6ab0861799b6c8727c123ee662c1fb9cbdd9ee926973b7a00cc62e32f6b4e462c0da3516f8b824337d9cf17587ebabd3f4753502641a60  sessreg-1.1.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003601.html
+sha256  4e85b52f4f65a93449753bfb00ceb5d77f3317e24d07dc23147f2f116c785350  sessreg-1.1.4.tar.xz
+sha512  836d2cfa60448de9b4af1b79693905854ba5c1135d623654bba627d125271eb74111bac2b4437a86f4cbd362695e796fc0279d4f4684f2cd5080cdd953318686  sessreg-1.1.4.tar.xz
 # Locally computed
-sha256  ac8f5cc696e6c473aea4caaf18650316dc8912fcf0f370cae1df5f395cea8631  COPYING
+sha256  1274afd6bafa32e4e1c2fc7c1b2ebe2fd690f6e63faf4a54a5b1348d6928e20d  COPYING
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index b196bb947e..bd5a419ad1 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SESSREG_VERSION = 1.1.3
+XAPP_SESSREG_VERSION = 1.1.4
 XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.xz
 XAPP_SESSREG_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SESSREG_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
