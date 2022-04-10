Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C38CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 21:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A637760EA5;
	Sun, 10 Apr 2022 21:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id degadCINYHZg; Sun, 10 Apr 2022 21:49:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF50560E48;
	Sun, 10 Apr 2022 21:49:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 519A11BF3D8
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40C7460AB5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsThzbPeQCll for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 21:48:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CD8960A75
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 21:48:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 147138397D; Sun, 10 Apr 2022 21:39:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 23:48:12 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 38a9dd649f0f559c0f438becb1e506950bc7a99a
X-Git-Newrev: 42706456fc912f76a2ec9842f52e7836a69ea0f3
X-Patchwork-Hint: ignore
Message-Id: <20220410213903.147138397D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/haproxy: security
 bump to version 2.4.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=42706456fc912f76a2ec9842f52e7836a69ea0f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-0711: A flaw was found in the way HAProxy processed HTTP
responses containing the "Set-Cookie2" header. This flaw could allow an
attacker to send crafted HTTP response packets which lead to an infinite
loop, eventually resulting in a denial of service condition. The highest
threat from this vulnerability is availability.

https://www.mail-archive.com/haproxy@formilux.org/msg41963.html
https://www.mail-archive.com/haproxy@formilux.org/msg41873.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f09fc6f958bebc742b0b0c2774eafe988807ad50)
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
