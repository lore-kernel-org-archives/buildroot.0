Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A30EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 12:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 664AA40650;
	Mon, 21 Aug 2023 12:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664AA40650
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pg7PuBLmZqiX; Mon, 21 Aug 2023 12:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CB8D40546;
	Mon, 21 Aug 2023 12:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CB8D40546
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8371A1BF388
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 12:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A04E4036E
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 12:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A04E4036E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjfPobCQtn7u for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 12:52:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21F6E40134
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 12:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F6E40134
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 103BB85F8C; Mon, 21 Aug 2023 12:52:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 14:47:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 171977f4bf63a9a11da8c1b9b24269c6d73dd8c3
X-Git-Newrev: b9a864d03d66b1132f484060f3724182f51cdfbc
X-Patchwork-Hint: ignore
Message-Id: <20230821125202.103BB85F8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: security bump version
 to 1.10.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9a864d03d66b1132f484060f3724182f51cdfbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/signalwire/freeswitch/releases/tag/v1.10.10
"This is a major release containing critical security fixes, adding
 Debian 12 Bookworm, OpenSSL 3 and FFmpeg5 support."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 3497a3283f..504be12090 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.9.-release.tar.xz.sha256
-sha256  f649d53af7beccb59c1d03864cd8f2d287e4ea26ef652b5c4969d29121ced063  freeswitch-1.10.9.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.10.-release.tar.xz.sha256
+sha256  d2c702c7f4bd6eca539c3981cf859ad5c1846d9283829e24cd75686f2322b9df  freeswitch-1.10.10.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 7497cc4964..07d436cf0b 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.9
+FREESWITCH_VERSION = 1.10.10
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
