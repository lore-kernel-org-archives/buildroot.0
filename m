Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2022A606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V3hgueuM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=OGpJrdgg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AAAF80D17;
	Sun, 22 Nov 2026 22:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khvTL_k9s043; Sun, 22 Nov 2026 22:10:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7D33280D09
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385422;
	b=pkxRA8I9RR8AguqNcA21yYOYRzfCFSYA+nmmCD6eHTdjGF8SB/9ZuHVqtwFOnp0werB3
	 yAq4/6AQgmYgwI6PtwahZL7aY765uBoyC9zi/pNQib0DP2PHupcKPJKUNd3WDi6IjE7cd
	 CYh3xH/gJA+ZwSPBBdCCT/8oCwA1w3NMgl2SxC6C6iBwxja4LtZslAbhPoXB4xcRgHEFG
	 6p/kdHPbXDkU9CajichVOiBmJkdB5dscqtdQtObLrP/JwyzrjqUywSBPgK6BEzTDOQVwI
	 D1yvHuMFsaHSVaaNbgVglI2UAc6pHVDl+Ex8vFQi8D4Bra0RaItzUgI9BdD4FFt5F9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385422;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=U6Vcy3D1mlwSQWiuxqaJIeAsznDdEbOeF/zQkem6OtA=;
	b=g8hYVrN1+KBNYq0Mp4G3yLueTs02/Xn1uATvZ3OZ5UMq2QaqwtC/ilmUGoIAFx5Tmpdh
	 UX/qdJ3+KQAkAoNLnr7k5DPGvflrhqiXrBgJNQkZg7GZVTKzqO4uU9eoYZOv3uncTIj/8
	 SiBjqDjxE7uyR6VNrS3r5YT/7e2s1ec+zWQ7zJWBoQ7XWf/ww8GXzAkUSiueqQaLeKYGW
	 xjUlpqsk3n06E0+xohwzqxByp3Uqo4at+A4BTQYxqRJKsqBWH0KEbi7nivjA55y21AtTI
	 drw7iDwCkOLjJvAPsZh3mKRs192rB/UFU3lLris0AhVicOuuTSkv8bZuuAHnVtB1jdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385422;
	bh=U6Vcy3D1mlwSQWiuxqaJIeAsznDdEbOeF/zQkem6OtA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V3hgueuMVc+AsoN/u/Vg1QLbYKBzgLJLm9e7i4Leyz/HhmXtOI1FgRdL7+ARhFmX/
	 Vm9ZUwPUgw7xq8lPMu+2HOJBhn1/GKVMyl0KYOPb5EjD1t2vyeXJsj3ca3cvgPng0R
	 Z/dKb773AYxUczOCpfdxpy+/o71OoFcZOBbodF6ZbhW1BLfKAl+Ln9J5J5WMIHim0d
	 o/YAbNPN4kkQGOuPpLzXHzFrw7Cz0V5gLTvpu3FWnnYwdWSNlwb6mU/apCeF43iKqJ
	 BHRqCNWfizs98TVdxQ7HB+zVbjvVmC4GdZrJ4NpcKx5t+x1IPat81CQv+M5Vt6i/2P
	 IwDt3tg0rqLHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D33280D09;
	Sun, 22 Nov 2026 22:10:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A58EF22B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93D9A405ED
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECI4VlUMsl3R for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:10:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5E5B0405E6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OGpJrdgg
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E5B0405E6
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385417;
 bh=HCmxnD7baD9XN/Tweg+5cM8Sd7H32f/wa3ag/x1GZ9s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OGpJrdggurdzZa607RyGpOiAu3D38UVlSx3MAgJbdepM+NPo9PA/NqZg9/OPap5p9
 cRo983mWCOO45+StmzpcZeCehMx0smlibLGbYM0YM0a9SfngqEsR7aLzkOKam7Pk7a
 l6PT8iMNCRdHFUGlQMxz9TKcOJxPleK2EApHRqizwg6scGBYFXJONNa/0ItoIT/fn+
 btu39Ih+8WSl088HSJ8BodjG+AP8SwVjVrRCWuCS0FgzNVq8uMNO6Q0d3Ju/QzZ0Oo
 iw/NYWEJjHNClrCnnVMokCYto2EmHPvMh9Jm56p5r3Z5rBKCfJpUn7P9mBflQTKUuh
 b1GdTQrTLvk0A==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 4Yn6fUlBrp/qZz9A63CyN20kqRXreLRhPlIR13dnFm9uQcLE0jljAAFIz5bu3HvsoaSr/RmeJyh
 0Tp6uCsB/G2sjm2ZggjwFawJynJQwB4NWF71HDLOG7U9LMaQ6P9uM0UhbL2CJ4QM/Vw1xClgKKN
 UBKVWt8SgVboEYgVLGppmnpbgdjD6OGyzN0sjkvPlTo9b4Strh3uHkKamH9cSCZI1PkaBYBRzik
 SCceco8xAnacVJj1TrgVgRT2XOWz1m8vSCmY4OkEcy3hLuiXdmZ+Zh0403wohPG9IIt6Awr/ef6
 rvI2ABNXVNJDS+jPr3qsw7naX4jdAV6YK345WV5m/gCgm/v4PSrZr6rZQ22Ph0zJwKCaXnnI3nR
 LmRN6QpJsUVHxOwcgBpD7CD6Y6va0hMXSAhX+ozbYSaGV0cPiVXY6hg8CECdxEBsblEXGrnTFrk
 L2Xt+8+pEpY4J3RUyfgSigOh3h+YrlA6FMF7TgNJRpIRp3Afog5cMvFoYWmfaNcFZhdCnMU3PwB
 5ZFWfhMJWTQZM0ftrQtcYdWNqOjvyKO+fZN81G1G9Ov6NPL7EjzB5gcAnT3H0WUNygI0jReqgzc
 Mq3eFQbENiVPAn14j8Bp01Dj9TQRfcGM01SEXlnuWobaKw==
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1DB03A4C4E4B;
 Sun, 22 Nov 2026 23:10:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-0MLb;
 Sun, 22 Nov 2026 22:10:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:09:54 +0100
Message-ID: <20261122221014.3945599-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 01/20] package/boost: program_options needs
 container
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michael Nosthoff <buildroot@heine.tech>

As of Boost 1.83.0 which is currently in Buildroot, there is no
visible impact if this dependency is missing, but as we're about to
bump to 1.92.0 this missed dependency would be causing
problems. Therefore we do not recommend backporting this to previous
LTS/stable releases.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 7b78345798..35e63138ff 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -257,6 +257,7 @@ config BR2_PACKAGE_BOOST_NOWIDE
 
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
