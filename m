Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C331EC982ED
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 06:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B1440CBC;
	Mon, 21 Sep 2026 06:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qq7EjUuWVFsr; Mon, 21 Sep 2026 06:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EE49E40CB4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789970769;
	b=F5qt4DDd9ceBNQaIptYRuE0lugyXjYBjQhqZcQ7BactsZIJr37g138YdeV/3p3NmtT60
	 lJygVyRXjB5dPQT+8KcDCE9dUmAICGVgbYFLzMIUOzGCzTfcUXO+QdLKq9GINuUWC1uDw
	 Qz4JkkJqY9SFYFhlMh2pEfZPRoW/P6E6buOsZwDuv94b3Lp0UhVTb3eTS8o5eJTvHtZq8
	 y3oYe7hcfBVBbtwxl4Iv7/wiNe2NSjbpD7m4QA6p+9XR3VfR3ftBIBjK0/PV24jRBo4M8
	 dxe6YdcwTVIcq4dfW1P1QGOFZ/dM2q4OYY8UaNaGGQOt6/J0TMhBr87AFx47giZN6Tg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789970769;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7C7hBBYVxJLAHNntR2GKkyxeya/JdoxKaTykT3cCtzs=;
	b=WApHCpGdTV/4PXSzhNR5GmCGBVL2C3uejcrF7oEQKbFkdPtpccIUU9ZTFpZCMYF0YN1z
	 NBNJjCqePFWaTpWAfFujEd5/k5e9URrtiaD83akWm7a+CevQAQEQA6PRRGBwRIs4IfhoV
	 3ld2altkex6BxVhRvHrGzKow8klgmndOUoxRDCViwj2z+MAqsLQ8ofi3XnJIYMEKyyFKw
	 nmAhHC1cbHLFzH5JLKcLuT5EUf1V/7dwuAU75dZuPD9KtGr519AXuIU1HDSnRee7XLWGs
	 bl66cu2zeX3nt9W2G4p6OPQ/wEyd5cA0rjX1zKLPis9/k5o5nPjSjlwlondAyH35Qlw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789970769;
	bh=7C7hBBYVxJLAHNntR2GKkyxeya/JdoxKaTykT3cCtzs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mxz/bblQwIgRvhgL0t96rZu5KnBhlm6FEF0hEq1iGZUu8ZiF9e6gH7gtKs1ZtPyUi
	 yd/ylRTIu7vgi7eeGNoeGNFKqingbmC5GoPrkow0iaQYje4f+OaXspH8sVATyvxpb7
	 JTkxRfqzYX9y5bwaaHJC8sJFVqq6V/dScp4IWH0xz2avI3VFJo8MgCWycrfufxM9ge
	 Tvxbn3y1sYco3wg+KULwUAie+XMgWCWdvcRsNyvDU7moM2WIwHfZEi/iguDctaKPqL
	 ebJYC4gb0Hptc9IDtKyMEMqHP/UsXPqMgYEH0tXHJ4JPdP4Aw5kz5Cey6UHZUHGQ+2
	 xf3V3e2vZN/HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE49E40CB4;
	Mon, 21 Sep 2026 06:06:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C98FFEA
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6240160629
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaWJyyc1k2jU for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 06:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1844860608
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789970766;
 b=H4BnAi0KWLQ46bHvync62sJv4GoZTVLZarjczzV+Sk5Tjo3bnDv/LC59xt4lG8puxkDK
 8a1xfbC0mKd4SbzvFANJIqd2jVOw7s0vpbzPeh5Phfq9QLpXTzMrVVKgikb97cBI53C7c
 6STuVmgAbKFc9JR8TzCUYBnPxR/xxlQGwx1UeZbbreyLA05K0Ufii/M9sarnTgIGRrOl8
 zxwV5OSOmzjYNwkzbJEevqv0OT5UhGBW4xey7Sxepkq6cwF2Nt0CjJTKAgoIrE/oIWl2N
 aV6T+cl8mmXao3SwGFzbeXRr0XnMeokygEkNkt/lOYn6fLSN8Ws0bSqXp/FxMmtaVPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789970766;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LxPwlUgMKYshEnW+Ijk3ihZOIeHMfLnbEQ7ZkSdqof8=;
 b=lCF5SFgWZ9laleT3gkBqR/6Iq+zz+EC2lWmHqIawlv9NGrOpUTzWdaCDN/osib0QVAfF
 uLiVQYTHo73nBiVBkdyBUan/d/I0q1MUxljMrEK6yWVDZ9DXVDfOGHZrjEqAeV5GiEoMm
 Y+krXSGZOFAA6HS0hFvoEceOw9pI59YZeOr2IsoaOZaHKFhrTJr2lwEmLVl/0h54K3TVJ
 J0CVFilbwVDFukW6tZuLXggx2NiTl3zeudj2HlzNHTI414UZ/BgGogQpVYJ5Py6gI3i6m
 lrzi/gk7Rw2rfK0Nl7U8fIHJy4vI+hSpTAscCKVGci3IHypBkZ5XxM/OgXyuJUh5rKg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cLncW3mY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cLncW3mY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1844860608
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789970763;
 bh=LxPwlUgMKYshEnW+Ijk3ihZOIeHMfLnbEQ7ZkSdqof8=;
 h=From:To:Cc:Subject:Date:From;
 b=cLncW3mYXYxWZKG14Ye1kVVyLGo/5QvhTMCaKkzb+gxP2bOUKhzdLjqqBkVMhAaFM
 OPV/VE0FxR6yYFWwZF2RiLk5u1MfBqsVPmOOjNjuKHlBMo3+X2leR2xBGFtFb48GCs
 mzyaJyBeUzK5Pv99YulS+V/RdIShL94LLvrlGxZHXzOsC64WU10JMAQDrVxY2Dhk5x
 eJSJ2Tuimu+eVd8WodqEaJLjhF/8gZ7AZ5hZGCEaxlMq06QOG/HOE9qqXmDgckrCMW
 UChZ04/2fCwy7W36nssxrCnlz4Bi+0o22yzn+esSlGQFLmh2QFUqHMvGfsN0OqiLI8
 fWy85jedeHTeQ==
X-KAS-Sym: v3:f51bdf72230551df:ET0ZYmwHBKs/KzAbiasoecMxobDk9nNTMD5dWFyU5H527uTad3H1XqLPEILx0yICgfKpTj/Nr3x/Iue0V0XIUJrogoheUbUgQq6AzGfsoIyTRTfc0q9qahtjEVrgEPVedpPJK1LUQ/5LQRTBV4q1FlBEhr+V2uwvzijmsW9I+CnwASOtjq7F9Sq0SLotIDo3YPDKgifxQgdpZEngcT++/c08MxztVYa/SE2p2wCu27uaNSyElmwFTPe0EmMDaxa0jmY92/hFPW5YZFscrYO43/KekBXIL0J+f6ossZwJwxBVxSAQzYg4bptChobMwcdFJLPS0glhHURTH6oAwaPwOg==:+b8Lqcci0VjUPql05/BYKJE3FciD7o0jyNkIPc/PwM3tHg1hf+scXI4aA4wZBDgVetxjL8tR/hfyFsTMBzl/DP1P5CT0AwqFEf8HW1Q5rTAbnqJ/g1zXYQhGMy/7Xu+TpAhPy7lC7zSx+fCdUwAMGk5oWmgAHsEogxl2kZi0xIIt7EuE3C+wvRc0P5dy6nO761ZFTnE3ab9toEgDAKKjEBKie3zMsKPXo8LagJmZHQHPFZ5Tzkjv3W3efubFN7qb4Pt+1YUOnV9sFPbGGFe7WjYG98AzBTRYXaviDrsRtsnAVgR4nRfcpdMSAVA3OeKLjTMQ6D7pRz4l7lgy9FVkvRUbl90+N79pwX2UgQT7t+7+W4e2KCcAb8e6aXlCoJfGv/FZgSQ7rZQqSagbmgf/9hCRAA8S4/3hAyIz5vuqy/0lkzmO/MYxHJRGX5QkIBrB1Hl/Ae6uFMADeIn1Ep/xbyTZSLG+GPwFBcc4tlHMW0EG1arPufSH/8NSF10+ze2+CnaKAwXwXn2vhezwCznkwLu21ijxeObyUgRhdPZA56Wltyq+he9bfoJwcY2nNFXaci3AbHlDHLvdnV4GQfqwp/QY/w7w5rDsTCr3sknk0RVPVf
 0Z/wX9R94VX40XvvZ4
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55B41A4C2845;
 Mon, 21 Sep 2026 08:06:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45262)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8XAB-00000000882-0DB6;
 Mon, 21 Sep 2026 06:06:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 21 Sep 2026 08:06:02 +0200
Message-ID: <20260921060603.10831-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20260916
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index c9cb054689..4c9ac0f141 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  f3937ca282ba256242e2b6dbe523df8a80007d29ffd61f56d270190865492ea8  linux-firmware-20260910.tar.xz
+sha256  f80dcb757a623deda62200c08e0e1a88c76fb6b54964f31b35fa74da1c90ccc5  linux-firmware-20260916.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENSES/LICENCE.Abilis
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSES/LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSES/LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSES/LICENSE.sdma_firmware
-sha256  8bc466434be59e1c044cb3821b30b7328859ca250a451bb6c799ffb21ae47f2e  WHENCE
+sha256  9350832c1e9afc35df50fa8b9793b31d60d78ef963152eec903fc0dbc6b4a559  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  LICENSES/NOTICE.qcom
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENSES/LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSES/LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c5749513c5..17fb565cb9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260910
+LINUX_FIRMWARE_VERSION = 20260916
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
