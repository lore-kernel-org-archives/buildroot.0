Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C9FC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 22:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54C1940A14;
	Tue, 26 Dec 2023 22:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54C1940A14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHKVrAGJ5jKZ; Tue, 26 Dec 2023 22:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56DC440A41;
	Tue, 26 Dec 2023 22:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56DC440A41
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 436701BF95D
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C39A60FCD
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 22:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C39A60FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08xF-LknHmfH for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 22:20:25 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8451760FC6
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 22:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8451760FC6
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 41AE113F8A7;
 Tue, 26 Dec 2023 23:20:20 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 23:20:13 +0100
Message-ID: <20231226222013.3316022-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703629222;
 bh=gvd58vbYobIgkpu4Z3Ju2MrGotm0Aa/nQNB9IJwky3k=;
 h=From:To:Cc:Subject:Date:From;
 b=ZZmXihHg3ElaXtXrJYEhhbIsLzZttjGK1o4+3SjYPGkn9Cx8TtDgp+HtuT0i73lv+
 zjjFPIyfMPRheQSIGbL0xLzAVDLB18rPGAImuhExMKX9fcIZoAO2mO8RW+V76XmKtk
 zpAS3mvnhgHHkfCA8sgKI9PmG3fT99bQx22wAkIscUxYuC4ElpjrM5kPQpBUbPgnGV
 Fu9w1p9w1hhOsTutz0+pdGYSFDef2AAFWgXgf9N4qUnE893RjBDDChUohHayU1RyDp
 04qM9OXErlRU2HX30TrMxh1VN/cwPu+0ZDnguIOhJJoY60D+OK+3pubPsumsDdjUVe
 b3hlgK3tv5Hqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZZmXihHg
Subject: [Buildroot] [PATCH 1/1] package/efivar: Add BR2_RISCV_64 in
 _ARCH_SUPPORTS
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A RISC-V 64bit EFI defconfig was added in commit 82199551
"configs/qemu_riscv64_virt_efi: new defconfig". So efivar can now be
enabled for this architecture.

This commit adds BR2_RISCV_64 in BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 4495383 with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p efivar
    ...
       bootlin-riscv64-glibc [18/45]: OK
        bootlin-riscv64-musl [19/45]: OK
    ...
    45 builds, 25 skipped, 7 build failed, 0 legal-info failed, 0 show-info failed

Note:
build failures were already present and are unrelated to this patch.

efivar will be used in a future grub2 runtime test for RISC-V 64bit,
suggested by Yann in [1].

[1] https://lists.buildroot.org/pipermail/buildroot/2023-December/681521.html
---
 package/efivar/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index d4402dbcf7..0a36335c0a 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 \
-		|| BR2_powerpc64le || BR2_mipsel || BR2_mips64el
+		|| BR2_powerpc64le || BR2_mipsel || BR2_mips64el \
+		|| BR2_RISCV_64
 
 config BR2_PACKAGE_EFIVAR
 	bool "efivar"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
