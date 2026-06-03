Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2700DCD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4975585ECF;
	Tue,  9 Jun 2026 13:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzSMKPz9Jbi5; Tue,  9 Jun 2026 13:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F36485E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010356;
	bh=ija7S55qLZhHSdIoQ7CJanwRtY7bi31p2SaDM3hSIe0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CZsGR4P2IuWO4gwTNbFE6TZF8FMPFEAku2c88zDq5ACN/VV1+++AeCdcQP9NKHNXL
	 d3I3jozFub6bJPC2x27GcPVvaB88T9WYsFW2bnEvGPBT2xQnCuxSDsUqgBSbfPjOsA
	 iiuS741UnCODPHI2bLDVVgoMHR4LBPixToyyDa1EknJ9NG3cDe0fyN9fNvBkL1Fei1
	 XyDlZBFAAtd6szEpZyiPpKPf3JjSk25XZQJpipuzBrxdC4fiXXBdkEiDp2eUI561F9
	 FSy6cT7iShv5aeNBJKwmowbKXNZ2HlxLfyvL5lb1zBr+L5APx1mfk1EgJRpbhSlJr/
	 JalPeE3ds0/5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F36485E95;
	Tue,  9 Jun 2026 13:05:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA0D0190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E306426F0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2-wPwsMvqEr for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 687C942705
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 687C942705
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A406187E86; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 23:03:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c1dd49656c26a960eb95ccf6fe686ee46eafa91
X-Git-Newrev: 64f501c412a8633c79ac1d14851c8d40f2d925b3
X-Patchwork-Hint: ignore
Message-Id: <20260609130126.A406187E86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-headers: add patch to fix
 build with spirv-llvm-translator >= 22.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64f501c412a8633c79ac1d14851c8d40f2d925b3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The upcoming bump of spirv-llvm-translator to 22.1.3 includes upstream
commit
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/commit/5a8baf6cd2b573fa40ed8e6c5e3eedadbe0c76e7

which depends on an upstream patch to spirv-headers:
https://github.com/KhronosGroup/SPIRV-Headers/commit/b8a32968473ce852a809b9de5f04f02a5a9dfa78

according to
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/pull/3721

but this patch is not included in any release of spirv-headers yet so we
need to add it to buildroot to prevent a build error with
spirv-llvm-translator 22.1.3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...eader-changes-for-SPV_INTEL_predicated_io.patch | 340 +++++++++++++++++++++
 1 file changed, 340 insertions(+)

diff --git a/package/spirv-headers/0001-grammar-and-header-changes-for-SPV_INTEL_predicated_io.patch b/package/spirv-headers/0001-grammar-and-header-changes-for-SPV_INTEL_predicated_io.patch
new file mode 100644
index 0000000000..1bb7b80b69
--- /dev/null
+++ b/package/spirv-headers/0001-grammar-and-header-changes-for-SPV_INTEL_predicated_io.patch
@@ -0,0 +1,340 @@
+From b8a32968473ce852a809b9de5f04f02a5a9dfa78 Mon Sep 17 00:00:00 2001
+From: Yury Plyakhin <yury.plyakhin@intel.com>
+Date: Wed, 29 Apr 2026 07:52:53 -0700
+Subject: [PATCH] grammar and header changes for SPV_INTEL_predicated_io (#585)
+
+Upstream: https://github.com/KhronosGroup/SPIRV-Headers/commit/b8a32968473ce852a809b9de5f04f02a5a9dfa78
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/spirv/unified1/spirv.bf               |  3 ++
+ .../spirv/unified1/spirv.core.grammar.json    | 34 +++++++++++++++++++
+ include/spirv/unified1/spirv.cs               |  3 ++
+ include/spirv/unified1/spirv.h                |  8 +++++
+ include/spirv/unified1/spirv.hpp              |  8 +++++
+ include/spirv/unified1/spirv.hpp11            |  8 +++++
+ include/spirv/unified1/spirv.json             |  3 ++
+ include/spirv/unified1/spirv.lua              |  3 ++
+ include/spirv/unified1/spirv.py               |  3 ++
+ include/spirv/unified1/spv.d                  |  3 ++
+ 10 files changed, 76 insertions(+)
+
+diff --git a/include/spirv/unified1/spirv.bf b/include/spirv/unified1/spirv.bf
+index b70525942..0fd870336 100644
+--- a/include/spirv/unified1/spirv.bf
++++ b/include/spirv/unified1/spirv.bf
+@@ -1426,6 +1426,7 @@ namespace Spv
+             UntypedVariableLengthArrayINTEL = 6243,
+             SpecConditionalINTEL = 6245,
+             FunctionVariantsINTEL = 6246,
++            PredicatedIOINTEL = 6257,
+             GroupUniformArithmeticKHR = 6400,
+             TensorFloat32RoundingINTEL = 6425,
+             MaskedGatherScatterINTEL = 6427,
+@@ -2694,6 +2695,8 @@ namespace Spv
+             OpSpecConstantArchitectureINTEL = 6252,
+             OpSpecConstantCapabilitiesINTEL = 6253,
+             OpConditionalCopyObjectINTEL = 6254,
++            OpPredicatedLoadINTEL = 6258,
++            OpPredicatedStoreINTEL = 6259,
+             OpGroupIMulKHR = 6401,
+             OpGroupFMulKHR = 6402,
+             OpGroupBitwiseAndKHR = 6403,
+diff --git a/include/spirv/unified1/spirv.core.grammar.json b/include/spirv/unified1/spirv.core.grammar.json
+index 22f5fe9c7..0a282c56f 100644
+--- a/include/spirv/unified1/spirv.core.grammar.json
++++ b/include/spirv/unified1/spirv.core.grammar.json
+@@ -11598,6 +11598,34 @@
+       "provisional" : true,
+       "version" : "None"
+     },
++    {
++      "opname" : "OpPredicatedLoadINTEL",
++      "class"  : "Memory",
++      "opcode" : 6258,
++      "operands" : [
++        { "kind" : "IdResultType" },
++        { "kind" : "IdResult" },
++        { "kind" : "IdRef",                          "name" : "Pointer" },
++        { "kind" : "IdRef",                          "name" : "Predicate" },
++        { "kind" : "IdRef",                          "name" : "Default Value" },
++        { "kind" : "MemoryAccess", "quantifier" : "?" }
++      ],
++      "capabilities" : [ "PredicatedIOINTEL" ],
++      "version" : "None"
++    },
++    {
++      "opname" : "OpPredicatedStoreINTEL",
++      "class"  : "Memory",
++      "opcode" : 6259,
++      "operands" : [
++        { "kind" : "IdRef",                          "name" : "Pointer" },
++        { "kind" : "IdRef",                          "name" : "Object" },
++        { "kind" : "IdRef",                          "name" : "Predicate" },
++        { "kind" : "MemoryAccess", "quantifier" : "?" }
++      ],
++      "capabilities" : [ "PredicatedIOINTEL" ],
++      "version" : "None"
++    },
+     {
+       "opname" : "OpGroupIMulKHR",
+       "class"  : "Group",
+@@ -18659,6 +18687,12 @@
+           "provisional" : true,
+           "version": "None"
+         },
++        {
++          "enumerant" : "PredicatedIOINTEL",
++          "value" : 6257,
++          "extensions" : [ "SPV_INTEL_predicated_io" ],
++          "version" : "None"
++        },
+         {
+           "enumerant" : "GroupUniformArithmeticKHR",
+           "value" : 6400,
+diff --git a/include/spirv/unified1/spirv.cs b/include/spirv/unified1/spirv.cs
+index 2f8c1ff8a..375dd0b46 100644
+--- a/include/spirv/unified1/spirv.cs
++++ b/include/spirv/unified1/spirv.cs
+@@ -1425,6 +1425,7 @@ public enum Capability
+             UntypedVariableLengthArrayINTEL = 6243,
+             SpecConditionalINTEL = 6245,
+             FunctionVariantsINTEL = 6246,
++            PredicatedIOINTEL = 6257,
+             GroupUniformArithmeticKHR = 6400,
+             TensorFloat32RoundingINTEL = 6425,
+             MaskedGatherScatterINTEL = 6427,
+@@ -2693,6 +2694,8 @@ public enum Op
+             OpSpecConstantArchitectureINTEL = 6252,
+             OpSpecConstantCapabilitiesINTEL = 6253,
+             OpConditionalCopyObjectINTEL = 6254,
++            OpPredicatedLoadINTEL = 6258,
++            OpPredicatedStoreINTEL = 6259,
+             OpGroupIMulKHR = 6401,
+             OpGroupFMulKHR = 6402,
+             OpGroupBitwiseAndKHR = 6403,
+diff --git a/include/spirv/unified1/spirv.h b/include/spirv/unified1/spirv.h
+index d00cf0f4e..9233ff0ee 100644
+--- a/include/spirv/unified1/spirv.h
++++ b/include/spirv/unified1/spirv.h
+@@ -1396,6 +1396,7 @@ typedef enum SpvCapability_ {
+     SpvCapabilityUntypedVariableLengthArrayINTEL = 6243,
+     SpvCapabilitySpecConditionalINTEL = 6245,
+     SpvCapabilityFunctionVariantsINTEL = 6246,
++    SpvCapabilityPredicatedIOINTEL = 6257,
+     SpvCapabilityGroupUniformArithmeticKHR = 6400,
+     SpvCapabilityTensorFloat32RoundingINTEL = 6425,
+     SpvCapabilityMaskedGatherScatterINTEL = 6427,
+@@ -2628,6 +2629,8 @@ typedef enum SpvOp_ {
+     SpvOpSpecConstantArchitectureINTEL = 6252,
+     SpvOpSpecConstantCapabilitiesINTEL = 6253,
+     SpvOpConditionalCopyObjectINTEL = 6254,
++    SpvOpPredicatedLoadINTEL = 6258,
++    SpvOpPredicatedStoreINTEL = 6259,
+     SpvOpGroupIMulKHR = 6401,
+     SpvOpGroupFMulKHR = 6402,
+     SpvOpGroupBitwiseAndKHR = 6403,
+@@ -3510,6 +3513,8 @@ inline void SpvHasResultAndType(SpvOp opcode, bool *hasResult, bool *hasResultTy
+     case SpvOpSpecConstantArchitectureINTEL: *hasResult = true; *hasResultType = true; break;
+     case SpvOpSpecConstantCapabilitiesINTEL: *hasResult = true; *hasResultType = true; break;
+     case SpvOpConditionalCopyObjectINTEL: *hasResult = true; *hasResultType = true; break;
++    case SpvOpPredicatedLoadINTEL: *hasResult = true; *hasResultType = true; break;
++    case SpvOpPredicatedStoreINTEL: *hasResult = false; *hasResultType = false; break;
+     case SpvOpGroupIMulKHR: *hasResult = true; *hasResultType = true; break;
+     case SpvOpGroupFMulKHR: *hasResult = true; *hasResultType = true; break;
+     case SpvOpGroupBitwiseAndKHR: *hasResult = true; *hasResultType = true; break;
+@@ -4517,6 +4522,7 @@ inline const char* SpvCapabilityToString(SpvCapability value) {
+     case SpvCapabilityUntypedVariableLengthArrayINTEL: return "UntypedVariableLengthArrayINTEL";
+     case SpvCapabilitySpecConditionalINTEL: return "SpecConditionalINTEL";
+     case SpvCapabilityFunctionVariantsINTEL: return "FunctionVariantsINTEL";
++    case SpvCapabilityPredicatedIOINTEL: return "PredicatedIOINTEL";
+     case SpvCapabilityGroupUniformArithmeticKHR: return "GroupUniformArithmeticKHR";
+     case SpvCapabilityTensorFloat32RoundingINTEL: return "TensorFloat32RoundingINTEL";
+     case SpvCapabilityMaskedGatherScatterINTEL: return "MaskedGatherScatterINTEL";
+@@ -5575,6 +5581,8 @@ inline const char* SpvOpToString(SpvOp value) {
+     case SpvOpSpecConstantArchitectureINTEL: return "OpSpecConstantArchitectureINTEL";
+     case SpvOpSpecConstantCapabilitiesINTEL: return "OpSpecConstantCapabilitiesINTEL";
+     case SpvOpConditionalCopyObjectINTEL: return "OpConditionalCopyObjectINTEL";
++    case SpvOpPredicatedLoadINTEL: return "OpPredicatedLoadINTEL";
++    case SpvOpPredicatedStoreINTEL: return "OpPredicatedStoreINTEL";
+     case SpvOpGroupIMulKHR: return "OpGroupIMulKHR";
+     case SpvOpGroupFMulKHR: return "OpGroupFMulKHR";
+     case SpvOpGroupBitwiseAndKHR: return "OpGroupBitwiseAndKHR";
+diff --git a/include/spirv/unified1/spirv.hpp b/include/spirv/unified1/spirv.hpp
+index 462c3f6bf..055086ca5 100644
+--- a/include/spirv/unified1/spirv.hpp
++++ b/include/spirv/unified1/spirv.hpp
+@@ -1392,6 +1392,7 @@ enum Capability {
+     CapabilityUntypedVariableLengthArrayINTEL = 6243,
+     CapabilitySpecConditionalINTEL = 6245,
+     CapabilityFunctionVariantsINTEL = 6246,
++    CapabilityPredicatedIOINTEL = 6257,
+     CapabilityGroupUniformArithmeticKHR = 6400,
+     CapabilityTensorFloat32RoundingINTEL = 6425,
+     CapabilityMaskedGatherScatterINTEL = 6427,
+@@ -2624,6 +2625,8 @@ enum Op {
+     OpSpecConstantArchitectureINTEL = 6252,
+     OpSpecConstantCapabilitiesINTEL = 6253,
+     OpConditionalCopyObjectINTEL = 6254,
++    OpPredicatedLoadINTEL = 6258,
++    OpPredicatedStoreINTEL = 6259,
+     OpGroupIMulKHR = 6401,
+     OpGroupFMulKHR = 6402,
+     OpGroupBitwiseAndKHR = 6403,
+@@ -3506,6 +3509,8 @@ inline void HasResultAndType(Op opcode, bool *hasResult, bool *hasResultType) {
+     case OpSpecConstantArchitectureINTEL: *hasResult = true; *hasResultType = true; break;
+     case OpSpecConstantCapabilitiesINTEL: *hasResult = true; *hasResultType = true; break;
+     case OpConditionalCopyObjectINTEL: *hasResult = true; *hasResultType = true; break;
++    case OpPredicatedLoadINTEL: *hasResult = true; *hasResultType = true; break;
++    case OpPredicatedStoreINTEL: *hasResult = false; *hasResultType = false; break;
+     case OpGroupIMulKHR: *hasResult = true; *hasResultType = true; break;
+     case OpGroupFMulKHR: *hasResult = true; *hasResultType = true; break;
+     case OpGroupBitwiseAndKHR: *hasResult = true; *hasResultType = true; break;
+@@ -4513,6 +4518,7 @@ inline const char* CapabilityToString(Capability value) {
+     case CapabilityUntypedVariableLengthArrayINTEL: return "UntypedVariableLengthArrayINTEL";
+     case CapabilitySpecConditionalINTEL: return "SpecConditionalINTEL";
+     case CapabilityFunctionVariantsINTEL: return "FunctionVariantsINTEL";
++    case CapabilityPredicatedIOINTEL: return "PredicatedIOINTEL";
+     case CapabilityGroupUniformArithmeticKHR: return "GroupUniformArithmeticKHR";
+     case CapabilityTensorFloat32RoundingINTEL: return "TensorFloat32RoundingINTEL";
+     case CapabilityMaskedGatherScatterINTEL: return "MaskedGatherScatterINTEL";
+@@ -5571,6 +5577,8 @@ inline const char* OpToString(Op value) {
+     case OpSpecConstantArchitectureINTEL: return "OpSpecConstantArchitectureINTEL";
+     case OpSpecConstantCapabilitiesINTEL: return "OpSpecConstantCapabilitiesINTEL";
+     case OpConditionalCopyObjectINTEL: return "OpConditionalCopyObjectINTEL";
++    case OpPredicatedLoadINTEL: return "OpPredicatedLoadINTEL";
++    case OpPredicatedStoreINTEL: return "OpPredicatedStoreINTEL";
+     case OpGroupIMulKHR: return "OpGroupIMulKHR";
+     case OpGroupFMulKHR: return "OpGroupFMulKHR";
+     case OpGroupBitwiseAndKHR: return "OpGroupBitwiseAndKHR";
+diff --git a/include/spirv/unified1/spirv.hpp11 b/include/spirv/unified1/spirv.hpp11
+index 41ebe9157..0d85dfec2 100644
+--- a/include/spirv/unified1/spirv.hpp11
++++ b/include/spirv/unified1/spirv.hpp11
+@@ -1392,6 +1392,7 @@ enum class Capability : unsigned {
+     UntypedVariableLengthArrayINTEL = 6243,
+     SpecConditionalINTEL = 6245,
+     FunctionVariantsINTEL = 6246,
++    PredicatedIOINTEL = 6257,
+     GroupUniformArithmeticKHR = 6400,
+     TensorFloat32RoundingINTEL = 6425,
+     MaskedGatherScatterINTEL = 6427,
+@@ -2624,6 +2625,8 @@ enum class Op : unsigned {
+     OpSpecConstantArchitectureINTEL = 6252,
+     OpSpecConstantCapabilitiesINTEL = 6253,
+     OpConditionalCopyObjectINTEL = 6254,
++    OpPredicatedLoadINTEL = 6258,
++    OpPredicatedStoreINTEL = 6259,
+     OpGroupIMulKHR = 6401,
+     OpGroupFMulKHR = 6402,
+     OpGroupBitwiseAndKHR = 6403,
+@@ -3506,6 +3509,8 @@ inline void HasResultAndType(Op opcode, bool *hasResult, bool *hasResultType) {
+     case Op::OpSpecConstantArchitectureINTEL: *hasResult = true; *hasResultType = true; break;
+     case Op::OpSpecConstantCapabilitiesINTEL: *hasResult = true; *hasResultType = true; break;
+     case Op::OpConditionalCopyObjectINTEL: *hasResult = true; *hasResultType = true; break;
++    case Op::OpPredicatedLoadINTEL: *hasResult = true; *hasResultType = true; break;
++    case Op::OpPredicatedStoreINTEL: *hasResult = false; *hasResultType = false; break;
+     case Op::OpGroupIMulKHR: *hasResult = true; *hasResultType = true; break;
+     case Op::OpGroupFMulKHR: *hasResult = true; *hasResultType = true; break;
+     case Op::OpGroupBitwiseAndKHR: *hasResult = true; *hasResultType = true; break;
+@@ -4513,6 +4518,7 @@ inline const char* CapabilityToString(Capability value) {
+     case Capability::UntypedVariableLengthArrayINTEL: return "UntypedVariableLengthArrayINTEL";
+     case Capability::SpecConditionalINTEL: return "SpecConditionalINTEL";
+     case Capability::FunctionVariantsINTEL: return "FunctionVariantsINTEL";
++    case Capability::PredicatedIOINTEL: return "PredicatedIOINTEL";
+     case Capability::GroupUniformArithmeticKHR: return "GroupUniformArithmeticKHR";
+     case Capability::TensorFloat32RoundingINTEL: return "TensorFloat32RoundingINTEL";
+     case Capability::MaskedGatherScatterINTEL: return "MaskedGatherScatterINTEL";
+@@ -5571,6 +5577,8 @@ inline const char* OpToString(Op value) {
+     case Op::OpSpecConstantArchitectureINTEL: return "OpSpecConstantArchitectureINTEL";
+     case Op::OpSpecConstantCapabilitiesINTEL: return "OpSpecConstantCapabilitiesINTEL";
+     case Op::OpConditionalCopyObjectINTEL: return "OpConditionalCopyObjectINTEL";
++    case Op::OpPredicatedLoadINTEL: return "OpPredicatedLoadINTEL";
++    case Op::OpPredicatedStoreINTEL: return "OpPredicatedStoreINTEL";
+     case Op::OpGroupIMulKHR: return "OpGroupIMulKHR";
+     case Op::OpGroupFMulKHR: return "OpGroupFMulKHR";
+     case Op::OpGroupBitwiseAndKHR: return "OpGroupBitwiseAndKHR";
+diff --git a/include/spirv/unified1/spirv.json b/include/spirv/unified1/spirv.json
+index 0a200b27b..ec778af36 100644
+--- a/include/spirv/unified1/spirv.json
++++ b/include/spirv/unified1/spirv.json
+@@ -1358,6 +1358,7 @@
+                     "UntypedVariableLengthArrayINTEL": 6243,
+                     "SpecConditionalINTEL": 6245,
+                     "FunctionVariantsINTEL": 6246,
++                    "PredicatedIOINTEL": 6257,
+                     "GroupUniformArithmeticKHR": 6400,
+                     "TensorFloat32RoundingINTEL": 6425,
+                     "MaskedGatherScatterINTEL": 6427,
+@@ -2595,6 +2596,8 @@
+                     "OpSpecConstantArchitectureINTEL": 6252,
+                     "OpSpecConstantCapabilitiesINTEL": 6253,
+                     "OpConditionalCopyObjectINTEL": 6254,
++                    "OpPredicatedLoadINTEL": 6258,
++                    "OpPredicatedStoreINTEL": 6259,
+                     "OpGroupIMulKHR": 6401,
+                     "OpGroupFMulKHR": 6402,
+                     "OpGroupBitwiseAndKHR": 6403,
+diff --git a/include/spirv/unified1/spirv.lua b/include/spirv/unified1/spirv.lua
+index e61202550..b883dd880 100644
+--- a/include/spirv/unified1/spirv.lua
++++ b/include/spirv/unified1/spirv.lua
+@@ -1383,6 +1383,7 @@ spv = {
+         UntypedVariableLengthArrayINTEL = 6243,
+         SpecConditionalINTEL = 6245,
+         FunctionVariantsINTEL = 6246,
++        PredicatedIOINTEL = 6257,
+         GroupUniformArithmeticKHR = 6400,
+         TensorFloat32RoundingINTEL = 6425,
+         MaskedGatherScatterINTEL = 6427,
+@@ -2615,6 +2616,8 @@ spv = {
+         OpSpecConstantArchitectureINTEL = 6252,
+         OpSpecConstantCapabilitiesINTEL = 6253,
+         OpConditionalCopyObjectINTEL = 6254,
++        OpPredicatedLoadINTEL = 6258,
++        OpPredicatedStoreINTEL = 6259,
+         OpGroupIMulKHR = 6401,
+         OpGroupFMulKHR = 6402,
+         OpGroupBitwiseAndKHR = 6403,
+diff --git a/include/spirv/unified1/spirv.py b/include/spirv/unified1/spirv.py
+index 10854986f..590ee22f3 100644
+--- a/include/spirv/unified1/spirv.py
++++ b/include/spirv/unified1/spirv.py
+@@ -1354,6 +1354,7 @@
+         'UntypedVariableLengthArrayINTEL' : 6243,
+         'SpecConditionalINTEL' : 6245,
+         'FunctionVariantsINTEL' : 6246,
++        'PredicatedIOINTEL' : 6257,
+         'GroupUniformArithmeticKHR' : 6400,
+         'TensorFloat32RoundingINTEL' : 6425,
+         'MaskedGatherScatterINTEL' : 6427,
+@@ -2558,6 +2559,8 @@
+         'OpSpecConstantArchitectureINTEL' : 6252,
+         'OpSpecConstantCapabilitiesINTEL' : 6253,
+         'OpConditionalCopyObjectINTEL' : 6254,
++        'OpPredicatedLoadINTEL' : 6258,
++        'OpPredicatedStoreINTEL' : 6259,
+         'OpGroupIMulKHR' : 6401,
+         'OpGroupFMulKHR' : 6402,
+         'OpGroupBitwiseAndKHR' : 6403,
+diff --git a/include/spirv/unified1/spv.d b/include/spirv/unified1/spv.d
+index c9cde5dcb..032386752 100644
+--- a/include/spirv/unified1/spv.d
++++ b/include/spirv/unified1/spv.d
+@@ -1428,6 +1428,7 @@ enum Capability : uint
+     UntypedVariableLengthArrayINTEL = 6243,
+     SpecConditionalINTEL = 6245,
+     FunctionVariantsINTEL = 6246,
++    PredicatedIOINTEL = 6257,
+     GroupUniformArithmeticKHR = 6400,
+     TensorFloat32RoundingINTEL = 6425,
+     MaskedGatherScatterINTEL = 6427,
+@@ -2696,6 +2697,8 @@ enum Op : uint
+     OpSpecConstantArchitectureINTEL = 6252,
+     OpSpecConstantCapabilitiesINTEL = 6253,
+     OpConditionalCopyObjectINTEL = 6254,
++    OpPredicatedLoadINTEL = 6258,
++    OpPredicatedStoreINTEL = 6259,
+     OpGroupIMulKHR = 6401,
+     OpGroupFMulKHR = 6402,
+     OpGroupBitwiseAndKHR = 6403,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
