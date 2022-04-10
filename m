Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A899C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 20:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2354440283;
	Sun, 10 Apr 2022 20:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rCuoxbQREYz; Sun, 10 Apr 2022 20:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C1FE401D6;
	Sun, 10 Apr 2022 20:06:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D598C1BF995
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D354D60BAA
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEBei2CrKi-i for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 20:05:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD84F60BA4
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 20:05:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9BC26838F5; Sun, 10 Apr 2022 19:56:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 22:04:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d485482b697f6af7ce4c33a33408c9ac82f9423d
X-Git-Newrev: f09fc6f958bebc742b0b0c2774eafe988807ad50
X-Patchwork-Hint: ignore
Message-Id: <20220410195609.9BC26838F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haproxy: security bump to version
 2.4.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=f09fc6f958bebc742b0b0c2774eafe988807ad50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-0711: A flaw was found in the way HAProxy processed HTTP
responses containing the "Set-Cookie2" header. This flaw could allow an
attacker to send crafted HTTP response packets which lead to an infinite
loop, eventually resulting in a denial of service condition. The highest
threat from this vulnerability is availability.

https://www.mail-archive.com/haproxy@formilux.org/msg41963.html
https://www.mail-archive.com/haproxy@formilux.org/msg41873.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index e3120b521f..18834c29b1 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.13.tar.gz.sha256
-sha256  4788fe975fe7e521746f826c25e80bc95cd15983e2bafa33e43bff23a3fe5ba1  haproxy-2.4.13.tar.gz
+# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.15.tar.gz.sha256
+sha256  3958b17b7ee80eb79712aaf24f0d83e753683104b36e282a8b3dcd2418e30082  haproxy-2.4.15.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 83d9cfee37..b498549e20 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.4
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).13
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).15
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
