Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE56BC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 09:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 708BB40DE9;
	Thu, 24 Sep 2026 09:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNtQiIX9KU4i; Thu, 24 Sep 2026 09:08:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8648440DEB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790240936;
	b=KzJ3Uj/5W2r9jK3Ztf1d+lu/NjQon+l2IRrIH8DcEO/fY3mdfKq+W2LstNfEymcqj24S
	 slHW6HmMOFn/hQkE4i81dOh6BxGoeHRaOIrryWb+B4RW+kftD3fMm+iSOTdpdXMdCsGYo
	 2+kDf0uj8F7Vs1wnzOn7ydVYImFiABIaX3JUHq7797O2dWR2NifUC0w71bIxEYdet6n35
	 CABj3es4JYPMOgl1uPIinbPLJRSJJRlpKE+RXbIHUpbkAI3RSxkJZI5r1RzEQPV+J49Do
	 4xVotDm3tP7jh5BIdRxzHyAQwerBXdGnsZiv9BZnTKKag0bzMW41Y2NGv5TslIgvhmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790240936;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5+JbU87jxclGJ0Y6xz5x6MPYIzhluY7z8807osN8lJE=;
	b=LoXPigQS83koRtEz2k8ruE0xIU+9ikRGotd+K/XRHI20C4KcWi8ime7lq7WdRD+7cDhb
	 iQ8il0lhUm9ZaMOZl6LuR2cDM0vMWpOfvUCCUoYQxpek3FoPoMpr4bx5KCWJt+kbvNqw/
	 ncCdfOFe/cs2b1OZOJRMydEuustWMs3WcR9mW711OemP1b39YQVgla+YLrnVLa/R3ntL5
	 puuvAvysunopD3+q+b23nJZ2ZZnY32d3NF+PxDacNxYwwQ2sNeQFYH5IcJ/DY6AWU1tKZ
	 i8tmR5iM1IbVVo2BdUhQ2WbL5saxyLHd9ssz8xWlUvJDtrR2zjE0qTCdLzEBe4JMWkw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790240936;
	bh=5+JbU87jxclGJ0Y6xz5x6MPYIzhluY7z8807osN8lJE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hGNU7vuCGNCJFREfIgPVaFUicsGmobCwidxq58wY6G6/JVTb4RjcCY4amu1dr0yn/
	 GYkzt/38p0Wf5A8Cuiv84jTUrZuI1381B6XBqEMC41ESUg05ud40thLfVA8tZ+wxU9
	 oUCo3/+tgS3getbSwhpsBeQefqtm4vsH6r1D8uVn5mWDja7mMCg2ubChp9S8ZGx2un
	 G28mgXcJshiPcjWtgqWgXATdQZ50vejIPj+YJuUF7JUIqveZe/Z/s4Foi7qq/PN6Sc
	 SDP/Et2qCsxcKkcUIrstUBZGhVzNvslRK0BPF3u0EYSVHNDop/8Dey/UDr8bwUF0LG
	 NjX1S+uTxNfWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8648440DEB;
	Thu, 24 Sep 2026 09:08:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 311041344
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 09:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F0AE60880
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 09:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcarROp_lehc for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 09:08:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 39D4660865
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790240934;
 b=hZ6Y2jGtMi9mh3Bx++GMDfC/kSqBqq14jW3WFBanEtZZg3ubs6MoReRvBueTEBk0pMuh
 PfyndfiqtmHr3HjzUCqvNUAXioAOZGWwnKlFuJnkxNxWT+K2rdEAT1jLV3RHyz0MQX/BM
 IllIYs5rfZYipuztY9rU5spmUbuWKY2EuJ8UH+fNIO6Mq8fc1vGUGUw5DeSclE0NT7YUc
 MgaYI7V1FvQtJWnKQrbY4HkqNaoQinCulW7f0Fqiv7fwaCRDXZLggT8qz2A8E1ua+HjNF
 Q7cz8mcRxRoEjVrujApmrJuTDvxo49HLOrgd9h5SePxmWGU/63QFCooodWcniUnKavQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790240934;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=aPEp9LFEclALoIh7z5Qm4QYEEXlajX/ji25dh3BSssI=;
 b=BLGb9LFdi2lsUgYcYzvyZScYceERKbhisn4v92vl3rWUY0Pfy3vFn/OQgUWnX6YOiETn
 IkOjgxnOES3mPv34iAPBdpzO0ViWuURdaK9f5FnvZ1Nccfn9MkhypvyPReFlGbIIAlFKq
 O2DOOPHEJQxgFmxNgiQhrb8NfuDqtONv4o/BfHf/vy3sjzB1pefiCLqv61FbGJq9gWFPh
 HKsKfcjJtVepcjx7mJxvhTA37RX8q8Hu7XLgq99TPriR5ouKKeSGZ+PL8fzt6O3N06ftv
 OBMCoLBQieng5R0IxP3sBQ67Hr6ccP5DSbwsWHN7EX4zxX1gZyhQK1dn9+730GpggSA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GuLeFTEE; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39D4660865
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 09:08:52 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c29d50b7cf9so249341466b.2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 02:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790240930; x=1790845730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aPEp9LFEclALoIh7z5Qm4QYEEXlajX/ji25dh3BSssI=;
 b=PaXJCO2h1KQRWAIYcz/x8vTE7XEjS3H6KsCrRDUSAiHS1BK3s77jA7qYIOLiVpXdti
 W1q4/IgH2guSh4ufwe++rcyl+HsGAXuaGac4jovTD9bd7qzwh0nDg+duLV5niCcDAcsH
 loXopZcsayl93EALyUil3gscB48A/vcOseJ7jpsgOvNOtld1E0jQpirCuc8k4jSDhqnF
 +6G+Dm/Pmhc3IHoRBVi7Qs4u7ggZV6nZUJ8+qF6a+T3rHWrzZe0Mz5zcckJUCQIEA5Cm
 4/X0yENESkPiwhSugwdVDowKZvi58k9NqC8nYchXVz+SmoCj1NuKk0i1a/PTfIcGxEuW
 0czQ==
X-Gm-Message-State: AFuF++kX30AgSah3gaCouKEzlL1LI+7PlF/Sig//bqQp2eLKCl1QKmiK
 gAhhvXHkgGnhj4IRb5fsAxixWLVfVHru9l0JWQe6+KyJlpcHndWIrB0az6PheLhPtxt7nDbZQgT
 VRaal
X-Gm-Gg: AYBFou0VMYYdcqR+a4iIrgBYVms5RQausG7CPiCN094u8ElXtTYHv1nolKISSWt9Q6R
 clmEw3JDEWiVejqYgyztLth20SPN5IZTV6iGvHAETUpU8IymtnHy08w1EVmCACB/4v/MaDZGkF0
 RiUGpTw69w1UqXAE5hJaBy3nulx/Ht7wprSiuOm0RtrmdgzbIYr6HMAMSMzyUw+An0tpU4TWJub
 /chHTV4fdvHT5QGdkrm06eUo1NmSVAiBLnA3VAHt9dsiKGg7DxxXHOThw0T4kN5yCKoAyTLqWis
 t0tWjyRlLSZm/pVhUuxEBQT3hbDiikMBOvDkeKXpYnZI3mJXdHwsBRpOwCltpF8PlBOgjF7W5QM
 xYiWkdNtW6mLJakQtt0tEYAIXI6cW0B5Wn9FtT5ts9sbzsDWLady5N44uk1v9frF57nDD7wbcdx
 KGag9bi7IVq15fZ4VKLxLOyuxSZkYHywE8PkXKz/5EiXzA6WPSgR+MfgWXui3ckLAv9hJWNti1g
 pIBkrdV7SOy7ijwocjl3g==
X-Received: by 2002:a17:906:6312:b0:c21:1b58:fa96 with SMTP id
 a640c23a62f3a-c2ac23dbdc6mr147769666b.3.1790240930280; 
 Thu, 24 Sep 2026 02:08:50 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2aae5c5c7asm266235866b.22.2026.09.24.02.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 02:08:50 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Neal Frager <neal.frager@amd.com>, matt@thewebers.ws
Date: Thu, 24 Sep 2026 11:08:11 +0200
Message-ID: <20260924090812.217731-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/xen: add x86_64 target
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for building xen for x86_64 targets. In this initial version,
do not build extra bootloaders which would require additional download
infrastructure.

Assisted-by: Claude:opus-5.5
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/xen/Config.in |  2 +-
 package/xen/xen.mk    | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index 47f9dfa6e4..89543ac9ba 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XEN
 	bool "xen"
 	# needs "dmb" on ARM, so ARM >= v7
-	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64
+	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_x86_64
 	select BR2_PACKAGE_XEN_HYPERVISOR if !BR2_PACKAGE_XEN_TOOLS
 	help
 	  This package builds the Xen hypervisor and toolstack.
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index bddfdbba38..729d213c02 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -24,6 +24,8 @@ ifeq ($(ARCH),aarch64)
 XEN_ARCH = arm64
 else ifeq ($(ARCH),arm)
 XEN_ARCH = arm32
+else ifeq ($(ARCH),x86_64)
+XEN_ARCH = x86_64
 endif
 
 XEN_CONF_OPTS = \
@@ -32,6 +34,21 @@ XEN_CONF_OPTS = \
 	--with-initddir=/etc/init.d \
 	--disable-werror
 
+ifeq ($(BR2_x86_64),y)
+# SeaBIOS, OVMF and iPXE would be git-cloned at build time, and ROMBIOS
+# needs the bcc/as86/ld86 toolchain, so only build hvmloader. The PV shim
+# is a second, differently configured build of the hypervisor.
+XEN_CONF_OPTS += \
+	--disable-seabios \
+	--disable-ovmf \
+	--disable-ipxe \
+	--disable-rombios \
+	--disable-pvshim
+
+# hvmloader is 32-bit x86 firmware, loaded into HVM guests
+XEN_BIN_ARCH_EXCLUDE = /usr/lib/xen/boot
+endif
+
 # Xen 4.20+ would normally fetch qemu-xen via git at build time; we
 # pre-provide it via the qemu-xen package instead.
 XEN_CONF_ENV = PYTHON=$(HOST_DIR)/bin/python3
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
