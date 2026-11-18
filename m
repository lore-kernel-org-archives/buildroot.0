Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCE660A5BCB
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UIGwv9w1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=S4eaWkjk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07080407EC;
	Wed, 18 Nov 2026 21:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id id_Wor3af2k9; Wed, 18 Nov 2026 21:28:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 67083407F0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795037335;
	b=qQjS0JLEKf4JwXrGVvyAuwYQAF35zq89DKVeDQi4d1WwuNA3lxVCNc+LGu0/EpyzgQze
	 s+f0ru392pmfMvgWWzC41ey/oZvc3POZlcmn19eLihDfupF/0NqxqkjPqGtSAPoXXGRf5
	 ttQ6RutGkfAjJXJBhMVtO4+Tl5S08XbZ9Xh6T6P8iuhjGWMmsaHr2hRoX5Iru0KPYDqkI
	 do+F5Lme5NyeRTJhanKp5G3j2Q5SBmP8SfecjKqG/YhNBxOjgX98WqSzMl6Z7HLwYskS/
	 cu8/aQkxzSa8iQXI8l6BkNxKi6a3h0pAh0dTdqYLscRNEMK5X5QWJiv01eVfAMUcFAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795037335;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=X68KFth56hfW3L0EGN/qgty2p1cElOEKPWeZDaVJgwM=;
	b=ObUuYaxkjcJnojxBNb64ddHBrx6VIN0QrgUakehDS27i6HJAOBvwg8cgyDHIb/XwnuRt
	 OMF06c6+9tgLPeiRB/XkHITN62JV9/UktHRvVURBI1SWVwfJ5e04dtlxN7hDM3QrqsDR5
	 aYEzrqhGVV47nost1YZirmNsy8O9PdoOAjebayid3PdsMqMS0kUkhAffeUZcyDm2NtrmO
	 PpEuywSz7WpzJkLChp0jmj+jAeu4YQebXFDMG/ciyNEUwanHTsd4q7YQQMakyV7A/cTu7
	 Xa9zSv+keIrUi5LDVInOyg1kEBKKt35TSzwaf80EWP+c++Cnzt5n4x/fIYpqAb095cg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795037335;
	bh=X68KFth56hfW3L0EGN/qgty2p1cElOEKPWeZDaVJgwM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UIGwv9w1ZlEyXTeqNGbWqNbxxE0eNf/yz2f6fOidEvsQbPaLF1vAIy7cuOA2nnEPO
	 EOv6fyeMrqqwxfFwkxCzXgmQKVUJw8OJbFoFKCU6njA2slMuLZvOZuXlIVfodfVJO1
	 nq/jSzY9ClVy9gTsXoySCS7PbancOMGb8bQKaiKe8ABodEBIBfohVMB+coWxin0IfO
	 0xSeEvHRnhinLL91LF0MXFpnbbsyh2sy5xxWgl8a2GkhbtRDPtL0k+nckYa/GxFGyV
	 DDrKtbEGmMNks2nz55Nxt8uFe7kp+UR09Om3XxoWX2knvjPcPSRh+H2OZsT6/7RHZ/
	 nLZr6rNJBHgYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67083407F0;
	Wed, 18 Nov 2026 21:28:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EDF49F8
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04DCC80F92
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnOGxnveNo-z for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 21:28:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B570F80F4E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=S4eaWkjk
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B570F80F4E
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795037327;
 bh=RdmLzoTNPvjCJckwV/h8fwM9jHxi61dWF+VjouMLgrE=;
 h=From:To:Cc:Subject:Date:From;
 b=S4eaWkjkWZdPW7u8qcVmlTNVV/OdlU4pwcluQaPHYDJFHk7HhM1OlH6slqGLhPAXH
 B4xs+lHxmVrLMQOwC2Elsr3+O7zGkrbL/fJvjiYF9Eq8X6az/qpT+UG3ZKZH00X3zt
 oflX5dih0QIYaHvJIkHNKxyYBxoB0Tf8olmlGFuNa4SSqGBNKIVpf+fLitl2maS3zs
 zMu/UtfZqxaSibLeMcgoaEOdx1lCdPYJwOKFjF/cekRMulIJLrhgF4q6djGopV2dTK
 zdu+Kj+eiPpswGux3MVGF8KyYTO2XMNupBNfNhIqVc2Pp+oUN92w48lpV0lo3L6Fcw
 yC/0WavlocVpg==
X-KAS-Sym: v3:f51bdf72230551df:LIF9ENNVYpf7Jfzr1bY4W2n50aLiYGVeemhvaIH6WCywV
 rhosPKwoJN0TRcKqxLshddNBsNNl3CaR7AoyY2OOekN6TUbrtciTuhSi8wSYEZBIUtgAxt5mvlF
 XpLS3F023roaYtHe4cupdJrDY5XL6n9/1LNQtQFvrQRBVqm4KLAmTudfODIk6FhKYn8wYSHE4mk
 jI0rvPr23Ov5tNDShsHcWMNeStXf0oHo4O4KKm9uuGPq7pLVnhoCsdwNFZLrs0DXq9iERPLEsiq
 0tonP+pAR6+GU39eHwFVY6R62SPzKekS2EL/m8GgVDlsUuIbo/s6GpMjsAw4nGBlFEjZQL4Q==:
 GBsYPSgYCB0yCwJbk1uGIn/AMs6I3PPsET7nZJhdkHlKFLB+AGzOerif8T+gX8wvFDlJ6u03H40
 rdPqui4WpyPFyC0w2XkG9qKEOCYEaxsbKRgx22lAMrqtIJsYbLUHqfTMpSPIqq7hc8NUtvu1BDU
 aWfsAMgHtYwkeGW1H9DUUHK5gp0eTUZMhDv6s1jgVy2bgOSXBxwR689zsSFfHtaKuAzOfSMza9k
 x/txUyCSCZHctsNE+WYYqgH6tdpnld1AigRmxEuXedi5yTkDHEZRjBV/ifFE1TZjru/SHB8vBmx
 uoJ7fIXBb9ia8Oxi0La8FI54DymgEEMYuAk5SaogYpVhrtZKpRFzp7J40QMcGeg//K9C4Q2dyyo
 xiFivthIa5lxW2TvsYJKrqGRzah/a0ETM6gLvvHLWXMevT4dxHn0MpxSR0Ts9Hvn7fhaxJsUTlc
 ICCGC6yvGS6fTy0UWM6XwU0AI6ENBwXZqybToVmEbqdJMmitv7AmXC9hB25h6L5SBM6jNmjY8y7
 MauDQh78S7kn1cIbVMqtzeQh2XmuKsjhLZUKRXY2Buz6yjajH6kSYjUnVK3uU+ZlHurqtNN2KH2
 9+GdR1AIC1h09ngAFw1wU5mkhz34GCjRsTtNeVOJKnJwvEqkQuJ0obzxkbIxWxI9/x75UijjNZh
 AEa/lC06xmA==
Received: from fli4l.lan.fli4l (p54a1b778.dip0.t-ipconnect.de [84.161.183.120])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ECA38A4C377C;
 Wed, 18 Nov 2026 22:28:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34328)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xTnCw-000000003Tp-2l6A;
 Wed, 18 Nov 2026 21:28:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Wed, 18 Nov 2026 22:28:46 +0100
Message-ID: <20261118212846.1258063-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 23.1.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://discourse.llvm.org/t/llvm-23-1-6-released/92877

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/88be068f5a3de9478c3d8d91fa3e7a6685039cdb

test_clang:
https://gitlab.com/bkuhls/buildroot/-/pipelines/3085510428

test_mesa3d:
https://gitlab.com/bkuhls/buildroot/-/pipelines/3085511678

 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 15d2885a2a..323a1be76a 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.5
-sha256  fb50b1eac93ddeb3aa8dab4cfe324dff74f4a9c2bdee6160c9e36188f8d06a6e  llvm-project-23.1.5.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.6
+sha256  d3b86ab29cfb4445a6652e5c2642ccc75e04e38084dde3701d323320f35a31da  llvm-project-23.1.6.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 9f99c9077b..6fbaf98b36 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 23
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.5
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.6
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
