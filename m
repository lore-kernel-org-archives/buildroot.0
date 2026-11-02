Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A360A6EEE
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 15:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DVDC9zLm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HcF+35tn
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 993D96081C;
	Mon,  2 Nov 2026 15:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1bCR8wDPIWn; Mon,  2 Nov 2026 15:23:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8DF38607F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793632995;
	b=Ma6PjBdet3yjplFsOxZTufFsls1fYQkUNtV0DW6+lt5lOzsaxJQLdlwkzO3WZB0JT2gV
	 pH9+MmECAe/eYpsyWH6kxSqlStrT5hcwRt3QD6/JbcoZ/29DgOCbymeP9cxZLuDfi6wDv
	 KMbg4dqQ6cQhxEyo2v9+Q5yrFHtcK6JI24wCZ6vJGShOSl8xVoMWXQ3k/f1TnVOi71I88
	 MtrFhxtOebO2sjH8gCLjnmM8JBcFuYyC/7gmL7WJOqE9aWmPRBuG0dvgl/K1Cbs0EsCyi
	 RlcHx7CfQ9wdadAEjdRFdQWyvgetHC1bFyT5Nkl4crKKLFXxK9RLCzPajNalhgw/HQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632995;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=BAi+ce5uJuWfsFQ+YVE75/ddCJCa+kIKEKA1iPXVIS4=;
	b=id0S65RBYjM6cPOEk59HFROl+tqJiZNhJ3xmAk0vhR3iaMNTwvJatm4q1t4phquYAghN
	 VZofxW/6MZ9n2SkVeeo7z0dj/km/Nw0eYSQ9oAYA9+55YMw/O4io1kHkf5abxENuWcPwq
	 L+iNXRCHwyODZSMrn/v5Mn7TWoMFuIDRXomfN54teSaed/FfA8er7unzmSdtGMwgyMDj7
	 +xReppQNBnJtwIqlIAK3NWYYcLyJ7cz+9wLtoghkGCPVb1aALAdpDmE05eqXuTtvQOnHi
	 mRtqMhuV2aUlnz3WEK7CRH0hqC7taCiLrmcwxMngd/e1rtp8lnn69hM+ESqSXdhTqBQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793632995;
	bh=BAi+ce5uJuWfsFQ+YVE75/ddCJCa+kIKEKA1iPXVIS4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DVDC9zLmHSyKIB//oE5cVJEMzyp9dUa5c53J83UzMYZY/nDdTP7GqcGVuzFFMM+tm
	 8ZRcc681pdukjgFODrc8VaODIF4DIEFDdYvXHLY7+t1pPGVVKDXPj56mhJc/wf0dx4
	 yWs4qQcIo42lAiDR12uylvi1s4EPcoaX/Uxx/r2lWLXqL0PfWOIq3c2/vPgOjEv3k+
	 rvqcvmvBw3ocqAdayBFDrJ+ErNhhnv03VGUB1l3s4oT1Gipv9l1EtqQbjJYYC1jlDh
	 jMvGbX2SnN44WibRiPXJQpCsW5B7BzaStuxXxUy6A9j8MtN0zOC0rZGtT2fIB4iXgK
	 UwEYd4IfsdJnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF38607F0;
	Mon,  2 Nov 2026 15:23:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 294AB4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CB3880D6F
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwIPoGS1KduB for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 15:23:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D384A81098
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793632991;
 b=bJ8Mdxj/yqWkjbzVRuYyPViunY3/gjIeUT+25H+iwcfesBi0PkHTrHKYKIMZlRMMKl4G
 hY5/EVSBfPb1KiD1hbijqHqY4pyY8BxaUQkVwRxUGs7O5q9ameR8T5Q0WlRCO9oH21LCr
 u7fdpBgwp8ZuMn2EIMquiG+6qSoFov8FYC7/uBqP2wSSnEOq5Lmi9xiPysuI59jfu3FV3
 p6d47wbY2ebHNGsb/ie0YB56VRb8iil+RBti21uf6mY46A8mVVeKgwBrOPbiFjKwPwYBn
 0MW3uVi66RjHyMPIfAvNc5XmFMcUyGcYeCyI0OSvFqo7wxcuY0rdHVkGEL2FoM93xLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793632991;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=g+P2hrVZIsyZLhuMKVPslSl9SYcpG4aB2fCeq7d41SU=;
 b=HfDZzaZt+BeEKikpM5xFBoeZEhnsY9+eaamr/7wxAaSBucYteJCCaxc48qVJ5Bc2wWmD
 J+qKg4Yv91Hbv4Ds3nQFKIEj8f56E9Bqy6I7gB2jp75y2bUWqEJ2mPgTZLmym5ovlKR8S
 R5Bp70WDfrrv9xl56a3A9ehk8wu3hTUoTNuGeLsg2X4ib7h09k7oR90muJLvhvKWk/sem
 tko4ZzV0s/rztIOjd3J2x0PcLUK9AU3nkdKzX9qZCSpVzK11fqGFAzcl8yViyskKqUW6n
 +00lSzJG/AHwUSijEjATrlPbYn0uIY+ugHh4Vs+q/t0dvZpw2iBeN7cNwQezP8Hc33Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=HcF+35tn; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=HcF+35tn
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D384A81098
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:23:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so36034795e9.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 07:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793632989; x=1794237789; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g+P2hrVZIsyZLhuMKVPslSl9SYcpG4aB2fCeq7d41SU=;
 b=HcF+35tnpTNH6sKHqQ3RvS5KazBtZkP+6hwX72g31HBNWNk13VuAOYjjWyQsOt6/Ua
 Gg56Ip1VQvHadpvNaicrjy/8TXv2ikuyN1lnq6l843yUgzAZCwPVoPM10b9R8ovO+uXP
 fqJbX+0UfKZdxPX1aT1fJsMkRNIuJUhVmPGTQid0yFIfzHRBJB2KJAUUT7HlusuIh8se
 2nqCzPyMfwMlDigBnr87hyOJcyLGHd+/QPjSk0y+AyOq7pkE9ifVDHRM+flOdtUamTFY
 he5s1WZzKbdXV7HVzLsTNKK4DIh5vZn6oDXaZVZm70okd3dzdid3gj5BFPTYLzok/GXB
 lXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793632989; x=1794237789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=g+P2hrVZIsyZLhuMKVPslSl9SYcpG4aB2fCeq7d41SU=;
 b=O2xJKn4g+0hLst65ZwrGLlPEVmks3mdTuXlQafod4fgK0GRnXtSGP3W2h1dXHCrBf3
 nZJEgDBFr4b3atOcXohm+0ZwiVhBYkSJ9e/J2H0v4OI06+yIaZ1vGgXmMyjH9Ujn+Qz9
 gnSjmtv3NwIYUk16xHrYRD+UZHLg2P/uE1y3X+rtstWGXxf5KUxuU7MrNiNKnMH5uKg0
 hYUlcEgoKTaY1ruE6RdDPAuaaz9iDXdyjsYupvfCVQH329dCYqlywbeGeecfJaSowLCT
 KzyhAj0k/fGFF97w3SOfM3A9RL31tGQ+63pbGJ400uqqjIAIxZF1Z8T2VjzUKkn/4nqD
 XzuA==
X-Gm-Message-State: AFq9FYJOCFprWL8WZJz/ibYB1M5GWxPNuE6FKqwrqI22CiDjK1ZWeUmi
 eUennJjyRQ/qWWDyLDRXvcjcujTA4LScVjpg+nCiIkYd1lMBR6E6mn5V03YdUA==
X-Gm-Gg: AYBFou2OZs0chEOHyiWIMGK96IrI36TETvIl549fvk9cirX7aRiq0NTdEQRhyk1C9wR
 y1Y7+3lZ+xToDnBDYT40ao+SsL43QOOnjOB2XWMsLQrZzINXPnQhdtEgbl6+cERk0nnG5P/SzjQ
 lJc6Lury2PqlDORuWI0CDigCmhRYr7EhxI1fGU5JcGcht5ihpKj4UYDPbXvoQfbnzehXdUup/4W
 jCJv531UoH3AOUk1RxFINq0Ak7gK+UveO+/qWxIoxr+bH97rKz+plNav96QcvJ29tN81AxxMFFn
 JzCOEhV//heiXdwQM6AXUrymCEZ/2VpVdclovfp4PY54nZ4M3IFmRYFsZAMU2813GJO8Fqxn/wO
 mY3A0jLAPE53rhT9zmd1EN4UUcn6mpqKu5wKgIObkjRrd9diBptPGE/xWjhryCvgQTBIH3OEphP
 eLTEMVwPFw0KSr72fQQ8yQZXta3ozc/afDhWJ43pplhB09W/58EEGXvB+L1gzNcGwWRm4pZVxYT
 N2juD7R7Fz+2c6qL+F++JxEpvbXgAkQIIj9sunJkaCO6jZQT46RTvxiO6vKn3/GWnYkJBjlZlMi
 /jGZ3vhgW6cFgxCsde0lcfO0e5grou7GPSax4llCES/AhX3d9lx0WA==
X-Received: by 2002:a05:600d:82ea:b0:4a1:cfa7:e968 with SMTP id
 5b1f17b1804b1-4ac17ff9be8mr256112085e9.21.1793632988460; 
 Mon, 02 Nov 2026 07:23:08 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09cc3e9asm121940775e9.3.2026.11.02.07.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 07:23:07 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 16:22:58 +0100
Message-Id: <20261102152258.1948796-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
References: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 6/6] configs/sipeed_lichee_rv*: add hashes
 for Linux/opensbi/u-boot
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.

The hashes are shared by both defconfigs, as the overlay.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
- drop the linux-headers hash, the Bootlin toolchain is now used

 .checkpackageignore                                 | 2 --
 board/sipeed/lichee_rv/patches/linux/linux.hash     | 2 ++
 board/sipeed/lichee_rv/patches/opensbi/opensbi.hash | 2 ++
 board/sipeed/lichee_rv/patches/uboot/uboot.hash     | 2 ++
 configs/sipeed_lichee_rv_defconfig                  | 2 ++
 configs/sipeed_lichee_rv_dock_defconfig             | 2 ++
 6 files changed, 10 insertions(+), 2 deletions(-)
 create mode 100644 board/sipeed/lichee_rv/patches/linux/linux.hash
 create mode 100644 board/sipeed/lichee_rv/patches/opensbi/opensbi.hash
 create mode 100644 board/sipeed/lichee_rv/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index a8c1baacbd..40716caa1d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -128,8 +128,6 @@ configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
-configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
-configs/sipeed_lichee_rv_dock_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_licheepi_nano_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_maix_bit_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_maix_bit_sdcard_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/sipeed/lichee_rv/patches/linux/linux.hash b/board/sipeed/lichee_rv/patches/linux/linux.hash
new file mode 100644
index 0000000000..a5e2b5fc40
--- /dev/null
+++ b/board/sipeed/lichee_rv/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
diff --git a/board/sipeed/lichee_rv/patches/opensbi/opensbi.hash b/board/sipeed/lichee_rv/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..5e2e695bc1
--- /dev/null
+++ b/board/sipeed/lichee_rv/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  fb1ae61a85e966322101acb1c982f84d9eaafc4de7dd474a7d7546d9bb321c6f  opensbi-1.8.1.tar.gz
diff --git a/board/sipeed/lichee_rv/patches/uboot/uboot.hash b/board/sipeed/lichee_rv/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..7d05185938
--- /dev/null
+++ b/board/sipeed/lichee_rv/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  36db7c20b179f03aa29009565c6b34380d5629fd5c57ed110244594d9930dfed  uboot-2e89b706f5c956a70c989cd31665f1429e9a0b48.tar.gz
diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index 7b896c795b..15f7a1275f 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -2,6 +2,8 @@ BR2_riscv=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/sipeed/lichee_rv/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv/genimage.cfg"
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index 639002b078..c82d27888f 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -2,6 +2,8 @@ BR2_riscv=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/sipeed/lichee_rv/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay board/sipeed/lichee_rv_dock/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
