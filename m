Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6AAC021A1
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 15:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 734EC40204;
	Sat, 14 Sep 2024 15:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ojDKv_7d3W3; Sat, 14 Sep 2024 15:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33FC94022E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33FC94022E;
	Sat, 14 Sep 2024 15:21:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 090401BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC512605C4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ieQFbrABJ_fF for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 15:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7AF1606BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7AF1606BE
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C32A782DEB; Sat, 14 Sep 2024 15:21:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 17:19:00 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5fe5d9b8944dbc3c8cb2e9894766874fdf008e73
X-Git-Newrev: 29405a94994496b309caf87ffba92ce4a9d4afae
X-Patchwork-Hint: ignore
Message-Id: <20240914152104.C32A782DEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python3: security
 bump to version 3.11.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=29405a94994496b309caf87ffba92ce4a9d4afae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issues:

- gh-115398: Allow controlling Expat >=2.6.0 reparse deferral
  (CVE-2023-52425) by adding five new methods:

        xml.etree.ElementTree.XMLParser.flush()
        xml.etree.ElementTree.XMLPullParser.flush()
        xml.parsers.expat.xmlparser.GetReparseDeferralEnabled()
        xml.parsers.expat.xmlparser.SetReparseDeferralEnabled()
        xml.sax.expatreader.ExpatParser.flush()

- gh-115243: Fix possible crashes in collections.deque.index() when the
  deque is concurrently modified.

- gh-114572: ssl.SSLContext.cert_store_stats() and
  ssl.SSLContext.get_ca_certs() now correctly lock access to the certificate
  store, when the ssl.SSLContext is shared across multiple threads.

For more details, see the changelog:
https://docs.python.org/release/3.11.9/whatsnew/changelog.html#python-3-11-9

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 962d32b5d9..c536c80e52 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3118/
-md5  b353b8433e560e1af2b130f56dfbd973  Python-3.11.8.tar.xz
+# From https://www.python.org/downloads/release/python-3119/
+md5  22ea467e7d915477152e99d5da856ddc  Python-3.11.9.tar.xz
 # Locally computed
-sha256  9e06008c8901924395bc1da303eac567a729ae012baa182ab39269f650383bb3  Python-3.11.8.tar.xz
+sha256  9b1e896523fc510691126c864406d9360a3d1e986acbda59cda57b5abda45b87  Python-3.11.9.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 950006698b..5f61456a74 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
