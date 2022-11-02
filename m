Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AD9C43217
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92AB240ADD;
	Wed,  2 Nov 2022 22:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92AB240ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qz9jln8rfFsz; Wed,  2 Nov 2022 22:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C94D40AE1;
	Wed,  2 Nov 2022 22:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C94D40AE1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB6811BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 873E640B51
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 873E640B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcJKx51MDhxM for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:52:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2A37408E5
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2A37408E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2BB287AFE; Wed,  2 Nov 2022 22:52:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 23:50:31 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 3f41aa67f0717577219a2e276097a6cd887ca35d
X-Git-Newrev: 902e22ba5b4292d39bd750946a55412ea508ccfc
X-Patchwork-Hint: ignore
Message-Id: <20221102225212.B2BB287AFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libosip2:
 security bump to version 5.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=902e22ba5b4292d39bd750946a55412ea508ccfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fix CVE-2022-41550: GNU oSIP v5.3.0 was discovered to contain an integer
overflow via the component osip_body_parse_header.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4e6cede090f0ad129469d9cd621cdf74d578712d)
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
