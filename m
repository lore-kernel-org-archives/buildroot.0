Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0633CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BF8960644;
	Sun, 11 Oct 2026 13:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FL1b7JcMFCTs; Sun, 11 Oct 2026 13:05:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B947960622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723956;
	b=i/yaxnM30HG0fS6QxwsitZAYJiSvGRKZ+bp/4Qc+ejMjBLmxueFrB3q7NhLq7X5Gyar7
	 o5nlId9yzYO1mK0fq+Uj+QHqfFY6IfywBnxuKO0H2FtAol24p6p21HhgbyTOw6YNdH1pT
	 wYsObVQ42R3vchsiJPtrsCez1n8s1HCdDoCdoMtjUlIWxDue2mqOehTp3FtNYnt51vc4s
	 GuVXZy8zrjL5K8vdkLc6ryD/HBCBgGHZ9VkOKtFDv/tgbjYlxjpA+henqRDH5DHD04ciJ
	 U3RjvrZXMhEv1nfvY224d2hwwDu0SVACrtIvAkoYTapa0cGlSy4QnOKy9OcOKOmpcZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723956;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OCmbckH2Xud62Vq4WwjpRDOxRA0iHspiHmPJuZz8oQE=;
	b=jWna7B34zwJLBReIZMevtdtgxLY5F8XP9A5FprtS/VXF/ss2+5Kc4WQjRsaRaunxMNgm
	 Hdl8w/mKbKbfGq1HSxfPz6B/ZbN+77ECYrYOHKJf4IgGF/x1ic2WkQhdmFqVXdPY1IDha
	 DZynB4Q3RAnN32ag6EF6F4OsAS+X26DtO61re+w2MDQEeJgJp+rO5MhDgP94tTRCWCESw
	 cwbUcr+dQpNMRje2ktBfSUCk2npZo1hzGBSk/es1Tr8Nn8wKFjGYoT3I2PClqqXhlI27X
	 oJlF9SQouRRYEnNw5NEhgYmErT5bc3eeBJawDCehGa+I2RCnm6kZo6O5u2U0jOK/TJQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723956;
	bh=OCmbckH2Xud62Vq4WwjpRDOxRA0iHspiHmPJuZz8oQE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KOTGx7VJK43IIMSyGsKIMqgP0XRRhxFn1Zj3vmXrr2QtUffcrMXNdaglHFAy+en0f
	 w4YF7RbTcPRNI+YBx4HgqqW81GRyS2S+cQyoabxhWNttcbrFyEUwMwhi7xAFD1Huvr
	 vnrnStosYBa/DEW2294jVDgw6KJAPLN8xiTBeilpTtp2xxRBqtonS7yg+xLoWaofIL
	 ETpBPtfH+iIf8qcP8TdeimqBNhRGTKi5R2PuC+Srk3cBAuBchVeYZYHOoJAtjyvsjY
	 ySldo9D/g+BF8uy3Uu2w1T4HpG0WuHRFe4VsnbLqg75Fxh+08YqDz+mYhI0gl7pny4
	 foirggH1Xpttw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B947960622;
	Sun, 11 Oct 2026 13:05:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB1B6111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD22280D9F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyTKLdaNX72I for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:05:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1393280D91
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723954;
 b=NeyXgicoEB3JdaiNVMF+BQH3YJMeJmI9VQJd0sCGb349pL90swPnzfvFRDFNfi9qrzKQ
 ezghDpMKSRPlrfAJN5jw4HogBm0r/l0ic5vVsLdhapX6GwqYv0xdnSCIi/OaWuMg2gvmC
 QVwtLOfml9dVFG9OOdNGNEwqDwr576cXux2trWG83ahJAQEOP1vO2azYF9coZ1Cw0x8DQ
 oi0HnWBKKviBgLkyx1mvTRJJ0aydh868PwjXzY4w27Q73GN6eCRWvUI1PVGZvvnxg6MPk
 ngMhPhwcI37HuHYHHpiC0L5ka58hTAZqRI9WomSuZJMmEKS4BAa32oyCJ5aStg4vD/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723954;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=QqE6trNrNMfV9t9bbsA5M9JZeoKCh90Wles6ofv0Qmo=;
 b=FKHJAv7VNXnnDc8XgbQFZXiOF2dujYJsd10/zUFq2GH4UqMT+eMfSOwh5Vy8XlnjT/iP
 MNIkkjlMjkGkmpPIZ0BxsdBp4CCUPEvR9pGq0n+0zxDOwPu/Rg1Cz1K2RNIiZstAqUPzd
 K7GwqQ20NSuX69jGxY0NdPmVhcnOIlUUBK5jiwpuihWjobBjCPZwiO8POhCQyBBbfJS3/
 umk/zXozOMUx9S0qNLx6yS6VIinstkNl0ZZ0xtM3LPf9CLRL6hyhjcWbahSLFIbFm09XQ
 r+bPSil86ZUjSeIu2NBpmgEs3MOrmvuvFWKLWzYCTq6RMAMyYauBsob4LamJP9PJt0Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KFoVY+Es; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=KFoVY+Es
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1393280D91
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723663;
 bh=QqE6trNrNMfV9t9bbsA5M9JZeoKCh90Wles6ofv0Qmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KFoVY+Es3zi3iNf5u77vpS2ioPYXEskxvyAOxEaLxgRBl5GrvmDMcm/eY3BG9xVGG
 oVZcLtNGdWfjjxnAil0DgQakNFUHBHn8C3TmUPb6hOfyVz7awJmyNr+TEgNl+9QTzA
 fjrArPxUB7rwOFt8q6OXH0OX1gXCOdadJI3TdHo0X4nt0Y9NoWLzYJHdPiqgcgbXYQ
 MhMw/FPzYwn836+dE7VkMUXh252DckQtj3vpHbmbZY0d5XmdxFyO4S78D61UnDqvxK
 I5y7K6k+KFEDm5KnFz8lYHxO9nC6ZghHyQImMPQjPsBtarG5SQ61m0AAqLoGuEhbn4
 I4kmPySRe8uPA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 o/CEzMifoLU6brIhXXARk2NkgNnK7YAj/3uFknhCaaaWp9u6vS/ZnN81tIOkxEXSUDPjwRO4OhE
 i3NjgpUgs1eZJBrpEoIo/4d6uKTbQ05VTnK9iPjt21PUxP8rfEM8+mZe7DkFtNHx7bBH+00d+WW
 eNV2xGI8Iq189VLwNyZUY6W0jfn8W/wajEDryQudSxQwMqZfQbOfexCuE8VLxtOaxcbuSdgXFCj
 EV2LE8qFh6uNSC3tt8vUqHjPUrk6vHb1lmglcwln34+3qClER9zx6PBC8rl8eIRBiVNZc6rzCV7
 5LvR7vrK6qBuTJwmAO9JbxaQx4nFtj4ygF3xgtG8pfUHnoJ0PnwL5nmiYdMeebilVj1KkQayafT
 a9erujj6Xz41PT10xPqYf6G4dMpZCGlvPRS1qNdrd/1o280lK/P/G/l5NgjatkC02iCIZfZuswN
 G+zlvFpTtEXYcqd/g7kVG0pK3jP1vg9a2sYNGsVSfDklGXQqd9/7RO1NaT1skVFKnCCdSR60LVp
 jUbMv/rNKLIjVTNNI5C9QYcf6k4f5YYoMcjL54XxgbTHp30nPL7XnDZGy9cGM/StzSzR2hpjA+u
 Pr3CUcFVMNzeaPUCOXFFbmtCTtvD53VM+OZmqw+4ROcVsA==
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3BDD4A4C5867;
 Sun, 11 Oct 2026 15:01:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-0QcR;
 Sun, 11 Oct 2026 13:01:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:13 +0200
Message-ID: <20261011130058.3443432-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v9 08/52] package/boost: program_options needs
 container
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

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 736255a33c..406a5b4d6c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -311,6 +311,7 @@ comment "boost-process needs a toolchain not affected by GCC bug 64735"
 
 config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"
+	select BR2_PACKAGE_BOOST_CONTAINER
 	help
 	  The program_options library allows program developers to
 	  obtain program options, that is (name, value) pairs from the
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
