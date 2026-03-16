Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C139F53D96
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 20:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAAA9835C9;
	Mon, 16 Mar 2026 20:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ob_nOQAV2Vt1; Mon, 16 Mar 2026 20:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24088835C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773694584;
	bh=Nxt7QEA/74OMX6QKXJiAmW5ztUzHqB4CgQ21LckSER8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=msJ5c46J6TYqf4bgQKpZfAbLcAtgjLaLyHI0U4VAgyfO+IbGA8hBRv+UoFZXvnCE3
	 DEG+VqqTjoJ39K/LPBlCUBkjPDHFE4sP/TwLTl6XdBucQ97wLZ1dPiZDST3I9kxpQN
	 hLRSLbYWTE1adJlyc7aP49M+ShW5xzujmjASc16I+suN23RSIXVGNoLAOZGgQfTzMp
	 XEc3fSmPQgJmVSh1oz9xvu3QBnjGkmRSnT0hKoc4XJG2LgsoGuFpsGa16X93jXInS4
	 RZeVQWhnlj/3nbOzZHj/gQYv0VuJwjMRGiDigzd6ACwSRcqlRVdD4xs4Fe3rfYbogP
	 IwUkT2783VyVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24088835C4;
	Mon, 16 Mar 2026 20:56:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84E2C3C6
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 764C140952
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKPPMRBywnB0 for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 20:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78C5D405A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78C5D405A7
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:56:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B366C86BDA; Mon, 16 Mar 2026 20:56:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Mar 2026 21:14:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e974de86e26baef2aee47670e620eb124b0d7651
X-Git-Newrev: 7428907828c7715c7f95303068a0dd8db2770c9f
X-Patchwork-Hint: ignore
Message-Id: <20260316205621.B366C86BDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: bump test_atf u-boot to
 fix the build
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
Content-Type: multipart/mixed; boundary="===============5647268386542548954=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5647268386542548954==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7428907828c7715c7f95303068a0dd8db2770c9f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Python setuptools has removed the obsolete pkg_resources python module in
v82.0.0. This module is used by the binman command in U-Boot until
v2025.10.
Since the python-setuptools package has been updated to v82.0.0 in
Buildroot, the python test tests.boot.test_atf.TestATFAllwinner (using
U-Boot v2023.10 and binman) fails to build with the following error [1]:

  ModuleNotFoundError: No module named 'pkg_resources'

Update test_atf to use a more recent U-Boot v2026.01 (and add the
dependency on GNU TLS), to fix the build.

Link: https://gitlab.com/buildroot.org/buildroot/-/jobs/13500946337 [1]
Fixes: 51365ff06379 ("package/python-setuptools: bump to version 82.0.0")
Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_atf.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index b822b9d357..02d0c74b84 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -16,13 +16,14 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
         BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
         BR2_TARGET_UBOOT_NEEDS_DTC=y
         BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
         BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
         BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
         BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+        BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
         BR2_TARGET_UBOOT_SPL=y
         BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
         BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"

--===============5647268386542548954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5647268386542548954==--
