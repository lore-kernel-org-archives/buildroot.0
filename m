Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF46A606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FKJ/0vVO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB44E606BA;
	Tue, 27 Oct 2026 19:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7XahUZ6c-5uW; Tue, 27 Oct 2026 19:56:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C54F2606CB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130980;
	b=lfjZTaTSn6Q7+lkl4U7Rz+o3NU1GSXIvBwOLyCQH6sS2u2PwXmsqEaYzcp1GA8boL9P7
	 /sEDPG2b1WZzF5GTVnNLW/dULrPdJRM9AUMAaBhhh/vzrJALI9o4NzMexZswqf8fM9uRa
	 Y28u5SkpHAanTAOdin6DtMxzb+qX0h5jqw01cDQj348dyLJsAlRUfBbISpJfu2aFJJ59G
	 T1vQqw/vUV0dwyb4X9mYZYD/0aI9bADkvhYMTMrH20nbmcu0B+oUNUfj2etn9NrkvXM9t
	 7Z4n1R+HuvOHtIwoWcm5Fz6a7VuljqB0VlhuKF4HK+9iPalVoQWRrDAa4O0y7DdrsGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130980;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lMJcVpyb+oJtxm20jA3Vfu8DowcWILeV0qCuvNcEasc=;
	b=MN8SaonXpsIn5U/VVnoXFHdtrj4nVBfzqmQ+tadBlXU3LbA6dBwmSUJF3iI9mF9gx7hI
	 VJKp2KYkMrJZALaQ1m3WLUfvMrBZhDBmLA48DFTue385PPtRzYO71uKBubxPNDFoAzzqz
	 MzNwRbUD3qUPNI+Zj5oS9vL2656TxO412s/zEEC98IgDbq9I/gYU21W9ygHPrlcJ7zQtf
	 b1p4KnaZ4cs62S7AjxX20cMuYoKe6JvG8sEc2owpqiv7y1UHq9f+4/SQHU6mT4Y20eTWZ
	 frayVhDIIqSbOB3tL8BXu6qR3OuBt9PvRn+t0QaswAiMsgpvd9p0TArqExwrc5/ZJQA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130980;
	bh=lMJcVpyb+oJtxm20jA3Vfu8DowcWILeV0qCuvNcEasc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=FKJ/0vVODVmO46hcGoiuPvFVhllTCGUG84fQyNPywIF6Q8Q1wTdZ8GBhtZE/8Xgwy
	 NLHalTJRKxdw3+IbAGtxQJZsvmYjRZl8RkSmKMIoD0kNholqGvi1XLqHBYyKxCT8ZH
	 BYMf+ihcdp/sf+56SAY1iO0V6dXHssIkZDN6n6lVNf2fV8vvDSPw7htCXTVYTU6SAd
	 Tay8r3W/lumTpYsvtN+51E0Ju4aj0VtB4H4SJ0KiOhtr3vq2iyCRdHcmQ8nhYcbvG+
	 e8c+HFnG5BLnyiowxpFLQrXo8B5ZcDhmr182BEe9HYjyxtSgUO5bFoBPhe9otU9B1B
	 jCtYO/jZlNkgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C54F2606CB;
	Tue, 27 Oct 2026 19:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB376279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCBCC80C9C
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taG-mrpAmtvi for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:56:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A7A3A80838
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130979;
 b=NcL9fuaLDKQXWAw2Q3eXEYzqq971wsbc7ICI2ok4LQvjVwFj5W84by4B9BytXIhFnsUR
 D7PCChFvCr5WwSus0yDiZltmrXIJv1p58SeAK5COsXERde95uFdtwnuwTQyzszBBaP6fY
 U4DtgzCT3Mb7suRNcLFyTwMYGHieQ/fcHOug1GLniLXlRETjq+YLInVn1pKpZru4NZ+qU
 +BqKRxMp4nlZt47pMXRqsbIWm099QE9Ra9ZJQDUJSguvOW9UTfPdcipUPLpr6RmF2EFcI
 UxCQYRKRNhPe4TDbZ1HWl58ANfRUVHDvSB1TDiyzsvphsvxp+ecAq4VtzUHwxU/yuhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130979;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=f5uS1U2c+hRoWUbWxT48hXOwelJOuNUH+pXmSBFiUAA=;
 b=Uph4wqn05fxKuAGmraWrKSwWRBpQmyYPh+KTmeacn3ZBbbZ17jw607sZGd2PcOBi088k
 MITg7i3FwQhVBVlGezVZlMor4xfnbOYzDtjr3erAP36bXkB8nC6CUZsiO1AlVS0UeQ4Ts
 5LOpN/+vmOGh+h64waBROYpZf6F/3q4FeDex6KVedmvI+gB5+Vo3SDgPHjAa/I9Sc6BBv
 GteA0T4TEI+NMDanE1Swn52qGFoZhEvVm1cQTd2ENHPOG/vPhU2cOB/bMauqqPy8f1aUw
 h4Bw1HWdk1j4wjw7jcUF0m0cgkj258h62u4dN+ktkkdC3ntfp59G6yx+n5NeBfY/Uxg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=liwyEF0Q; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7A3A80838
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:56:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXQ5-1x5dyC4915-00RI6U; Tue, 27
 Oct 2026 20:56:16 +0100
To: buildroot@buildroot.org
Cc: Robert Rose <robertroyrose@gmail.com>, Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Oct 2026 20:56:13 +0100
Message-ID: <20261027195613.2168721-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WSF+bGYBiafOyt6bMTLYmAxjQgLNkPI+a38c71imiY7LwzrwznC
 glz2WkjR1ntiHUMj6WI1sbShH8znMSljXW7wxN/y6QmzN39SIhNwND9K0G0uCjJaH+9FTUL
 H1vs6+axAbf8FgO7w860VIsiY9V/dEkQpEHIDdMTnIu+UwO4bP+y389igRo2BEsaerx82Rd
 NwqHUVg0sC/EbbbDpPfnA==
UI-OutboundReport: notjunk:1;M01:P0:PYySvuDpZoE=;x8uLyXvFD1y6Zed5Z/R39xGTNWQ
 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
 Wc/S6ebFLVhv/bPwA8rwIiFCOa/zkY=
Subject: [Buildroot] [PATCH v1] package/grpc: bump version to 1.84.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- bump version to 1.84.1 (for details see [1], [2])
- add patch 0004-CMakeLists.txt-fix-grpc-compile-without-third_party-.patch
  to fix compile without extra/third_party downloads

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ix-grpc-compile-without-third_party-.patch | 71 +++++++++++++++++++
 package/grpc/grpc.hash                        |  2 +-
 package/grpc/grpc.mk                          |  2 +-
 3 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 package/grpc/0004-CMakeLists.txt-fix-grpc-compile-without-third_party-.patch

diff --git a/package/grpc/0004-CMakeLists.txt-fix-grpc-compile-without-third_party-.patch b/package/grpc/0004-CMakeLists.txt-fix-grpc-compile-without-third_party-.patch
new file mode 100644
index 0000000000..8811271511
--- /dev/null
+++ b/package/grpc/0004-CMakeLists.txt-fix-grpc-compile-without-third_party-.patch
@@ -0,0 +1,71 @@
+From de97b2d195bf7b29db119313f4dcdd90b499eecf Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 27 Oct 2026 17:53:21 +0100
+Subject: [PATCH] CMakeLists.txt: fix grpc compile without third_party
+ downloads
+
+- comment out  protobuf_generate_grpc_cpp_with_import_path_correction lines
+  with external dependencies (to fix compile failure because of missing
+  files)
+
+Fixes:
+
+  CMake Error at CMakeLists.txt:601 (file):
+    file COPY cannot find
+    ".../build/host-grpc-1.84.1/third_party/grpc-proto/grpc/channelz/v1/channelz.proto":
+    No such file or directory.
+  Call Stack (most recent call first):
+    CMakeLists.txt:710 (protobuf_generate_grpc_cpp_with_import_path_correction)
+
+  CMake Error at CMakeLists.txt:601 (file):
+    file COPY cannot find
+    ".../build/host-grpc-1.84.1/third_party/grpc-proto/grpc/reflection/v1/reflection.proto":
+    No such file or directory.
+  Call Stack (most recent call first):
+    CMakeLists.txt:713 (protobuf_generate_grpc_cpp_with_import_path_correction)
+
+  CMake Error at CMakeLists.txt:601 (file):
+    file COPY cannot find
+    ".../build/host-grpc-1.84.1/third_party/grpc-proto/grpc/reflection/v1alpha/reflection.proto":
+    No such file or directory.
+  Call Stack (most recent call first):
+    CMakeLists.txt:716 (protobuf_generate_grpc_cpp_with_import_path_correction)
+
+Upstream: N/A Buildroot specific.
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 44bf4d2972..36c37b8cb4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -707,15 +707,15 @@ protobuf_generate_grpc_cpp_with_import_path_correction(
+ protobuf_generate_grpc_cpp_with_import_path_correction(
+   src/proto/grpc/lookup/v1/rls_config.proto src/proto/grpc/lookup/v1/rls_config.proto
+ )
+-protobuf_generate_grpc_cpp_with_import_path_correction(
+-  third_party/grpc-proto/grpc/channelz/v1/channelz.proto grpc/channelz/v1/channelz.proto
+-)
+-protobuf_generate_grpc_cpp_with_import_path_correction(
+-  third_party/grpc-proto/grpc/reflection/v1/reflection.proto grpc/reflection/v1/reflection.proto
+-)
+-protobuf_generate_grpc_cpp_with_import_path_correction(
+-  third_party/grpc-proto/grpc/reflection/v1alpha/reflection.proto grpc/reflection/v1alpha/reflection.proto
+-)
++#protobuf_generate_grpc_cpp_with_import_path_correction(
++#  third_party/grpc-proto/grpc/channelz/v1/channelz.proto grpc/channelz/v1/channelz.proto
++#)
++#protobuf_generate_grpc_cpp_with_import_path_correction(
++#  third_party/grpc-proto/grpc/reflection/v1/reflection.proto grpc/reflection/v1/reflection.proto
++#)
++#protobuf_generate_grpc_cpp_with_import_path_correction(
++#  third_party/grpc-proto/grpc/reflection/v1alpha/reflection.proto grpc/reflection/v1alpha/reflection.proto
++#)
+ 
+ # This enables CMake to build the project without requiring submodules
+ # in the third_party directory as long as test builds are disabled.
+-- 
+2.56.0
+
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 42b1120c8a..5adc16927e 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  60caa8397426d8a500e3e57ab6a49d1cb5aa62a36f2591eb9da3d77fa38ad8c9  grpc-1.83.1.tar.gz
+sha256  e3cd1dbeedc989a6bf863bc1f0762a7cd1feff5cfae7d520481a541ad23ca85e  grpc-1.84.1.tar.gz
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index d504eeb992..c6057674a6 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.83.1
+GRPC_VERSION = 1.84.1
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
