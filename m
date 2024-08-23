Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EFCE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B40B84891;
	Fri,  6 Sep 2024 20:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjVNkHAFpozP; Fri,  6 Sep 2024 20:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73EE384966
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73EE384966;
	Fri,  6 Sep 2024 20:05:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE2A1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80BE161149
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWA4jP5P9XMe for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A4B36066C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A4B36066C
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0770286C5A; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:37:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7866b382bc7e1adc93925076f0b9719d78886e40
X-Git-Newrev: 4e492e449204274d25633b9c00c18e26c1ca7003
X-Patchwork-Hint: ignore
Message-Id: <20240906195857.0770286C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: update to 2.43.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e492e449204274d25633b9c00c18e26c1ca7003
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here the release announcement for changes:
https://sourceware.org/pipermail/binutils/2024-August/136396.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/{2.43 => 2.43.1}/0001-sh-conf.patch                  | 0
 .../binutils/{2.43 => 2.43.1}/0002-poison-system-directories.patch    | 0
 package/binutils/Config.in.host                                       | 4 ++--
 package/binutils/binutils.hash                                        | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/binutils/2.43/0001-sh-conf.patch b/package/binutils/2.43.1/0001-sh-conf.patch
similarity index 100%
rename from package/binutils/2.43/0001-sh-conf.patch
rename to package/binutils/2.43.1/0001-sh-conf.patch
diff --git a/package/binutils/2.43/0002-poison-system-directories.patch b/package/binutils/2.43.1/0002-poison-system-directories.patch
similarity index 100%
rename from package/binutils/2.43/0002-poison-system-directories.patch
rename to package/binutils/2.43.1/0002-poison-system-directories.patch
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 36fd2bd377..16a57a5cb4 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -23,7 +23,7 @@ config BR2_BINUTILS_VERSION_2_42_X
 	bool "binutils 2.42"
 
 config BR2_BINUTILS_VERSION_2_43_X
-	bool "binutils 2.43"
+	bool "binutils 2.43.1"
 
 endchoice
 
@@ -32,7 +32,7 @@ config BR2_BINUTILS_VERSION
 	default "arc-2023.09-release"	if BR2_BINUTILS_VERSION_ARC
 	default "2.41"		if BR2_BINUTILS_VERSION_2_41_X
 	default "2.42"		if BR2_BINUTILS_VERSION_2_42_X
-	default "2.43"		if BR2_BINUTILS_VERSION_2_43_X
+	default "2.43.1"	if BR2_BINUTILS_VERSION_2_43_X
 
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 74765a4fbf..084793fc9f 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,7 +1,7 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
 sha512  5df45d0bd6ddabdce4f35878c041e46a92deef01e7dea5facc97fd65cc06b59abc6fba0eb454b68e571c7e14038dc823fe7f2263843e6e627b7444eaf0fe9374  binutils-2.41.tar.xz
 sha512  155f3ba14cd220102f4f29a4f1e5cfee3c48aa03b74603460d05afb73c70d6657a9d87eee6eb88bf13203fe6f31177a5c9addc04384e956e7da8069c8ecd20a6  binutils-2.42.tar.xz
-sha512  93e063163e54d6a6ee2bd48dc754270bf757a3635b49a702ed6b310e929e94063958512d191e66beaf44275f7ea60865dbde138b624626739679fcc306b133bb  binutils-2.43.tar.xz
+sha512  20977ad17729141a2c26d358628f44a0944b84dcfefdec2ba029c2d02f40dfc41cc91c0631044560d2bd6f9a51e1f15846b4b311befbe14f1239f14ff7d57824  binutils-2.43.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  binutils-gdb-arc-2023.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
