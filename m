Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A45C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 11:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B616141132;
	Fri, 14 Oct 2022 11:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B616141132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7mTCJ-GikoW; Fri, 14 Oct 2022 11:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B757E4113D;
	Fri, 14 Oct 2022 11:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B757E4113D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10CB01BF327
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 11:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF1434224E
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 11:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1434224E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NcStgdON89w for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 11:18:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F1F24224C
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F1F24224C
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 11:18:36 +0000 (UTC)
Received: from opfednr06.francetelecom.fr (unknown [xx.xx.xx.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr22.francetelecom.fr (ESMTP service) with ESMTPS id 4MpkQy1PkXz10Rr; 
 Fri, 14 Oct 2022 13:18:34 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 14 Oct 2022 13:18:31 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 14 Oct 2022 13:18:27 +0200
Message-ID: <8818_1665746314_6349458A_8818_181_1_964b37c54bd0ea2c0ca9a24787249f3276aec699.1665746266.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
References: <2b0b6b796ff36967c963ba90f138a03d467ee5cf.1665746266.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX107.corporate.adroot.infra.ftgroup (10.115.27.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1665746314;
 bh=8SiAWg/yFKYH5nQ216JLW1mr71iswTp1OUe2mpsLVf8=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=cMl4PaHqzPWTQNXGuwFEyoZy2YXoSxQlonqyc/ZQhdEmzV5rRxC/fOcoTkCCf1G1c
 v5XaBQg/zxzj/l6ENA4JqOct8/gSpWmkJSWEV7/kuLhIkL3PWEkYoXkNNWKysyQEqe
 xCXG+/qizjqx8b4sVNG3FlKi2giFIEZOqj6LyucRlZSAU3BubsVGaeVFn4VZmjGqq1
 UcdYfaLYo7XOALgVtALV1hnhGIKmvNHxayhhypbKx4ONSPHnsUJafUVHJ3jHhGG4va
 4UIi2/a4H8trPZM5Yo+DMcTZlnW1W3Z4OLBq0mp95SCAyFw4jhfkzJNhayniyFeZBU
 LRkqX4L1gsiNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=cMl4PaHq
Subject: [Buildroot] [PATCH 3/3] toolchain: suppot gconv modules fro mglibc
 >= 2.34
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, yann.morin@orange.com,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Startig with glibc 2.34, the gconv modules description has been split in
two:
  - a common definition in the old location, /usr/lib/gconv/gconv-modules
  - specific defitions in a subdirectory, /usr/lib/gconv/gconv-modules.d/

This is done so as to simplify the handling of glibc gconv modules, and
eventually to segregate those outside of glibc, and so that third-parties
may also provide their own gconv converters and their definitions.

And starting with that same glibc version, most of the gconv modules
definition is moved to an extra configuration file in that
sub-directory.

It is thus no longer possible to use special code pages, like cp850,
which are very usefull to access FAT-formatted devices.

Add suppot for this new gconv layout, while keeping support for older
glibc versions. Note that the modules themselves are not moved or
renaed, just the definition files have changed.

Instead of passing the one old gonv modules definitions file on stdin,
we pass the base directory to that file, and move into the script the
responsibility to find all the gconv definition files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 support/scripts/expunge-gconv-modules | 22 ++++++++++++++++------
 toolchain/toolchain.mk                |  9 +++++++--
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/support/scripts/expunge-gconv-modules b/support/scripts/expunge-gconv-modules
index bc60fc0ce4..e9ac48ca3f 100755
--- a/support/scripts/expunge-gconv-modules
+++ b/support/scripts/expunge-gconv-modules
@@ -1,11 +1,17 @@
 #!/usr/bin/env bash
 
 # This script is used to generate a gconv-modules file that takes into
-# account only the gconv modules installed by Buildroot. It receives
-# on its standard input the original complete gconv-modules file from
-# the toolchain, and as arguments the list of gconv modules that were
-# actually installed, and writes on its standard output the new
-# gconv-modules file.
+# account only the gconv modules installed by Buildroot, and generates
+# a stripped-down gconv-moduels file on its stdout.
+# It takes two arguments:
+#   $1: the directory where to look for gconv modules definitions
+#   $2: a space-separated list of gconv modules that were actually
+#       installed
+
+# Starting with glibc-2.34, modules definitions are located in multiple
+# files:
+#   ${1}/gconv-modules
+#   ${1}/gconv-modules.d/*.conf
 
 # The format of gconv-modules is precisely documented in the
 # file itself. It consists of two different directives:
@@ -19,7 +25,11 @@
 # we handle each with slightly different code, since the second never has
 # associated aliases.
 
-awk -v files="${2}" '
+for f in ${1}/gconv-modules ${1}/gconv-modules.d/*.conf; do
+    [ -e "${f}" ] || continue
+    cat "${f}"
+done \
+|awk -v files="${2}" '
 $1 == "alias" {
     aliases[$3] = aliases[$3] " " $2;
 }
diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index 08d1649603..fe87a72ed4 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -27,6 +27,10 @@ define TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 		$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/$${d}/gconv/*.so \
 				   $(TARGET_DIR)/usr/lib/gconv \
 		|| exit 1; \
+		if [ -d $(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules.d ]; then \
+			cp -a $(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules.d \
+				$(TARGET_DIR)/usr/lib/gconv/ || exit 1; \
+		fi; \
 	else \
 		for l in $(TOOLCHAIN_GLIBC_GCONV_LIBS); do \
 			$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/$${d}/gconv/$${l}.so \
@@ -41,8 +45,9 @@ define TOOLCHAIN_GLIBC_COPY_GCONV_LIBS
 				 || exit 1; \
 			done; \
 		done; \
-		./support/scripts/expunge-gconv-modules "$(TOOLCHAIN_GLIBC_GCONV_LIBS)" \
-			<$(STAGING_DIR)/usr/lib/$${d}/gconv/gconv-modules \
+		./support/scripts/expunge-gconv-modules \
+			$(STAGING_DIR)/usr/lib/$${d}/gconv \
+			"$(TOOLCHAIN_GLIBC_GCONV_LIBS)" \
 			>$(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
 	fi
 endef
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
