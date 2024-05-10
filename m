Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052EEC25B74
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBDF0404A3;
	Fri, 10 May 2024 21:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmdsbv1OmpIl; Fri, 10 May 2024 21:11:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9DC140643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9DC140643;
	Fri, 10 May 2024 21:11:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5935A1BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46345614FD
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8zNQiSF4R_r for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F163613CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F163613CA
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:11:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38F2386F4E; Fri, 10 May 2024 21:11:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 23:11:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fccd228bace3ea1cd12b9e3f3a9f989e7f60edb3
X-Git-Newrev: be710974525298eb7b565977ba7484b0614effb9
X-Patchwork-Hint: ignore
Message-Id: <20240510211132.38F2386F4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wavpack: bump to version 5.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=be710974525298eb7b565977ba7484b0614effb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of COPYING (year updated with
  https://github.com/dbry/WavPack/commit/b28fdab79dd8af2b8281d77097cf8f25e580e525)
- threads is an optional dependency since
  https://github.com/dbry/WavPack/commit/9ef0d37deb4f3f6def663079b18d3beea9cc10d2
- openssl dropped with
  https://github.com/dbry/WavPack/commit/c5b545146de8dd296f905183908cdcda682ed88b

https://github.com/dbry/WavPack/releases/tag/5.7.0
https://github.com/dbry/WavPack/blob/5.7.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wavpack/wavpack.hash | 4 ++--
 package/wavpack/wavpack.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index 2a2317a86c..e938386b76 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  af8035f457509c3d338b895875228a9b81de276c88c79bb2d3e31d9b605da9a9  wavpack-5.6.0.tar.xz
-sha256  275d65ec11a78d552d078b9c26d950e3075892bca895a415ceaaec33bcfabff9  COPYING
+sha256  e81510fd9ec5f309f58d5de83e9af6c95e267a13753d7e0bbfe7b91273a88bee  wavpack-5.7.0.tar.xz
+sha256  35a87c7390cd00e51e7a7cbb0486df7897201347e4625779248ace48e7e6cfbc  COPYING
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index b393a75197..25fe448c5f 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 5.6.0
+WAVPACK_VERSION = 5.7.0
 WAVPACK_SITE = \
 	https://github.com/dbry/WavPack/releases/download/$(WAVPACK_VERSION)
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.xz
@@ -18,11 +18,10 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WAVPACK_CONF_OPTS += LIBS=-liconv
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-WAVPACK_DEPENDENCIES += openssl
-WAVPACK_CONF_OPTS += --enable-libcrypto
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+WAVPACK_CONF_OPTS += --enable-threads
 else
-WAVPACK_CONF_OPTS += --disable-libcrypto
+WAVPACK_CONF_OPTS += --disable-threads
 endif
 
 # WavPack "autodetects" CPU type to enable ASM code. However, the assembly code
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
