Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B314606A31D
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V2TZmVdW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18DD9606F2;
	Mon, 19 Oct 2026 19:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnQtD2tBIPVo; Mon, 19 Oct 2026 19:31:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 29A72606CC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792438264;
	b=TpvPiElytPHnrr6Td0G/mMXzHb0PWlnLTi5+DTstEKyy1pL9WC3jRBC6I1r3TYs8T0FC
	 ffhmrHFFLxbgD3S372S7by1AgJo/pjugMD2FKl5DBdBkxRM5zW9lk7J24rcvRnwHw+Wsc
	 bDFU4ugf1qmDlJwImP9sLCDTHwIMf/sFNsmPESE0VzqGXl9yrMIb6pFzCkvj6q+cs07tg
	 7iX8XX8UmwIkP8jAWlXXCvcL4O7oRjYzJqWEVIkXj83/SZmBCr3sney+AREgXA/V+rHBm
	 qj7kfRATNzTRbruBLhQuZ+Ogu3elKHAN8ycf8OwO1hLKD4idDs6RAFu4Tx36qvkXidQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792438264;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=m4HaacR6YEGDVCZFAAlTUl1Wdrb93GUY4bP6OvXk6VA=;
	b=Tu/5ZZImwscuSHPok6guqPDD2641fPqR9ONSkShSrSdNlNQqxu5gnafM8DkU9KF6kRgr
	 kv3/oJRpSCSIoZGuFF1/7qy23Emw2Dh+cSvikBcEBbNr7XWrqxBfRbDDmDfBGq1VHB9P+
	 Oz3ERjeh9RBZub7Lsc7dKBqnJirczQ9etOhQXTNhugHJTcRfTGI3+gEcdGGSvCdLX2yj2
	 Gv+C5FsUu3Y6w2HnIoXlFyYV08DjTraKyy2mOgCPQlO/oYqB9qg6QP+bi5KzZzU03LYlu
	 0mBL0CAz5ud3CN3hxLAzBD1Cj/tlJceFtWMsokLDXWDdDbwFy15YTSHYNZU8Gl/gg+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792438264;
	bh=m4HaacR6YEGDVCZFAAlTUl1Wdrb93GUY4bP6OvXk6VA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V2TZmVdW+Z1Hdi/eRFj9hxtWxJ+h1Qj1lM8SHHA4vwTVv8W/zLma763WX6c5Vvlbk
	 HGX8tWwgEhWAUZgazYDlJW3bugW4vTUHcEBA2YtHg0taE6X2FdO2B7+okBp7L/Kw8T
	 J+2VWQy5aM39AcQsPv/UKgh7EgdGHFqRTHd3rDuL+ny+SToPGy6sFs54gJx5NuQZ30
	 +11KJm6VoP2WS9/eatLMPeb3IWYl3KSlg3dqqSItvsBOpAO1EFOb8fpNIvJmmbd6Qa
	 rgUbtyDW4vAjdVAl5QqWQz5sbMOjCyI4L9kXQBt4LbadKCSVwhwkPrarT/uE9Us0ZB
	 b6JKVlz2yTjhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29A72606CC;
	Mon, 19 Oct 2026 19:31:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E11691E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6928606CC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEFo114lVENq for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:31:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 511246063F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792438261;
 b=m6qnLGVTbR59gr5W2KaGW/5h2PgSkJEISabh9606jyjDcxnpCjan04iNg17/vOqWaSL4
 uWx3IsvBIao6o9vqSV0tigSuVb/AV8Q2uyLqtl9v96uFWJ4ZN+jyT67GNL8UZkEMuu5Oa
 4kDMlYE4Clg1r7bwbM/gAlYPdQMDbqUssSoQ5iwk19UeNeRXK3tNQFICm+Dr8V6zr6WC5
 UpZF4qrbgxiYGDuK1VcuBsrtIhOn9rOE6Ly3v9L9l0IDRb6lkISUiS12LSJjoc3u7gflj
 sC0Rsm+K4974gBrfYYUX6eyTAz7Ou/TTdWy7OgEJTjCU/EsNsAmk4Hlttw5eTJV732g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792438261;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=zPUvnSGiJ9OvcUrePRn25yGPMmQJT3jgFuWVc7I9pl4=;
 b=GzJBaf4BHmk2+GDgrPimVrBQwCHOOcP2dsg5uHh4t7QFf50GrkxHNv4StWpHUH9Ylb4A
 UVrdwl6DFkcGdh/fAStNXrsEdBbU8eXmSXLvkJOK+d0z76QjwWMdWbnuyEFM79Xh4L0YQ
 XpRzJqA8eKMFeWViHohpG4ZQ3r06tXQ4qEYsgtiUmgt7/t3CQlYelqawB2BtV4TKYZqV1
 xOOaKjqc2KTiExgTmhDfDeYudlSv9rep4dDLPaPTeBPcqXf1yvjHkutZvGt6DphstonmD
 +noZJFgOEuAutv1BRJbAik6cp2Kk6vgrfwQmrO4yyV1jBgEM+2fgpQP+hVHHN9lrtmQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BId5QbVX; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 511246063F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:31:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D1F221A124D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A06AF60582
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC4FC10328D55; 
 Mon, 19 Oct 2026 21:30:53 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Oct 2026 21:30:42 +0200
Message-ID: <20261019193044.900785-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019193044.900785-1-thomas.petazzoni@bootlin.com>
References: <20261019193044.900785-1-thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/3] utils/genrandconfig: do not select fmlib or
 fmc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The fmlib package contains kernel modules that can only build with
NXP-provided kernel sources, as they need the fm_ioctls.h header which
doesn't exist upstream. Therefore, there is absolutely no chance for
fmlib to build in our autobuilders as they will always build upstream
Linux kernel source code.

This commit updates genrandconfig to ensure that we don't generate a
configuration that includes fmlib. This requires also disabling fmc,
which selects fmlib.

Fixes: https://autobuild.buildroot.net/results/7fb2b2808c4f122e08ca217f34c4d56a2b1bfcc0/
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 597602f257..5cea529354 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -502,6 +502,12 @@ async def fixup_config(sysinfo, configfile):
         if optstr in configlines:
             configlines.remove(optstr)
 
+    # fmlib and fmc cannot build without NXP-provided kernel sources
+    for opt in ["FMLIB", "FMC"]:
+        optstr = 'BR2_PACKAGE_%s=y\n' % opt
+        if optstr in configlines:
+            configlines.remove(optstr)
+
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
