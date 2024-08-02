Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED87BC52D6D
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4138E6130A;
	Fri,  2 Aug 2024 21:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUltrYdhqeYi; Fri,  2 Aug 2024 21:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DAD66130B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DAD66130B;
	Fri,  2 Aug 2024 21:35:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3BE1BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14B94400B5
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nr3pj6Oqwnr for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFCFA40286
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFCFA40286
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:35:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E670D83C24; Fri,  2 Aug 2024 21:35:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 23:31:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b88d2b51a4bd2d825d71730bde934dc9991fc6cf
X-Git-Newrev: 5cd3797e9bd103d3c02f37875fda96350863620d
X-Patchwork-Hint: ignore
Message-Id: <20240802213533.E670D83C24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: move python option later
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cd3797e9bd103d3c02f37875fda96350863620d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's in the middle of options that are specific to the daemon, while
it itself is not specific to the daemon. We're going to add an option
to enable/disable the daemon soon, so that python option would get
hidden away.

Move it further down, out of scope of the daemon-related options.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpsd/Config.in | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 44615f4e43..1b61f8c286 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -76,17 +76,6 @@ config BR2_PACKAGE_GPSD_MAX_DEV_VALUE
 config BR2_PACKAGE_GPSD_SQUELCH
 	bool "squelch gpsd_report and gpsd_hexdump to save cpu"
 
-config BR2_PACKAGE_GPSD_PYTHON
-	bool "build Python support and modules"
-	depends on BR2_USE_WCHAR # python3
-	select BR2_PACKAGE_PYTHON3
-	help
-	  Python libraries and tools for the gpsd service daemon
-	  including gpsfake test harness.
-
-comment "python support needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
-
 comment "Protocols"
 
 config BR2_PACKAGE_GPSD_AIVDM
@@ -221,4 +210,15 @@ config BR2_PACKAGE_GPSD_UBX
 	help
 	  uBlox UBX binary support
 
+config BR2_PACKAGE_GPSD_PYTHON
+	bool "build Python support and modules"
+	depends on BR2_USE_WCHAR # python3
+	select BR2_PACKAGE_PYTHON3
+	help
+	  Python libraries and tools for the gpsd service daemon
+	  including gpsfake test harness.
+
+comment "python support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
