Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B82C3271E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 19:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D08360708;
	Fri,  5 Jul 2024 19:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9q3CCfx6NFxb; Fri,  5 Jul 2024 19:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CDDB61064
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CDDB61064;
	Fri,  5 Jul 2024 19:31:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50F531BF990
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A1C6414BE
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dr8oYfOZlVB9 for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 19:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D3BD408BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D3BD408BF
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 19:30:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C10583C18; Fri,  5 Jul 2024 19:30:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jul 2024 21:21:26 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 583ecdb8b433190e82ea4497b6b75a3f74b8b173
X-Git-Newrev: 4ef5ca26a5ac57af0f835d69e8ce3c406e5dde0a
X-Patchwork-Hint: ignore
Message-Id: <20240705193056.0C10583C18@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/avro-c: fix build
 with gcc 14
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
Content-Type: multipart/mixed; boundary="===============1475103028674555511=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1475103028674555511==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4ef5ca26a5ac57af0f835d69e8ce3c406e5dde0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix the following build failure with gcc 14:

In file included from /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/src/avro/legacy.h:33,
                 from /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/src/avro/io.h:31,
                 from /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/src/avro/consumer.h:30,
                 from /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/src/avro.h:28,
                 from /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/examples/quickstop.c:18:
/home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/examples/quickstop.c: In function 'print_person':
/home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/examples/quickstop.c:123:61: error: passing argument 3 of 'first_value.iface->get_string' from incompatible pointer type [-Wincompatible-pointer-types]
  123 |                         avro_value_get_string(&first_value, &p, &size);
      |                                                             ^~
      |                                                             |
      |                                                             int32_t ** {aka int **}

Fixes:
 - http://autobuild.buildroot.org/results/fdbc6a888ba8bb51f4e076a450919477d1378eb3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b39dfdde338bb254b958fbfbe6c7f0fb4e447e34)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-3957-Fix-typos-in-docs-and-examples-2795.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/avro-c/0001-AVRO-3957-Fix-typos-in-docs-and-examples-2795.patch b/package/avro-c/0001-AVRO-3957-Fix-typos-in-docs-and-examples-2795.patch
new file mode 100644
index 0000000000..72faaa0abe
--- /dev/null
+++ b/package/avro-c/0001-AVRO-3957-Fix-typos-in-docs-and-examples-2795.patch
@@ -0,0 +1,59 @@
+From 52f051dbeefad0b7e73187becad6c33747b047d3 Mon Sep 17 00:00:00 2001
+From: Sahil Kang <sahil.kang@asilaycomputing.com>
+Date: Mon, 11 Mar 2024 03:01:21 -0700
+Subject: [PATCH] AVRO-3957: [C] Fix typos in docs and examples (#2795)
+
+* AVRO-3957: [C] Fix misformatted type in docs
+
+Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
+Signed-off-by: Sahil Kang <sahilkang@google.com>
+
+* AVRO-3957: [C] Fix type in quickstop example
+
+This removes the following warning:
+
+  avro/lang/c/examples/quickstop.c:123:40: warning: incompatible pointer types passing 'int32_t **' (aka 'int **') to parameter of type
+        'const char **' [-Wincompatible-pointer-types]
+                          avro_value_get_string(&first_value, &p, &size);
+
+Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
+Signed-off-by: Sahil Kang <sahilkang@google.com>
+
+---------
+
+Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
+Signed-off-by: Sahil Kang <sahilkang@google.com>
+
+Upstream: https://github.com/apache/avro/commit/52f051dbeefad0b7e73187becad6c33747b047d3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lang/c/docs/index.txt       | 2 +-
+ lang/c/examples/quickstop.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/docs/index.txt b/docs/index.txt
+index a439a052631..df16f9d9678 100644
+--- a/docs/index.txt
++++ b/docs/index.txt
+@@ -178,7 +178,7 @@ different versions of the Avro library.  That means that it's really
+ only safe to use these hash values internally within the context of a
+ single execution of a single application.
+ 
+-The +reset+ method “clears out” an +avro_value_t instance, making sure
++The +reset+ method “clears out” an +avro_value_t+ instance, making sure
+ that it's ready to accept the contents of a new value.  For scalars,
+ this is usually a no-op, since the new value will just overwrite the old
+ one.  For arrays and maps, this removes any existing elements from the
+diff --git a/examples/quickstop.c b/examples/quickstop.c
+index ff9e9700590..b26dad10c04 100644
+--- a/examples/quickstop.c
++++ b/examples/quickstop.c
+@@ -107,7 +107,7 @@ int print_person(avro_file_reader_t db, avro_schema_t reader_schema)
+ 	if (rval == 0) {
+ 		int64_t id;
+ 		int32_t age;
+-		int32_t *p;
++		const char *p;
+ 		size_t size;
+ 		avro_value_t id_value;
+ 		avro_value_t first_value;

--===============1475103028674555511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1475103028674555511==--
