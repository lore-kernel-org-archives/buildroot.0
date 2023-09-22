Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D173CE7D0D2
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 07:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C154610A0;
	Fri, 22 Sep 2023 07:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C154610A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sk4MtCzqMhdE; Fri, 22 Sep 2023 07:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB60161097;
	Fri, 22 Sep 2023 07:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB60161097
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6CFE1BF290
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 07:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C96783D10
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 07:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C96783D10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usoQ15cCos4a for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 07:03:48 +0000 (UTC)
Received: from fallback2.i.mail.ru (fallback2.i.mail.ru [79.137.243.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C084B83CDE
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 07:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C084B83CDE
Received: from [10.161.55.49] (port=46548 helo=smtpng1.i.mail.ru)
 by fallback2.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1qjaCX-006ONQ-01
 for buildroot@buildroot.org; Fri, 22 Sep 2023 10:03:45 +0300
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qjaCL-0005O0-Gm; Fri, 22 Sep 2023 10:03:33 +0300
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 10:03:29 +0300
Message-Id: <20230922070329.524672-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD94A82C1E0D012D83996EA9A6CDA4A43548507956F443A97DF182A05F5380850404C228DA9ACA6FE278400F8E1640315EC7C1CB66A9665B73FB6659C1343FEE2D024E72152644AC562
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78C722B68A3D10D1CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063764BF1E09E94CC6278638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8FE23EEC4C7A57F9E41B8529C33E7424E6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE73D04F0695778128A9FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FC26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF80095D1E77F4578A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB0EC3B1FCAE4A06943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A51243CABB610ED8AE6791426680BB5FB3C2387DD49BED7A925A4FF58CDAEABE2AA132EA92956906CB6AB745FA4E566B44957033528158102EBADB2A551DC3F950AD821FE3CBC9797D794DB285CF8A07CE4AAE2D1698E8717BF36E2E0160E5C55389181B4E2F58B1401E618B5D5F965AFD9E7983562007754F3D58D961240FA4EF6DABF04D5057A81F1E618B5D5F965AFDCD68EDCA48B5F1B5
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF26627E0B569FD6DE0357DC0226EF9A8E87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF035A636C104C8B1EC8EF56E7A465FC2729DEBA7950FB6A5BE42EE0648398D06601EE030787A60D78ADCD6B1B15162EE4284D514B2EA86CAAC4DEAE5B4C7390ADE48CAC7CA610320002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4QXCo1VISWJ+f+GjxlbnLA==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986B7843C51A8AECB322BE0E81A93205C87B98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4445B90D6AFEE871FDC6C0BDA1FC50A042671947D58A8406068F3CF0E9FE49B690B08D1586DBB1858EC8A8EF7F52718F6900D4D3CE7C76D6AA9774360EDFECC23
X-7FA49CB5: 0D63561A33F958A5264F09AA0D085AEA2D13DE0394880B41DC89AB06BA07E22FCACD7DF95DA8FC8BD5E8D9A59859A8B6A096F61ED9298604
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdPOFkVkQ4Q/l2M1gQ00Tl2g==
X-Mailru-MI: C000000000601000
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=2VNbuggTfIySqAsG2k7hhguZoFv6/lzwKKUiP6MX1bw=; 
 t=1695366227;x=1695456227; 
 b=q6VXUor3BwNQ6SA9TdqvKseeYUMVR8PsO4znztTS18pMR6g+A7q1lOVc9nRiUo7beqh2qCNCZLgAPhfWyqvlz9exlPgv7p1OKC38hTsOno8NnX7TtIT5d+xVLhbSIsb1p715buTxZndxXVr3LD/Q5p9RDY1LfuScKlD46RcHXxn34mZBKKiwQnmeMvi2xjEa0b3+zPQZjFCsYk+jy0NSGeLhhF2ws4nEZSp2v+FvkDakAGpTkYVx2VAdbMwJ5VnumPcVsxN8JewbQZzTjAyaAX+nhAYltzvKONHO/jGPC6zN0GTg67OEUVw2DCv71mgD/uBiO5figFqfak5B6oP9gQ==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=2VNbuggTfIySqAsG2k7hhguZoFv6/lzwKKUiP6MX1bw=; 
 t=1695366225;x=1695456225; 
 b=ranozGmezEjSqpKDEoQKG85VLCUZWWnS80OL1yEyELdVnkKix6K+I7xFK8TAKxA9VsSdqUDhxbS/D90/Tof0m+1unaiQ1onpuR/YFAdDUQv4Zwje1nVOsmDvJkwNoF7FSvsZJ63Si7sutAMfh9o+Os16PBnljy0R3iwWhYdT4C/SlOKwNUrk3f3bBrbHi4/di1Z4geewWxTg7veHxtg8uiKAjkk3s7MpdDUrraqikzHnzQbYTApAPNwjCgmCgzqUhL5WJPqMhDYGX+/aI837vrXOp8yc5Q+tw6Z713Df3BgsZ5k8z9aee9aPvMwtCWEu62yHMxIVqhlodXISB7CW7Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=q6VXUor3; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=ranozGme
Subject: [Buildroot] [PATCH 1/1] configs/visionfive2_defconfig: bump custom
 kernel version to 7b7b4edd
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>, francois.dugast.foss@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Current kernel fails to build with GCC>=12:
  AS      arch/riscv/kernel/vdso/note.o
./arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
./arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01', extension `zicsr' required
./arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01', extension `zicsr' required

So use latest kernel from starfive repo.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 configs/visionfive2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 5b07a8efbc..dc086953a0 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,7b7b4eddd8d5ae55f6e0ee09b93e16e23ab4f97b)/linux-7b7b4eddd8d5ae55f6e0ee09b93e16e23ab4f97b.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,05533e9c31d6f0da20efc2d436a3b0f6d516ed4b)/linux-05533e9c31d6f0da20efc2d436a3b0f6d516ed4b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="starfive_visionfive2"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-visionfive-v2"
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
