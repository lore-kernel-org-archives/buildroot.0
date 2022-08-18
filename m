Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8E7C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5556410CD;
	Thu, 18 Aug 2022 06:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5556410CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KkqK2swMenpC; Thu, 18 Aug 2022 06:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 097A1408F0;
	Thu, 18 Aug 2022 06:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 097A1408F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B49C1BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62D8641BA8
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D8641BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6SW2orSUSv6 for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:31:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DDD441B88
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DDD441B88
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BF4F887995; Thu, 18 Aug 2022 06:16:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 08:25:54 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: dfdeccd91245f3af0ff4a28530fc2f6affedebf4
X-Git-Newrev: b83c653199b52f454c09f70b717b090742825ac9
X-Patchwork-Hint: ignore
Message-Id: <20220818061635.BF4F887995@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/pppd: fix build
 with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=b83c653199b52f454c09f70b717b090742825ac9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following build failure with libressl:

eap-tls.c: In function 'ssl_msg_callback':
eap-tls.c:1284:10: error: 'SSL3_RT_HEADER' undeclared (first use in this function); did you mean 'SSL3_RT_ALERT'?
 1284 |     case SSL3_RT_HEADER:
      |          ^~~~~~~~~~~~~~
      |          SSL3_RT_ALERT

Fixes:
 - http://autobuild.buildroot.org/results/7d721833bddf73531fa03b0a626511af6826d0df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b78ecb7ef80a558f508bd9ca6b2b6439040b442b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...02-pppd-eap-tls.c-fix-build-with-libressl.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch b/package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch
new file mode 100644
index 0000000000..aefdc5b7a4
--- /dev/null
+++ b/package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch
@@ -0,0 +1,36 @@
+From b0a011bc4abac8cb3de8dfff42b754ed236ecf0f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 4 Jul 2022 10:07:03 +0200
+Subject: [PATCH] pppd/eap-tls.c: fix build with libressl (#338)
+
+Fix the following build failure with libressl:
+
+eap-tls.c: In function 'ssl_msg_callback':
+eap-tls.c:1284:10: error: 'SSL3_RT_HEADER' undeclared (first use in this function); did you mean 'SSL3_RT_ALERT'?
+ 1284 |     case SSL3_RT_HEADER:
+      |          ^~~~~~~~~~~~~~
+      |          SSL3_RT_ALERT
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7d721833bddf73531fa03b0a626511af6826d0df
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and backported) from:
+https://github.com/ppp-project/ppp/commit/b0a011bc4abac8cb3de8dfff42b754ed236ecf0f]
+---
+ pppd/eap-tls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pppd/eap-tls.c b/pppd/eap-tls.c
+index b9bab842..40796d58 100644
+--- a/pppd/eap-tls.c
++++ b/pppd/eap-tls.c
+@@ -61,7 +61,7 @@
+ #include "mppe.h"
+ #include "pathnames.h"
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ 
+ #define TLS_method SSLv23_method
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
