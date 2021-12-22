Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AB2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7D254060B;
	Wed, 22 Dec 2021 17:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8nWfg9-i34D; Wed, 22 Dec 2021 17:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9591840AC1;
	Wed, 22 Dec 2021 17:43:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2593F1BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 125634060B
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtbAGCzuoYK7 for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:43:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CAB740273
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:43:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0F1DD6000A;
 Wed, 22 Dec 2021 17:42:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1n05dg-0006zQ-4Q; Wed, 22 Dec 2021 18:42:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 18:42:45 +0100
Message-Id: <20211222174246.26822-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] pakage/apache: security bump to version 2.4.52
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

  *) SECURITY: CVE-2021-44790: Possible buffer overflow when parsing
     multipart content in mod_lua of Apache HTTP Server 2.4.51 and
     earlier (cve.mitre.org)
     A carefully crafted request body can cause a buffer overflow in
     the mod_lua multipart parser (r:parsebody() called from Lua
     scripts).
     The Apache httpd team is not aware of an exploit for the
     vulnerabilty though it might be possible to craft one.
     This issue affects Apache HTTP Server 2.4.51 and earlier.
     Credits: Chamal

  *) SECURITY: CVE-2021-44224: Possible NULL dereference or SSRF in
     forward proxy configurations in Apache HTTP Server 2.4.51 and
     earlier (cve.mitre.org)
     A crafted URI sent to httpd configured as a forward proxy
     (ProxyRequests on) can cause a crash (NULL pointer dereference)
     or, for configurations mixing forward and reverse proxy
     declarations, can allow for requests to be directed to a
     declared Unix Domain Socket endpoint (Server Side Request
     Forgery).
     This issue affects Apache HTTP Server 2.4.7 up to 2.4.51
     (included).

For more details, see the changes file:
https://downloads.apache.org/httpd/CHANGES_2.4.52

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 138717c336..014d920772 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.51.tar.bz2.{sha256,sha512}
-sha256  20e01d81fecf077690a4439e3969a9b22a09a8d43c525356e863407741b838f4  httpd-2.4.51.tar.bz2
-sha512  9fb07c4b176f5c0485a143e2b1bb1085345ca9120b959974f68c37a8911a57894d2cb488b1b42fdf3102860b99e890204f5e9fa7ae3828b481119c563812cc66  httpd-2.4.51.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.52.tar.bz2.{sha256,sha512}
+sha256  0127f7dc497e9983e9c51474bed75e45607f2f870a7675a86dc90af6d572f5c9  httpd-2.4.52.tar.bz2
+sha512  97c021c576022a9d32f4a390f62e07b5f550973aef2f299fd52defce1a9fa5d27bd4a676e7bf214373ba46063d34aecce42de62fdd93678a4e925cfcbb2afdf6  httpd-2.4.52.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index ff01b25106..5fcb887fbc 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.51
+APACHE_VERSION = 2.4.52
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
