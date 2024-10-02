Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BF8CF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ADFC41C28;
	Wed,  2 Oct 2024 21:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QY4E3E7UeZeg; Wed,  2 Oct 2024 21:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84F5F41C33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84F5F41C33;
	Wed,  2 Oct 2024 21:02:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27B521BF97E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 933A741061
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhByei0VzUJo for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C8EB40190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C8EB40190
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:02:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 451C784A09; Wed,  2 Oct 2024 21:02:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 23:01:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62e24c548bd894ff095670fc91620476d8cd3ae1
X-Git-Newrev: 74a2dbb8900334641108cb89a190adbce36c75ab
X-Patchwork-Hint: ignore
Message-Id: <20241002210218.451C784A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{avro-c,
 python-avro}: bump to version 1.12.0
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
Content-Type: multipart/mixed; boundary="===============7214680159620616000=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7214680159620616000==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=74a2dbb8900334641108cb89a190adbce36c75ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-3957-Fix-typos-in-docs-and-examples-2795.patch | 59 ----------------------
 package/avro-c/avro-c.hash                         |  4 +-
 package/avro-c/avro-c.mk                           |  2 +-
 package/python-avro/python-avro.hash               |  8 +--
 package/python-avro/python-avro.mk                 |  5 +-
 5 files changed, 9 insertions(+), 69 deletions(-)

diff --git a/package/avro-c/0001-AVRO-3957-Fix-typos-in-docs-and-examples-2795.patch b/package/avro-c/0001-AVRO-3957-Fix-typos-in-docs-and-examples-2795.patch
deleted file mode 100644
index 72faaa0abe..0000000000
--- a/package/avro-c/0001-AVRO-3957-Fix-typos-in-docs-and-examples-2795.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 52f051dbeefad0b7e73187becad6c33747b047d3 Mon Sep 17 00:00:00 2001
-From: Sahil Kang <sahil.kang@asilaycomputing.com>
-Date: Mon, 11 Mar 2024 03:01:21 -0700
-Subject: [PATCH] AVRO-3957: [C] Fix typos in docs and examples (#2795)
-
-* AVRO-3957: [C] Fix misformatted type in docs
-
-Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
-Signed-off-by: Sahil Kang <sahilkang@google.com>
-
-* AVRO-3957: [C] Fix type in quickstop example
-
-This removes the following warning:
-
-  avro/lang/c/examples/quickstop.c:123:40: warning: incompatible pointer types passing 'int32_t **' (aka 'int **') to parameter of type
-        'const char **' [-Wincompatible-pointer-types]
-                          avro_value_get_string(&first_value, &p, &size);
-
-Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
-Signed-off-by: Sahil Kang <sahilkang@google.com>
-
----------
-
-Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
-Signed-off-by: Sahil Kang <sahilkang@google.com>
-
-Upstream: https://github.com/apache/avro/commit/52f051dbeefad0b7e73187becad6c33747b047d3
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lang/c/docs/index.txt       | 2 +-
- lang/c/examples/quickstop.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/docs/index.txt b/docs/index.txt
-index a439a052631..df16f9d9678 100644
---- a/docs/index.txt
-+++ b/docs/index.txt
-@@ -178,7 +178,7 @@ different versions of the Avro library.  That means that it's really
- only safe to use these hash values internally within the context of a
- single execution of a single application.
- 
--The +reset+ method “clears out” an +avro_value_t instance, making sure
-+The +reset+ method “clears out” an +avro_value_t+ instance, making sure
- that it's ready to accept the contents of a new value.  For scalars,
- this is usually a no-op, since the new value will just overwrite the old
- one.  For arrays and maps, this removes any existing elements from the
-diff --git a/examples/quickstop.c b/examples/quickstop.c
-index ff9e9700590..b26dad10c04 100644
---- a/examples/quickstop.c
-+++ b/examples/quickstop.c
-@@ -107,7 +107,7 @@ int print_person(avro_file_reader_t db, avro_schema_t reader_schema)
- 	if (rval == 0) {
- 		int64_t id;
- 		int32_t age;
--		int32_t *p;
-+		const char *p;
- 		size_t size;
- 		avro_value_t id_value;
- 		avro_value_t first_value;
diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index 83b5759a16..8c6b4b625c 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.11.3/c/avro-c-1.11.3.tar.gz.sha512
-sha512  56ce8c6f0b06b779679a6e7a2b738ec94277920e9b3d7c6f1062a0b47db80b90dccf89df9d977ec1f120211f7c2f33845e18df4961818e5c5cc93aaec18e1302  avro-c-1.11.3.tar.gz
+# From https://downloads.apache.org/avro/avro-1.12.0/c/avro-c-1.12.0.tar.gz.sha512
+sha512  71f0a8b63e212a12d38c05ef0c8e17822af7eb38698e07550a15f49d3f976f015f31cd804784df76c16e6cf7129c0d1a5028cb78032ad0259b4d151dcf022099  avro-c-1.12.0.tar.gz
 
 # License files
 sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index d7efdc2003..0f1ada72f8 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update python-avro
-AVRO_C_VERSION = 1.11.3
+AVRO_C_VERSION = 1.12.0
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index e57b6a722b..3556692398 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.11.3/py/avro-1.11.3.tar.gz.sha512
-sha512  c2066b4dd8b55b0534fb5bb8fc5a81abcef76ab46458b666c98732811f632c34062c1a0cefaf370aa0843c1cad5bd822f9a6ef0ad88cda5177519a3d3c73072d  avro-1.11.3.tar.gz
-
-# License files
+# md5, sha256 from https://pypi.org/pypi/avro/json
+md5  03dbb66d68ad18a332a4f4bce0700ca9  avro-1.12.0.tar.gz
+sha256  cad9c53b23ceed699c7af6bddced42e2c572fd6b408c257a7d4fc4e8cf2e2d6b  avro-1.12.0.tar.gz
+# Locally computed sha256 checksums
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index 4e9db9fefc..e1cbea8971 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -5,10 +5,9 @@
 ################################################################################
 
 # When updating the version, please also update avro-c
-PYTHON_AVRO_VERSION = 1.11.3
-PYTHON_AVRO_SITE = \
-	https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py
+PYTHON_AVRO_VERSION = 1.12.0
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
+PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/e6/73/48668732bbc8ae1e79b237f84e761204c8dd266c5e16e7601000aba471d3
 PYTHON_AVRO_LICENSE = Apache-2.0
 PYTHON_AVRO_LICENSE_FILES = avro/LICENSE
 PYTHON_AVRO_SETUP_TYPE = setuptools

--===============7214680159620616000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7214680159620616000==--
