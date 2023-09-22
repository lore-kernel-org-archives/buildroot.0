Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D742E7D0D2
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 07:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 248F760AFC;
	Fri, 22 Sep 2023 07:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 248F760AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDx-Hr5TFMrp; Fri, 22 Sep 2023 07:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67B7860B0C;
	Fri, 22 Sep 2023 07:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67B7860B0C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3D61BF997
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 07:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 392214211E
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 07:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 392214211E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0Z8CJ4jRlLH for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 07:06:27 +0000 (UTC)
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1660D41DC2
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 07:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1660D41DC2
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qjaF5-0007cS-E6; Fri, 22 Sep 2023 10:06:23 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 10:06:18 +0300
Message-Id: <20230922070618.524825-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9B5EC2F0BC61DBDE7930999068D87983610A2119EB010F09C182A05F5380850400ADF6FE84138C62E4B13BF270CA33C16BE91EED6A14CDF604C4E31B930476E70
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C8DD139BC0BB8586EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371DF52D98DC3592C48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8642E4E521613BF2F34859BBB9F579AB46F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE729FBA39629FC1B7C9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FE5D25F19253116ADD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF80095D1E77F4578A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB0EC3B1FCAE4A06943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5DF932F32D0A5C7A30FCEC3E2F672F26811C1A28444EC265A5A4FF58CDAEABE2AA132EA92956906CB6AB745FA4E566B44559C6C5561145D6FBADB2A551DC3F950AD821FE3CBC9797D794DB285CF8A07CE4AAE2D1698E8717BF36E2E0160E5C55389181B4E2F58B1401E618B5D5F965AFDAD6569683AD073753D58D961240FA4EF6DABF04D5057A81F1E618B5D5F965AFDEE9E2E19D1BC048C
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF26627E0B569FD6DE0357DC0226EF9A8E87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF73127A9449B25F545EB3C3B12D67E97E6A75F104E621C5A658AC0E81457377E324DE828755D94EE9ADCD6B1B15162EE446CC6313EE50B59E0AD1F2DB28DC343FE48CAC7CA610320002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4QXCo1VISWKqyLS2sHdp4w==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986BAA3F329DA7F79133797953F6B5E20C0698CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=qwFd+p4L9XtovMALIwoNMEgtEZvfg4pZSACDcLfJ9PQ=; 
 t=1695366387;x=1695456387; 
 b=pxdVlWtdi+64GRULsT5ZLEmIElq0x+ogRuUIQnWeDWO5YNAyiARXc8mUI4wsAsN2UzJhD3au8bNvxfjZ/jK8k5YeMDAapTkbmv8TZ0pbNVXK52XpuME9bk7FzuqD/riRYFMQbmDZWB6FZ5Ez6Y/jaeHrY2YCAGXtDyp8wF8tE/2dNghzCzbxg/ZWniAYKkxwLSJs3JJbXgC+Xh4fMOaia6WZE4XDZWiMakyx2Acz2XARs81lud/Ac4KB7EQMPDZP2rbVPaCuk68+ds7a+FQkmynfrLr6S50G5xOCir9w05SO7ffpyNPc+ZSxoh1ZFH8BGjEg+JHalnMX+sTrzt2iFQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=pxdVlWtd
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH v2 1/1] configs/visionfive2_defconfig: bump
 custom kernel version to 05533e9c31
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
v2:
  Fix commit message
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
