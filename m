Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FBBFD88C4
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AECA83C7E;
	Tue, 10 Mar 2026 22:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlOkkQF8m1kK; Tue, 10 Mar 2026 22:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C3F483D57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773180378;
	bh=J4uVBBewbzSsZ/YUntaEzjqcsmMQIP4b0edU3FtgVNE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=noQpuKQGWR2e6yJ+lGeRL7nuauDOyphvUiD1oClrmGEPZ8FKiM/1Ix1RKO3CSU/2b
	 6x4vUdQp7AoQSkZwiy/Mm2EQIB2ULbun+Phuw/tbmGm5ifOhMyaJ1CAujHd8u0qClx
	 kDbJk9xsCv6KDyNIXt9E6LRxYQA2bBP++0Zhu/SRAsySDHEEz7GM3tBv4+k1wWNPjQ
	 9k1BjjGHxEBkkTj1l7tl9/ehyNuBHoTOZdAbiyzI+rv1R0m+L6gUs34PaqXdq7Geo/
	 1Ygupagmcw2MkBPxy1ufWuRNH73cWaOqS8kh+KRXbHH9JmCKLalej8MC3IL27m3SOX
	 jHhYro7N9/QPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C3F483D57;
	Tue, 10 Mar 2026 22:06:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CE1F9E3
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 528E160E4B
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yddmEydl4lcI for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CE1F60E1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CE1F60E1C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:06:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A0E086905; Tue, 10 Mar 2026 22:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 22:57:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 064ab5b00c60bdc895dc74aecb1e1779fb4e565a
X-Git-Newrev: 0428cb3c274afde135400877750c3d725b4ebce5
X-Patchwork-Hint: ignore
Message-Id: <20260310220615.8A0E086905@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/protobuf-c: fix protobuf v34.0
 compatibility
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0428cb3c274afde135400877750c3d725b4ebce5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

pull in patch from https://github.com/protobuf-c/protobuf-c/pull/797
which fixes compatibility with Protobuf v34.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-fix-protobuf-34-compatibility.patch       | 208 +++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/package/protobuf-c/0001-fix-protobuf-34-compatibility.patch b/package/protobuf-c/0001-fix-protobuf-34-compatibility.patch
new file mode 100644
index 0000000000..d1acdf232e
--- /dev/null
+++ b/package/protobuf-c/0001-fix-protobuf-34-compatibility.patch
@@ -0,0 +1,208 @@
+From d39f001b4578966600de0aaf7fc665eec6e057e5 Mon Sep 17 00:00:00 2001
+From: Leon White <l.white@interstellarlab.earth>
+Date: Tue, 10 Mar 2026 10:37:18 +0100
+Subject: [PATCH] Fix compilation against protobuf v34
+
+Upstream: https://github.com/protobuf-c/protobuf-c/pull/797
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+
+---
+ protoc-gen-c/c_bytes_field.cc     |  4 ++--
+ protoc-gen-c/c_enum_field.cc      |  4 ++--
+ protoc-gen-c/c_field.cc           | 10 +++++-----
+ protoc-gen-c/c_helpers.cc         | 11 +++++++++++
+ protoc-gen-c/c_helpers.h          |  5 +++++
+ protoc-gen-c/c_message_field.cc   |  4 ++--
+ protoc-gen-c/c_primitive_field.cc |  4 ++--
+ protoc-gen-c/c_string_field.cc    |  4 ++--
+ 8 files changed, 31 insertions(+), 15 deletions(-)
+
+diff --git a/protoc-gen-c/c_bytes_field.cc b/protoc-gen-c/c_bytes_field.cc
+index c8ac7725..ab101177 100644
+--- a/protoc-gen-c/c_bytes_field.cc
++++ b/protoc-gen-c/c_bytes_field.cc
+@@ -94,7 +94,7 @@ BytesFieldGenerator::~BytesFieldGenerator() {}
+ 
+ void BytesFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "ProtobufCBinaryData $name$$deprecated$;\n");
+       break;
+@@ -135,7 +135,7 @@ std::string BytesFieldGenerator::GetDefaultValue(void) const
+ }
+ void BytesFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "$default_value$");
+       break;
+diff --git a/protoc-gen-c/c_enum_field.cc b/protoc-gen-c/c_enum_field.cc
+index c3111f50..78ffb1c7 100644
+--- a/protoc-gen-c/c_enum_field.cc
++++ b/protoc-gen-c/c_enum_field.cc
+@@ -95,7 +95,7 @@ EnumFieldGenerator::~EnumFieldGenerator() {}
+ 
+ void EnumFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "$type$ $name$$deprecated$;\n");
+       break;
+@@ -117,7 +117,7 @@ std::string EnumFieldGenerator::GetDefaultValue(void) const
+ }
+ void EnumFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "$default$");
+       break;
+diff --git a/protoc-gen-c/c_field.cc b/protoc-gen-c/c_field.cc
+index 8d22343f..8f83e1b1 100644
+--- a/protoc-gen-c/c_field.cc
++++ b/protoc-gen-c/c_field.cc
+@@ -125,11 +125,11 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(google::protobuf::io::
+     variables["oneofname"] = CamelToLower(oneof->name());
+ 
+   if (FieldSyntax(descriptor_) == 3 &&
+-    descriptor_->label() == google::protobuf::FieldDescriptor::LABEL_OPTIONAL) {
++    FieldLabel(descriptor_) == google::protobuf::FieldDescriptor::LABEL_OPTIONAL) {
+     variables["LABEL"] = "NONE";
+     optional_uses_has = false;
+   } else {
+-    variables["LABEL"] = CamelToUpper(GetLabelName(descriptor_->label()));
++    variables["LABEL"] = CamelToUpper(GetLabelName(FieldLabel(descriptor_)));
+   }
+ 
+   if (descriptor_->has_default_value()) {
+@@ -145,11 +145,11 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(google::protobuf::io::
+ 
+   variables["flags"] = "0";
+ 
+-  if (descriptor_->label() == google::protobuf::FieldDescriptor::LABEL_REPEATED
++  if (FieldLabel(descriptor_) == google::protobuf::FieldDescriptor::LABEL_REPEATED
+    && is_packable_type (descriptor_->type())
+    && descriptor_->options().packed()) {
+     variables["flags"] += " | PROTOBUF_C_FIELD_FLAG_PACKED";
+-  } else if (descriptor_->label() == google::protobuf::FieldDescriptor::LABEL_REPEATED
++  } else if (FieldLabel(descriptor_) == google::protobuf::FieldDescriptor::LABEL_REPEATED
+    && is_packable_type (descriptor_->type())
+    && FieldSyntax(descriptor_) == 3
+    && !descriptor_->options().has_packed()) {
+@@ -179,7 +179,7 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(google::protobuf::io::
+     "  $value$,\n"
+     "  PROTOBUF_C_LABEL_$LABEL$,\n"
+     "  PROTOBUF_C_TYPE_$TYPE$,\n");
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables, "  0,   /* quantifier_offset */\n");
+       break;
+diff --git a/protoc-gen-c/c_helpers.cc b/protoc-gen-c/c_helpers.cc
+index e5c177c9..fcfc2588 100644
+--- a/protoc-gen-c/c_helpers.cc
++++ b/protoc-gen-c/c_helpers.cc
+@@ -338,6 +338,17 @@ std::string GetLabelName(google::protobuf::FieldDescriptor::Label label) {
+   return "bad-label";
+ }
+ 
++google::protobuf::FieldDescriptor::Label FieldLabel(
++    const google::protobuf::FieldDescriptor* field) {
++  if (field->is_repeated()) {
++    return google::protobuf::FieldDescriptor::LABEL_REPEATED;
++  }
++  if (field->is_required()) {
++    return google::protobuf::FieldDescriptor::LABEL_REQUIRED;
++  }
++  return google::protobuf::FieldDescriptor::LABEL_OPTIONAL;
++}
++
+ unsigned
+ WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *values, compat::StringView name)
+ {
+diff --git a/protoc-gen-c/c_helpers.h b/protoc-gen-c/c_helpers.h
+index 69369997..210f17a9 100644
+--- a/protoc-gen-c/c_helpers.h
++++ b/protoc-gen-c/c_helpers.h
+@@ -153,6 +153,11 @@ std::string FilenameIdentifier(compat::StringView filename);
+ // return 'required', 'optional', or 'repeated'
+ std::string GetLabelName(google::protobuf::FieldDescriptor::Label label);
+ 
++// Returns the field label in a way that is compatible with protobuf versions
++// where FieldDescriptor::label() is unavailable.
++google::protobuf::FieldDescriptor::Label FieldLabel(
++  const google::protobuf::FieldDescriptor* field);
++
+ // write IntRanges entries for a bunch of sorted values.
+ // returns the number of ranges there are to bsearch.
+ unsigned WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *values, compat::StringView name);
+diff --git a/protoc-gen-c/c_message_field.cc b/protoc-gen-c/c_message_field.cc
+index 9fca9208..43661353 100644
+--- a/protoc-gen-c/c_message_field.cc
++++ b/protoc-gen-c/c_message_field.cc
+@@ -83,7 +83,7 @@ void MessageFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer*
+   vars["name"] = FieldName(descriptor_);
+   vars["type"] = FullNameToC(descriptor_->message_type()->full_name(), descriptor_->message_type()->file());
+   vars["deprecated"] = FieldDeprecated(descriptor_);
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       printer->Print(vars, "$type$ *$name$$deprecated$;\n");
+@@ -103,7 +103,7 @@ std::string MessageFieldGenerator::GetDefaultValue(void) const
+ }
+ void MessageFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       printer->Print("NULL");
+diff --git a/protoc-gen-c/c_primitive_field.cc b/protoc-gen-c/c_primitive_field.cc
+index 588f60e6..b3a4a46e 100644
+--- a/protoc-gen-c/c_primitive_field.cc
++++ b/protoc-gen-c/c_primitive_field.cc
+@@ -109,7 +109,7 @@ void PrimitiveFieldGenerator::GenerateStructMembers(google::protobuf::io::Printe
+   vars["name"] = FieldName(descriptor_);
+   vars["deprecated"] = FieldDeprecated(descriptor_);
+ 
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(vars, "$c_type$ $name$$deprecated$;\n");
+       break;
+@@ -156,7 +156,7 @@ void PrimitiveFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer*
+   } else {
+     vars["default_value"] = "0";
+   }
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(vars, "$default_value$");
+       break;
+diff --git a/protoc-gen-c/c_string_field.cc b/protoc-gen-c/c_string_field.cc
+index 163f4246..6aea8dd3 100644
+--- a/protoc-gen-c/c_string_field.cc
++++ b/protoc-gen-c/c_string_field.cc
+@@ -94,7 +94,7 @@ void StringFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer*
+ {
+   const ProtobufCFileOptions opt = descriptor_->file()->options().GetExtension(pb_c_file);
+ 
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       if (opt.const_strings())
+@@ -138,7 +138,7 @@ void StringFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* pri
+   } else {
+     vars["default"] = "(char *)protobuf_c_empty_string";
+   }
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       printer->Print(vars, "$default$");
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
