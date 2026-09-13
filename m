Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E5BC88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C687605DF;
	Sun, 13 Sep 2026 16:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNHlPadp5qlO; Sun, 13 Sep 2026 16:08:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5DBA1605F9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789315723;
	b=PYuMHyB/iaDknTN4OrMCirrhBFrnOcOpWuUW4EdDpVVCyLJPNyou2LjcxAVy91ZeCV5k
	 1N+rQ4WSh17lNpqz+/k+vb1iuXdiUXirzN2ZMqNOg9VYqpxKdtYVyGGd1Q42oVQ+0FsY6
	 jdf7Fku1NJB/ShkZAuIHLpKM3TgbhnuLcF6c0TCVz3jocheOugp0+T7XQo/AyTNTNhQ2M
	 aterBcOxyOXhAGgHZ1TES1+lE68GkbIrIxe9ivfsPl2mc5henretqXo88RuALxLv4k92D
	 QZ/pieUGD5+TiswAZO5FVH6mTyeFBKbhfzVhwamUlOUjST+QLNn0ndEK0eZbrM3uLTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789315723;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=zbsaijLThttdPe+D/Cy8IqjSEkzxTA5LhUdjcL0ADH4=;
	b=XEg9Fk1sidUkPunzmNhIPbtm0ddu7UuJ3uqmr1/7ZleSvxbIaEHUgLijwlz+9SgOFqip
	 SMBKZUf0mVB2b2G8bZzuC7XZlX+nXMKH8F4hl0Qnx3sxq4CFMPZOSBHs9w4EHU7oHBubs
	 ktMwu0pV/TAnuYjxPHgBl6oGr9dtzfsP+1hZgU6JdS72EiyeMzQFMTXtnqlYCKIJUtF4K
	 cjXBJgk49zl1T8J3zK2+pQsTNPa8SrvvglJTnsf8UR+zs1RJY3yZ+M2KL/01jvlJGMs+B
	 g0EniVynX7FsIe2deKpz+JyEX/U1gglu8WKnIQ/jBzDs5MLeb5ppq9Gdb34tYISsbsA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789315723;
	bh=zbsaijLThttdPe+D/Cy8IqjSEkzxTA5LhUdjcL0ADH4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=U2teE6zMOZhN6kW9XrkP+I2KIe0eRuAv5vJldyoplotiUzbXeKf7novWD4X8T64Um
	 TlxVWFCUwI52wzmDQw/GvL7cd44pfH8qRyMQbXPuxnG7MEaqQp4FvgoRCVdta2wFSx
	 cRkr0W9uiaPMtkBrsJ0B3VSDXYpB0YeSS09inv+3RTWoRhn313tIWaSdJzea/dWzIP
	 98wfTSz4Hwni1iW6RfECEx8nim2xP61GWGlcnphwFkzpFWpf3ju0DyNTrqBsrBVcsm
	 uHhfLGvZd8/MTsLVf162a2mSEW2tMezE8uYlJMPTBGMflojb9hN7Z8zrpEl6N5WK2J
	 PB8ixqOHW+zvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DBA1605F9;
	Sun, 13 Sep 2026 16:08:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D71B3AF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CF8F605F9
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5M-C9KAyZuTm for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:08:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 210FD605DF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789315720;
 b=fyTHlbUC3r51y3h5+2j3Lf09BiMsoSblMa3+r/gR1qyv9GVC3ffx7bo/EtR6QJwb1mbs
 gkrXebRB1NpBIBdxpf1mX3D8SvTEqU9W9+KKeeLYikF6AG21RIyBQA72bvDhFtJFQuYeh
 5LKIe4aoc8CN7oL0SrWD2ovtHYi8O0lMBeOGuFIM2P3Gn8n5AJhdA1m7XE2Cpf1G/A7mx
 XNXj/A5b07iN96o7QgAXr3Qpin4vLxtGbsfp+Dd4FzXg3jPRDPKPWDV5F/J5bti7WElrO
 oytnPodIgkO20C4Z30TAXRnKSzjFnI2wpRszUr+Bebzy++fQ8g8KsVnYvngIXuNcupg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789315720;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=5VmnnehbmXyOiZWNkTow/Z27mTgwu+6/DSGMX7+F2tU=;
 b=IaduC2LxOkJtPxQYSUZavhQU4YdOfCrbOLm/DY2TzBN79JJFpgHJUXEkQqhCHuq0orVz
 irpY9QH7LiECJ1C9yEj2NQMs0jbrc8WSE+pWJVrlK9ORBbOorAM4PE82hpMWYJ3YjSzWS
 bgn8wi+7Irb1TfKJ3MGsuZ8TA7pZ7q/9z5f4cWPKnoGFT+NcdHSiVssyvkhjJPLLXe3Qk
 tZ9W+/rYkYx7T4QbiZoO3Hv1sTD2XsowFGsBC5QaW6MnzaNi8sLCrxRL1+LGykJ/CoBBJ
 ZB8W6JRAwd2aK9VxROCaiyREiAPsEGxE0JoQMHTG784JipF5qlKDuNAbxcrek5T76aw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jxgTW63d; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 210FD605DF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:08:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 537371A051C
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:08:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 28AAF60435
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:08:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6CFE611C78D5A; 
 Sun, 13 Sep 2026 18:08:35 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2026 18:08:33 +0200
Message-ID: <20260913160834.1668831-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/pulseview: add missing 'select
 BR2_PACKAGE_QT5GUI'
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_PULSEVIEW selects BR2_PACKAGE_QT5BASE_PNG and
BR2_PACKAGE_QT5BASE_WIDGETS, which both depend on
BR2_PACKAGE_QT5BASE_GUI. It ends working because we also select
BR2_PACKAGE_QT5SVG, which selects BR2_PACKAGE_QT5BASE_GUI, so there is
no bug, but it's bit inconsistent to select sub-options that have a
"depends on" without selecting the option they depend on.

This not a bug fix, it has no functional implication.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseview/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index b1f9dc25d7..b9dbd88c28 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_LIBSIGROKCXX
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SVG
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
