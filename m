Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858FDC27C6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 08:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F8E8203D;
	Sun, 16 Jun 2024 08:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKMiauAAD9-X; Sun, 16 Jun 2024 08:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA33481ED8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA33481ED8;
	Sun, 16 Jun 2024 08:58:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4212A1BF2C9
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 08:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 302246069A
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 08:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYeegbzCqF_l for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 08:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0579A6067C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0579A6067C
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 08:58:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F05A787EA7; Sun, 16 Jun 2024 08:58:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 10:58:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fbeeb23c8fca597beda37b9394d4099f1cadc41
X-Git-Newrev: b39dfdde338bb254b958fbfbe6c7f0fb4e447e34
X-Patchwork-Hint: ignore
Message-Id: <20240616085832.F05A787EA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avro-c: fix build with gcc 14
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
Content-Type: multipart/mixed; boundary="===============6183513212172424202=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6183513212172424202==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b39dfdde338bb254b958fbfbe6c7f0fb4e447e34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============6183513212172424202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6183513212172424202==--
