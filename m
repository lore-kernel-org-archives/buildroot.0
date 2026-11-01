Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15B3606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pT+NmbD5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEFA980C97;
	Sun,  1 Nov 2026 16:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82238SDZSwfd; Sun,  1 Nov 2026 16:24:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A22CE80CE0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793550257;
	b=IdCZIYrmRBJ5D1KmrRuQsxWMi4M57LUYMQ1Ses5ZEfls+TD1uZODBgITduQutXwpCYDb
	 dxTSDDUe8Dg1vSsCymc3RLW4e8LegXK7Pcbc4y2PQLsA3mq4UdPPDFnGyah0j2ZxuFoST
	 mAcnJqibhTrXeJr3jc1tL64yJrGSPDLDTaMTitq+g/126akvP/YU/BovAWpBsX8z6QsFu
	 E9NfWeteegup1qj+Q6Ma5dkY//V1Clg9LHWX1kCwxCF9d+F5veaQ6aSBXi0xRxFPT3dNP
	 ul3AYcSVFAx5kCWiSy8h8kcbQqQiJhAyt5WtyQ7jrmSTX+fLKXtAwePIPprlpcILakA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793550257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5xL6+nZmkWUjSwSxnJfe/2M66gq5pNQT4FPFcqU+K7o=;
	b=CjhtFAqTCyUFNZeKtsPp/YWc350+TbhpXDYtslC+j4V/3vxLoinuDlJ8s/boLHokhkpb
	 bXJ0uvHHY+9wpLkOq9lhk4ADP9CSDZ3DlzRkCJ8blHNr0swKGAuqdAfIPvf/NyOJ5/I73
	 6BoZf7urO3IfTCRVaDdqHhtcJHBd9QXTZ7G4Ox6Ah7mkzA1QdWqyw2ZtXJNMjrosQgrH3
	 jU3Cau9fhnZYpxhyJpzzZVRI5jfKmIAo4XOXATKSbMUi55l+dLqNwZsYqo/EnGv2R4FDq
	 Xw98Y4qBXWKnxWvIRFHvrxSP13l4x5ElM9/U9JB2IPwK6QFSbPAaug00rRf4oeIfSOA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793550257;
	bh=5xL6+nZmkWUjSwSxnJfe/2M66gq5pNQT4FPFcqU+K7o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pT+NmbD5FCgysZijbt1GeeJMv7gKYSJpsYmgQjrr2IyULfJJRJwnbJ1ecj/Rbx37I
	 0Uosn23H+QHxXApTK+KzgufdJ/vjnQGmJjhTmqjQbV9oo3wQdlx5v0QTjKwzrhaiKc
	 SHynZLD9sLFUSvekzFJQqVQ5VGdYzxhg9jOu8flbFBsZVHSmhvtfwmSztdehOtD5Yq
	 Xyjc5kVDRK5MAG3t2zweOQ/qqb4z6HWLDzY6U2O41YzgumtxJS2gTznOaR4JILktla
	 0WapaIYdD9RGfTq2l4dz6WpeC1ALkEz9iAIC4Yxi4BNnYcSrOS3WEktJkpEyr31Jpe
	 Q/EJa1X1QwtBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A22CE80CE0;
	Sun,  1 Nov 2026 16:24:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 020FB323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC06C60619
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6iD4d5Y6PJD for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:24:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C08760607
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793550256;
 b=EXkvq6Wq+cO1l2khL4EyRc3GzTuRRGiCzr86VSLuPINEZhLrDwmrEa/ZoVe1Vio4OdlT
 EOSwHnT8Y2ZJKeCa2E84sepLXQYv6FD4P44dkvP75exAiIhFiVUNL4Ic3PaR9ILTvcUXq
 Sxi/tV9NqD3kqeQ8iBLd8+dMrcnd3IeI9YPw5swH056jGZRA3+QNTAjciSPXSxfkIdJaC
 raU4tnocNEmLNUuRj42SMJrgEfxjPth853vi6CmybMtbH+/etzK/ZuM0x1UHhwrPan8Lr
 pe2yjKWBFK+Ik/CakNQwzWpJ4yU0+uceQpwGUPYf+o98umHaE+TI6q0GfOlWDFuz9Tg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793550256;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=d2Me2DarQo45abQlQfVn5oWKsCUeMdz6YZTTMnjlNHY=;
 b=oZa7u5+AdmbChimIpb13XE6c84FuSyextG2+ZZuWuxPO+0IAl35XL9tHDZAMFRUl1rJC
 jiQTbnkA5wGKx5XHp0/GfzXuj3oOngWzBq//XkPgdIkJ4hYfYUxRyHe80dw7h9v3zv/jC
 qwRIF921Bb2uCXQOiru+pR5ITSxxDKdSrdIN/0tZUc/xFyfvJMQ6wxpWWqGrfxGmL3FsJ
 oelx676amBlvHKy6nxaDIotrYuIifJ5OQCjg87ByMaRCX2C4VFWY3QspSJGnQriXJl9PE
 tKtwExRUYmWQ8ELeZJshobelCqHQi6iWv2vlwL5HMaFttXTtsT3cEqq8bDV2rNdsuwg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C08760607
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:24:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7FED9D4C2; Sun,  1 Nov 2026 16:22:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 17:23:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d150cdaba473ac6c1bfadb9751b5a836dff0cf39
X-Git-Newrev: 3602e1ba7fd49c90a2e05f270ed2a57f472d0305
X-Patchwork-Hint: ignore
Message-Id: <20261101162246.D7FED9D4C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: fix build on MIPS r6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3602e1ba7fd49c90a2e05f270ed2a57f472d0305
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The MIPS assembly code in wolfcrypt/src/sp_int.c uses the
multu/dmultu, mflo and mfhi instructions and clobbers the hi/lo
registers. These were removed in MIPS release 6, so the build fails
on MIPS64 r6:

  wolfcrypt/src/sp_int.c:4217:5: error: the register '$hi' cannot be clobbered in 'asm' for the current target

and on MIPS32 r6:

  wolfcrypt/src/sp_int.c:4418:5: error: the register '%hi' cannot be clobbered in 'asm' for the current target

BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS was meant to exclude MIPS64 r6, but
the mips64/mips64el conditions test BR2_MIPS_CPU_MIPS32R6, which can
never be set for a 64-bit CPU, and the mips/mipsel condition has no
r6 exclusion at all. Test BR2_MIPS_CPU_MIPS64R6 for mips64/mips64el
and BR2_MIPS_CPU_MIPS32R6 for mips/mipsel instead, so assembly is
disabled on all r6 CPUs.

Commit d8dc5315eb71 ("package/wolfssl: disable assembly when not
supported") introduced BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS to fix the
MIPS64 r6 build, but used the wrong r6 symbol for mips64 and added no
r6 exclusion for mips, so the issue was never fixed. It therefore
affects 2023.02 and later, including all maintained branches.

Fixes:
https://autobuild.buildroot.org/results/10c901b8c57f6322b127f1b14c78f73dbb7f28b2

Fixes: d8dc5315eb712eca0a5cbf793a6714a47ab6e57e ("package/wolfssl: disable assembly when not supported")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolfssl/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
index 9d173412fe..8eb789274c 100644
--- a/package/wolfssl/Config.in
+++ b/package/wolfssl/Config.in
@@ -4,9 +4,9 @@ config BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS
 	default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4 # clz
 	default y if BR2_powerpc
 	default y if BR2_powerpc64 || BR2_powerpc64le
-	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS32R6
-	default y if BR2_mips64el && !BR2_MIPS_CPU_MIPS32R6
-	default y if BR2_mips || BR2_mipsel
+	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS64R6
+	default y if BR2_mips64el && !BR2_MIPS_CPU_MIPS64R6
+	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
 	default y if BR2_riscv && BR2_RISCV_ISA_RVM
 	default y if BR2_s390x
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
