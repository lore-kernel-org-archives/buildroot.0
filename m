Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0A8CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84BD661121;
	Sun, 17 Sep 2023 12:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84BD661121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8WJ3-sZX7-nY; Sun, 17 Sep 2023 12:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0957610F9;
	Sun, 17 Sep 2023 12:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0957610F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DE021BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 224ED81ED3
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 224ED81ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmfkRToRPmpX for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:49:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51FDC81ECC
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51FDC81ECC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 411BD87166; Sun, 17 Sep 2023 12:49:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 14:41:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc4110b0739f07436cb8c0ff837b7284835fb9b8
X-Git-Newrev: 8fc24fbd173a3d7565d3b3db4adebcb2244568a5
X-Patchwork-Hint: ignore
Message-Id: <20230917124914.411BD87166@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haproxy: security bump to version
 2.6.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fc24fbd173a3d7565d3b3db4adebcb2244568a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-40225: HAProxy through 2.0.32, 2.1.x and 2.2.x through
2.2.30, 2.3.x and 2.4.x through 2.4.23, 2.5.x and 2.6.x before 2.6.15,
2.7.x before 2.7.10, and 2.8.x before 2.8.2 forwards empty
Content-Length headers, violating RFC 9110 section 8.6. In uncommon
cases, an HTTP/1 server behind HAProxy may interpret the payload as an
extra request.

https://www.mail-archive.com/haproxy@formilux.org/msg43864.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 20048da7ec..74390c2ff5 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.14.tar.gz.sha256
-sha256  bd3dd9fa60391ca09e1225e1ac3163e45be83c3f54f2fd76a30af289cc6e4fd4  haproxy-2.6.14.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.15.tar.gz.sha256
+sha256  41f8e1695e92fafdffe39690a68993f1a0f5f7f06931a99e9a153f749ea39cfd  haproxy-2.6.15.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 2b8920efa6..63a92090f3 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).14
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).15
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
