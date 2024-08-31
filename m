Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04F1CD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EDB181F22;
	Sat, 31 Aug 2024 17:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1VwSRyJ95LL; Sat, 31 Aug 2024 17:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A2CE840FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A2CE840FE;
	Sat, 31 Aug 2024 17:24:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D85C01BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2EB94026B
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajutN-AsWucN for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C17B140042
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C17B140042
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:24:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA3C0867FF; Sat, 31 Aug 2024 17:24:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 19:15:25 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 990d0b3d10737f0b820fb1aded2d06fda3d1e4f2
X-Git-Newrev: 22741d9eb6f7350650521d183a5c74810d1ae5f6
X-Patchwork-Hint: ignore
Message-Id: <20240831172415.AA3C0867FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libressl: fix
 powerpc64 build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=22741d9eb6f7350650521d183a5c74810d1ae5f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix the following build failure with powerpc64 raised since bump to
version 3.8.2 in commit 21eca49ed5110872407b76ab9337d2877c4cda24:

In file included from /home/autobuild/autobuild/instance-23/output-1/build/libressl-3.8.4/crypto/rc4/rc4_enc.c:61:
/home/autobuild/autobuild/instance-23/output-1/build/libressl-3.8.4/crypto/../include/openssl/rc4.h:75:9: error: unknown type name 'RC4_INT'
   75 |         RC4_INT x, y;
      |         ^~~~~~~

Fixes: 21eca49ed5110872407b76ab9337d2877c4cda24
 - http://autobuild.buildroot.org/results/2533f8f642f435b40ce687b6df482c51a3fa0250

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ee00cfd09e4ffa97019c4e9384cc761995912e28)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...MakeLists-txt-Fix-HOST-variable-for-ppc64.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/libressl/0004-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch b/package/libressl/0004-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch
new file mode 100644
index 0000000000..8da8fedae2
--- /dev/null
+++ b/package/libressl/0004-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch
@@ -0,0 +1,26 @@
+From e6c7de3f03c51fbdcf5ad88bf12fe9e128521f0d Mon Sep 17 00:00:00 2001
+From: OPNA2608 <opna2608@protonmail.com>
+Date: Fri, 19 Jul 2024 11:41:46 +0200
+Subject: [PATCH] CMakeLists.txt: Fix HOST variable for ppc64
+
+The code here defined HOST_PPC64, but the rest of the build system expects HOST_POWERPC64.
+
+Upstream: https://github.com/libressl/portable/commit/e6c7de3f03c51fbdcf5ad88bf12fe9e128521f0d
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c496ad97b5..670aa9a1a0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -373,7 +373,7 @@ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "mips")
+ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "powerpc")
+ 	set(HOST_POWERPC true)
+ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
+-	set(HOST_PPC64 true)
++	set(HOST_POWERPC64 true)
+ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "riscv64")
+ 	set(HOST_RISCV64 true)
+ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "sparc64")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
