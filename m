Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C5FC71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 21:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C4F8102F;
	Mon,  7 Jul 2025 21:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5K8EEWbtMwy; Mon,  7 Jul 2025 21:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C49780E74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C49780E74;
	Mon,  7 Jul 2025 21:17:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B45815F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CDEE612AD
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bj_t7EAkDy6e for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 21:17:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC23C61278
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC23C61278
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC23C61278
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:17:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id YtDZuZvBut6p9YtDaukSN2; Mon, 07 Jul 2025 23:17:42 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  7 Jul 2025 23:16:25 +0200
Message-Id: <20250707211625.3673431-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250707211625.3673431-1-giulio.benetti@benettiengineering.com>
References: <20250707211625.3673431-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPy8cUMoyN7q+cy/3kVL7gIOJatwcNKIsHTKcak1G1PfsBkKsSISetU97aOvkVXvmkL1A8vxnuiu4OjvpA8msakumcjNFf9NNfxF+2B3+4wcXkg7B0Kj
 OcyYQqbcB1RaTVqw9a8/EXFMggJzjIlxX/8z3DP4han9lXX16BtdEQDchcdRTK/FrlXASB7RjFhmhXBHspy4F1C0TAxNzjEkUQ7vruezegxEtsTlsN3u9UCF
 cNot9Y8BGKogp6+i1birLUyj/qdxiJDEvvG4u9grGWk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751923062; bh=gw7v3vC+/89Ku3mYoIXYaSCSyq/onMMVJAejPB/rjqQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=OpJul0ZPyJ8qO+WAk/YN84gqCOUsn+x2E47TlUnK3z2iy8CRfVIxir5N8vWUdZgxg
 N5IaMMcelYcZmLhOQa5++OFRCG6/INhFhGvQLUeAeNvExbMWsszMOw8n08fLnuLYBB
 1CqDj0ks88RC978nQr9paSlH2HZurHi82i2IQp8Bagq2ESFMBheV5Qme48Yllxy6L3
 nTAEonBNwOzldpP3KRu4qeSv/uj5pyxcsiqywhmjrN6RvOwOtrSWwgDOMwQ+IN566B
 5ZYvg+KlbELLoXWJRMO18UMKOWj7R0KFW0KaFahkB6yaZFAPCv1Kuh0NpAXhPuYPXE
 i1G4jNBQDUVGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OpJul0ZP
Subject: [Buildroot] [PATCH] package/liblo: bump to version 0.32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* Drop upstreamed local patch
* Add local patch pending upstream to fix build failure as static
  library
* Re-enable ipv6 support since it's been fixed upstream[1]

Release notes:
https://liblo.sourceforge.net/NEWS.html

[1]:
https://sourceforge.net/p/liblo/git/ci/968dff4d576ca102525c81beddb36a623890424b/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...x-use-after-free-warning-in-server.c.patch | 29 ----------------
 ...-fix-build-failure-as-static-library.patch | 34 +++++++++++++++++++
 package/liblo/liblo.hash                      |  8 ++---
 package/liblo/liblo.mk                        |  5 +--
 4 files changed, 39 insertions(+), 37 deletions(-)
 delete mode 100644 package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch
 create mode 100644 package/liblo/0001-server.c-fix-build-failure-as-static-library.patch

diff --git a/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch b/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch
deleted file mode 100644
index be815a0a61..0000000000
--- a/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8187a8456c14eeb3af08c86ffa1228823c9ef1c5 Mon Sep 17 00:00:00 2001
-From: Guido Aulisi <guido.aulisi@gmail.com>
-Date: Sun, 25 Jun 2023 15:58:30 +0200
-Subject: [PATCH] Fix use-after-free warning in server.c
-
-That assignment is not necessary before returning
-
-Upstream: https://sourceforge.net/p/liblo/git/ci/8187a8456c14eeb3af08c86ffa1228823c9ef1c5/
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/server.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/server.c b/src/server.c
-index ba02d8e..35c9ba5 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -2289,7 +2289,6 @@ int lo_server_del_lo_method(lo_server s, lo_method m)
-             free((void *) it->path);
-             free((void *) it->typespec);
-             free(it);
--            it = prev;
-             return 0;
-         }
-         prev = it;
--- 
-2.39.2
-
diff --git a/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch b/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch
new file mode 100644
index 0000000000..caeee536a0
--- /dev/null
+++ b/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch
@@ -0,0 +1,34 @@
+From 74b228c74c7821dbe16d7730040030eed2f01a28 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 7 Jul 2025 22:58:10 +0200
+Subject: [PATCH] server.c: fix build failure as static library
+
+As static library strncpy() can't determine precise maximum characters
+because strlen() is variable, so to fix build failure let's convert 3
+lines into one by using strdup() that does the same as the actual code.
+
+Upstream: https://sourceforge.net/p/liblo/patches/9/
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/server.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/server.c b/src/server.c
+index 130f6d5..1236279 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -2062,10 +2062,7 @@ static void dispatch_method(lo_server s, const char *path,
+                     char *tmp;
+                     char *sec;
+ 
+-                    int tmplen = (int) strlen(it->path + len) + 1;
+-                    tmp = (char*) malloc(strlen(it->path + len) + 1);
+-                    strncpy(tmp, it->path + len, tmplen);
+-                    tmp[tmplen-1]=0;
++                    tmp = strdup(it->path + len);
+                     sec = strchr(tmp, '/');
+                     if (sec)
+                         *sec = '\0';
+-- 
+2.39.5
+
diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index a3d34d796c..a87b6233dd 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.31/
-sha1  d188a62df51e29fa98861daec1db0fdae400410d  liblo-0.31.tar.gz
-md5  14378c1e74c58e777fbb4fcf33ac5315  liblo-0.31.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.32/
+sha1  e660cf3f630f9255a626102b4ff5082114ebd8a1  liblo-0.32.tar.gz
+md5  a93a7a9da084e6a0937bde6fc324a52a  liblo-0.32.tar.gz
 
 # Locally computed
-sha256  2b4f446e1220dcd624ecd8405248b08b7601e9a0d87a0b94730c2907dbccc750  liblo-0.31.tar.gz
+sha256  5df05f2a0395fc5ac90f6b538b8c82bb21941406fd1a70a765c7336a47d70208  liblo-0.32.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 27dba1f99f..c47e06c0a3 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.31
+LIBLO_VERSION = 0.32
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
 LIBLO_LICENSE_FILES = COPYING
 LIBLO_INSTALL_STAGING = YES
 
-# IPv6 support broken, issue known upstream
-LIBLO_CONF_OPTS = --disable-ipv6
-
 # Liblo uses atomic builtins, so we need to link with libatomic for
 # the architectures who explicitly need libatomic.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
