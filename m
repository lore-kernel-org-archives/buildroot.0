Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099B9C5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 20:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C2DE6072F;
	Thu, 13 Aug 2026 20:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhuagGDxB5zO; Thu, 13 Aug 2026 20:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C60E2606B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786653172;
	bh=VS1+2AuIU/YZkv9dtNJQ+/gV/CI3cmT521Ce1Ctwvus=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fhg51BrWXh/eHQZoLEag6bK4VRbqLXWr7szcrReIwQ7NjCUw+Bv7HhISKhYJKCd7h
	 +OB5RXzKmqN60VCtgLivurYw0kOJwegWGm7OiH+ELZ75OpR3axVJVKDjuyddGS6J47
	 IxoBxLJC8HUl98oitrYIdi4NisDGdLTZU8PGUZDFNKQMowxqRZQXjUIH5EYuh/BxXL
	 mv/K7A6Yps2r2e5LcoNbgJT8Z8EuuWhSV6TKRETvzWuSJ8Tsw6QBSXlxvchPPSHnBQ
	 16iPZn+LnRLrQoIUzNXaWJ+Q93XNzmolMCXwSDirWrohqzcwcCt3/G7pMPuISjuCtT
	 G5sFK80/BWpfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C60E2606B9;
	Thu, 13 Aug 2026 20:32:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 341841393
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25C0B81450
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfELv9MDOlYn for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 20:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67A558144A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67A558144A
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:32:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A12ED8D5C4; Thu, 13 Aug 2026 20:32:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 22:22:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9af6e062331cc6755a8aa46588b3b3b0c0fce6f
X-Git-Newrev: bb6edc3ea1371b5c1bdfe250c8ed502a1fe69109
X-Patchwork-Hint: ignore
Message-Id: <20260813203200.A12ED8D5C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: security bump version
 to 1.11.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bb6edc3ea1371b5c1bdfe250c8ed502a1fe69109
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/signalwire/freeswitch/releases/tag/v1.11.2

"This is an important release containing extensive security hardening
 across the core, mod_rtmp, mod_xml_rpc and mod_sofia, alongside the new
 interface allowlist, stricter DTLS/STUN validation for media sessions,
 and a modernized build system. We strongly encourage all users to
 upgrade to v1.11.2 as soon as possible."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index ffddee806a..1ae30ebc3a 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.11.1.-release.tar.xz.sha256
-sha256  ed4e6ecc6a6ee0bcbc068f33cf3e5d1b83d7ad26c3a98feaebb1b2ab22d5adf4  freeswitch-1.11.1.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.11.2.-release.tar.xz.sha256
+sha256  1a460e28a0309bf2e29397f0dc7cebecaa579c9f19efa9a301dfc6bf5015d17e  freeswitch-1.11.2.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index cec9b30660..39af6214bf 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.11.1
+FREESWITCH_VERSION = 1.11.2
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
