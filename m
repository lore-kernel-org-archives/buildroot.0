Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A998CCA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 737D660863;
	Sat,  3 Oct 2026 22:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FISW13v1brF; Sat,  3 Oct 2026 22:45:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 69B1160675
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067512;
	b=dE9n90XM6uNU4eUka5J486K1QBYOHLkjLL0sKPAlJ3jzL9f4QYXaqGSO1E8Qtz9xkinK
	 SWUAmq+Gm6U5CO7GWhdu38XDVgQegr7gP30wiJQv80eUbND4Ycd84CKZiOhlN2DiHJfk1
	 fL3nEWhk61dO+wm76Dm4VmrAhlVbrKnHDFQckcaMhaXWAAf7l3bmCLGlG/jEruES2BhHW
	 MMi+Dtia2Vc/JXWsQZYGBfwh7H9oucrZvjgt7gSfT8D54wNT9LSz1HFKeMETUxrVshfuO
	 3IlMw9CIOK6IHrc2RkaHwCUQQQfRFQ8QhNlg73e6M1Nlcw6jBrg37+bJYsziwssglXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067512;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OWgjhQic6TyGTqw5i5/U/ehf9psYEqok3El85ImrJT4=;
	b=JEIhYeR7EesfoBz+rdGKcTY4x7hV6T6gx5TqcC1UJCCZ24vxVEW5hwD1bZENak8U2BQz
	 RCKmgmbHHme5n6pJ9zbs9lmc6WypZRr/XxNFcOZXPvzypFsSc8dQJcIZyUImviAWTQfzy
	 d/5zA8wx4XXT+3XE7WUgPgRDgyI9dWtd6yut13CFSohD8DrzMcLyE3kFUV1I6kxAMQUT8
	 jl+BiSdJ0CLqjmtcl5CBkF/6Vu8XtIOF/P/2J5/OWty5895GAn/iVtVrbGJFhEEDu2D0G
	 rmN0on0JckFpADWWAPxnitmGebp/hPmvSAPXEl4FkmcpA3a1WFPUwsTdd79S4YuQwfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067512;
	bh=OWgjhQic6TyGTqw5i5/U/ehf9psYEqok3El85ImrJT4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WPNJ+erM5+R93eYdXyKzoo4Fz/+Dp3Vdkoz0MlAMhJmzx3uCiFpg4A5zHkRpAhjmc
	 6EbXrs6Y29UzN6GnlgkjOauOOWrioLz2AhUaod37n6j/wQeOUj0TFxmPp26qkG+I8I
	 bHQbta2GQJJqQoUdJRkMAPrbrHM3+/mHFLn+WzwT/myJXRELsG8ARzn1Pql2skR8L2
	 uBYBQ0gfnr4Kn8NXSsiqb8X47Z6VLMQk9gWLLoz9AnmcoXvZX4UcfRRsRkoCJZb0oi
	 gv/PdiagcPIrq53inB1+XrHShgQOkaYHsTIWDMsZexL1wZg6TkdWuuG42kG2x/QVly
	 D5boJlNTZRqiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69B1160675;
	Sat,  3 Oct 2026 22:45:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC560282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE3D240CF2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8fO3uO0heOk for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8DBBC40CB1
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067508;
 b=cgYUTo5w71h4b2Bruvm9UUBq1lVbDIXCI0nBTB1aFROohdyqBzUk2QChgc0zNnrMr/vq
 38pLm9iNvmA48XP/Rca5JTzWK8MvRmUGg2Ics/YqLZot3UOwxaDY9A5/7WHz9jzkDcbNj
 QyE2FwvCoQCcw4qFbnEPwcCygkpCxdtJE8chNg7JZwuJTbtAjxrZgeffRA4ptcYxbvAgl
 +H4EjPlcLkkexcECE6Nx1GPbtX3S5K5H1eHmp3mau1Cnq823galMuzejcyw73dFhL36L8
 13vnDRdZz0DwKxV5HOMewoc20707schVMmXYpHDhofRKRJ/3/OGW1ArHFpY07MDIUzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067508;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=QvDlwlW+F5V1DBVhvFcFN+lUVq+q4R8l9caQgr0dsSA=;
 b=AN3b0F17K8q9refD7qzKUFWKM1d0rCAb34y3ukfAAENW5MtxRolxcN0YcCg1/3DwQ6Q3
 lQs5NsZyGfPYfm8PR2VmApa78dAzZuK1QBScZvNTbXPJ9MvkJ3ukl/tUZTa2yFAf5+92/
 n9ZCJ1YIuLK8D9lsuhVV49KgcAtgOKjpj/WYGQ/hmp2hIgKeEHlrfq2u+LjEVM8GjQyNy
 2p/smCq/etQbacSy+Qm6yyznSKQe/1nOTF5z2sXsE+H9t2HRcxAZQQiZcMU0Kxbp5OAFg
 xAbcu17tnfKg7P4CHhqMyXRNGvueZNUt++6uouCvsGmOjDoA4VbV3ZOh7OOOe/40XlQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nre1h4vb; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nre1h4vb
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DBBC40CB1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:08 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-82478760557so500138a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067507; x=1791672307; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QvDlwlW+F5V1DBVhvFcFN+lUVq+q4R8l9caQgr0dsSA=;
 b=nre1h4vbhHd+QpXaSsGxl3TWWjGwvxZmThXOViEWD4uxveLWvPbzDRpk1XycbIfsRB
 k917RqjhYxyZKZ9n7HH5mBcf/ojqi/lrxc0rvhFlwkMuSyFn7l31L5TtK9km+vqc4tSO
 BRRAol9Ah5Y7mXK2vlEFJz7Qa+3bK07kcVBHC1J5HM7XJkIZecoSSvbdR+23vboFjdiv
 mEpOV76j6+/NGOAeDtw54tSXj2t/83ufinOY1V97nVp2ULxUEsmSE/9efQWzf7pcnklJ
 V2HOb2QGid3YfprFncFw+GMlm7a0E81ZmSrnKZwAIzDalOcJirMyixWEKc6tIy01MekS
 KEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067507; x=1791672307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QvDlwlW+F5V1DBVhvFcFN+lUVq+q4R8l9caQgr0dsSA=;
 b=NUZV+Ieri8IrwtWLS/i3A/8qeV07aSuzya+gbLmGsteRHvvfP0CefO5pXpqJTGTZt7
 aiQb9CsSeg5uAcAE47at8FFFOVTwngklPiL8MzKS1q8cNuzE+M2K0+u2Zov83XU1tAia
 eGSZZwrcEbublIN7OhAUvB/LfOjio3NQfoeASefUiRvxUFM+SZpYhZkvbCg1xO8shcZi
 EX9V7eLomuu3PnQHmdDH41EcFyrRkRBrUjaP4flpWLQCfE+H08rxfh49HwUwgaurqzvb
 spfSkCFXLqCT0TNrq9Ahw6cbq+1tenDoTltryMzbrVcT1ZXghOIMw2fK12cD/J3/xWb7
 hY6g==
X-Gm-Message-State: AFuF++ku+DrrtOMlrWOOFjJk5epovv2wITi/aKENMIlBMgLF4VIQSMTT
 vrXOJiZMt8cmh8y43ta3g+BKAmuNbfwhT7oaB+OIMK96aYG4N/xdTfQqmnMJig==
X-Gm-Gg: AYBFou2KjIoT2Of2SwnnXeu6FmD+SydvFhyr4X1an8+EyJOwuCTvJobjWq4qM5qakiC
 aJiK2ZBUaXrrvZ7+O7BFCsUf3mczfvRupPDatfdIimVXpRBnFjDDGqrY/s2bE41fTjs+k3CJcKP
 KRFJHuic7yQkmBOaB0U7mqQRm1ybVx9cD8aBPe0NFM8hnuXtxR1yR8h6bqiIaqunc8lftG30dPn
 TWgTBwzUcmdR88v2Qb14uL6bJcJ6rT291XQpnpAWobj65duXvfe7ZqnDsi0Dl8CPEp0LJWH0elu
 aXtKAGEC90XUmINlHyieJTsoxwQmlCUubMDD3tZZ+zDg6XTZyzOSxIRmFQlEIrsrPu163aRUxAV
 8zNJp1vIkOTZqsADeMWzgKm22ooD/t4t3Op7N+fpDtwFXIq+gDiGXWzahRv5qZBje30XhR+0Ipu
 sNw5kkALuvWLWTfeejH4nUW6Rc66lq4phcAPV40cQp7caaLjSJwlzJHXoqPgs+tZ+36yWkZgVJ8
 KbtKYHy9GvN6ZcdFJzKG/vnXebWblKRdsPatUQZGkxASYt3w3J3aAqUKpjSKlJKq3RW7E19mjRI
 scm9uIwM4wi5DxOFjv3UPp9c8broEDhUMkHfwjL38ehC2mJmWKoNw1P8sCMWhiLRRbP/Y3tUtHZ
 2WzGGO4ocdZTbeZTUXqbnZ2zVXrx4EcDeRnThGbosXQ==
X-Received: by 2002:a05:6830:6b05:b0:81d:6a2a:7db0 with SMTP id
 46e09a7af769-823fdf09779mr3422694a34.23.1791067507171; 
 Sat, 03 Oct 2026 15:45:07 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:45:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 16:44:34 -0600
Message-ID: <20261003224447.744966-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-thrift: bump to version
 0.25.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to README changes:
https://github.com/apache/thrift/commit/09b177a3f67acbdce2d8e5ff7bd94d3bcd99d9df

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-thrift/python-thrift.hash | 6 +++---
 package/python-thrift/python-thrift.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index 452bb7176b..972c0e0173 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/thrift/json
-md5  521e6b4fc5d135af2d16f7198dcfa0e2  thrift-0.24.0.tar.gz
-sha256  9ef601c49e988475ff0e741d8e1b45feec23b48514e524341efc274191f1789c  thrift-0.24.0.tar.gz
+md5  e01caa69e039b12ce4c47be63cd79bac  thrift-0.25.0.tar.gz
+sha256  e85615ae9245f5622a5e36a9d2d867e1e7b17a8ca467b257dece5dc1642ccd73  thrift-0.25.0.tar.gz
 # Locally computed sha256 checksums
-sha256  35e2508f171c3ac2529f402c123c12f3b2ac91643f2e52b334f71f8c861be321  README.md
+sha256  aabb457f78181734bf08e1da52f08fa6008cda8747647d8d540e0853016f7253  README.md
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 182139015f..827818fbfe 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.24.0
+PYTHON_THRIFT_VERSION = 0.25.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/5f/bd/8f90501b11206e545da3343ed0e5740fc694be24a5f637d7dd7e4e3af927
+PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/65/be/b3f5ef7af6c1209085f45d7004e148de1d157ac5a142a672021b44ef7195
 PYTHON_THRIFT_SETUP_TYPE = setuptools
 PYTHON_THRIFT_LICENSE = Apache-2.0
 PYTHON_THRIFT_LICENSE_FILES = README.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
