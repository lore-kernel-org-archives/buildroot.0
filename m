Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750F3C98332
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 13:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1524881231;
	Sat, 26 Sep 2026 13:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N98snhVnlVDz; Sat, 26 Sep 2026 13:04:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 377D481233
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790427889;
	b=kB3ZBNeFItMElcOkSs/aHmkvY+zbBWA9pJ/sFpj44EcbonofDooUb1htMY8Vp5b6pGws
	 /0uozk5/pAjytoi2YW4oXs3Q2I90r0Z3rgNmlByF/PTcNfn+X3iMVAfeji6yp+3Eh3CHk
	 VS352S/FQn4nMPLoV80pmH1EFvfs6ebjWt/pPYE2p0m4AkTviIq/us7Dqddv3fnetoMpM
	 NlnAOI0+zn9dhzqfaAdbsLqVblYsnDefAcgLhh5Ke8mKVMlwIinOatEg2BA8ZoXhjmCON
	 +vpAMDFDvgD4hC9/2OYQfn1GQuV9QQyct5XnCn2f79HJyDZymStdwcpmprYq2OP22qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790427889;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g7Yj/lvxUHqcx6dB9y1dAeqRla8Ad6p0yru0I/Uzgjs=;
	b=mQPWuS2KKp7S94+/6oqzFvPIpuL0fJwgGb8CW+iZ7/bwJrG8J31p+oFiXOjYfZvD9O1O
	 TjFIpqh3a62acTZvO8OGkBxQz/Ec3beb/Zr23+FVGHZP4+9aMDNkBrphC45Z3aR5uLfl9
	 wcxgDJ5PHZqE7yItHg/xcRX2eKtsDYvYslBUAwpetyUq+MLkXLqso7wdALXO5obgw2AlA
	 WoToWnceJYBtHJkTlxhGK590IizLKRqtreSTcMUsqcciaXnzV8nGFw/HTE9AVtkZZGfxT
	 +vtr+sTcK/v7ztf0plOs1w0QFUZPoRVYO22NYjt88u3idnkr7CyQFwzNdYATItd2tXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790427889;
	bh=g7Yj/lvxUHqcx6dB9y1dAeqRla8Ad6p0yru0I/Uzgjs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=NCrcGr+otG6A9/vLEch1X4OpoZHUwXvFDKJfCrSaVsePlPNRcMaQUw7617E+10lG7
	 Q0IVkKa2SmC64bgpVelNFb6AybBGIJSgdYC0LjbrmaC5CtvVTdPmvGl0QGPoZfh7sX
	 34QM2I5DdjG3G3CCooRVRnfUa6rAEHwuN/ASfIKrq5HtEzYIJ1jYovsSziXO1zgkL3
	 hvB4ISnu09vrz7VvJO1puHAow4U/VAxcEjyXnJ/BzS2vmj5r85mlBGJrirnbRKQG0U
	 b4arVFpnGtt3PmH3hjAUIhtF8HZc00jAmLDs1xXCx2fWqDrOalmKVjscCGNmcsfgc3
	 6UaRSDPe54hQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377D481233;
	Sat, 26 Sep 2026 13:04:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 783DF194
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 13:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68FD881231
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 13:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e99pdxuqmRe9 for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 13:04:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 47F3881232
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790427886;
 b=Si3zOLDiUTpN9XO4QcVLD9+2HPL5EsF/lF57pT9xVD8Gj0qbG0XnYJL7+kMHithyeVuc
 WdJMlpNuZC12U3brcdY+5l6poeT7YpvyZVRSChgS/xBbFSd7uAZTfIgDCzoFIG+/5P1/I
 PKTmN3+2gq70Lki/GM0lWV3/G3jIG8C4FcbRNDtD5P+j1z5FSjnGZMgx6nYMMxcT0Q0HO
 VEu7btI+5+dQpcXmNa+r1MiZO620JdxeY1NUC8rWu+yId3ho5Kg6xTyfi06cw8s89IPhg
 AD0RbXnH0Fl1zF8sfnGjllOH8W+pBAuR8AKDhMFv0mGFRxtpweUCssZlaTuxkdr8Spg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790427886;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=rgzEiM/FyE+/f4zTiWatvjOobzi4BfaKYnHQsrYk7V8=;
 b=KI8l4soqs6ysTJm9FQM6ky28utjhUKLYrc5bHkl03LXNNIbD4OAg9RQIiw1nRy6fnyne
 IwojZeXVJgf+k/QiHJSqmgOHVsDg5pyEIhrnIQqZCawea2kYlNgbOvwu8uPO+ZGoMCkWU
 mA3FuObCjjZXDJp5rhVHC2+EsKo30ujKsKZ/pqMiv6d/jDCQDCmdSx2TPXwQoosssFuOs
 jlwysYq4E3s7L1Fx3F9LyVRXgeu7qsT4N7Q6c0svo4nntOgSlNJAsjfzoU5YloyhBwJEG
 SKmi80QLXx+KDcFgQe/PcqsXdM0ErVk4VgJzaMi8a+vVcMra2uAktjF6DcDYUkmqx7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=qtlpVbXs; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47F3881232
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 13:04:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIdeX-1wvw0y0wsv-007vuk; Sat, 26
 Sep 2026 15:04:41 +0200
To: buildroot@buildroot.org
Date: Sat, 26 Sep 2026 15:04:37 +0200
Message-ID: <20260926130437.398038-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:SdQgWHdN6Bx/w513CxxSg27CNbsv0njDWXufVUJlpxPKP7aEAAC
 l09/VD1elqvf+PiV51gjbmyhgLpJ6sbhSbJ6v9kySexEUJV7yl3YPAuQeaaR0nLX8osVNeT
 NqMFHXHHbicT2COUk/jiZX9RFT9zbc7MybWqgyLW2IkwscaEtOqkIhv1HkKae0ebreVud7v
 sTw5Bnbc4fh6RpBdAZT6g==
UI-OutboundReport: notjunk:1;M01:P0:L7aRndfYiqg=;ztZ9mGZbLXsOzkqd2U74BHxdrIN
 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
 TF2XWJYdlH/buelFWdYy6Aq8A4v/W9ZRJCw==
Subject: [Buildroot] [PATCH v1] package/linux-firmware: add rtl8761cu
 firmware
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Bernd Kuhls <bernd@kuhls.net>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add rtl8761cu firmware deploy to BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT
  option (e.g. for Asus USB-BT540)

- while at it add missing rtl8761b and rtl8761bu entries at the option
  help text

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/linux-firmware/Config.in         | 3 ++-
 package/linux-firmware/linux-firmware.mk | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 7533b3d899..833c07b615 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -137,7 +137,8 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AR3012_USB
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT
 	bool "Realtek 87xx Bluetooth"
 	help
-	  Realtek 8723a/8723b/8723bs/8723d/8723ds/8761a
+	  Realtek 8723a/8723b/8723bs/8723d/8723ds/8761a/rtl8761b/
+	  rtl8761bu/8761cu.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT
 	bool "Realtek 88xx Bluetooth"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 17fb565cb9..50c84082ea 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -97,7 +97,8 @@ LINUX_FIRMWARE_FILES += \
 	rtl_bt/rtl8723bs_config.bin rtl_bt/rtl8723bs_fw.bin \
 	rtl_bt/rtl8723d_fw.bin rtl_bt/rtl8761a_fw.bin \
 	rtl_bt/rtl8761b_fw.bin rtl_bt/rtl8761b_config.bin \
-	rtl_bt/rtl8761bu_fw.bin rtl_bt/rtl8761bu_config.bin
+	rtl_bt/rtl8761bu_fw.bin rtl_bt/rtl8761bu_config.bin \
+	rtl_bt/rtl8761cu_fw.bin rtl_bt/rtl8761cu_config.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.rtlwifi_firmware.txt
 endif
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
