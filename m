Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0457C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:28:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F1DB60F94
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F1DB60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 157F1404B6;
	Mon, 27 Sep 2021 19:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t21-TP83kwul; Mon, 27 Sep 2021 19:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26B2E40173;
	Mon, 27 Sep 2021 19:28:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5AC531BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49CDA404C7
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o9nT60ug9xsL for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:28:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92BD2404B8
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:28:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D7F858D388; Mon, 27 Sep 2021 19:25:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 21:27:52 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: bdc7e494a11811bce95c65d00f8cd0d767f07c3c
X-Git-Newrev: 3cee0ac57046ddacc59b55bb4323166eb28678b3
X-Patchwork-Hint: ignore
Message-Id: <20210927192555.D7F858D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/apache: security
 bump to version 2.4.49
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cee0ac57046ddacc59b55bb4323166eb28678b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2021-33193: A crafted method sent through HTTP/2 will bypass
validation and be forwarded by mod_proxy, which can lead to request
splitting or cache poisoning. This issue affects Apache HTTP Server
2.4.17 to 2.4.48.

https://github.com/apache/httpd/blob/2.4.49/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 868367222b6bda2fa4c155a1c6334e7efbdbf62b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index c03934b40a..49efefebb9 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From http://archive.apache.org/dist/httpd/httpd-2.4.46.tar.bz2.{sha256,sha512}
-sha256  1bc826e7b2e88108c7e4bf43c026636f77a41d849cfb667aa7b5c0b86dbf966c  httpd-2.4.48.tar.bz2
-sha512  6c250626f1e7d10428a92d984fd48ff841effcc8705f7816ab71b681bbd51d0012ad158dcd13763fe7d630311f2de258b27574603140d648be42796ab8326724  httpd-2.4.48.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.49.tar.bz2.{sha256,sha512}
+sha256  65b965d6890ea90d9706595e4b7b9365b5060bec8ea723449480b4769974133b  httpd-2.4.49.tar.bz2
+sha512  418e277232cf30a81d02b8554e31aaae6433bbea842bdb81e47a609469395cc4891183fb6ee02bd669edb2392c2007869b19da29f5998b8fd5c7d3142db310dd  httpd-2.4.49.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 403dc0f761..047a5ad446 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.48
+APACHE_VERSION = 2.4.49
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
