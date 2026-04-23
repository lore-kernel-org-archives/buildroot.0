Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B228FDEE49
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD67411D6;
	Thu, 23 Apr 2026 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hv39VWtJPffR; Thu, 23 Apr 2026 20:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 444E0411D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776975757;
	bh=w+pMTw0XKmzZeVcyRmbA88qreP7sRbB8KOi0lEyGR98=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R9nHuMkH+xANBRWqlqXQ05RuceRub44MVonQwYBr4KIONB5vrxM0HEDEuqyVtgnyG
	 ks2gdVyjZPYlbVz/SEhm8oa2pjqKQ76nKoMnD4xs9bb2xKAGBkbFup99hAyKM9NEf4
	 RQjeh+hXP0r+rZE1VNHJTOGDWsPKzGzRTy3AAK3YykQRf20gMjUvhWGO4qEXSu9pWf
	 10YHUgV358NAbJmMJlLge3q8KkLjLbFMzXO9nc0wfV+HD9Ng6Em+uiRqRt8ALvDauV
	 BA2ld75+58OgCbyROA/flw6USJoTfaPZOGnVBFYx0trLOp9gfamLUfEmHiPb7xD1QU
	 9slbnUVKMta4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 444E0411D7;
	Thu, 23 Apr 2026 20:22:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A534231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BD9D60F4B
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmJOg_Fsa0l6 for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BCE960F4A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BCE960F4A
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:22:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2C8D828A2; Thu, 23 Apr 2026 20:22:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 22:09:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d966da35812c943fff6dd7be55284966626c4fc9
X-Git-Newrev: 1c039b6ea38ed964b4ca586358d32f6252e93622
X-Patchwork-Hint: ignore
Message-Id: <20260423202234.E2C8D828A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: bump version to 1.80.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1c039b6ea38ed964b4ca586358d32f6252e93622
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/grpc/grpc/releases/tag/v1.80.0

Rebased patch 0002 due to upstream commit:
https://github.com/grpc/grpc/commit/4c3996f0da7041ca7d3b4265d9e0299baa0ed4eb
which added a new configure option.
Added this new configure option -DgRPC_BUILD_GRPCPP_OTEL_PLUGIN=OFF to
HOST_GRPC_CONF_OPTS.

Updated license hash due to upstream commit:
https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...option-to-restrict-building-of-host-grpc-to-grpc.patch | 15 ++++++++++-----
 package/grpc/grpc.hash                                    |  4 ++--
 package/grpc/grpc.mk                                      |  3 ++-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
index d36eb8fca1..3e0aa2909b 100644
--- a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
+++ b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
@@ -15,6 +15,8 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Updated for 1.76.0:
 [build utf8_range_lib as it is now explicitly required]
 Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+[Bernd: rebased for 1.80.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  CMakeLists.txt | 39 +++++++++++++++++++++++++++++++++------
  1 file changed, 33 insertions(+), 6 deletions(-)
@@ -199,12 +201,15 @@ index bc86c00463..08441ddbd2 100644
  
  if(gRPC_INSTALL)
    install(EXPORT gRPCTargets
-@@ -52025,3 +52050,5 @@ generate_pkgconfig(
-   "-lgrpcpp_otel_plugin"
-   "-laddress_sorting -lupb_textformat_lib -lupb_json_lib -lupb_reflection_lib -lupb_wire_lib -lupb_message_lib -lutf8_range_lib -lupb_mini_descriptor_lib -lupb_mini_table_lib -lupb_hash_lib -lupb_mem_lib -lupb_base_lib -lupb_lex_lib"
-   "grpcpp_otel_plugin.pc")
-+
+@@ -54105,6 +54105,8 @@
+   "-laddress_sorting -lupb_textformat_lib -lupb_reflection_lib -lupb_wire_lib -lupb_message_lib -lutf8_range_lib -lupb_mini_descriptor_lib -lupb_mini_table_lib -lupb_hash_lib -lupb_mem_lib -lupb_base_lib -lupb_lex_lib"
+   "grpc++_unsecure.pc")
+ 
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
++
+ if(gRPC_BUILD_GRPCPP_OTEL_PLUGIN)
+   # grpcpp_otel_plugin .pc file
+   generate_pkgconfig(
 -- 
 2.43.0
 
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 289a6f8191..6329aff00f 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e2ace790a5f2d0f83259d1390a816a33b013ea34df2e86084d927e58daa4c5d9  grpc-1.78.0.tar.gz
-sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
+sha256  38f58596277fa632064cc0719b9ece4381c8c77461cb51e9b66ca149574b7865  grpc-1.80.0.tar.gz
+sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index c99863e92b..19250d679c 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.78.0
+GRPC_VERSION = 1.80.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
@@ -83,6 +83,7 @@ HOST_GRPC_CONF_OPTS = \
 	-DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF \
+	-DgRPC_BUILD_GRPCPP_OTEL_PLUGIN=OFF \
 	-DgRPC_DOWNLOAD_ARCHIVES=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
