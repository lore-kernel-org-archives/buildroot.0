Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27647C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CF9940528;
	Tue, 22 Nov 2022 22:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CF9940528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zUaLZmv-ClO4; Tue, 22 Nov 2022 22:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C14B940A01;
	Tue, 22 Nov 2022 22:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C14B940A01
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3C951BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78B9840A01
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78B9840A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59Yj-N1btQie for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:23:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0B754012F
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0B754012F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CE45841CD; Tue, 22 Nov 2022 22:23:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 23:17:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4187b38f270cf170334b15b595b88136102eb20b
X-Git-Newrev: 72fa60dc102679f51b228336ec38f5af78ff7646
X-Patchwork-Hint: ignore
Message-Id: <20221122222301.8CE45841CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sscep: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=72fa60dc102679f51b228336ec38f5af78ff7646
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

SSCEP is a client-only implementation of the SCEP (Cisco System's Simple
Certificate Enrollment Protocol).

The goal of SCEP is to support the secure issuance of certificates to
network devices in a scalable manner, using existing technology whenever
possible. The protocol supports the following operations:

* CA and RA public key distribution
* Certificate enrollment
* Certificate and CRL query

Certificate and CRL access can be achieved by using the LDAP protocol,
or by using the query messages defined in SCEP.

CC: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/sscep/Config.in  |  9 +++++++++
 package/sscep/sscep.hash |  3 +++
 package/sscep/sscep.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fb6b329087..3f1ed0ef12 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -682,6 +682,7 @@ F:	package/luaexpat/
 F:	package/xinetd/
 
 N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
+F:	package/sscep/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
diff --git a/package/Config.in b/package/Config.in
index 7b18859d02..6290e103bb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1952,6 +1952,7 @@ menu "Networking"
 	source "package/slirp4netns/Config.in"
 	source "package/snmppp/Config.in"
 	source "package/sofia-sip/Config.in"
+	source "package/sscep/Config.in"
 	source "package/sysrepo/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
diff --git a/package/sscep/Config.in b/package/sscep/Config.in
new file mode 100644
index 0000000000..8907578062
--- /dev/null
+++ b/package/sscep/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SSCEP
+	bool "sscep"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  SSCEP is a client-only implementation of the SCEP
+	  (Cisco System's Simple Certificate Enrollment Protocol).
+
+	  https://github.com/certnanny/sscep
+
diff --git a/package/sscep/sscep.hash b/package/sscep/sscep.hash
new file mode 100644
index 0000000000..549c63b918
--- /dev/null
+++ b/package/sscep/sscep.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  489cc8e093986776eb3f15082bf766778f707176f3cd604bf0ef1008da06b8e5  sscep-0.10.0.tar.gz
+sha256  e1328c292102a22c10e8dcfbfda33740f603767c73f8c5b5189c5513eb6b4dea  COPYING
diff --git a/package/sscep/sscep.mk b/package/sscep/sscep.mk
new file mode 100644
index 0000000000..782bd358ed
--- /dev/null
+++ b/package/sscep/sscep.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# sscep
+#
+################################################################################
+
+SSCEP_VERSION = 0.10.0
+SSCEP_SITE = $(call github,certnanny,sscep,v$(SSCEP_VERSION))
+SSCEP_LICENSE = BSD-2-Clause, OpenSSL, OpenOSP
+SSCEP_LICENSE_FILES = COPYING
+SSCEP_AUTORECONF = YES
+SSCEP_DEPENDENCIES = host-pkgconf openssl
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
