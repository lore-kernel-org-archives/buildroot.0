Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBEFCA5FA1
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 09:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E05BA80CE8;
	Tue, 29 Sep 2026 09:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJy6-xPOt20u; Tue, 29 Sep 2026 09:08:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EFB9380C50
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790672885;
	b=SfFhVltYg0bq6n3BpTlq7QVfX5787oMoCLnj1FfwnEM0/pQHtK8EgeuDCKkqHhwJSboh
	 FSj9MeQ4lP5azItdXo19bi5STjTTdjzaVdbGQmDPGOG/bCgPz+WqzLcypxr7Wfzkne0mi
	 GKVQF8d84aPZKq5ih8jaxwX+Sv6ddIgxr2rp6z51L7MecRqA5pLFCsF7Hqt9fYiVwGZY2
	 /TbHgSSpLIBa1bHwMerM+z7wnDH7tTz6T3XxWWBAxvrgqCI8OvYm57kN22N0aovepINn7
	 3iCPmPMZRXGO9WF4JjPOnNvd5L2VgbsEU0vKVbvILXfX0ei5ozkxSnkqqYQnZY+Prxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790672885;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QsWUbuGWy2ahok848okuHy1S1KIA99dxn2StXpsU7ew=;
	b=MBZBmEaHTzunrCj7DmLvkPBM836TqyqxmtsWUIqOyzB8Fn9RdMqjpmyOhj2sjwEB0j73
	 l4LNWZqEf8ImtNTiPsEV6xCH7noHfj8+uTxubVbBmv/XtnkAj9eUBluWuPLnicSAmC3SZ
	 RFgzzXt6fBHSjEaBy+oqmmQw6ezl0IvbXhhD2EjTv9eMeHI2s4C5vGG+J0303oIS7yUXQ
	 bxnXVmj20GE1MPRqtUmsREkqW5KfSFfsoSQ5wjLEytQrKQ/Sha/XG9B0+qqx1GtwUjz03
	 Z6HJj2r5hoCddHk0eXeY/5ILPCGRXRsTokz9lCjRw2I+/crmnxPiC/jdUD+N6IYHuqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790672885;
	bh=QsWUbuGWy2ahok848okuHy1S1KIA99dxn2StXpsU7ew=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=oUqQNKfPZSU1bSScxhLBH2W2tnPyP9gCGuviR/vaSbmUrzv/PnMwcE12cJSTJ3Ap5
	 WKWxF3EtdqvUYs/r+INI0V1YzWBk/fOVTdLsMTEaFxqvYmn4nTaMbQ85ndH55V3Mgc
	 lQ84QJVmLfSY7EUAUEcFbPaeIcIPgk6N0SidxefWmUUGKrUU7D7T8OSUTokSJouLhA
	 AsaxO3wU9qeJZZyAfyBPsiDAno6H+OlOY+iUv5ov4jDREvzw4ZxjOzKLVxlV1yAmum
	 /Y4FAiIY0Benr5UoTuHXZF9NPSHngTeZGrH5akwF3MZDy07cxxYhUIBuv0MO6yhjRQ
	 MhcuySQvb5WjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFB9380C50;
	Tue, 29 Sep 2026 09:08:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85FDD3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 09:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8CE440501
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 09:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JMpqOM965Ad for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 09:08:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DCDFC404C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790672882;
 b=EEiAsoKaD3I/vgRD+vcjj0BTFotn4C8D0Pb80Zq+hS+U7InN5kBzQxe5Q0O5DdJXVtgJ
 J6FEDyTZ+IakIgwtsLztiVyyLyjcDFpp0oafpTvSl4bqQw17fRVXjM8epl3KqLQEjsMkL
 O9FdXBKN9SA/w8Vfe3yMC38HMR9CkXVXRrWJVzyIkIy2OQJ0nlZuQ0D85PVCw0ooCXHr0
 N/oOSOs9MfHCTMm9NxmT4xADWb9TJh/1fZb9NPblf9MSKlZ/aHHk76rkUn+pH2kZ2cWkr
 v06gJDAX6RtBfTud0O8/yDs8lax732/5IoKzShPEHumAgDdXO19Ypjnn/wwSqzALMXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790672882;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=lbfrabEpID3PM7F9dE+OHrBLtHpR+ZSeUeeZPP/FpHg=;
 b=ZXnWuFkEbSTU0dDVTwfoBN8p5hPCAQ1yTJ/wv41Ey/h3XPHh74vfT+Cg1nDbROGwgOw+
 jeRsAKS7y8DUDdxUX08diIOJjBE2iqcHZEOkEAUhzCHsH0fni53htZtWyf55MPRInronC
 BjAQrX8S7d176h8ITxXYKVJLYkEqMLJ/Tpfa26MQHAe1xA9bSLKGG2mg2lLTqReyWOf9J
 uOd//G6V6M8Aj8DfSqdXVNwz9KE8OJZ3kwSZtYeVTAH0gOje/f+6pJdlqA2SkrfV7B7E6
 MVhxTHRy/6BopL3dER/lCwEVROB/ZXkuwF/ljMAaV2/FP+13xl+tghgIFQvqP6w/pjQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Mml0QTCd; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:33::d;
 helo=mail-ed2-x0d.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ed2-x0d.google.com (mail-ed2-x0d.google.com
 [IPv6:2a00:1450:4864:33::d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCDFC404C8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 09:08:01 +0000 (UTC)
Received: by mail-ed2-x0d.google.com with SMTP id
 4fb4d7f45d1cf-6ab02c68d2cso1921834a12.1
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 02:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790672879; x=1791277679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lbfrabEpID3PM7F9dE+OHrBLtHpR+ZSeUeeZPP/FpHg=;
 b=LFtZda/Xd8F7WpbcxcdzgkwIR8+wADRNCXG6usaIgILlsCEtt+VHlatzgbB+qAmHnO
 FQQ9MJqZVJviY6PYKqb+A2zpPDYL1EMprcqjhbIP468Aj1gkLsuNnT5Fd2aMS0WoWEb2
 TyLEU3oQdbAvshNBRBkkqtEU8BPdxWEoZ4baHgF5wRzjCwvOmaMBStWeAZGvnPDTAtIL
 GhCfVc7v4h0+CvemyAGtWdqzjs512drBTpgO5uyXtTxOnfdpC8bIc4qcpCSs2v1AMJJG
 vgL5zMB5xwhzPsZ2MJQlJbqaljN9dR3sSe67bYkJVQd3Ba696OKnmEvFZCFvzRzS1vZ1
 QpJw==
X-Gm-Message-State: AFuF++nx6X7tt1sDG1hAvtaFPzsEJkQPhViazZXdR4XNabHCuuljXc+V
 d1m+b0qPdqRI924sgSLagXi4CSMGZSp90b7Ma5R9v5bD+XJa6M5Xxd4CYaWnXQ==
X-Gm-Gg: AYBFou0y6btz6n01+46vpO1zbgJvrb/3k08ANZZZHwjJ562AMogLl2sdJ9yBsjUuG1i
 67KCLC7eq+ZwVOmmcnJ3X4+fnjJb4FI9VdGWbcyajkKB4jcIAQKVqVQUwT7hxAh6afGAuEzWvFf
 7Tm6B61GZUJw/LO9rJpJnkwbS9TVZ0dZZ75as9yxR6K3opTikG5jEbvpNuIp4sTi2Apu6n0gPQA
 NcDV/3hbIIIjQTBmrNHOW0tiASsRHNdutDJm3hkO9CN+SUSnpr8daxkMTzRKkpQLYaX/RfQZiwv
 QfOemL3scCz//lNAfiATkKowYmd+u7lVLrF0KyFlzJwKpAHVxXGHJeTax8qMhgESvRNVN1w2Apx
 SEvFS5y5jsqvM2bXuXZnfZ7604F/jTrKoGy+1uE8xn/2/M5Evi/qk5+EzrNNEnxxHELb8jp64Hy
 LmOdUBj0xH9+o9JpvwWof0meT01/Qjd8yxAxla8bWS0F7mtDlAzxu1DknQK2BWx0Xd1GjoWZEan
 hl7aaFkeCf+z2dNK3oSjysAAbQnHqG+1JxDwW7PLlwgia8DpZtQKw==
X-Received: by 2002:a17:906:dc8f:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c2df471e916mr168408866b.0.1790672874517; 
 Tue, 29 Sep 2026 02:07:54 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2ae84ba822sm592479266b.7.2026.09.29.02.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2026 02:07:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 11:07:53 +0200
Message-Id: <20260929090753.3570630-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] utils/genrandconfig: reject qemu user mode on
 hosts with large pages
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qemu in user mode cannot load target binaries laid out for 4k pages
when the host uses larger pages, as the 16k pages of the Asahi Linux
kernel on Apple Silicon. The dynamic loader then fails with e.g.:

  GLib-2.0: error while loading shared libraries: libz.so.1: failed
  to map segment from shared object

or, depending on the target:

  qemu-aarch64: .../GLib-2.0: Error mapping file: Invalid argument
  torque: error while loading shared libraries: libz.so.1: ELF load
  command address/offset not page-aligned

This hits every package running target code through qemu at build
time, i.e. gobject-introspection and nodejs, on mips, sparc64 and
aarch64 alike, and is not something Buildroot can fix in the
packages themselves.

As this only depends on the build host, reject such configurations
in genrandconfig when the host page size is larger than 4k.

Fixes:
https://autobuild.buildroot.org/results/4848e735fe83dfeef4f24d32655c567951fd113a (mips)
https://autobuild.buildroot.org/results/089ddac5bdaaf5650cbc5c26d48952b5bede0ca6 (sparc64)
https://autobuild.buildroot.org/results/c30c6719a0350370ebe3cfe262123727f4057734 (aarch64)

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 utils/genrandconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 727c8193c4..8437d6342d 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -124,6 +124,13 @@ async def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_LIBOPENSSL=y\n' in configlines and \
        'BR2_TOOLCHAIN_HAS_ATOMIC=y\n' not in configlines:
         return False
+    # Qemu in user mode cannot load target binaries laid out for 4k
+    # pages on a host with larger pages (e.g. 16k on Apple Silicon),
+    # so packages running target code at build time (gobject-
+    # introspection, nodejs) fail there.
+    if 'BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE=y\n' in configlines and \
+       os.sysconf('SC_PAGE_SIZE') > 4096:
+        return False
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
