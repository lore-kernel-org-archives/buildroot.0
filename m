Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747E4C79FA1
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 15:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3702C6061E;
	Mon,  7 Sep 2026 15:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4ZD344ep_gy; Mon,  7 Sep 2026 15:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A31B260662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788796432;
	b=K+rcGr2aSQ37zvchojXPkaxPcBGpUMDHpv9U7s+iAwJPLHWo9wfe92TycnlcmbYyf1iv
	 ugslgblA63gmRwkUcZ+LkpeyOM75syQnTcJIsxqBofOspGEJ6c+hpXUSjW/AktGP3EtMB
	 M2QbMwhF6nK8Zqs0yYAzo2ObdLgZlZE57x0eWsPCRYKLtdjdDUMufMDUhj3FxzzTJ9wDR
	 QYzFeG0AMixt/s0oaSWveLgzZy8Q2q8Y+mIlZFROMVcRf6wEQXKgx8kDvLsY5zb97ey1V
	 ft5imNHv4YIhnCYExRthhxxI1A/rkqv8OAWEDYF9qt00P5uVoP+7rqrnLvbwa+TR7Wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788796432;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=QK7dG7kxyPkoZvfay0BcN3yrVwK6df/zYdNRKQAUPQo=;
	b=kJdlZTZ/etb1gYgl9B3GgHuBLBqDpYtqMvd1VJC1sMHS+MAjfQ5eiGsFFKUr/DxP2VfC
	 hm2l/aSZWW1MQkpU1OCe8zi4QoI8NKmA4kY13UQW6Fyx7yVdnm5q/9MDvTVi5g4zz5aHk
	 AQ51TS2X4JdLzZQl0sSGbWZwcdT21j7b/p5WJ7ze2V0qqA/ouIqH8aPzR5HS7unLLJRlU
	 dvfEfs/19X8XUo8ihyNkcULwi3xeoWgXc1KBQhrSIHuWwvAritWArZa3AmYiawp5VCSx3
	 /xNexe4TcxacnzP3LaBEcCAX309pitL4UkPh8wXkoMunR5Fj3sRKJzmGPOz4yhobzZg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788796432;
	bh=QK7dG7kxyPkoZvfay0BcN3yrVwK6df/zYdNRKQAUPQo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G100SP0dqIPhpSXIZCxl0KztPpEgSYSiOuaYsj0EsqIJ2Thzx1OXRbUjc65ZbGyjp
	 8X4hSSLONkkpgUK5+LoLmrDlDKdCxKYA8tUCN7oTzXnE8W8tUXyPBnuBBW7FV9pmgK
	 lzOxpeJKXTCCEboNw1K+IPWcZh4cp4sRnCnuwhqV8RnQ/E0fkGk4yjgC2hWkm23wzA
	 yA2vnErCjMER/LaRutgEoVOTVyGUWpaNe4pXSEnDmWBbObEctxloxlAETbV5Wkuba+
	 CKq2gbcpWozNMMWdghlJcHUw85giewGKfzTmaCdDa4Z/2KmN2+KrUZBVgXTGlHQcZB
	 P5a/IJo7rY7eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31B260662;
	Mon,  7 Sep 2026 15:53:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D051949D
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C15C080A79
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEvm-0FKjNRj for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 15:53:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 65B3580A76
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788796428;
 b=SQevAszxjrwR6bmu/ifWEmc21cGy4Sq75A3cAEq/WeHzdyKb4ZAVf6iysYBEUNtQ9Bbl
 wyEsL+Iy46s0eS9Xyc6mW7xNHpLiTKopMLbKtOB/kzPHXp0a3KcHk3dlbjdFtCaoO+kik
 67iLdArIrkLd3f6eJvuumzEpm3GUZ3TgRRrNsnCRANcuW363XanMZ7OoTa8Wd56YleoTy
 35dU0BhKD4tBxS4pUTxx+EbDJE2q87CPrNwj6kmx0GQ5ObQqNFyNhPiBIAd9FvfzrmXSH
 li8kfTHdUs1MuDDfmdkNt8DdNh9qs9jKPcGoiPGocsryZv7gXqH03fPjwO9XhLeJUPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788796428;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=pYC2NM55wpLqH0Dwwgx7fbd/5x3DB1ugUXkaRrCwLUc=;
 b=DunO7wqCg56FhjQWZTLtlxrPJM4JrljzXh+EHc/TKy1kMb90Rem4UEmLFIT49d4hdbFg
 xmK8gRez0gdGqjKOXpDBeB72nyB9NMpehCtw5OD88gCHGZHobIA0DLVbw7bBqf5cpiCsZ
 s8LhOMxXlJP+rEVWSevHpf8uRgW+JwWXSo6DwTTooGL2ZcPe9w+e0014FFAJCsnHdl5AH
 lu7/UbCJLVO16gCOC4hKW6ZbwbJuapGEZaJL3zF9Kd88tbXlpKVgjWAU2tkyFh6xWRime
 qq0DO7x9DxD6Enmy5CoKyUKT6yT1bRlW/8a+QX+O2Vbx/HjDXW3AXePx6xMubkeLY6A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=akLWz8su; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=akLWz8su
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65B3580A76
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788796425;
 bh=pYC2NM55wpLqH0Dwwgx7fbd/5x3DB1ugUXkaRrCwLUc=;
 h=From:To:Cc:Subject:Date:From;
 b=akLWz8sugRO+8UhyRxkxXoNwqVnRCNKwRMoU0yCWwjMTwu0LMAVvg3qOeNR2axjWe
 ytRgeGVAe/20AGZlkrVWsDS9OUk3O721/4A1h+myLe/zIaOJfsJFuMTP4i6mXi1S8k
 HTvfuuaZ1T3bnMdHg0yHb5t+XRBLwj1gIu+15EEM6PCmGkdnZetNETXUx0TwQupdeT
 adhlKzaumqykpNjf3lrYAOCYluHIEcYKQ6zcYWgN46MqE7TF8GFmuDKkdY1FxSrW+b
 siBJrpMcCoC7v16oc3q3qcniaPtMh7M6g+48reXsGsIOw3TdXTCp7auTQNSQemI7qJ
 ODTA6fSdli4Bg==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17767A4C3798;
 Mon,  7 Sep 2026 17:53:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49438)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3bfE-000000001FY-30rG;
 Mon, 07 Sep 2026 15:53:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Mon,  7 Sep 2026 17:53:42 +0200
Message-ID: <20260907155344.3755749-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/3] package/spirv-{headers,
 tools}: bump to version 1.4.357.0
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

https://github.com/KhronosGroup/SPIRV-Tools/blob/vulkan-sdk-1.4.357.0/CHANGES

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-changes-for-SPV_INTEL_predicated_io.patch | 340 ------------------
 package/spirv-headers/spirv-headers.hash      |   2 +-
 package/spirv-headers/spirv-headers.mk        |   2 +-
 package/spirv-tools/spirv-tools.hash          |   2 +-
 package/spirv-tools/spirv-tools.mk            |   2 +-
 5 files changed, 4 insertions(+), 344 deletions(-)
 delete mode 100644 package/spirv-headers/0001-grammar-and-header-changes-for-SPV_INTEL_predicated_io.patch

diff --git a/package/spirv-headers/0001-grammar-and-header-changes-for-SPV_INTEL_predicated_io.patch b/package/spirv-headers/0001-grammar-and-header-changes-for-SPV_INTEL_predicated_io.patch
deleted file mode 100644
index 1bb7b80b69..0000000000
--- a/package/spirv-headers/0001-grammar-and-header-changes-for-SPV_INTEL_predicated_io.patch
+++ /dev/null
@@ -1,340 +0,0 @@
-From b8a32968473ce852a809b9de5f04f02a5a9dfa78 Mon Sep 17 00:00:00 2001
-From: Yury Plyakhin <yury.plyakhin@intel.com>
-Date: Wed, 29 Apr 2026 07:52:53 -0700
-Subject: [PATCH] grammar and header changes for SPV_INTEL_predicated_io (#585)
-
-Upstream: https://github.com/KhronosGroup/SPIRV-Headers/commit/b8a32968473ce852a809b9de5f04f02a5a9dfa78
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- include/spirv/unified1/spirv.bf               |  3 ++
- .../spirv/unified1/spirv.core.grammar.json    | 34 +++++++++++++++++++
- include/spirv/unified1/spirv.cs               |  3 ++
- include/spirv/unified1/spirv.h                |  8 +++++
- include/spirv/unified1/spirv.hpp              |  8 +++++
- include/spirv/unified1/spirv.hpp11            |  8 +++++
- include/spirv/unified1/spirv.json             |  3 ++
- include/spirv/unified1/spirv.lua              |  3 ++
- include/spirv/unified1/spirv.py               |  3 ++
- include/spirv/unified1/spv.d                  |  3 ++
- 10 files changed, 76 insertions(+)
-
-diff --git a/include/spirv/unified1/spirv.bf b/include/spirv/unified1/spirv.bf
-index b70525942..0fd870336 100644
---- a/include/spirv/unified1/spirv.bf
-+++ b/include/spirv/unified1/spirv.bf
-@@ -1426,6 +1426,7 @@ namespace Spv
-             UntypedVariableLengthArrayINTEL = 6243,
-             SpecConditionalINTEL = 6245,
-             FunctionVariantsINTEL = 6246,
-+            PredicatedIOINTEL = 6257,
-             GroupUniformArithmeticKHR = 6400,
-             TensorFloat32RoundingINTEL = 6425,
-             MaskedGatherScatterINTEL = 6427,
-@@ -2694,6 +2695,8 @@ namespace Spv
-             OpSpecConstantArchitectureINTEL = 6252,
-             OpSpecConstantCapabilitiesINTEL = 6253,
-             OpConditionalCopyObjectINTEL = 6254,
-+            OpPredicatedLoadINTEL = 6258,
-+            OpPredicatedStoreINTEL = 6259,
-             OpGroupIMulKHR = 6401,
-             OpGroupFMulKHR = 6402,
-             OpGroupBitwiseAndKHR = 6403,
-diff --git a/include/spirv/unified1/spirv.core.grammar.json b/include/spirv/unified1/spirv.core.grammar.json
-index 22f5fe9c7..0a282c56f 100644
---- a/include/spirv/unified1/spirv.core.grammar.json
-+++ b/include/spirv/unified1/spirv.core.grammar.json
-@@ -11598,6 +11598,34 @@
-       "provisional" : true,
-       "version" : "None"
-     },
-+    {
-+      "opname" : "OpPredicatedLoadINTEL",
-+      "class"  : "Memory",
-+      "opcode" : 6258,
-+      "operands" : [
-+        { "kind" : "IdResultType" },
-+        { "kind" : "IdResult" },
-+        { "kind" : "IdRef",                          "name" : "Pointer" },
-+        { "kind" : "IdRef",                          "name" : "Predicate" },
-+        { "kind" : "IdRef",                          "name" : "Default Value" },
-+        { "kind" : "MemoryAccess", "quantifier" : "?" }
-+      ],
-+      "capabilities" : [ "PredicatedIOINTEL" ],
-+      "version" : "None"
-+    },
-+    {
-+      "opname" : "OpPredicatedStoreINTEL",
-+      "class"  : "Memory",
-+      "opcode" : 6259,
-+      "operands" : [
-+        { "kind" : "IdRef",                          "name" : "Pointer" },
-+        { "kind" : "IdRef",                          "name" : "Object" },
-+        { "kind" : "IdRef",                          "name" : "Predicate" },
-+        { "kind" : "MemoryAccess", "quantifier" : "?" }
-+      ],
-+      "capabilities" : [ "PredicatedIOINTEL" ],
-+      "version" : "None"
-+    },
-     {
-       "opname" : "OpGroupIMulKHR",
-       "class"  : "Group",
-@@ -18659,6 +18687,12 @@
-           "provisional" : true,
-           "version": "None"
-         },
-+        {
-+          "enumerant" : "PredicatedIOINTEL",
-+          "value" : 6257,
-+          "extensions" : [ "SPV_INTEL_predicated_io" ],
-+          "version" : "None"
-+        },
-         {
-           "enumerant" : "GroupUniformArithmeticKHR",
-           "value" : 6400,
-diff --git a/include/spirv/unified1/spirv.cs b/include/spirv/unified1/spirv.cs
-index 2f8c1ff8a..375dd0b46 100644
---- a/include/spirv/unified1/spirv.cs
-+++ b/include/spirv/unified1/spirv.cs
-@@ -1425,6 +1425,7 @@ public enum Capability
-             UntypedVariableLengthArrayINTEL = 6243,
-             SpecConditionalINTEL = 6245,
-             FunctionVariantsINTEL = 6246,
-+            PredicatedIOINTEL = 6257,
-             GroupUniformArithmeticKHR = 6400,
-             TensorFloat32RoundingINTEL = 6425,
-             MaskedGatherScatterINTEL = 6427,
-@@ -2693,6 +2694,8 @@ public enum Op
-             OpSpecConstantArchitectureINTEL = 6252,
-             OpSpecConstantCapabilitiesINTEL = 6253,
-             OpConditionalCopyObjectINTEL = 6254,
-+            OpPredicatedLoadINTEL = 6258,
-+            OpPredicatedStoreINTEL = 6259,
-             OpGroupIMulKHR = 6401,
-             OpGroupFMulKHR = 6402,
-             OpGroupBitwiseAndKHR = 6403,
-diff --git a/include/spirv/unified1/spirv.h b/include/spirv/unified1/spirv.h
-index d00cf0f4e..9233ff0ee 100644
---- a/include/spirv/unified1/spirv.h
-+++ b/include/spirv/unified1/spirv.h
-@@ -1396,6 +1396,7 @@ typedef enum SpvCapability_ {
-     SpvCapabilityUntypedVariableLengthArrayINTEL = 6243,
-     SpvCapabilitySpecConditionalINTEL = 6245,
-     SpvCapabilityFunctionVariantsINTEL = 6246,
-+    SpvCapabilityPredicatedIOINTEL = 6257,
-     SpvCapabilityGroupUniformArithmeticKHR = 6400,
-     SpvCapabilityTensorFloat32RoundingINTEL = 6425,
-     SpvCapabilityMaskedGatherScatterINTEL = 6427,
-@@ -2628,6 +2629,8 @@ typedef enum SpvOp_ {
-     SpvOpSpecConstantArchitectureINTEL = 6252,
-     SpvOpSpecConstantCapabilitiesINTEL = 6253,
-     SpvOpConditionalCopyObjectINTEL = 6254,
-+    SpvOpPredicatedLoadINTEL = 6258,
-+    SpvOpPredicatedStoreINTEL = 6259,
-     SpvOpGroupIMulKHR = 6401,
-     SpvOpGroupFMulKHR = 6402,
-     SpvOpGroupBitwiseAndKHR = 6403,
-@@ -3510,6 +3513,8 @@ inline void SpvHasResultAndType(SpvOp opcode, bool *hasResult, bool *hasResultTy
-     case SpvOpSpecConstantArchitectureINTEL: *hasResult = true; *hasResultType = true; break;
-     case SpvOpSpecConstantCapabilitiesINTEL: *hasResult = true; *hasResultType = true; break;
-     case SpvOpConditionalCopyObjectINTEL: *hasResult = true; *hasResultType = true; break;
-+    case SpvOpPredicatedLoadINTEL: *hasResult = true; *hasResultType = true; break;
-+    case SpvOpPredicatedStoreINTEL: *hasResult = false; *hasResultType = false; break;
-     case SpvOpGroupIMulKHR: *hasResult = true; *hasResultType = true; break;
-     case SpvOpGroupFMulKHR: *hasResult = true; *hasResultType = true; break;
-     case SpvOpGroupBitwiseAndKHR: *hasResult = true; *hasResultType = true; break;
-@@ -4517,6 +4522,7 @@ inline const char* SpvCapabilityToString(SpvCapability value) {
-     case SpvCapabilityUntypedVariableLengthArrayINTEL: return "UntypedVariableLengthArrayINTEL";
-     case SpvCapabilitySpecConditionalINTEL: return "SpecConditionalINTEL";
-     case SpvCapabilityFunctionVariantsINTEL: return "FunctionVariantsINTEL";
-+    case SpvCapabilityPredicatedIOINTEL: return "PredicatedIOINTEL";
-     case SpvCapabilityGroupUniformArithmeticKHR: return "GroupUniformArithmeticKHR";
-     case SpvCapabilityTensorFloat32RoundingINTEL: return "TensorFloat32RoundingINTEL";
-     case SpvCapabilityMaskedGatherScatterINTEL: return "MaskedGatherScatterINTEL";
-@@ -5575,6 +5581,8 @@ inline const char* SpvOpToString(SpvOp value) {
-     case SpvOpSpecConstantArchitectureINTEL: return "OpSpecConstantArchitectureINTEL";
-     case SpvOpSpecConstantCapabilitiesINTEL: return "OpSpecConstantCapabilitiesINTEL";
-     case SpvOpConditionalCopyObjectINTEL: return "OpConditionalCopyObjectINTEL";
-+    case SpvOpPredicatedLoadINTEL: return "OpPredicatedLoadINTEL";
-+    case SpvOpPredicatedStoreINTEL: return "OpPredicatedStoreINTEL";
-     case SpvOpGroupIMulKHR: return "OpGroupIMulKHR";
-     case SpvOpGroupFMulKHR: return "OpGroupFMulKHR";
-     case SpvOpGroupBitwiseAndKHR: return "OpGroupBitwiseAndKHR";
-diff --git a/include/spirv/unified1/spirv.hpp b/include/spirv/unified1/spirv.hpp
-index 462c3f6bf..055086ca5 100644
---- a/include/spirv/unified1/spirv.hpp
-+++ b/include/spirv/unified1/spirv.hpp
-@@ -1392,6 +1392,7 @@ enum Capability {
-     CapabilityUntypedVariableLengthArrayINTEL = 6243,
-     CapabilitySpecConditionalINTEL = 6245,
-     CapabilityFunctionVariantsINTEL = 6246,
-+    CapabilityPredicatedIOINTEL = 6257,
-     CapabilityGroupUniformArithmeticKHR = 6400,
-     CapabilityTensorFloat32RoundingINTEL = 6425,
-     CapabilityMaskedGatherScatterINTEL = 6427,
-@@ -2624,6 +2625,8 @@ enum Op {
-     OpSpecConstantArchitectureINTEL = 6252,
-     OpSpecConstantCapabilitiesINTEL = 6253,
-     OpConditionalCopyObjectINTEL = 6254,
-+    OpPredicatedLoadINTEL = 6258,
-+    OpPredicatedStoreINTEL = 6259,
-     OpGroupIMulKHR = 6401,
-     OpGroupFMulKHR = 6402,
-     OpGroupBitwiseAndKHR = 6403,
-@@ -3506,6 +3509,8 @@ inline void HasResultAndType(Op opcode, bool *hasResult, bool *hasResultType) {
-     case OpSpecConstantArchitectureINTEL: *hasResult = true; *hasResultType = true; break;
-     case OpSpecConstantCapabilitiesINTEL: *hasResult = true; *hasResultType = true; break;
-     case OpConditionalCopyObjectINTEL: *hasResult = true; *hasResultType = true; break;
-+    case OpPredicatedLoadINTEL: *hasResult = true; *hasResultType = true; break;
-+    case OpPredicatedStoreINTEL: *hasResult = false; *hasResultType = false; break;
-     case OpGroupIMulKHR: *hasResult = true; *hasResultType = true; break;
-     case OpGroupFMulKHR: *hasResult = true; *hasResultType = true; break;
-     case OpGroupBitwiseAndKHR: *hasResult = true; *hasResultType = true; break;
-@@ -4513,6 +4518,7 @@ inline const char* CapabilityToString(Capability value) {
-     case CapabilityUntypedVariableLengthArrayINTEL: return "UntypedVariableLengthArrayINTEL";
-     case CapabilitySpecConditionalINTEL: return "SpecConditionalINTEL";
-     case CapabilityFunctionVariantsINTEL: return "FunctionVariantsINTEL";
-+    case CapabilityPredicatedIOINTEL: return "PredicatedIOINTEL";
-     case CapabilityGroupUniformArithmeticKHR: return "GroupUniformArithmeticKHR";
-     case CapabilityTensorFloat32RoundingINTEL: return "TensorFloat32RoundingINTEL";
-     case CapabilityMaskedGatherScatterINTEL: return "MaskedGatherScatterINTEL";
-@@ -5571,6 +5577,8 @@ inline const char* OpToString(Op value) {
-     case OpSpecConstantArchitectureINTEL: return "OpSpecConstantArchitectureINTEL";
-     case OpSpecConstantCapabilitiesINTEL: return "OpSpecConstantCapabilitiesINTEL";
-     case OpConditionalCopyObjectINTEL: return "OpConditionalCopyObjectINTEL";
-+    case OpPredicatedLoadINTEL: return "OpPredicatedLoadINTEL";
-+    case OpPredicatedStoreINTEL: return "OpPredicatedStoreINTEL";
-     case OpGroupIMulKHR: return "OpGroupIMulKHR";
-     case OpGroupFMulKHR: return "OpGroupFMulKHR";
-     case OpGroupBitwiseAndKHR: return "OpGroupBitwiseAndKHR";
-diff --git a/include/spirv/unified1/spirv.hpp11 b/include/spirv/unified1/spirv.hpp11
-index 41ebe9157..0d85dfec2 100644
---- a/include/spirv/unified1/spirv.hpp11
-+++ b/include/spirv/unified1/spirv.hpp11
-@@ -1392,6 +1392,7 @@ enum class Capability : unsigned {
-     UntypedVariableLengthArrayINTEL = 6243,
-     SpecConditionalINTEL = 6245,
-     FunctionVariantsINTEL = 6246,
-+    PredicatedIOINTEL = 6257,
-     GroupUniformArithmeticKHR = 6400,
-     TensorFloat32RoundingINTEL = 6425,
-     MaskedGatherScatterINTEL = 6427,
-@@ -2624,6 +2625,8 @@ enum class Op : unsigned {
-     OpSpecConstantArchitectureINTEL = 6252,
-     OpSpecConstantCapabilitiesINTEL = 6253,
-     OpConditionalCopyObjectINTEL = 6254,
-+    OpPredicatedLoadINTEL = 6258,
-+    OpPredicatedStoreINTEL = 6259,
-     OpGroupIMulKHR = 6401,
-     OpGroupFMulKHR = 6402,
-     OpGroupBitwiseAndKHR = 6403,
-@@ -3506,6 +3509,8 @@ inline void HasResultAndType(Op opcode, bool *hasResult, bool *hasResultType) {
-     case Op::OpSpecConstantArchitectureINTEL: *hasResult = true; *hasResultType = true; break;
-     case Op::OpSpecConstantCapabilitiesINTEL: *hasResult = true; *hasResultType = true; break;
-     case Op::OpConditionalCopyObjectINTEL: *hasResult = true; *hasResultType = true; break;
-+    case Op::OpPredicatedLoadINTEL: *hasResult = true; *hasResultType = true; break;
-+    case Op::OpPredicatedStoreINTEL: *hasResult = false; *hasResultType = false; break;
-     case Op::OpGroupIMulKHR: *hasResult = true; *hasResultType = true; break;
-     case Op::OpGroupFMulKHR: *hasResult = true; *hasResultType = true; break;
-     case Op::OpGroupBitwiseAndKHR: *hasResult = true; *hasResultType = true; break;
-@@ -4513,6 +4518,7 @@ inline const char* CapabilityToString(Capability value) {
-     case Capability::UntypedVariableLengthArrayINTEL: return "UntypedVariableLengthArrayINTEL";
-     case Capability::SpecConditionalINTEL: return "SpecConditionalINTEL";
-     case Capability::FunctionVariantsINTEL: return "FunctionVariantsINTEL";
-+    case Capability::PredicatedIOINTEL: return "PredicatedIOINTEL";
-     case Capability::GroupUniformArithmeticKHR: return "GroupUniformArithmeticKHR";
-     case Capability::TensorFloat32RoundingINTEL: return "TensorFloat32RoundingINTEL";
-     case Capability::MaskedGatherScatterINTEL: return "MaskedGatherScatterINTEL";
-@@ -5571,6 +5577,8 @@ inline const char* OpToString(Op value) {
-     case Op::OpSpecConstantArchitectureINTEL: return "OpSpecConstantArchitectureINTEL";
-     case Op::OpSpecConstantCapabilitiesINTEL: return "OpSpecConstantCapabilitiesINTEL";
-     case Op::OpConditionalCopyObjectINTEL: return "OpConditionalCopyObjectINTEL";
-+    case Op::OpPredicatedLoadINTEL: return "OpPredicatedLoadINTEL";
-+    case Op::OpPredicatedStoreINTEL: return "OpPredicatedStoreINTEL";
-     case Op::OpGroupIMulKHR: return "OpGroupIMulKHR";
-     case Op::OpGroupFMulKHR: return "OpGroupFMulKHR";
-     case Op::OpGroupBitwiseAndKHR: return "OpGroupBitwiseAndKHR";
-diff --git a/include/spirv/unified1/spirv.json b/include/spirv/unified1/spirv.json
-index 0a200b27b..ec778af36 100644
---- a/include/spirv/unified1/spirv.json
-+++ b/include/spirv/unified1/spirv.json
-@@ -1358,6 +1358,7 @@
-                     "UntypedVariableLengthArrayINTEL": 6243,
-                     "SpecConditionalINTEL": 6245,
-                     "FunctionVariantsINTEL": 6246,
-+                    "PredicatedIOINTEL": 6257,
-                     "GroupUniformArithmeticKHR": 6400,
-                     "TensorFloat32RoundingINTEL": 6425,
-                     "MaskedGatherScatterINTEL": 6427,
-@@ -2595,6 +2596,8 @@
-                     "OpSpecConstantArchitectureINTEL": 6252,
-                     "OpSpecConstantCapabilitiesINTEL": 6253,
-                     "OpConditionalCopyObjectINTEL": 6254,
-+                    "OpPredicatedLoadINTEL": 6258,
-+                    "OpPredicatedStoreINTEL": 6259,
-                     "OpGroupIMulKHR": 6401,
-                     "OpGroupFMulKHR": 6402,
-                     "OpGroupBitwiseAndKHR": 6403,
-diff --git a/include/spirv/unified1/spirv.lua b/include/spirv/unified1/spirv.lua
-index e61202550..b883dd880 100644
---- a/include/spirv/unified1/spirv.lua
-+++ b/include/spirv/unified1/spirv.lua
-@@ -1383,6 +1383,7 @@ spv = {
-         UntypedVariableLengthArrayINTEL = 6243,
-         SpecConditionalINTEL = 6245,
-         FunctionVariantsINTEL = 6246,
-+        PredicatedIOINTEL = 6257,
-         GroupUniformArithmeticKHR = 6400,
-         TensorFloat32RoundingINTEL = 6425,
-         MaskedGatherScatterINTEL = 6427,
-@@ -2615,6 +2616,8 @@ spv = {
-         OpSpecConstantArchitectureINTEL = 6252,
-         OpSpecConstantCapabilitiesINTEL = 6253,
-         OpConditionalCopyObjectINTEL = 6254,
-+        OpPredicatedLoadINTEL = 6258,
-+        OpPredicatedStoreINTEL = 6259,
-         OpGroupIMulKHR = 6401,
-         OpGroupFMulKHR = 6402,
-         OpGroupBitwiseAndKHR = 6403,
-diff --git a/include/spirv/unified1/spirv.py b/include/spirv/unified1/spirv.py
-index 10854986f..590ee22f3 100644
---- a/include/spirv/unified1/spirv.py
-+++ b/include/spirv/unified1/spirv.py
-@@ -1354,6 +1354,7 @@
-         'UntypedVariableLengthArrayINTEL' : 6243,
-         'SpecConditionalINTEL' : 6245,
-         'FunctionVariantsINTEL' : 6246,
-+        'PredicatedIOINTEL' : 6257,
-         'GroupUniformArithmeticKHR' : 6400,
-         'TensorFloat32RoundingINTEL' : 6425,
-         'MaskedGatherScatterINTEL' : 6427,
-@@ -2558,6 +2559,8 @@
-         'OpSpecConstantArchitectureINTEL' : 6252,
-         'OpSpecConstantCapabilitiesINTEL' : 6253,
-         'OpConditionalCopyObjectINTEL' : 6254,
-+        'OpPredicatedLoadINTEL' : 6258,
-+        'OpPredicatedStoreINTEL' : 6259,
-         'OpGroupIMulKHR' : 6401,
-         'OpGroupFMulKHR' : 6402,
-         'OpGroupBitwiseAndKHR' : 6403,
-diff --git a/include/spirv/unified1/spv.d b/include/spirv/unified1/spv.d
-index c9cde5dcb..032386752 100644
---- a/include/spirv/unified1/spv.d
-+++ b/include/spirv/unified1/spv.d
-@@ -1428,6 +1428,7 @@ enum Capability : uint
-     UntypedVariableLengthArrayINTEL = 6243,
-     SpecConditionalINTEL = 6245,
-     FunctionVariantsINTEL = 6246,
-+    PredicatedIOINTEL = 6257,
-     GroupUniformArithmeticKHR = 6400,
-     TensorFloat32RoundingINTEL = 6425,
-     MaskedGatherScatterINTEL = 6427,
-@@ -2696,6 +2697,8 @@ enum Op : uint
-     OpSpecConstantArchitectureINTEL = 6252,
-     OpSpecConstantCapabilitiesINTEL = 6253,
-     OpConditionalCopyObjectINTEL = 6254,
-+    OpPredicatedLoadINTEL = 6258,
-+    OpPredicatedStoreINTEL = 6259,
-     OpGroupIMulKHR = 6401,
-     OpGroupFMulKHR = 6402,
-     OpGroupBitwiseAndKHR = 6403,
diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 1d0057fb60..225946c381 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9905d9341f20388adb852c77dd982f2c4d539fd68e6c1f1bcebf034715f2d1d5  spirv-headers-1.4.350.0.tar.gz
+sha256  4d703067a7e06331ccb37bdfed3f9b7879cc61969a2689ae95c95db34a47ff07  spirv-headers-1.4.357.0.tar.gz
 sha256  ea43b1de38a6f90c488800d66dec1ed671e68cda530266bc96951fb5b6307613  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 87c4eb1888..e2937b5fd6 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.4.350.0
+SPIRV_HEADERS_VERSION = 1.4.357.0
 SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index 9b7133016a..f5fb6dd080 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  446b288fe76d3f31bbf9a405d62b97020ac0f135edb0ed5dbdf1136c488138f5  spirv-tools-1.4.350.0.tar.gz
+sha256  d31e7109b6ef3559067e53e520870eafed7c9534d00db9728814b6df03fa4a5e  spirv-tools-1.4.357.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index c9735d7ecd..a427224130 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.4.350.0
+SPIRV_TOOLS_VERSION = 1.4.357.0
 SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
