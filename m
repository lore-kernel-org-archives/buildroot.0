Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06ECC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09B73417E8;
	Fri, 28 Feb 2025 17:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8TToGL3oWYW; Fri, 28 Feb 2025 17:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 662FE417E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 662FE417E5;
	Fri, 28 Feb 2025 17:16:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB01711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FD1042D38
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyKkqmIPdkMj for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D362439BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D362439BF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 059657FDF9; Fri, 28 Feb 2025 16:30:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 21:04:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 91f3e387fdb53c7b48044b53a11acf4954630d6c
X-Git-Newrev: 03c498f1bc1ab9ee1ca305b9fce02a088e514a32
X-Patchwork-Hint: ignore
Message-Id: <20250228163036.059657FDF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/protobuf-c: bump to
 version 1.5.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03c498f1bc1ab9ee1ca305b9fce02a088e514a32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to year update:
https://github.com/protobuf-c/protobuf-c/commit/53e0b201db240694f8c8aabf0d0b579de33bf24d

Drop patches which are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...Protect-against-being-invoked-against-edi.patch | 57 ---------------
 ...-FieldSyntax-to-maximize-compatibility-ac.patch | 84 ----------------------
 ...or-GenerateHeader-Set-min_header_version-.patch | 44 ------------
 package/protobuf-c/protobuf-c.hash                 |  4 +-
 package/protobuf-c/protobuf-c.mk                   |  2 +-
 5 files changed, 3 insertions(+), 188 deletions(-)

diff --git a/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch b/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
deleted file mode 100644
index c674ca2ee1..0000000000
--- a/package/protobuf-c/0001-CGenerator-Protect-against-being-invoked-against-edi.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 2480f4d9d2fa97e5511ed0914ee529a344e969a7 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Wed, 20 Mar 2024 22:43:30 -0400
-Subject: [PATCH] CGenerator: Protect against being invoked against "edition"
- syntax .proto files
-
-The Google protobuf project is currently experimenting with a new syntax
-for .proto files called "editions". Since protobuf-c is a proto2/proto3
-compiler, after the previous commit reimplementing `FieldSyntax()`, the
-protobuf compiler will abort like this if presented with an "editions"
-syntax .proto file due to the safety check in `FieldSyntax()`:
-
-    $ protoc --experimental_editions --c_out=. test.proto
-    protoc-gen-c: ./protoc-c/c_helpers.h:178: int google::protobuf::compiler::c::FieldSyntax(const google::protobuf::FieldDescriptor*): Assertion `syntax == "proto2" || syntax == "proto3"' failed.
-    --c_out: protoc-gen-c: Plugin killed by signal 6.
-
-On protobuf 26, our `CodeGenerator` can implement certain methods to
-declare that we "support" editions, and then reject any other edition
-except proto2 and proto3, which have apparently been retroactively
-declared to be "editions". Of course this needs to be wrapped in a
-version guard.
-
-With this protection in place, the protobuf compiler cleanly exits with
-a nice error message like this:
-
-    $ protoc --experimental_editions --c_out=. test.proto
-    WARNING: All log messages before absl::InitializeLog() is called are written to STDERR
-    E0000 00:00:1710988958.296200   20022 descriptor.cc:4620] Invalid proto descriptor for file "test.proto":
-    E0000 00:00:1710988958.296239   20022 descriptor.cc:4623]   test.proto: Edition 2023 is later than the maximum supported edition PROTO3
-    --c_out: protoc-gen-c: Plugin failed with status code 1.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
----
- protoc-c/c_generator.h | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/protoc-c/c_generator.h b/protoc-c/c_generator.h
-index b8b44aa..4aeb579 100644
---- a/protoc-c/c_generator.h
-+++ b/protoc-c/c_generator.h
-@@ -93,6 +93,12 @@ class PROTOC_C_EXPORT CGenerator : public CodeGenerator {
-                 const std::string& parameter,
-                 OutputDirectory* output_directory,
-                 std::string* error) const;
-+
-+#if GOOGLE_PROTOBUF_VERSION >= 5026000
-+  uint64_t GetSupportedFeatures() const { return CodeGenerator::FEATURE_SUPPORTS_EDITIONS; }
-+  Edition GetMinimumEdition() const { return Edition::EDITION_PROTO2; }
-+  Edition GetMaximumEdition() const { return Edition::EDITION_PROTO3; }
-+#endif
- };
- 
- }  // namespace c
--- 
-2.34.1
-
diff --git a/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch b/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
deleted file mode 100644
index e14a9fbc75..0000000000
--- a/package/protobuf-c/0002-Reimplement-FieldSyntax-to-maximize-compatibility-ac.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From ee3d9e5423c93ee6b828fdda8e7fef13a77634eb Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Wed, 20 Mar 2024 22:25:54 -0400
-Subject: [PATCH] Reimplement FieldSyntax() to maximize compatibility across
- protobuf versions
-
-Recent versions of Google protobuf have broken the interfaces for
-determining the syntax version of a .proto file. The current protobuf-c
-1.5.0 release does not compile with Google protobuf 26.0 due to the most
-recentage breakage. There is a possible workaround involving the Google
-protobuf `FileDescriptorLegacy` class, which is documented as:
-
-// TODO Remove this deprecated API entirely.
-
-So we probably shouldn't rely on it.
-
-Instead, this commit obtains the `FileDescriptorProto` corresponding
-to the passed in `FieldDescriptor` and interrogates the `syntax` field
-directly. This is a single implementation with no version-specific
-workarounds. Hopefully this won't break in the next Google protobuf
-release.
-
-I tested the `FieldSyntax()` implementation in this commit across a
-number of different Google protobuf releases and found that it worked
-(`make && make check`) on all of them:
-
-- Google protobuf 3.6.1.3 (Ubuntu 20.04)
-- Google protobuf 3.12.4 (Ubuntu 22.04)
-- Google protobuf 3.21.12 (Debian 12 + Debian unstable)
-- Google protobuf 3.25.2 (Debian experimental)
-- Google protobuf 26.1-dev
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
----
- protoc-c/c_helpers.h | 24 ++++++++++++++----------
- 1 file changed, 14 insertions(+), 10 deletions(-)
-
-diff --git a/protoc-c/c_helpers.h b/protoc-c/c_helpers.h
-index 062d330..be28b60 100644
---- a/protoc-c/c_helpers.h
-+++ b/protoc-c/c_helpers.h
-@@ -70,10 +70,6 @@
- #include <protobuf-c/protobuf-c.pb.h>
- #include <google/protobuf/io/printer.h>
- 
--#if GOOGLE_PROTOBUF_VERSION >= 4023000
--# include <google/protobuf/descriptor_legacy.h>
--#endif
--
- namespace google {
- namespace protobuf {
- namespace compiler {
-@@ -173,13 +169,21 @@ struct NameIndex
- int compare_name_indices_by_name(const void*, const void*);
- 
- // Return the syntax version of the file containing the field.
--// This wrapper is needed to be able to compile against protobuf2.
- inline int FieldSyntax(const FieldDescriptor* field) {
--#if GOOGLE_PROTOBUF_VERSION >= 4023000
--  return FileDescriptorLegacy(field->file()).syntax() == FileDescriptorLegacy::SYNTAX_PROTO3 ? 3 : 2;
--#else
--  return field->file()->syntax() == FileDescriptor::SYNTAX_PROTO3 ? 3 : 2;
--#endif
-+  auto proto = FileDescriptorProto();
-+  field->file()->CopyTo(&proto);
-+
-+  if (proto.has_syntax()) {
-+    auto syntax = proto.syntax();
-+    assert(syntax == "proto2" || syntax == "proto3");
-+    if (syntax == "proto2") {
-+      return 2;
-+    } else if (syntax == "proto3") {
-+      return 3;
-+    }
-+  }
-+
-+  return 2;
- }
- 
- // Work around changes in protobuf >= 22.x without breaking compilation against
--- 
-2.34.1
-
diff --git a/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch b/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch
deleted file mode 100644
index d7d9cdf845..0000000000
--- a/package/protobuf-c/0003-FileGenerator-GenerateHeader-Set-min_header_version-.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a6cf1aa386067e26d582cc1d1e327787595c9f13 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Wed, 20 Mar 2024 21:48:10 -0400
-Subject: [PATCH] FileGenerator::GenerateHeader(): Set `min_header_version`
- unconditionally
-
-Previously, we were conditionally trying to set `min_header_version` to
-the lowest possible value, and relying on a "legacy" Google interface to
-determine the file descriptor's syntax version as part of that
-determination.
-
-Instead, simply bump the minimum version to 1003000 (1.3.0). This
-release was almost 7 years ago. In practice protobuf-c users should not
-be shipping pre-compiled .pb-c.c/.pb-c.h files, anyway.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/protobuf-c/protobuf-c/pull/711
----
- protoc-c/c_file.cc | 9 +--------
- 1 file changed, 1 insertion(+), 8 deletions(-)
-
-diff --git a/protoc-c/c_file.cc b/protoc-c/c_file.cc
-index ca0ad34..c6d8a24 100644
---- a/protoc-c/c_file.cc
-+++ b/protoc-c/c_file.cc
-@@ -117,14 +117,7 @@ FileGenerator::~FileGenerator() {}
- void FileGenerator::GenerateHeader(io::Printer* printer) {
-   std::string filename_identifier = FilenameIdentifier(file_->name());
- 
--  int min_header_version = 1000000;
--#if GOOGLE_PROTOBUF_VERSION >= 4023000
--  if (FileDescriptorLegacy(file_).syntax() == FileDescriptorLegacy::SYNTAX_PROTO3) {
--#else
--  if (file_->syntax() == FileDescriptor::SYNTAX_PROTO3) {
--#endif
--    min_header_version = 1003000;
--  }
-+  const int min_header_version = 1003000;
- 
-   // Generate top of header.
-   printer->Print(
--- 
-2.34.1
-
diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index aafd98416a..ea7262028c 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7b404c63361ed35b3667aec75cc37b54298d56dd2bcf369de3373212cc06fd98  protobuf-c-1.5.0.tar.gz
-sha256  ad28bbf89340b86d15aad1ff62c4f4590025d836415307dc66cf0338235cc2f4  LICENSE
+sha256  20d1dc257da96f8ddff8be4dd9779215bbd0a6069ed53bbe9de38fa7629be06b  protobuf-c-1.5.1.tar.gz
+sha256  2d1d028bd27f8c85bc970d720519d2069ca6213fcb26b9dea444a7c39d24bbb3  LICENSE
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 2b3e86a1bc..b1e8c25496 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = 1.5.0
+PROTOBUF_C_VERSION = 1.5.1
 PROTOBUF_C_SITE = https://github.com/protobuf-c/protobuf-c/releases/download/v$(PROTOBUF_C_VERSION)
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
