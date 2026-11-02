Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561306097079
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KlpZuFRw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pOS7WWFO
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F5A2607F0;
	Mon,  2 Nov 2026 15:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PT3-J-MZQywl; Mon,  2 Nov 2026 15:23:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8370360821
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793632998;
	b=IIMFCWxI3KKl+s8XDmaeIw1stSGnr4NmV5O1xj7wy60tkIAqfOFg7FEMWUgpu9xdJT6R
	 7Le0Iz63d8sgCuekfEQeIPX4XC2B4+EZpzZAHnsIaEeI5gWmDK3E/SBhvbYvA//t41YxJ
	 h3in85DpD5zMMCefFa5wDwnvurXtK6Eb1Jneix2BpEivsZ5GHTmy7Fa7wiYyUWVnD+JK5
	 Pp8Z1sLUIwLI8WagBPV8tkX/c4vMczkoDWAaBCf4j57gH6akRHb/X8ANCk2rEblXRxYYx
	 9Ny8CfKyakadFtMPhDeV46RlBMCOGRgB1zu2pbYITuzwBEPb4ItJwXHb6rZF8HtOwiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632998;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=L6OCCcaOM/I5vi5YYUb7zz1eJfChDN69yRgUNqJIayg=;
	b=mOkIElzQlkB8nXG9vkexd+h2E2M0u/ZBbwuco9884aWWPBv7udi5Kxe766AmhpgIez4N
	 0wSjyrZ8YIpC2P0EHecnHPe5AaSiaMIW3PEOtTCbR1N/D1FzNDAQcHmV4TFdCbj6g6A73
	 UlBBJcS4VRf4TSqJEvbdceUZxGNv3eIvCvZcHfsor+8MCYquoO/poRxFaISpUdU3fBfTC
	 NLQnhRHGTTdzRmu5lBX53gwynuAuE/7AfoSxLqQN8GupdlGi8VawC4zQGqCMrvk1Qc/mw
	 91GTFiPQuj5+XwFLI4uDqTu7j6wXLmZiIOGfgGUtALrXJWbOhujpTOqeot/ShqfQHJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pOS7WWFO;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793632997;
	bh=L6OCCcaOM/I5vi5YYUb7zz1eJfChDN69yRgUNqJIayg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KlpZuFRwlSYOBvQhQebbNmquXrZNTDH2N51CPT8CsxVYTu1DFMq8O2PM40PoSrrGN
	 birivHfZVSoTddO5zFf1VUF9a6StieIzqUzPaafICN/ElgsqslaULKY9BlnVhFFtVx
	 nPk2km1vkr0ypF1NaKXJoYT9vssjcZXWNoCsRUS8CHW4a0rgutOwBt7ShZyMvf78b7
	 xvix4WdieXYdcC9RtWoUNAdSdbu2phsWFHCbTuve0OhrSpDykXql4HzGmn/1iXcZWH
	 lo6uYDWBJu+sOueW8KebbHQODfADNw3V7EMrIokfy+tdpr7JXDsgsMH363eG8ETCIQ
	 istE+b+Wd0sGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8370360821;
	Mon,  2 Nov 2026 15:23:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6458E2A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45342607F0
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIbbgj_p4SJU for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 15:23:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 04B8F607CB
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793632990;
 b=nly7pV5Skhlwa9OOmSrRC/pfjRhXXkunt6aRK+55kt9oo/M2h8eT5JMZUIEFleoLBeja
 VGPwBp30gCdfOa6aHcIxZwxx3832rTB+dKnt1OL/LMmXNNkKmDmECbdYQbm/jJfz06cTp
 ueAUMlfxF9HMEl/MC5a11GKpLNL5qBhijxhYOM3zMR1fXw5ZgbyfN7uQtDPTmYTAVh+Q0
 3OLndXnGa8BVSF9sn4J1RNYY6bMOwD/Y26o9QuQ9JclKk8NWuNJkFWIDMifLg5Z2zWrU0
 976VkOXLUx6qyztUA9D0TzQIO+rftJgTHP0KjtMUrBigMXB+EGpKY44M3mzEzoiOpTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793632990;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=E32G8WgxoLGQOPtl0V4mBvovxGWUHhUQXksDzibo/Ao=;
 b=rjdHRFcXCeTUwW5v08w/C2zDFKhXl13VaoWZ/Tc3rEc0wRWH4Ks6e6MnH85n1ek1yzCm
 W1d2f2LZxvzQNPHLSnnoWoD2wt54bFvI6e6ddqUMRb8CGcTArLiaikT6QolQ+uxlMg7Jk
 FdZiQ2UD2PKxcQHo+Nz261GbFfiXmU5/mucwr8OCWPCtLvbV73IeybVmlOs74Je4mfs4b
 W+r2jy0lPcbLJEeqkSpwnjGtjfsusd9tAT6tozw4Snw2Y7YRsxFJWW3oNddniDm7vcN1k
 ttALctLrHAnAmprM/rxdNfkBG8WEi/7dUVhHNj54d0xBn4dF8FiVZtnoo86x6vD650Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=pOS7WWFO; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=pOS7WWFO
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04B8F607CB
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:09 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so25264915e9.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 07:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793632988; x=1794237788; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=E32G8WgxoLGQOPtl0V4mBvovxGWUHhUQXksDzibo/Ao=;
 b=pOS7WWFOX/MtPyGGy1Ne/J7yeXyYqYxWvi5MLNGU9HSFonB/e/S/TKUCpkNT9mY6uc
 zQ60mX4L33BjGwsNLAZsHQwt3GRODmrXXOGEwo/sDZ7x3y8D2GWSF9zrgavQStfXZMmp
 eUOFLNeGhXwm3iFmtYStnesIwO/6DGzmA4ZRdhRujWqFVGJSHXrWSueSC0qReDDG3+v4
 w8oUKGQWjTSP6uYBQXLa6OB/AMyYBklWcGDc+5+jnZFpcD889ZYibf3pzSMGYEDbCFyo
 oR6FsaNWGCY+e9Fi9FbMSWCF8V8uTvA7Djr/JIra7PvINSqnVylip7jwzciTNCxOQae4
 4cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793632988; x=1794237788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=E32G8WgxoLGQOPtl0V4mBvovxGWUHhUQXksDzibo/Ao=;
 b=dy/o5MPuzpW5Bx7K3aQ0z1TYFDwk1SbULeFale3u3Olz/OWItK/RzFxcL7E7jTBtl2
 JtnI0HQ5kvYkXskY8xcqJW/vz1Y/Y5NkbhWRUPn25bnmgi2K1Crm8xc9lwCJD9sbvBHt
 oEXRIxbYD60lQB+YfupFXlVnHUqVUZqhYIO6H3uJFE5RnCHsmKuBcG0txpf6ne8zIgD5
 DQDmFQSs2Z5UXGtezSu08fkK3lefLuTXFVY1MrzsrLQAxyfWw/BTTMv+Etz44P0QsBjN
 APjzsc1vx5q+6P97Se7sv9JTn3U6H1I8kzQB6CzXRAFYYUVvOiEWV2OfmARSaweCSlxQ
 qslw==
X-Gm-Message-State: AFq9FYL2MUxtxq4eDtTnNJksP6m5pxZM0hzgzOVOziFtE4y4b8/RYzll
 q0JSVoPw/6EbljKnlBV6QATe0aQ0tE9yMlkqAWC7CuzpT6haQnI8YbVdsLatWQ==
X-Gm-Gg: AYBFou3GB1fEeb6rPBU32n2hRBqi2aCzvU45xsQBD+wlX9aXNYuCTGxYuHwtwdTMpjh
 kW31OSSV/wScBjidyA/DKC6eOC4pgfK9FQKKseKhEXzj0FPCx1BpSmEiNjeYo/COA7QW1MUCcJz
 FlpqMeszBza4RdemjUn7p3a+E3V8wMmqPjNCFypBNsJUs77V+4iSz4NBuKUFjvJJ+vigDkrHyX6
 VRr9XhATBIbDGV4DFWYM5ucY5FMtC5DPzQXdqvU4+R/3NegaGru5Uvf401jXhyq2EeIEYFQ+Gy6
 8hBCFe5UKhnEy7abCuGhl/8EvZiRrAitAv58pLUBltx5FPuTOCkOi8Mb1wG1MVVLzmKn/FR69Lr
 9BZRx5LZ7xOXtbjWKLW347Y7OaLbvFRAFAXCFDukos7JS0U51A5bFCDN16MqZzdLsDIfYL4NlVO
 WC6eD/Vav8X0HepbDHsJ5YsOLXuF8KRzKU+eaFTq7wb+OL4yEAi6pUDwPL9RjMNdW685WgsBw3k
 /WExgNkIVLt3SWTIFZFKdrV6gazzWlYKOp/e6kLVuuDyrfFWhNN8NsHgYkgRlUco0/Eco/Gd7lV
 TL9nNoec2oYWMoxKnUZn3SpJQDitI9FAqLXCO29fz7f653HR6Gt2DQ==
X-Received: by 2002:a05:600c:8b85:b0:4a1:cd83:b23e with SMTP id
 5b1f17b1804b1-4ac122897a8mr279205625e9.0.1793632987398; 
 Mon, 02 Nov 2026 07:23:07 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09cc3e9asm121940775e9.3.2026.11.02.07.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 07:23:06 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 16:22:57 +0100
Message-Id: <20261102152258.1948796-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
References: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/6] configs/sipeed_lichee_rv*: use mainline
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
Changes v1 -> v2:
- do not bump the kernel headers, the Bootlin toolchain is now used

 board/sipeed/lichee_rv/linux.config     | 197 ++++++++++++++++++++++++
 configs/sipeed_lichee_rv_defconfig      |   7 +-
 configs/sipeed_lichee_rv_dock_defconfig |   7 +-
 3 files changed, 205 insertions(+), 6 deletions(-)
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
index 15d1d40d14..7b896c795b 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -6,9 +6,10 @@ BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay"
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
index ed36a4d115..639002b078 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -7,9 +7,10 @@ BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay board/sipeed/lichee_rv_dock/o
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
