Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C14606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ms8gxu4r
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0486681664;
	Fri, 30 Oct 2026 14:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRE-SBP_PRVf; Fri, 30 Oct 2026 14:48:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D96B8159B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793371694;
	b=gifm4BHjMCD1frdXH5S8zujbnpffS4Z31Lpdmv07Bki2e+DDO/6ua+L3D/6GI4glJu98
	 5uJbJ33HzEihAgfrlvDoKD2GG+hoOmXnJ4OYWc5zTwPLfOko+a6p/tenm0gDH0pdzrGdl
	 uwr3QF881cLDlpYA4ZhfgZFIkAmSIkxfoUxO5dHIHCRT/ZunQYyhhOXyUMVkuO2g231gt
	 sNWL+85SqMGqLayQvTRup6uMi/8zCQE/g8LyAZnRDCZFGEMJqIZkIQ+Jme7LAQD7iJri/
	 A6oIqgCh4cWLaNZKYKwCN1Kl4jFx9ZuNalRTpDNYr7mjGbvJgpBAH5Ufg+T+PVNEq3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793371694;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KVc/BVb5uVsZd7gqZyN9InbUtlr4ofXhZn6SqajOKdI=;
	b=O9mcE7bphQLgMJ5vOJcFtEDliU1q1POarEnGHxFFognGVMtzh1JxMfmi+916nsapUILg
	 YI4dcqkNe/IU77+2lRWQolRg+lkgaN8F7Tvpk5upDXwW8qPu3rR7Hpao7FRG4UdJHCGog
	 LN0JXGdrWCt44LGQKppCuBbAMwpiwtN6rDXSdaPhGaZX1cB4NF2i3GGkhds0GSeS1DX5x
	 a1FZvg+UgIhnCPTGpPD6p/teY9+SLHaqVeKMZyJedjXw6pAa44cIDnOhinT/7u9Mgq92B
	 8MVShTMg/7B/OMiThsgj79fh09mYJ2VcZ3R/M5tqnH4lz4kasUR48G9/WYFPno6IK4w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793371694;
	bh=KVc/BVb5uVsZd7gqZyN9InbUtlr4ofXhZn6SqajOKdI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Ms8gxu4rlqqrY0N/1rXq4aA96VYMH2evZ2evujdeKnAUT7CztXf2reGZaNEVW70DZ
	 2/D/AeyxFqnIFqNCseM5uBvVhJviYwYCMeMkYWdIJjqq80NEnxMXfe2Gsw8LosqC3J
	 81+FqOKJtGRGJ2EpHQGWmxBmetbwC/WHiOAzjyZDDX+RQLUND95aebD/d7C+TRrCIm
	 xYpPttcA92wQiqjy8Z59vlRsajyBWWS6DCIAKeKZMGWX5N6TMmyvUK7t40Qal6Zkm4
	 7O8CNcgpbiPMacpM+iZDR0IWz4VM4z8v0cLehTvNdlDhWGrqH+Q5K9j3+MWeLkg/W+
	 cFRkplU7hp5vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D96B8159B;
	Fri, 30 Oct 2026 14:48:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89A20529
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 871B5607D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p03p4Fzs4gHv for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:48:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ECB49607B6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793371690;
 b=D+eHKNGr9/0PX0NVsk8llz6SB3f4ImY9o1XQPElRuFWms+p8f2W9VQlRc6aRy56Aoxuy
 z6qIi0iTZmTNNILKIUAIVCpTj/BUsAgJ2tNydf4+vCrSlsQEy65k/3bOoHaNnvyq0Lqp1
 nXHLlzLdPQr3GSuRqcK0vJkXeNCVi8DqVtg7ku0l3wIfZ361jkaBNM6sZ3krfUoWYv1hu
 a6afl6mfKr/nDNwunK41LQY8347EXG/kzAMHcgOHCLwSgGyoAzLUahMlb19Wg/+1AnQSA
 UzAZa6RzNxRzoC+xY9C5N6BnJK6haML0zap85DqN8HRYOQ+GbQd+0HOTd27tzHQKstQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793371690;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=wRwykoI1r1lVF3RmOAgQHFWXCoQEffEwYqKRL59LN9I=;
 b=mHPBX2uvtw7HkzDnGrHFCkf0NoJ0pADtOv1iLbPcyW3EcSdIpKrKjkUkw2hyiGnG8y3J
 twSIqxGokxds4YEinYzvdGjjRH4D1po/yF9ZnSfB4Iy3x45UchNIWEvBU33CnINq9tLdl
 EIZyqt0hdi98qVtNfO4AWZz5YDMqcc7fRqM+xXCct2p8U0SdyJZPK8iinIAyeNYvYF84t
 E3ILGkWjinyzGWdDSSHHa4rMozaAxaRQqyxmH6+E+CjciaB+qBJQov9fRWvg6IrbnSD65
 Y45Y72OE49GSJU5QReTC081VyqZxApULlAVqQS1Ydn6EyrHa54XG5xxwGJHBkWvYLWg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=G4PchgW3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECB49607B6
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:48:09 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b413b0a974so1129463a12.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 07:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793371687; x=1793976487;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wRwykoI1r1lVF3RmOAgQHFWXCoQEffEwYqKRL59LN9I=;
 b=jzEpxYr7IV6Y+VqV/FgWSkSVxPHUsynGpKgq7KBVzgAuUngSr+i5SfakbA20l5PIYE
 vtiq5VYZMgGwUIhaCO4ovtc6t1k52qJXK8XQSy56DlcQNvcp86xFNSMIW/Uc97ZUwCM0
 P3ZXAzW2cAvbmtgSdRmEWQ8Uml55uHaWxrme2PqyDEEGTMLMXfb3Ga4wMDFiBnZ7fwt1
 ulptUeOGx1j8w6J84w8bALeW9raybmacotvZ09LKcPDXSRB6d5DeLX44FL0rT46XjJvN
 l3cimTSJ/+jRnjO6UVY6qsaavpgdDh6FD0NDtLSkN6x5v+q+RoEcc36u4EoaKvg5FCYP
 tfmQ==
X-Gm-Message-State: AFq9FYI4tPoq778gupnORV6t8ETyfX7Bq10X73UO3vq5VCefV7Z218FT
 lqzgHtPIYguixjVxDAbbKe5uWnJrIR3wa9neGDDyQJejuIHsbXNveYCCCA5Efw==
X-Gm-Gg: AYBFou28+JEmajFmoG1RvbGYUEqZriOTkeEh86vLn1DVWGnwq7maWqti9kfyoNY2k6e
 IKeKendFBcXGcfwYdQtr73zkJkCqc8Q31sTMuZeqsjX+Q9pvL5NXPQiDiFk73aUvxYRtav/Yyh+
 J6tfzfONAg8QZ//FHhDW6JA6d1K50UbKqtRRTM41gCGnFKjLl58M3S+FxqDbON8NocoI+tzxewS
 VQG9VV4Ioj7fKlamUstblbi+AshuZ3BJq8f6rK88SU/P2KWMgzHNq1/dazT1xlzMN1IvxVCkUZp
 cRAnKEcTt6YrdCWBUgPFhC34Lco+S+uCMb8s8gm3flNLVqQ2HfIb9cywQKAGyiLLWQiD7KGbHWk
 ATy/x3dYiH487T3o0eGLrNjTebFhL2m8El/sAxttDMwzE4QG/ncRhGovNx9C5t5kOH6nAwNiQO4
 fNiFmKH1scaL+9xj0vjUQYPGL0P8U1kllpzfCa61Hp/pr5i15Xv7CR5Lb039BEB/r/GqsQCXvvD
 gqVQ0wAgUUQZQRT/sXJ2S76uiEfQLW/4xBgukaxeVwY+vXv/Y4croJhUk5YSRr2VHutmm5ChE/5
 G811xL8GITsl19haiHsbnBem7ySHsODc5MjtMRhnsWSiESzvaAwgR/NzFBt8nUFP/ts5+FQUnC9
 9pgjN9n/K
X-Received: by 2002:a17:907:7f90:b0:c49:bc1f:fe2d with SMTP id
 a640c23a62f3a-c4ca7a858f3mr234652766b.28.1793371686970; 
 Fri, 30 Oct 2026 07:48:06 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cabe101d4sm72581066b.40.2026.10.30.07.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 07:48:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 15:48:05 +0100
Message-Id: <20261030144806.2040536-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/zynaddsubfx: add mxml 4.x support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Backport upstream commit f57e0ce3a56a ("Support MXML4, if available"),
which makes the build look for mxml4.pc first and adapts XMLwrapper to
the mxml 4.x API, while keeping mxml 3.x support.

This is needed for the upcoming mxml bump to 4.x, which installs the
library as libmxml4 with an mxml4.pc file, so that without this patch
the configure step fails with:

  -- Checking for module 'mxml'
  --   Package 'mxml' not found

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0005-Support-MXML4-if-available.patch     | 328 ++++++++++++++++++
 1 file changed, 328 insertions(+)
 create mode 100644 package/zynaddsubfx/0005-Support-MXML4-if-available.patch

diff --git a/package/zynaddsubfx/0005-Support-MXML4-if-available.patch b/package/zynaddsubfx/0005-Support-MXML4-if-available.patch
new file mode 100644
index 0000000000..388c4375b0
--- /dev/null
+++ b/package/zynaddsubfx/0005-Support-MXML4-if-available.patch
@@ -0,0 +1,328 @@
+From f57e0ce3a56ab508cce8946f78c94de91ed9c313 Mon Sep 17 00:00:00 2001
+From: Johannes Lorenz <j.git@lorenz-ho.me>
+Date: Sun, 12 Jan 2025 15:33:11 +0100
+Subject: [PATCH] Support MXML4, if available
+
+Improve comments
+
+MXML4: Free memory
+
+Fixup test, so it works on mxml3 and 4
+
+Fix MessageTest for MXML4
+
+Upstream: https://github.com/zynaddsubfx/zynaddsubfx/commit/f57e0ce3a56ab508cce8946f78c94de91ed9c313
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/CMakeLists.txt        |  5 ++-
+ src/Misc/XMLwrapper.cpp   | 93 +++++++++++++++++++++++++++++++--------
+ src/Tests/MessageTest.cpp | 16 +++----
+ src/Tests/PluginTest.cpp  | 21 ++++++++-
+ 4 files changed, 104 insertions(+), 31 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 396f28fe..555825d4 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -33,7 +33,10 @@ if(PKG_CONFIG_FOUND AND NOT (${CMAKE_SYSTEM_NAME} STREQUAL "Windows"))
+     pkg_check_modules(NTK_IMAGES ntk_images)
+ 
+     pkg_check_modules(FFTW3F REQUIRED fftw3f)
+-    pkg_check_modules(MXML REQUIRED mxml)
++    pkg_check_modules(MXML mxml4)
++    if(NOT MXML_FOUND)
++        pkg_check_modules(MXML REQUIRED mxml)
++    endif()
+ 
+     pkg_search_module(LASH lash-1.0)
+     mark_as_advanced(LASH_LIBRARIES)
+diff --git a/src/Misc/XMLwrapper.cpp b/src/Misc/XMLwrapper.cpp
+index e1c55a49..b34c843c 100644
+--- a/src/Misc/XMLwrapper.cpp
++++ b/src/Misc/XMLwrapper.cpp
+@@ -32,9 +32,30 @@ namespace zyn {
+ int  xml_k   = 0;
+ bool verbose = false;
+ 
+-const char *XMLwrapper_whitespace_callback(mxml_node_t *node, int where)
++#if MXML_MAJOR_VERSION <= 3
++// Mimic datatypes present in mxml4 for compatibility
++typedef int mxml_ws_t;
++typedef int mxml_descend_t;
++// Mimic typenames present in mxml4 for compatibility
++constexpr int MXML_DESCEND_ALL = MXML_DESCEND;
++constexpr int MXML_DESCEND_NONE = MXML_NO_DESCEND;
++constexpr int MXML_TYPE_OPAQUE = MXML_OPAQUE;
++constexpr int MXML_TYPE_ELEMENT = MXML_ELEMENT;
++constexpr int MXML_TYPE_TEXT = MXML_TEXT;
++#endif
++
++const char *XMLwrapper_whitespace_callback(void*, mxml_node_t *node, mxml_ws_t where)
+ {
++#if MXML_MAJOR_VERSION >= 4
++    // New node types in MXL4
++    if(mxmlGetDirective(node))  // "?xml" directive
++        return "\n";
++    else if(mxmlGetDeclaration(node))  // "!DOCTYPE" declaration
++        return nullptr;
++#endif
++
+     const char *name = mxmlGetElement(node);
++    assert(name);
+ 
+     if((where == MXML_WS_BEFORE_OPEN) && (!strcmp(name, "?xml")))
+         return NULL;
+@@ -67,13 +88,21 @@ const char *XMLwrapper_whitespace_callback(mxml_node_t *node, int where)
+     return 0;
+ }
+ 
++#if MXML_MAJOR_VERSION <= 3
++// Wrapper, because int and mxml_ws_t are different types
++inline const char *XMLwrapper_whitespace_callback(mxml_node_t *node, int where)
++{
++    return XMLwrapper_whitespace_callback(nullptr, node, where);
++}
++#endif
++
+ //temporary const overload of mxmlFindElement
+ const mxml_node_t *mxmlFindElement(const mxml_node_t *node,
+                                    const mxml_node_t *top,
+                                    const char *name,
+                                    const char *attr,
+                                    const char *value,
+-                                   int descend)
++                                   mxml_descend_t descend)
+ {
+     return const_cast<const mxml_node_t *>(mxmlFindElement(
+                                                const_cast<mxml_node_t *>(node),
+@@ -92,16 +121,22 @@ XMLwrapper::XMLwrapper()
+     minimal = true;
+     SaveFullXml=false;
+ 
+-    node = tree = mxmlNewElement(MXML_NO_PARENT,
+-                                 "?xml version=\"1.0f\" encoding=\"UTF-8\"?");
++    node = tree = mxmlNewXML("1.0");
++    assert(node);
+     /*  for mxml 2.1f (and older)
+         tree=mxmlNewElement(MXML_NO_PARENT,"?xml");
+         mxmlElementSetAttr(tree,"version","1.0f");
+         mxmlElementSetAttr(tree,"encoding","UTF-8");
+     */
+ 
+-    mxml_node_t *doctype = mxmlNewElement(tree, "!DOCTYPE");
+-    mxmlElementSetAttr(doctype, "ZynAddSubFX-data", NULL);
++    mxml_node_t *doctype =
++#if MXML_MAJOR_VERSION <= 3
++        mxmlNewElement(tree, "!DOCTYPE");
++        mxmlElementSetAttr(doctype, "ZynAddSubFX-data", NULL);
++#else
++        mxmlNewDeclaration(tree, "DOCTYPE ZynAddSubFX-data");
++#endif
++    assert(doctype);
+ 
+     node = root = addparams("ZynAddSubFX-data", 4,
+                             "version-major", stringFrom<int>(
+@@ -164,7 +199,7 @@ bool XMLwrapper::hasPadSynth() const
+                                        "INFORMATION",
+                                        NULL,
+                                        NULL,
+-                                       MXML_DESCEND);
++                                       MXML_DESCEND_ALL);
+ 
+     mxml_node_t *parameter = mxmlFindElement(tmp,
+                                              tmp,
+@@ -204,7 +239,15 @@ char *XMLwrapper::getXMLdata() const
+ {
+     xml_k = 0;
+ 
++#if MXML_MAJOR_VERSION <= 3
+     char *xmldata = mxmlSaveAllocString(tree, XMLwrapper_whitespace_callback);
++#else
++    mxml_options_t *options = mxmlOptionsNew();
++    mxmlOptionsSetWhitespaceCallback(options, XMLwrapper_whitespace_callback, /*cbdata*/nullptr);
++    char *xmldata = mxmlSaveAllocString(tree, options);
++    mxmlOptionsDelete(options);
++#endif
++
+ 
+     return xmldata;
+ }
+@@ -317,8 +360,15 @@ int XMLwrapper::loadXMLfile(const string &filename)
+     if(xmldata == NULL)
+         return -1;  //the file could not be loaded or uncompressed
+ 
++#if MXML_MAJOR_VERSION <= 3
+     root = tree = mxmlLoadString(NULL, trimLeadingWhite(
+-                                     xmldata), MXML_OPAQUE_CALLBACK);
++                                           xmldata), MXML_OPAQUE_CALLBACK);
++#else
++    mxml_options_t *options = mxmlOptionsNew();
++    mxmlOptionsSetTypeValue(options, MXML_TYPE_OPAQUE);
++    root = tree = mxmlLoadString(NULL, options, trimLeadingWhite(xmldata));
++    mxmlOptionsDelete(options);
++#endif
+ 
+     delete[] xmldata;
+ 
+@@ -330,7 +380,7 @@ int XMLwrapper::loadXMLfile(const string &filename)
+                                   "ZynAddSubFX-data",
+                                   NULL,
+                                   NULL,
+-                                  MXML_DESCEND);
++                                  MXML_DESCEND_ALL);
+     if(root == NULL)
+         return -3;  //the XML doesn't embbed zynaddsubfx data
+ 
+@@ -384,8 +434,15 @@ bool XMLwrapper::putXMLdata(const char *xmldata)
+     if(xmldata == NULL)
+         return false;
+ 
++#if MXML_MAJOR_VERSION <= 3
+     root = tree = mxmlLoadString(NULL, trimLeadingWhite(
+-                                     xmldata), MXML_OPAQUE_CALLBACK);
++                                           xmldata), MXML_OPAQUE_CALLBACK);
++#else
++    mxml_options_t *options = mxmlOptionsNew();
++    mxmlOptionsSetTypeValue(options, MXML_TYPE_OPAQUE);
++    root = tree = mxmlLoadString(NULL, options, trimLeadingWhite(xmldata));
++    mxmlOptionsDelete(options);
++#endif
+     if(tree == NULL)
+         return false;
+ 
+@@ -394,7 +451,7 @@ bool XMLwrapper::putXMLdata(const char *xmldata)
+                                   "ZynAddSubFX-data",
+                                   NULL,
+                                   NULL,
+-                                  MXML_DESCEND);
++                                  MXML_DESCEND_ALL);
+     if(root == NULL)
+         return false;
+ 
+@@ -531,11 +588,11 @@ void XMLwrapper::getparstr(const string &name, char *par, int maxstrlen) const
+         return;
+     if(mxmlGetFirstChild(tmp) == NULL)
+         return;
+-    if(mxmlGetType(mxmlGetFirstChild(tmp)) == MXML_OPAQUE) {
++    if(mxmlGetType(mxmlGetFirstChild(tmp)) == MXML_TYPE_OPAQUE) {
+         snprintf(par, maxstrlen, "%s", mxmlGetOpaque(mxmlGetFirstChild(tmp)));
+         return;
+     }
+-    if((mxmlGetType(mxmlGetFirstChild(tmp)) == MXML_TEXT)
++    if((mxmlGetType(mxmlGetFirstChild(tmp)) == MXML_TYPE_TEXT)
+        && (mxmlGetFirstChild(tmp) != NULL)) {
+         snprintf(par, maxstrlen, "%s", mxmlGetText(mxmlGetFirstChild(tmp),NULL));
+         return;
+@@ -555,11 +612,11 @@ string XMLwrapper::getparstr(const string &name,
+     if((tmp == NULL) || (mxmlGetFirstChild(tmp) == NULL))
+         return defaultpar;
+ 
+-    if(mxmlGetType(mxmlGetFirstChild(tmp)) == MXML_OPAQUE
++    if(mxmlGetType(mxmlGetFirstChild(tmp)) == MXML_TYPE_OPAQUE
+        && (mxmlGetOpaque(mxmlGetFirstChild(tmp)) != NULL))
+         return mxmlGetOpaque(mxmlGetFirstChild(tmp));
+ 
+-    if(mxmlGetType(mxmlGetFirstChild(tmp)) == MXML_TEXT
++    if(mxmlGetType(mxmlGetFirstChild(tmp)) == MXML_TYPE_TEXT
+        && (mxmlGetText(mxmlGetFirstChild(tmp),NULL) != NULL))
+         return mxmlGetText(mxmlGetFirstChild(tmp),NULL);
+ 
+@@ -684,8 +741,8 @@ std::vector<XmlNode> XMLwrapper::getBranch(void) const
+     std::vector<XmlNode> res;
+     mxml_node_t *current = mxmlGetFirstChild(node);
+     while(current) {
+-        if(mxmlGetType(current) == MXML_ELEMENT) {
+-#if MXML_MAJOR_VERSION == 3
++        if(mxmlGetType(current) == MXML_TYPE_ELEMENT) {
++#if MXML_MAJOR_VERSION >= 3
+             XmlNode n(mxmlGetElement(current));
+             int count = mxmlElementGetAttrCount(current);
+             const char *name;
+@@ -705,7 +762,7 @@ std::vector<XmlNode> XMLwrapper::getBranch(void) const
+ #endif
+             res.push_back(n);
+         }
+-        current = mxmlWalkNext(current, node, MXML_NO_DESCEND);
++        current = mxmlWalkNext(current, node, MXML_DESCEND_NONE);
+     }
+     return res;
+ }
+diff --git a/src/Tests/MessageTest.cpp b/src/Tests/MessageTest.cpp
+index ef7558df..f6810a2f 100644
+--- a/src/Tests/MessageTest.cpp
++++ b/src/Tests/MessageTest.cpp
+@@ -105,22 +105,16 @@ class MessageTest
+             mw->transmitMsg("/presets/copy", "s", "/part0/kit0/adpars/VoicePar0/FMSmp/");
+ 
+             TS_ASSERT_EQUAL_STR("Poscilgen", mw->getPresetsStore().clipboard.type.c_str());
+-            // a regex would be better here...
+-            // hopefully, mxml will not change its whitespace behavior
+-            assert_non_null(strstr(mw->getPresetsStore().clipboard.data.c_str(), "<par name=\"base_function_par\" value=\"32\" />"),
+-                    "base_function_par at right value", __LINE__);
+-
+-            /* // better test this without string comparison:
++	    //Use XMLwrapper to validate copied XML
+             {
+                 XMLwrapper xml;
+                 bool couldPutXml = xml.putXMLdata(mw->getPresetsStore().clipboard.data.c_str());
+                 TS_ASSERT(couldPutXml);
++		xml.enterbranch("Poscilgen");
+                 unsigned char copiedBasefuncPar = xml.getpar127("base_function_par", 0);
+-                TS_ASSERT_EQUALS(copiedBasefuncPar, 32);
+-            }*/
+-
+-            //printf("clipboard type: %s\n",mw->getPresetsStore().clipboard.type.c_str());
+-            //printf("clipboard data:\n%s\n",mw->getPresetsStore().clipboard.data.c_str());
++		xml.exitbranch();
++                TS_ASSERT_EQUAL_INT(+copiedBasefuncPar, 32);
++            }
+ 
+             TS_ASSERT_EQUAL_INT(osc_dst.Pbasefuncpar, 64);
+             TS_ASSERT_EQUAL_INT(osc_oth.Pbasefuncpar, 64);
+diff --git a/src/Tests/PluginTest.cpp b/src/Tests/PluginTest.cpp
+index 665a7311..dd0c4214 100644
+--- a/src/Tests/PluginTest.cpp
++++ b/src/Tests/PluginTest.cpp
+@@ -15,6 +15,7 @@
+ #include <cstdlib>
+ #include <iostream>
+ #include <fstream>
++#include <regex>
+ #include <string>
+ #include "../Misc/MiddleWare.h"
+ #include "../Misc/Master.h"
+@@ -228,12 +229,30 @@ class PluginTest
+ 
+         void testLoadSave(void)
+         {
++            // Do the load/save
+             const string fname = string(SOURCE_DIR) + "/guitar-adnote.xmz";
+-            const string fdata = loadfile(fname);
++            string fdata = loadfile(fname);
+             char *result = NULL;
+             master[0]->putalldata((char*)fdata.c_str());
+             int res = master[0]->getalldata(&result);
+ 
++            // Fixup, because d44dc9b corrupted guitar-adnote.xmz:
++            // Replace "1.0f" with "1.0" and "UTF-8" with "utf-8" in `<?xml...`
++            fdata = std::regex_replace(fdata,
++                                       std::regex(R"(<\?xml version="1\.0f" encoding="UTF-8"\?>)"),
++                                       R"(<?xml version="1.0" encoding="utf-8"?>)");
++
++            // Fixups, because guitar-adnote.xmz was saved with MXML3
++#if MXML_MAJOR_VERSION >= 4
++            // guitar-adnote has tags ending on " />" - we remove the space
++            fdata = std::regex_replace(fdata, std::regex(" />"), "/>");
++            // Remove trailing newline
++            if (fdata.size() >= 1 && fdata[fdata.size() - 1] == '\n') {
++                fdata.pop_back();
++            }
++#endif
++
++            // Checks
+             TS_ASSERT_EQUAL_INT((int)(fdata.length()+1), res);
+             TS_ASSERT(fdata == result);
+             if(fdata != result)
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
