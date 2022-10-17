Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00340C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 08:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4F1F409F8;
	Mon, 17 Oct 2022 08:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4F1F409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1yKx7Va1P1n; Mon, 17 Oct 2022 08:39:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D17DD4053F;
	Mon, 17 Oct 2022 08:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D17DD4053F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 124E81BF38A
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE05160BD3
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE05160BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iOck8WrmLpLV for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 08:38:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EC2F6070A
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EC2F6070A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F14DD86E08; Mon, 17 Oct 2022 08:38:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 10:38:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99a570ee2b1368ca8b2be36c496bbe71224679ad
X-Git-Newrev: 4e6cede090f0ad129469d9cd621cdf74d578712d
X-Patchwork-Hint: ignore
Message-Id: <20221017083837.F14DD86E08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libosip2: security bump to version
 5.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e6cede090f0ad129469d9cd621cdf74d578712d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-41550: GNU oSIP v5.3.0 was discovered to contain an integer
overflow via the component osip_body_parse_header.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libosip2/libosip2.hash | 2 +-
 package/libosip2/libosip2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libosip2/libosip2.hash b/package/libosip2/libosip2.hash
index 071ad7e61a..a563f0c4cd 100644
--- a/package/libosip2/libosip2.hash
+++ b/package/libosip2/libosip2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  f4725916c22cf514969efb15c3c207233d64739383f7d42956038b78f6cae8c8  libosip2-5.3.0.tar.gz
+sha256  fe82fe841608266ac15a5c1118216da00c554d5006e2875a8ac3752b1e6adc79  libosip2-5.3.1.tar.gz
 
 # Hash for license file:
 sha256  8d9e95ed0e48df46dc758eb0d86df611f771eab4eed94bebb77dca87f1c897de  COPYING
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 2f9b7a9242..618d98a85c 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSIP2_VERSION = 5.3.0
+LIBOSIP2_VERSION = 5.3.1
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
 LIBOSIP2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
