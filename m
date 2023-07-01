Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776CFEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 13:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C474181F2B;
	Sat,  1 Jul 2023 13:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C474181F2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZXHnqK4Qz5D; Sat,  1 Jul 2023 13:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B9C481F44;
	Sat,  1 Jul 2023 13:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B9C481F44
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7BAF1BF616
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 13:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B180060D67
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B180060D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQfkiaMZZdND for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 13:21:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B53E460D52
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 13:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B53E460D52
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94C82841A2; Sat,  1 Jul 2023 13:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 15:14:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af25796d49cf36ad0cd3a4bf6fc71eed6b10d450
X-Git-Newrev: 5ce72a74d2163a455c499701b16bc0f4350ad935
X-Patchwork-Hint: ignore
Message-Id: <20230701132103.94C82841A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: security bump version to
 9.16.42
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ce72a74d2163a455c499701b16bc0f4350ad935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://ftp.isc.org/isc/bind9/9.16.42/CHANGES

Fixes CVE-2023-2911

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 32804b5ce0..a8c15f2a12 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.38/bind-9.16.38.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.42/bind-9.16.42.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  8df44c9d9a84a28ab8b49d55f3c33b624b90ef8f6a8b9ee6a4c33cc17c14c50f  bind-9.16.38.tar.xz
+sha256  a8b51c6bfdf3ab6885102f764c2418e037897b7ea46a09f8f07876fa11a6c0b3  bind-9.16.42.tar.xz
 sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 70987a9823..f46d1a8a54 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.38
+BIND_VERSION = 9.16.42
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
