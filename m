Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DEEC982FF
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 12:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17EF66061B;
	Tue, 22 Sep 2026 12:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbRYHCJMrJ0A; Tue, 22 Sep 2026 12:30:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0700F6072B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790080241;
	b=TDRhkXu7TXRwxNnN3YZHmgc6vOuLZgfOHjK+c9DM41NQOzYYR4Uvey9exAEdE2ZR1/Ai
	 1S79L6oAT9r02tj2riiYJZR0faaaonyw+369+Vihjpo+DcDHHY5OUzKdpUIyqLTcwSBJE
	 rzinn1NclAJpGtpAOg72XMzxCZJ/MPj+bHPbZhAbPK/OyIBGjHjWRy96QlQ24zWyLURw0
	 bfcfbeLjqTRjT/bnbj7ozAOZPVPjgvMI63T5qUnSMgsdu17GY6GuzR39cmglhnVCs4rVd
	 aLWYl+PNKW+5eC7WR/Vfh79nb0wgT2y2hTxuCntz2VOvQSw6kSrnlUyCc/PfxvmJ4pA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790080241;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4Ec7HgnrL2a/AQsIrKtB0S3HF6J3khPdmx/Mt0bb6G0=;
	b=ZNmtV2hJL7fh0/vXSXrm0NqsmW82wGhlwd8RHZ4xgxEQExWfTf5fzxuO+xJPv/IqpWuZ
	 VpP1L4J9PzyUhhFBfeWyxGO0w1xWLCJ+7h2DDSobh1TcKZgLlJ0XUgDsRm/QBfZQYx93t
	 KMAxtocQHzyN6J9Sbij3nqDgu2pSfqqIk9uhRsuLysQ6Sh5y4IMOJwI7bWt+1eZGAzcX5
	 D/7PYeL13DklO9eqvk7I+9Rp1vZX0FnyCHYUsjiFl3LykKlEfae7U88r8XSLg/S3K0uI9
	 43nvjSf5p0xL7Qu1alsx1Kpq0vzc6jIkiVpwAakYMTDIj//utLuOEsBpzIswshxPooQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790080241;
	bh=4Ec7HgnrL2a/AQsIrKtB0S3HF6J3khPdmx/Mt0bb6G0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rdsr+FFYoLFyNKwaWddaLG73BZ0VgazyylZ7B3ECTJ0aN4MyTzZXSwDoLp/YJOybq
	 t23Ohl4jfpeDBMwhQKFqiYVWtwcSV57/WukIj93sBz+Sjp9erg6CmYwOyfyHumdtM/
	 fmHpS27MjwDWwg+LCAw+XyB1WDUjucM6yV0/z8rACG2MPNwzxkJa2fs/ePbvU8w1xx
	 3I/iKZMODoQ/ZpJzi38C5wnVR8vOqXj0AcdCN6TsKB3frkD8HweUm3PNONckNWSUhE
	 N0osBCfl9HTobnj7ZIU8HBnQJoVjdkXb3lGttsZhZmFeho7mampqsMqPpOngMmmcBp
	 cszZX+NYPbyRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0700F6072B;
	Tue, 22 Sep 2026 12:30:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A541C35A
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 12:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BE8340244
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 12:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnVrESgXj1c8 for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 12:30:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 90139400B1
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790080236;
 b=DgrEearLuVE5F3UAkGJXwZMYoZtN+7KqAZtuNw9Lm8iMmiMJoP45Yx9uMJAlIpSsiuCJ
 ozAs5z2SydZ3+qb5QKbfCShLTEZYyuUxt4f9NEjoXF8ks0Ha2wVmmgS561zn4Zk6wEox7
 Lek+uKXL9g7KdLz0C5nFC9B5gTD3CHPpWVeVLdZHK03BGsc9QQKkqrSwNEiamd34C6OOg
 SS4VZU5dIPUOCtNUoXOYOVtYmJzEng5eaFEvhtxdnciqh2f66TGTXkcEt5VQqUznP/sKm
 jgCL3kxyVtSb9mwcY1/ALT+j7Vz4udsWf3Brr7itQ0y2bLd8VhVXWMGF3jF2qcJQJQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790080236;
 h=Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
 bh=pYcAqyIvVq9Hw5Te+44508kZeFl9BrRU3LC4IzbOwWA=;
 b=ZpN9PcZ7T1duEM77f7Eed+c3slIdcMhEBhyc25Xv0IHQVqrczc7otFRrbTYFQ9xQIdUE
 pih3Fc3J3F45E1ilm439zA5nuRlTzyza0Pgm8verbPFPAxwd8+9Rr6qAu0g+Mg/rxMAVM
 kHBAaYIWq/Shfxk08hNvIuzyyK7/M3GbSVp+662fpLAdAqxPu10s3yDZCvtS7SIzJreb4
 xgREYpnBEYtyjQu2x5IdrWmAJ8e8t2qOYWRTnI7roHg0/zYaTbcIbRPYPHogT31LDf3Gb
 WjjIRNCYscPgOnTSossNqgHHnIll157yrJkLKrBZDaBH+d26lRfNp0N0OQdhVy+SeFg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=163.com; 
 dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=ZP4gJoF4; 
 arc=none smtp.remote-ip=220.197.31.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=ZP4gJoF4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90139400B1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pY
 cAqyIvVq9Hw5Te+44508kZeFl9BrRU3LC4IzbOwWA=; b=ZP4gJoF48JepN8Na34
 6Fzy0TUVmp4LOX/ASTR8wX0Vrt5Mn9enGFZTwaSsT0WP5kFd9pykEsU7cKeWU8rz
 grZI58Mcej6Y1mTh1nhqMs3ii4EkyI6WfHypr7rzc5YrAxynfXT1r8lKxSAuso9o
 qiuUWpxuZqL+BnKMSmcJFBLzI=
Received: from ubuntu.localdomain (unknown [])
 by gzsmtp2 (Coremail) with SMTP id PSgvCgD3_87kdLJqFBj0Ag--.59395S2;
 Tue, 22 Sep 2026 20:30:29 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Date: Tue, 22 Sep 2026 05:29:36 -0700
Message-ID: <20260922122936.3945-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: PSgvCgD3_87kdLJqFBj0Ag--.59395S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr45ur17XF18CF13JFyxKrg_yoWDGrb_Ja
 y5ur4v9ryFqa9xuF4UJFZayryrCan8Jw1FyFnxtrsYkry8tw1Utr1kK34YyF1kJrWqvFy2
 9w1Ygr9rWF15ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRG-e5UUUUU==
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/
Subject: [Buildroot] [PATCH 1/1] package/network-manager: set modprobe path
 to /sbin/modprobe
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

With -Dmodprobe left empty, meson's find_program() bakes the build
host's modprobe path into MODPROBE_PATH, which doesn't exist on the
target.

Pass -Dmodprobe=/sbin/modprobe: both busybox's and kmod's modprobe
resolve there; a missing modprobe only costs an error log at runtime.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/network-manager/network-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index bf4f29c3cc..c96f613831 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -31,6 +31,7 @@ NETWORK_MANAGER_CONF_OPTS = \
 	-Dqt=false \
 	-Diptables=/usr/sbin/iptables \
 	-Dip6tables=/usr/sbin/ip6tables \
+	-Dmodprobe=/sbin/modprobe \
 	-Difupdown=false \
 	-Dnm_cloud_setup=false \
 	-Dsession_tracking_consolekit=false
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
