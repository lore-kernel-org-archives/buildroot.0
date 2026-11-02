Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1215A606A326
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cnFzhRsb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4DuORa5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7274E60661;
	Mon,  2 Nov 2026 13:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-DTEAUjAiwn; Mon,  2 Nov 2026 13:16:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4630460788
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793625385;
	b=RBunqPjtDGJX79QrIqiDzeD9wTcGj00QoEHhNCyorrBp4t2NNbjdzT2GpPZdFHsWsGGe
	 Tc3LzM1r326V1ZW56Th/RCn5lkFF2ddi+g5C1fqpU3+zlWGs2zSXCYPIhzIEILgQM5Jkz
	 jS9zkLXd5Nv7ndWZ34p7l5iPVZQMBSii7XJag3YwWhhbeXzKn0T2ao7uUbiW00v9Wv5K9
	 nw0x/S7l37xeU0dVq5PWcd4t/aUnXceclViWruk7XYJXgOWIlG3J9hzA5cqMpXD4dk2/t
	 aosyJ4bNFiT7sh+fqjZv1E3hBsk7UWVSZIDknJfVKI7QRZ0N5XwAFHSjuHxNQh8gknA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793625385;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=qn6TE3VxBoyqj8FmazjM2QLEuQrRPthNHPQBUpbOF/8=;
	b=Qt3yBjaerzquYzw/F33OR5Wv3VEuT3XidKAD0hKATqfPnkljnqeTk7arHeXW57r6GelP
	 5XdcPQ64XHL5FYvZZ46rLbrsgw+iqEAPLCkb5UBX1wBQS1gZTG5deUdOs+lnZDcM1CCow
	 sYU1zwzbg15pCnCaWhJ+qcuzAiE5yH06hpsE0iFZNmSONv3mDLl0+6m23fNdH3Nv+JGJZ
	 nUFwZJkMJiQVV54zfOH+QD84bnajfzvyJhvwHWuJSnZaEyqOeB/twM1O1Q8m93YYnT2gR
	 BF+KFfjekY056dfNKkYD9v3S+uAOMM5enzymh2Zjcn3kwmmSVvCCcflQYMKypEFeg3w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4DuORa5;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793625385;
	bh=qn6TE3VxBoyqj8FmazjM2QLEuQrRPthNHPQBUpbOF/8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnFzhRsbAqQQmw7ukigcrhl81Koz/CTgf3rPufuCTlxRY8o7BFB7VqtSi7S6f7EH8
	 NZbwKyr6AhqRrfjY2pz4t3Iw90tKhxjKwx/wsRb8WhIEFCU7l2FvBCCGZd3uwEBRpy
	 Wm+9Did1+Xzu386mYSmDFIGg2u+c8jIVIVAEBZjj8HxmuufQDYUVhLQXnhemv4Df8N
	 994plAdEH9Aq4chgigUX5vRPRlpoDhqDDEQjKsuXhliCyhn73KtZ+8+vauOGExDEOa
	 T9DrqMaGxK4TRR6e3LN1YH2KfWXzSxlzYFbIEk5UZ7uE6siGEknX+ogKCweQD9lwoX
	 1QlbOEYoqPgDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4630460788;
	Mon,  2 Nov 2026 13:16:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 225344BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0755F606D0
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oGblVrcvSKH for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 13:16:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D8F5A6065F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793625379;
 b=bh4rHsPnfbLzlgOryfLeg+5WIKhvUFuos9w//Y3GDPXfLNRgX4L4qf8ZGkJQw0A+JSyE
 WaAJ8Ky/+JM7XFGTApTdUDvC9isOg9CRKyAR0+tJyYCIeAVT3dCK+u0K+AaLazbND7GWT
 1QUva99bnxo1lyloh0LQC6tHKdSVu7T1OvBZlxNDVIQm4PqqfIHKVC1iQoqq/n8A4Jj0Z
 4bS0OEPUThypK84Whm1jgS08wxzCMW6nOBUNYrpSpSffdrnXXPfnITrx3wscPQRBCMSiy
 s+bppDJPjbqpng518bdkigwS7yEYoAQrAJRMUdmcgWjl+wdQSOZFCxXiRXL4mWEnsjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793625379;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=83igqs36FxyXmY6tHfkaeXupBJQluISkie4OZo4/rXc=;
 b=I+YVIIr2kwX8p5eX6MZDPg3iItvW/kSw+7pXwwMSP9gKekwn1Op9HvnXXtLyNsNnnB2Q
 BO8vZP/tcfdF1MKEUYSFxDewVvYHaLdqO04Gr7tQDijHY9NDQFTTRIN6Z+WsrG+FtiO17
 a6ucg9zlnNKUm16995qOjVM3TT1M/l1sx2grO7BM5MbtaPWfA3agfsjZwdYMCDhgbWHvY
 ifnAeSY9gKTRXoR992YLrfkPY7yKKjcBjnU3LKkWP+WgWDGqEsTQc6uFZoVNg7Ib7NOTX
 Lz2rG2sH2x9v9y3u6aZ7htW2MwcErBFw/iigQsltA1XcwDuSpHicACNv4aXvF8iF+0g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=B4DuORa5; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=B4DuORa5
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8F5A6065F
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:16:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48e04773687so841078f8f.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 05:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793625376; x=1794230176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=83igqs36FxyXmY6tHfkaeXupBJQluISkie4OZo4/rXc=;
 b=B4DuORa534TEv9R5yZ2aZ3LS09Fqd/YKoG6RyzrLq5r5kfNaVzzwKGsGqk6AHL0Xfk
 1Ityrwnmkdojl3YcakOCUvFJnZP3yj+O/I83I5CaXQ6pcTxz1ZB/6rqWPBree+XbRV2G
 qsv4VEwDvvQG0k+gwHJnOwm5I27kSkl5EiXmM73PiZAUiYFfCz5w7jdC0jvnn0vHvmp1
 yz01dgYQrlFhPZyvUFYflZQzjYxu1CWiPWVnXksJT3R2L2gyM3QEfUgmfjwkFdgKOKkz
 pWkVYceBNEZ1CmdmXm5AID6RxvrS95V2NzwTRluu9DSDXyw4TbJlIbzO6N2ymfxhtToH
 dAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793625376; x=1794230176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=83igqs36FxyXmY6tHfkaeXupBJQluISkie4OZo4/rXc=;
 b=oZRFtP5ue73mxvO+aWfadShTidlD0on18OLt8CtU7dcZfix0XRFMUbhc8ZJsR0hdOZ
 8mXK9NxUJ3qDC2CNHqe9RnAtLOnD5EBZPVZhXVbL/RKhjgj9CsyLOlIOTHAKcKpEMaNE
 eOQhvMmZTqm3OGhGgp8wnt7PuRcH5HMXuqvPe6G9EaTKqLQuAZeruZe5OHMSstjTeFQz
 4KVOaj9bD3HGz72e7xu+naFRdJ5Z+W7RP+FTX20+JGxwE8g9opMdvIdVCNhlkTMpvP9U
 g5dyytHria9hUDcExtTy3APsI0zMXlcVrYTEz3hedNdelS2Kp4vdoSXN8C0eCIbzHCYn
 K+uQ==
X-Gm-Message-State: AFq9FYJ5dDN4CWzu4GUh8mWH7joxEWeA8nmXUV/kMxHmJ8n9j+dhUzBi
 ntlaf5xzwQYVAydLO51eBczPzozLc4FhIFrBeLk6PRzNL0Gx+UiVeQpyUdZmig==
X-Gm-Gg: AYBFou2VVwUt5OXa7t9Srh4kycomBiVJesAc5/8BwpxVIIL73W8TQ7LqPColz74Pm1r
 gFPiI6fFDiRfnQ2wK2F+54LHlkQ20zYD6z5rp792cj7blYKmUxetnxdvsb5NMv8dLVykHmRqFJY
 FqvW8zUhMjfWThSArCBTV9G1oT+GXvQJMppS6GIJKkpy0fLf7ZIJRnT5Jt4I4iztsJnbICEaHbX
 CHBW+orHioD3NSO2XBOpunNyRHVWIXFud/HQ9E9r8oYD1o3G/vYuskpj8hMCljC0ISCxDUpfIWr
 abhKFOdTdt0gBePGa8I7PF77UxzOSpVbWzn/5kNhcoq+a9V5fkd6CZHaqxn93NQvjxTOQGtxBVQ
 r4CjIzCbblPrCgTUUQ+VTX86twcRpbB6f7+vlmeiN7jk5lM4HE8Ka7Cn7uGMxeikjlVea2BXCVb
 BjInZMt7/qWlv8F8vJ2ZBBHmINeBym8lxHq/8o4c+Pgap4eRKjRD3fdXsUp9szMryEcI2h05GNK
 m50m7NyaOLsJz8j5qOIH2lEmSh3Wyu3+S3aO6stpWxJmMoqMFhiDzQn5lf21RW+7V6SUj9G7+Pu
 S2ph4rY2ZKPkPqF1OZ2RgMJw7MWG6m5Rq3i12nnDV3awZP5Kw061fA==
X-Received: by 2002:a05:600c:1387:b0:4aa:2339:a375 with SMTP id
 5b1f17b1804b1-4ac1793fa6bmr239249065e9.13.1793625376160; 
 Mon, 02 Nov 2026 05:16:16 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa81a896ecsm361313165e9.9.2026.11.02.05.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 05:16:15 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 14:16:09 +0100
Message-Id: <20261102131610.141568-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102131610.141568-1-angelo.compagnucci@gmail.com>
References: <20261102131610.141568-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] configs/sipeed_lichee_rv*: use mainline
 Linux 6.18.60
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The D1 support is now in mainline, so use that instead, as done in the
nezha defconfig.

The linux configuration, shared by both boards, is based on the riscv
defconfig, reduced to the smallest one supporting the boards.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 board/sipeed/lichee_rv/linux.config     | 197 ++++++++++++++++++++++++
 configs/sipeed_lichee_rv_defconfig      |   9 +-
 configs/sipeed_lichee_rv_dock_defconfig |   9 +-
 3 files changed, 207 insertions(+), 8 deletions(-)
 create mode 100644 board/sipeed/lichee_rv/linux.config

diff --git a/board/sipeed/lichee_rv/linux.config b/board/sipeed/lichee_rv/linux.config
new file mode 100644
index 0000000000..e454cdd46a
--- /dev/null
+++ b/board/sipeed/lichee_rv/linux.config
@@ -0,0 +1,197 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_HUGETLB=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_PROFILING=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_ERRATA_ANDES=y
+CONFIG_ERRATA_SIFIVE=y
+CONFIG_SMP=y
+CONFIG_RISCV_SBI_CPUIDLE=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_VIRTUALIZATION=y
+CONFIG_ACPI=y
+CONFIG_JUMP_LABEL=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_THROTTLING=y
+CONFIG_SPARSEMEM_MANUAL=y
+CONFIG_PAGE_REPORTING=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_NETFILTER=y
+CONFIG_NET_SCHED=y
+CONFIG_NETLINK_DIAG=y
+CONFIG_NET_L3_MASTER_DEV=y
+CONFIG_CGROUP_NET_PRIO=y
+CONFIG_CGROUP_NET_CLASSID=y
+CONFIG_RFKILL=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_EEPROM_93CX6=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_MD=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_MACB=y
+CONFIG_MICREL_PHY=y
+CONFIG_MICROSEMI_PHY=y
+CONFIG_MOTORCOMM_PHY=y
+CONFIG_REALTEK_PHY=y
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
+CONFIG_SERIAL_SIFIVE=y
+CONFIG_SERIAL_SIFIVE_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_I2C=y
+CONFIG_I2C_DESIGNWARE_CORE=y
+CONFIG_I2C_MV64XXX=y
+CONFIG_SPI=y
+CONFIG_SPI_SIFIVE=y
+CONFIG_SPI_SUN6I=y
+# CONFIG_PTP_1588_CLOCK is not set
+CONFIG_PINCTRL=y
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_SIFIVE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_CPU_THERMAL=y
+CONFIG_DEVFREQ_THERMAL=y
+CONFIG_WATCHDOG=y
+CONFIG_SUNXI_WATCHDOG=y
+CONFIG_MFD_AXP20X_I2C=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_AXP20X=y
+CONFIG_REGULATOR_GPIO=y
+CONFIG_FB=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SOC=y
+CONFIG_USB=y
+CONFIG_USB_OTG=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
+CONFIG_USB_MUSB_HDRC=y
+CONFIG_USB_MUSB_SUNXI=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_GADGET=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_DWCMSHC=y
+CONFIG_MMC_SDHCI_CADENCE=y
+CONFIG_MMC_SPI=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_SUNXI=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SUN6I=y
+CONFIG_RTC_DRV_GOLDFISH=y
+CONFIG_DMADEVICES=y
+CONFIG_DMA_SUN6I=y
+CONFIG_DW_AXI_DMAC=y
+CONFIG_SYNC_FILE=y
+# CONFIG_VIRTIO_MENU is not set
+CONFIG_GOLDFISH=y
+# CONFIG_SUN8I_DE2_CCU is not set
+CONFIG_MAILBOX=y
+CONFIG_PCC=y
+CONFIG_SUN50I_IOMMU=y
+CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_PM_DEVFREQ=y
+CONFIG_IIO=y
+CONFIG_PWM=y
+CONFIG_PHY_SUN4I_USB=y
+CONFIG_LIBNVDIMM=y
+CONFIG_NVMEM_SUNXI_SID=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
+CONFIG_AUTOFS_FS=y
+CONFIG_ISO9660_FS=y
+CONFIG_JOLIET=y
+CONFIG_ZISOFS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=y
+# CONFIG_EFIVAR_FS is not set
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
+CONFIG_9P_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_SELINUX=y
+CONFIG_SECURITY_APPARMOR=y
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_FS=y
+# CONFIG_RUNTIME_TESTING_MENU is not set
+CONFIG_MEMTEST=y
diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index e2590983a9..2591609bce 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -1,12 +1,13 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.60"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/sipeed/lichee_rv/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-lichee-rv"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index 91383d7980..4467fcb916 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -1,13 +1,14 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay board/sipeed/lichee_rv_dock/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv_dock/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.60"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/sipeed/lichee_rv/linux.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/lichee_rv_dock/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-lichee-rv-dock"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
