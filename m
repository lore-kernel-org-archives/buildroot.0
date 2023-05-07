Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104F0C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 13:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFFD6405B2;
	Sun,  7 May 2023 13:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFFD6405B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHDmbJ6HzjF2; Sun,  7 May 2023 13:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEBF5404F4;
	Sun,  7 May 2023 13:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEBF5404F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 354581BF2F9
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DF4C411C6
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DF4C411C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzBUJ7VrD39g for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 13:19:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 070A8408DD
 for <buildroot@buildroot.org>; Sun,  7 May 2023 13:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 070A8408DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8AC785FAB; Sun,  7 May 2023 13:19:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 15:19:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b31dad2fc872052ffc792f11952e71c0e197dec5
X-Git-Newrev: f7d0ed4a78f4aa3741f94c4bbb69efbe74c920a9
X-Patchwork-Hint: ignore
Message-Id: <20230507131956.E8AC785FAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: (ctest) add support for
 riscv architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7d0ed4a78f4aa3741f94c4bbb69efbe74c920a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package binaries can be successfully built for and then executed on
RISC-V platforms including RV32 and RV64 variants. Tested in QEMU.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cmake/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 3c47fdcb49..4ef5612b57 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 		BR2_mipsel    || BR2_mips64el    || BR2_powerpc  || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc    || \
 		BR2_i386      || BR2_x86_64      || BR2_xtensa   || \
-		BR2_s390x
+		BR2_s390x     || BR2_riscv
 
 config BR2_PACKAGE_CMAKE
 	bool
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
