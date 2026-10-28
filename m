Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DD7606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GRjY08Ba
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD486810F9;
	Wed, 28 Oct 2026 15:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RPPDHyJUSNf; Wed, 28 Oct 2026 15:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D18D180F38
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793202881;
	b=Pxw/SpZlNeAMyjfRBd1wC1a/9lfBBKHH7ACgAK9MnIKq0+JJamGZkICVt9JeHMmzXIwW
	 VsSTW7+EA5zQeIawGIZLYDOUXBIwFmHfsU8SDGSPFcFqlEWHQG8sCeF46MZ+UygzuEOYk
	 DWn2SajON3kKB75D8niO3DmQNFsy7sbx2qHa9mtOl/DbOQDb43+GJlS6WRg+C7mYtnlNz
	 Y712D0YdgLqM2XkiRknTmDazt2kWil/EuMd3EwquuuoIu7ET7LWXpqs1fOPcWFtUky0SE
	 13fxjtTzWqAykGJFx5h7qzihnXp2IYDhiXEKonRGIY+rC36E1zh0Pp9HXF56laU6gFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793202881;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7QCHmiHjL9ElQPWfWN0KmZB6C5EiElynHsVWSggxF04=;
	b=WrnN5yhSVnTyfE6WnLd4O0fypq95g7gSYGodlyrJyV8nhD5YJYJLxdQM2yeA03F3qaZW
	 WJcsRSh03sLmuH/Q6uNX89hT5qbhEaeX/sx7BclKYLKYL8D/3qCx4q++9DMGir+YJq4YH
	 d4zmnmmt4fN6nNZ+0IL+YJxglJkvXcaSzt0hC2M+g2XKi83x+qk32KkBdYNV6cFEduiqZ
	 uhl7s5IpM5ixuklSm5hG+0n8Z1/PDicq87+vS3WTdKddW6/jJ/csx53XhDezBS59sia5s
	 4AYSfnAXRan0Y/VWqAZOxCbiZKXqO6ysYLHXNBZWC2QmZvrUFZKoXkQXkz4Mnk4fPzA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793202880;
	bh=7QCHmiHjL9ElQPWfWN0KmZB6C5EiElynHsVWSggxF04=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GRjY08BafXqQrkLD9ZUfZgNCfUcsFgD+bLDseJVDIzSA+5Fo493AvgDlV0MRyJwHY
	 7FO9mjpNTBfx/ZeCEt4jfhtNAHsWNCiB13bWB1VQRtQPsph7IW1eth5pmf3i9OA+eo
	 V1myD2NyQOa/Z9n7IvsZhbUDJ25YV3L3njbx+9ne3HZhYmekZCfwSoCMyAfjFg1RsY
	 yNPUvempJ7/ii02J0yHR5UOlxdLIs+iboOaOLOXMHDBT0JGKtY/b6iC/tc2rdC6WY5
	 gmCfcWO5uKxuktBUSEHA6Ardixb3reML6oTxVnl0hcW4oovv1HD62YOei5u7AZ0OMh
	 SO0T5Ite7+Bwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D18D180F38;
	Wed, 28 Oct 2026 15:54:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CCBA8529
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B285D605EC
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_RdrnY5Reyq for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 15:54:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5F0AE605E0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793202878;
 b=qCdBSvAqV185CwiSA6q/eT6YcnMkG2Uf3INQfsBMQ67g24nmcqcUB7iShbmpNZNvKhMC
 GzaQtsGMrf2qf5p//gdzn4/pQftScuJX3EoAcTzcDG2VfmtvPpxtaHDyHYgqz3Kxj51KV
 eQn6Wg6uVCKzOOKlkPaJIXrhQvorF5x/BdHf6OWSB47wxOO0lqHxT0OflF9U9uByW0vre
 DHpN/cjOPmSlEfvkBSyTP6kVw8xhrocIxUeyPIkXIafvVpoPFOUEDB+hajNTVzLA6EUST
 OEF3FuvhT6Ev8ehICsQUB1oPxf5/wsykQKKAJ8xBd7Zud61wlHuVHj03mtBG6t7+8+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793202878;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=trHuTJsYDbRtMWH20oPnasyjxnK+JAg/+MSwsDcmheA=;
 b=pNor9SwHTE0anJZsZSQLyS2+RCMkUGlHc1mbM0XGl63pcnDmLv9xGKZijIvZycBuDPou
 hg4IdiJ8Dkiqm3TmY1IBAnOiNIaWnXvbotKmugH5GkZxgetzZTDsDwad+2MnKoVDGBuKW
 6RxdYNTdPYcoMi7qCbNZGBoW90Qu8SIzufe5bsbQthscVtnhkE9gYClZENA4Z17xmskbq
 ok7z3EGYuDaNzRBfr8T+w7A0gN44dMd1wFvQgkfMSgl8itt8XqMyjT70gZCKxIPEYXigt
 y1pnhLlywP19HrQ3XKVwl/1mmoZdM4ZqSJQmHgEpEHEi31fBZ0e4IvZboulhI4hOIyA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=bVCAOc0w; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F0AE605E0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:54:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsnF-1x88ZF3eW5-00Mc2f; Wed, 28
 Oct 2026 16:54:29 +0100
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 28 Oct 2026 16:54:09 +0100
Message-ID: <20261028155409.3271339-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028155409.3271339-1-fiona.klute@gmx.de>
References: <20261028155409.3271339-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:aC/Tc9OeEHrFpT2+raJ/pIT/l146OVybcQqYVltV7rqmoSVt8VR
 h/adOEMjKYSGZZM60QW7p8vHrFuSdELj9EjBrMpJL9jY38AlGN8PD2OE+1RSQvVVDywCFIQ
 v77IAnjXubR2mmr1Yz8BErAF86uYPn78mIEs7cAwlH57Dj1M8L5ZDqQERihqaGpr5KLwKnt
 ehe/4p+FY3Mlhv/ineyNg==
UI-OutboundReport: notjunk:1;M01:P0:ZEJ070jBo7Y=;4mpqYeUGPJUSu/FfnXbBIBd7odv
 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
Subject: [Buildroot] [PATCH v2 2/2] package/lvm2: depend on libudev if
 enabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

If a sufficiently new libudev (>= 176, so actually pretty old) is
found, the udev rules installed by lvm2 request the built-in blkid
implementation of udev, instead of calling "blkid -o udev", which
Busybox's blkid does not provide. A practical result of this is that
systemd never considers device-mapper block devices as ready (seen
with dm-crypt and dm-verity) when Busybox blkid is used. So depend on
libudev if it is part of the build.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/lvm2/lvm2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 21fd5134c1..2656d81716 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -39,6 +39,9 @@ LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LVM2_CONF_OPTS += --enable-udev_rules
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LVM2_DEPENDENCIES += libudev
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
