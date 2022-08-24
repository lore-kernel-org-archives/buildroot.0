Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93EFC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A5996106E;
	Sun, 11 Sep 2022 09:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A5996106E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlz3X0Ct7Jha; Sun, 11 Sep 2022 09:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 183646FB5C;
	Sun, 11 Sep 2022 09:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 183646FB5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1113C1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C59F98195C
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C59F98195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wfSvmSeY3TU for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73EDF80C1C
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73EDF80C1C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 720AA83518; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 13:32:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22d10e294cc9cd30fa8adc3672a337167e6241a3
X-Git-Newrev: ab105fda88047e21cfcd7e02b85220918b8b134b
X-Patchwork-Hint: ignore
Message-Id: <20220911084827.720AA83518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/serd: bump to version 0.30.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab105fda88047e21cfcd7e02b85220918b8b134b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package
- Update hash of COPYING (update in year:
  https://github.com/drobilla/serd/commit/0e7053de7086423484e5a8f2c0db76efba4ed257)

https://github.com/drobilla/serd/blob/v0.30.14/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/serd/serd.hash |  6 +++---
 package/serd/serd.mk   | 12 ++++--------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/package/serd/serd.hash b/package/serd/serd.hash
index d64a2aa271..c8a45a0831 100644
--- a/package/serd/serd.hash
+++ b/package/serd/serd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# http://download.drobilla.net/serd-0.30.10.tar.bz2.sig
-sha256  affa80deec78921f86335e6fc3f18b80aefecf424f6a5755e9f2fa0eb0710edf  serd-0.30.10.tar.bz2
-sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
+# http://download.drobilla.net/serd-0.30.14.tar.xz.sig
+sha256  a14137d47b11d6ad431e78da341ca9737998d9eaccf6a49263d4c8d79fd856e3  serd-0.30.14.tar.xz
+sha256  13b62d3705cabee6a21730eb24f773249271c2d95e9ecbab16069e729d4ae147  COPYING
diff --git a/package/serd/serd.mk b/package/serd/serd.mk
index 85b16f6866..7922e777c8 100644
--- a/package/serd/serd.mk
+++ b/package/serd/serd.mk
@@ -4,17 +4,13 @@
 #
 ################################################################################
 
-SERD_VERSION = 0.30.10
+SERD_VERSION = 0.30.14
 SERD_SITE = https://download.drobilla.net
-SERD_SOURCE = serd-$(SERD_VERSION).tar.bz2
+SERD_SOURCE = serd-$(SERD_VERSION).tar.xz
 SERD_LICENSE = ISC
 SERD_LICENSE_FILES = COPYING
 SERD_INSTALL_STAGING = YES
 
-SERD_CONF_OPTS += --largefile --no-coverage
+SERD_CONF_OPTS += -Ddocs=disabled -Dstatic=false -Dtests=disabled
 
-ifeq ($(BR2_STATIC_LIBS),y)
-SERD_CONF_OPTS += --static --no-shared --static-progs
-endif
-
-$(eval $(waf-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
