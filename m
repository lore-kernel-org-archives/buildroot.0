Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99497CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 332A9812E9;
	Sun, 15 Oct 2023 20:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 332A9812E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DmLb2WDJEaGc; Sun, 15 Oct 2023 20:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 527F281AC4;
	Sun, 15 Oct 2023 20:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 527F281AC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3371F1BF2C1
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09B44402D0
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09B44402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvSoY8UudqnJ for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:47:58 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1236E401ED
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1236E401ED
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88F4DA4C0AF8
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 22:47:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44220)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qs81h-00043Y-32
 for buildroot@buildroot.org; Sun, 15 Oct 2023 22:47:54 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:47:53 +0200
Message-Id: <20231015204753.5775-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697402874;
 bh=20Rf6DXlulqgxsPvDv4FXMqGwElRpXzXa2YrXsaEU6E=;
 h=From:To:Subject:Date:From;
 b=p/cOYBTWVngtnDRA4NclovDghrYAzPHstGvjPJwVg9jD5gdqY4ZAESeV/1qDb9xLO
 iJqZVPaaC/O4KN4W9PDXBFoZvQkF+xyEdga7xel79w4OavKG/ZmAmYH5QKsBzLgC5F
 +TUA2KE62fZJB4dRvGU8Qnt7HAxHeTnARXBVeG9PUlLmksv2Bk8yVOjMUD5vg9gNfK
 fd5ogA0YmK6Ukv69QME9WA/Dk7WS25H/92ducQTeLNTfICk/soQ9PwO6vC+w6X2fK1
 4Dwa4Zm3eeGJGio4CL2opQnOAyj6/gTsCFMRbPaG5F3NEDna1FGn+Mcquc3NbI953D
 MnpP7g53u884A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=p/cOYBTW
Subject: [Buildroot] [PATCH 1/1] package/pppd: disable for sparc and sparc64
 architectures
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pppd fails to build on sparc and sparc64 architectures with a
redefinition of 'struct termio' error, with no proper fix or workaround
for now. See discussions in [1] and [2] and picocom source code in [3].

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20191227204520.1500501-1-fontaine.fabrice@gmail.com/
[2] http://patchwork.ozlabs.org/project/buildroot/patch/20200511142602.46170-1-vadim4j@gmail.com/
[3] https://github.com/npat-efault/picocom/blob/master/termbits2.h#L37

So let's disable it for now on sparc and sparc64 architectures.

Fixes:
http://autobuild.buildroot.net/results/c0a/c0a9dd410664dec670f90966e12b76e68f9883ee/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/network-manager/Config.in | 1 +
 package/pppd/Config.in            | 8 ++++++++
 package/rp-pppoe/Config.in        | 1 +
 3 files changed, 10 insertions(+)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 57d7543131..8c284024e1 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -48,6 +48,7 @@ config BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER
 
 config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	bool "pppd support"
+	depends on !BR2_sparc64 && !BR2_sparc # pppd
 	select BR2_PACKAGE_PPPD
 	help
 	  This option enables support for PPPD daemon
diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 88c2180a9b..3ff8123aab 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PPPD
 	bool "pppd"
+	depends on !BR2_sparc64 && !BR2_sparc
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_OPENSSL if BR2_TOOLCHAIN_USES_GLIBC
@@ -22,5 +23,12 @@ config BR2_PACKAGE_PPPD_FILTER
 endif
 
 comment "pppd needs a toolchain w/ dynamic library"
+	depends on !BR2_sparc64 && !BR2_sparc
 	depends on BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
+
+# pppd is disabled for sparc and sparc64 architectures because it fails
+# to build with a redefinition of 'struct termio' error, with no proper
+# fix or workaround for now
+comment "pppd is disabled for sparc and sparc64 architectures"
+	depends on BR2_sparc64 || BR2_sparc
diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index 6ff005a1e1..27eb0276db 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -4,6 +4,7 @@ comment "rp-pppoe needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_RP_PPPOE
 	bool "rp-pppoe"
+	depends on !BR2_sparc64 && !BR2_sparc # pppd
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_PPPD
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
