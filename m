Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E732ACE79AC
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 06:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68F9C60F6F;
	Wed, 20 Sep 2023 06:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68F9C60F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ir7nJ1lXSLNg; Wed, 20 Sep 2023 06:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8DAE60F49;
	Wed, 20 Sep 2023 06:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8DAE60F49
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7E321BF293
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 06:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE13E40382
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 06:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE13E40382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMz50cYGz2Z9 for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 06:08:48 +0000 (UTC)
Received: from fallback21.i.mail.ru (fallback21.i.mail.ru [79.137.243.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01D664019E
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 06:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01D664019E
Received: from [10.161.55.49] (port=53628 helo=smtpng1.i.mail.ru)
 by fallback21.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1qiqOD-00BDZt-Fm
 for buildroot@buildroot.org; Wed, 20 Sep 2023 09:08:45 +0300
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qiqO3-0002Vw-6E; Wed, 20 Sep 2023 09:08:35 +0300
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 09:08:31 +0300
Message-Id: <20230920060831.71857-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD94C460F083DF69F51776AF4F60B73038DFB04A8506B5144C3182A05F538085040A581A81543105502E00FBAA45D11829A2F29689CFA4C99E3A7CE93DF47F9CD70
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7EBC3E7439A970C64EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AB1265E79AFCDEF58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D84C7B2875D5D38C52E77C2C93434E45456F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE721935C8CC5BA8AFE9FA2833FD35BB23D9E625A9149C048EE140C956E756FBB7A618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B791E6C230873D55CA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C837C4FEFBD186071C4224003CC83647689D4C264860C145E
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5665C28890387C0294549AEF6AA349C398FFCCCE5972EF6F6F87CCE6106E1FC07E67D4AC08A07B9B0724336BCC0EE1BA89C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A092FFDA4F57982C5F4CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFDDAB9934BE44C893799298E4B30912651935F7E826A32DB9FF94BD5D5F59960DF93E7F6CC6F2622970502DB933AA346E1B4D5285CA61C2074708435470670B1540B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYCr+T1AfK5x5ZT8g9wSckg==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986B90931B7D533BA598357BB2037F1B69C798CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B40BAAB6146616B44EB5C4422D802A5AF2F0FF5AE2E4CDB147049FFFDB7839CE9EF0375AB2D64EE5A027FF5885A0045D9C3CDDDCDF3A6705B389EF41D4415CBB74
X-7FA49CB5: 0D63561A33F958A592176572B7C446BEE8440FED14352376883907DB5D3840D9CACD7DF95DA8FC8BD5E8D9A59859A8B69E93E0164395CE86
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdPOFkVkQ4Q/lbHPwRK6Rl/g==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=yUU5ZaJhTkLDeJqkbRbvJHDy1J0b7PGwVCyO3d1n1zw=; 
 t=1695190128;x=1695280128; 
 b=Q3jOS7e3yMWztjPLxyEulPwTsLLVTFnbNH6LmiKa7TJ64Trcxc2AsbnBtGy2PmSSr2HpdGDLK9XZIKqhJqo9gK6Xyw8Orrzg+y72ORZJ0fc5TBl7j7WoTc8i5UDdPG8IYpVwYUAUCt7ONFoXIsh/onInJgF8yI0/cZrQ7pR5UAJXy04thgPSoFHqV+CxJ/EilZxCcpHjNz3R9rF8kOuvb5iw53HGtmU5psq5fXLogm7XE+FPRAzLUV+KL4AU0z1So/Yr0yqG2htJS97IxI/PqeOrMo1Llhkb9ZXvtT3KjVdCPLQnnnPydsiQatx4/Dkww+2yrO/8vqDwJD642CFlYA==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=yUU5ZaJhTkLDeJqkbRbvJHDy1J0b7PGwVCyO3d1n1zw=; 
 t=1695190125;x=1695280125; 
 b=QBHKqp4CJ2SN96yNpEA5g60RQUmjm4JBFy+XRklosTrl9rnn9vKcHoQooPQXvcRj2Gke8/FSvY28Sea2wE92UeZAA1A49ZCA2QEzlbn+QVqSNJ/HtcPNW74MM5ozoI2+jyrO9LDEmajkqhz+E33WEEax/qqebU+aQyYNV/iXDbp7ZB4X531yRGTNijkoh+1AggF0S8r38f/sapfVvdW1PjXdY/jmfprOpo8KPne49uYRb++HB80TyQ1Jv7SWNNZAveIQmDl+Ad5xoKo8g9pdUQTTOff3YK4QLj5XM/8y9LjgwaHYYBihRTDWGGWSlTeVqFzJ9gKkGnER5WX+kgi3Dw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=Q3jOS7e3; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=QBHKqp4C
Subject: [Buildroot] [PATCH 1/1] qt5: enable jscore/qt5declarative support
 for riscv
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/qt5/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f1b16ff39b..e15d3a5005 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	bool
 	default y
 	# Javascript engine is only available on certain architectures
-	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel || BR2_arc
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel || BR2_arc || BR2_riscv
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
