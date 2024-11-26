Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA2BE77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49BAA81190;
	Sun,  8 Dec 2024 13:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZMxUFkVkfSG; Sun,  8 Dec 2024 13:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CA0B81217
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA0B81217;
	Sun,  8 Dec 2024 13:08:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F62979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AD4D607E6
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5ehQUlo3ejM for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E57460731
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E57460731
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09B8E86B75; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 19:47:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9aedec00d23904756382f59311ab06ff1955be8a
X-Git-Newrev: 456d89ebdd8035be533906d8f2d56e3bfcddb43e
X-Patchwork-Hint: ignore
Message-Id: <20241208130653.09B8E86B75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.107
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=456d89ebdd8035be533906d8f2d56e3bfcddb43e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_107.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
[Julien: add release note link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 36e2296d38..fe29029633 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_106_RTM/src/SHA256SUMS
-sha256  026b744e1e0784b890c3846ac9506472a92138c1f4d41dec581949574c585c38  nss-3.106.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_107_RTM/src/SHA256SUMS
+sha256  7f7e96473e38150771a615f5d40e8c41ba3a19385301ae0c525091f2fc9d6729  nss-3.107.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0c3c24b664..d0f02a7b74 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.106
+LIBNSS_VERSION = 3.107
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
