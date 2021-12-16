Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AE5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38687417D3;
	Thu, 16 Dec 2021 20:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vik4WWna-LOv; Thu, 16 Dec 2021 20:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B90741798;
	Thu, 16 Dec 2021 20:17:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11B291BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCD4E6103B
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8ckpRHt4ynR for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10A7461053
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 71E9B81EB3; Thu, 16 Dec 2021 20:11:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 21:08:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59a1fcc69620da8eab1c048977fa22d297b18284
X-Git-Newrev: cca2c19ea3f02abeba971c9957af234da6d823ca
X-Patchwork-Hint: ignore
Message-Id: <20211216201118.71E9B81EB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jansson: bump to version 2.14
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cca2c19ea3f02abeba971c9957af234da6d823ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://jansson.readthedocs.io/en/latest/changes.html#version-2-14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/jansson/jansson.hash | 2 +-
 package/jansson/jansson.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
index 5c19316981..0d9dc7b5a5 100644
--- a/package/jansson/jansson.hash
+++ b/package/jansson/jansson.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  f4f377da17b10201a60c1108613e78ee15df6b12016b116b6de42209f47a474f  jansson-2.13.1.tar.gz
+sha256  fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9  jansson-2.14.tar.bz2
 sha256  1fff7d37d22157bcd81ab53b6c54da755d7c2f868f15807d9bde920f10730da0  LICENSE
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 2761ce9b16..99e1817eef 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.13.1
-JANSSON_SITE = http://www.digip.org/jansson/releases
+JANSSON_VERSION = 2.14
+JANSSON_SOURCE = jansson-$(JANSSON_VERSION).tar.bz2
+JANSSON_SITE = \
+	https://github.com/akheron/jansson/releases/download/v$(JANSSON_VERSION)
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
 JANSSON_CPE_ID_VENDOR = jansson_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
