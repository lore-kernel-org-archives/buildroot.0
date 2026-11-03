Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6562D606A820
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JRq3T8du;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FLBG+dT1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7346B606A2;
	Tue,  3 Nov 2026 10:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-0laZalIuby; Tue,  3 Nov 2026 10:52:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9913E606E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793703156;
	b=o5EJ8l4sIJGxnsrTcQlON+/sQgGcbhJNveRQzHsDYM0/EPQSoKMmS40tM/J7XZGr6trT
	 tPlJuxTEBMASDTITPjqfxkrSvPByqwUIaD3BOzWjNr6vmdQoJxALx4G/xR3wBAIPIkaC8
	 JlEImTfvqLKsV/t9VMao87oi+eyJuncf3Kshg1jKDRz6VdanK9jOZ3PzAJ9HkMk5UUjpB
	 hi4uq/Ggqd74XMAbrvTST8PI/rNxVFCo/J8A1GzG57x69lNtwAYeGBruZYTpgugmZ14a0
	 dqVMH0w3eWGYN5qEnWhmgfWtswlDgvUgCgFkeD+ngOrzXEsJQQ/P9TEZPlcTJOWjknA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793703156;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=s05glC14jrVotlTciZA8rSyPv6v7cQDExaJ6YgG4f7A=;
	b=J1/numzvXlHQoxPk3nx6pypk8gDoInbhX0C3i0HB93+Hmw4yAgdSGof/DkX1gmLey9tq
	 zHsSHNl2dhLj0Veqf3EbaN/q+bALzX1lQHqLDYCidENWEFiK0hDKacD37gf+kJ/4K8nYl
	 ZjZ+H28ijrrKtr2+65KIClRFef+1j/UPsygzEOoEWA+FTXSL5u8RMIPDP0Gfo/y2hZ7Gp
	 waDYrUtcIrudYPP9miFrs1xww6VX0Q9VkLBhBHHDjzxVKGcuPIOpWR4rR305nUPG9ZbO7
	 aFzbA2TREhiQ4DkgFPfi6Hc+wW3oULME7hcKvxuCQnZmJsQxJ1UFu7kzUHTcegHkDNQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793703156;
	bh=s05glC14jrVotlTciZA8rSyPv6v7cQDExaJ6YgG4f7A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JRq3T8duXVkIbwscdD1XuhWraAQWoCGeglO4z3Oy4eN4vhUXM+cR9cgGHLcNFzDJJ
	 0Hxpax4F2P5U6J2ba7TO0C1iRqmc/CiFNFMdTNHYMqQLiiRgOSWcorvmMqM4uYbcGX
	 k3QQBdzoCHxg1JL55b2cjIoMN5SUceaSQlp4HO7QciMOHaTWZqCKvxidDYacyC/QRQ
	 A/agurMktxTnngFA8fl9/Lwz/y10dyx0egUPus22bZyfXZVPPSkmkxjc9oTzBFhP6E
	 rOY1npNVdNM+ReE5Mj4TJoHUYTi2aIP85ZeDhsHnRbMurDkP/7/hKwQ02hqwTlj7f3
	 5RrS+e9ADre0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9913E606E6;
	Tue,  3 Nov 2026 10:52:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21935235
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07AC580DEE
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jB6pyAtzzui8 for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 10:52:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1E9EF80D8B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793703152;
 b=D2b/zGk8M8SOY4C5mgZ2oC5LJERFrMrY2+zXEslTWOPbQEQ+dGC0hz28T/K/mYf6QHgn
 ld1Tlk2dVaNgulxqZvkSqZe3btwFYAXJ8/lrg6KLNa/IB5sVUhCycRD7XQpVNpPaUt5pj
 Ry8Cu3wuYVQZAWm7zAq0/WAIAWTWbcWacX3QxAH5E8JGR7n/slswmq6LPVuQRB8MPkJeL
 xNUg+BES5U1FHTm4J707xAb9Sxt9lu2nh2WyaLmYZREeoE8Y6EA14/mqkL4liGqZEmZ2f
 UlewXnFn2b9XDHmmsovXQf7tP9nVxpp+o2FP1w7EfbM32uJoqBQ3y3YUB23B7ixnUeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793703152;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=SeGEdUnAt//Q0HJw9Ioc8AlJJgy+VHhA6bmBDC42pqY=;
 b=OxVyCgQcGipfKNgUi5Inity/ft58hi9YypbrdKlr07NFd7cMXL4X32Gv5i9HmQ0/JlV8
 RBci6PKHFWJDP/KjjyK56HM+/8FeRJumtEU0jJnimRcAgK3o3UOecrlnvQ6OhShUy5ptI
 ElA4THX05YtppGa2ycjFlwfzK8ZqZXLerzBgR8HG+odkxAofWlw5oI54SjRoe5RR0DHpx
 asR0LahbdPDwafAjxaIH4EuhGRNJ01k8w4Rp/vH3V8A8m0N1Lj1zy+qzNRvlpUfMdJXAC
 ubaQCmNI6iLohPCflIQug/Dr+7nBCFuIm4jRfvvqyD6RNicL5Da4XdXj4qN4BFEN4BQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=FLBG+dT1; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=FLBG+dT1
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E9EF80D8B
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:31 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48dfaa3fa12so325548f8f.0
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 02:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793703149; x=1794307949; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SeGEdUnAt//Q0HJw9Ioc8AlJJgy+VHhA6bmBDC42pqY=;
 b=FLBG+dT1F1FeBtwGupLc1+bS+I3tlQJ+9oeA/UKN2As/cG3+70jh/nkuW5E5BdyquY
 bH8RJXJh9ygVkIwVzTETNnKbiIJ/Vj1pyQSkhEORk549V2aX9cSxSYZG0CoR7ZkGOr2C
 IvUkQXGZw9FYlTYQtR/h0/5V62QTpQe2HdXxLuBn8dLVyRQzZkGzILT+PnLMx+z4hwKx
 JzsYVIVOIupoOuHXNUoOv0tkoKbL0DxVeqzXKZkUSBHOSGG8Zo6eLbCU0pJsJgZFQ7Aw
 9eC1GRLIyH9drkVZLTut2Kyzsf57gAsAwtYyB0++fx3dW+EWQMp2rPZLrQ+ZljXGbw/E
 CbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793703149; x=1794307949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SeGEdUnAt//Q0HJw9Ioc8AlJJgy+VHhA6bmBDC42pqY=;
 b=ba+5JDcRJXxhpbbMEVpDR/SrxDd3Ot/qd2h39P0CJPS/MPQsWnDKh5c7oJnItZz8dQ
 4NPFbFf0UywDS4IQZ2BP/I98O6SFUiwn+kuzIgC/8RDW787MuZT+eEh+tJ6OMggmxeGA
 yJPQPuML2EDvAhEZD06jiOqP5rSH4vkWvA0aKyc89Vue3+Fgisa1QxmkBTniblDPOiCW
 xMN2k2SHU9aP5d36f5JDNhcxIsNnnTeCgxvHg5zVMv5mdijO258NEr/D1rGs9QIVB6Rc
 gct/1ytI2X8WRr+SdTK8ba3dmNvhhmkYNDNIKKqyLp6btuPNEoR0poXD9KLEs7+Kivqq
 k/lw==
X-Gm-Message-State: APuU4Z812eQnqjbbLRfC1N4K1WAinLsk86oMUJfajD9eix2YBwtN+N7N
 lKy12dQkg9jGm4CxqWjZgKBcU5rCLQ3+hnPASRQX30qC2109FYsHhEFX1iuN3g==
X-Gm-Gg: AYBFou0ttsBm6avtb2PKeZCovPrakU/tE6gStESE6Xb44HtfzGLY7yV5FDqwaDJXDTk
 Ks8M8daJoHUU4mRFkYnXT99B5y6ff/gcb8pt14qmFXBnstp9bzE3Vxy2r+vYPIYqYGyWMVU5pST
 X9ysaR5o3yQ7GZ/hOaBW02kZ9yIwImtMYiJkopSRFh1PMivlt237krXfzdbLKEr+uuCWUOhPsr7
 RXz3xfRNObeQD2Ib/AXdH699MDwZASBlZNT8K0cnRWrLRFMOC28B8lDbHX+enbVGJNA1qT4YIKI
 9oZXrmr1sh0eyxq/J5gCT2s9CbneQe4ccRrZqEzVf2aNOALdC8b4+nCpI2aB1sUalG44p4w1wN2
 bswCT12QWSeTW3F4DyFJJbVofiEmkEDCVwQ4bn3EJjaBf/FogRhk99/QwpbZyVe/KpKKt6KzA4J
 0FB6ArwE22el4KEK2q1/fezlCJPVHlkenVr3x2wHNzJKoM+h0H8wM56LY7CjfXkgvHqEZ94uVoU
 cZloLINJY3Q+tmdy9EaeOsZG6Yu/lYsU67gHD+2BLQmm4p4cCYqYnMTvf07vkluyBPu5zAsCn+I
 Hkqu6c3zzqyt6arKjZQ7woMJoOTMzn1wJVd/7uCGo2zT2Mu1EfwQ8A==
X-Received: by 2002:a05:6000:144e:b0:48e:850:c0b7 with SMTP id
 ffacd0b85a97d-48e6e27ec17mr27260342f8f.1.1793703149493; 
 Tue, 03 Nov 2026 02:52:29 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e7a1d9d71sm18911099f8f.48.2026.11.03.02.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 02:52:28 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  3 Nov 2026 11:52:23 +0100
Message-Id: <20261103105224.1995953-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103105224.1995953-1-angelo.compagnucci@gmail.com>
References: <20261103105224.1995953-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] docs/manual: document the /etc overlayfs
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Explain how the /etc overlayfs works, the options to configure it, the
requirements on the persistent device, and that only /etc is handled.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/manual/configure.adoc | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/docs/manual/configure.adoc b/docs/manual/configure.adoc
index e0358aa0f9..6aacc8fefb 100644
--- a/docs/manual/configure.adoc
+++ b/docs/manual/configure.adoc
@@ -429,3 +429,35 @@ can be chosen from +System configuration+, +Init system+:
 The solution recommended by Buildroot developers is to use the
 *BusyBox init* as it is sufficient for most embedded
 systems. *systemd* can be used for more complex situations.
+
+==== Writable /etc on a read-only root filesystem
+
+When the root filesystem stays read-only (+BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW+
+disabled), +/etc+ can still be made writable with an overlayfs whose
+upper layer is on a persistent device, by enabling
++BR2_ROOTFS_OVERLAYFS_ETC+. This works with the BusyBox, systemV and
+systemd init systems.
+
+The init system reads +/etc+ as soon as it starts, so the overlay
+can't be mounted from +/etc/fstab+ or from a systemd unit. Instead,
+Buildroot moves the init program to +/usr/libexec/overlayfs-etc/init+
+and installs a small script as +/sbin/init+, which:
+
+ * mounts the persistent device (+BR2_ROOTFS_OVERLAYFS_ETC_DEVICE+,
+   +BR2_ROOTFS_OVERLAYFS_ETC_FSTYPE+, +BR2_ROOTFS_OVERLAYFS_ETC_MOUNT_OPTIONS+)
+   on +BR2_ROOTFS_OVERLAYFS_ETC_MOUNT_POINT+ (+/data+ by default);
+ * mounts an overlayfs on +/etc+, with the original +/etc+ as the lower
+   layer and +<mount point>/overlay-etc/upper+ as the upper layer;
+ * optionally (+BR2_ROOTFS_OVERLAYFS_ETC_EXPOSE_LOWER+), bind-mounts the
+   original +/etc+ read-only on +<mount point>/overlay-etc/lower+;
+ * starts the original init program.
+
+The persistent device must already exist and be formatted, which is
+left to the integration, and it must not be listed in +/etc/fstab+.
+If it cannot be mounted, the system still boots, with a read-only
++/etc+.
+
+Only +/etc+ is handled. With systemd, +/var+ is managed by the
++/var management+ option. With BusyBox or systemV init, +/var+ only
+provides volatile directories (symbolic links to +/tmp+ and +/run+),
+and +/var/lib+ stays read-only.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
