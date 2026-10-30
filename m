Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29CE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KkyjqTYl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8QCBXaa
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC07340AE9;
	Fri, 30 Oct 2026 10:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AuR4QMjFqUE; Fri, 30 Oct 2026 10:02:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B944740AE3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793354523;
	b=SokYheuD2yA3NVPMflbpL5ReXcBoODrqUKRIDo/N8HEUJ78qKGXhE7rfTriEdkI3EL8S
	 1l06SXqcDE9iRfC/7I+s4RMRinnd6NPQk0y3GUqcZKc2eU05t9XFJpU0NOujRV8hO2ffU
	 msSkfbt/5UanoDNfQWvghbQB6aGpXXJzJKuVERBP3IcL07m2/HkkyF6XoDi9S3XVuPcDY
	 d5tu5YgOsDrgsCfvNoXsFR/WQwK6KqGNZrvHJTLkMHA+qDbXQFwUZpQf2DAOgaLlyCjNd
	 ZYyt6QTzZkoFSjCzFs/kaKw+95vpbFvM1Nh1T9WgT7Y+H5vL33tFIFJlQYeUw/7QZnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793354523;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+maT+LeIGf4GENFkCqy7ivcJCChWXlyhnaQ14ZRsWUg=;
	b=AFV7LHOpekDBBu+ABbPCfq7WF7q7ltM0TjOM0zAePgU7IZidp2ubbducGJDRWA1zazQd
	 RHRFmH5T+QXSL2f3FPf9wcZBHjdZFlVppc+Yz65EHvhQWTkUgQchlUbvvSVg6GGXVMbTn
	 cwOHq4MeBaJO/jHa3gRPYAgQlMPbC+rNFFCSv6ncBazTNQb5u2kcPbGJ8/nRh7yOhJBib
	 aX0s0eXdcYcsODB+0xvuvh91g2z5IlCYpbfmwmzyNJwGqbyJUuPFl1s7GnWmOPjyfyImm
	 g/RHpn0O/u5T8p7XUGNFt5YC2p7Uzbf7KHJKUu8I5jdtnKDilClTsj61+LOJ9WbWBpw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793354523;
	bh=+maT+LeIGf4GENFkCqy7ivcJCChWXlyhnaQ14ZRsWUg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KkyjqTYlnwwIZnDTNgxjqOZWl6I+Ufucc/41ycUZfk07oYaLlOAchTw3gBe4R0o0N
	 aK1XIqqz+12ai2gmSBnIX51VPPicMmlmwEU1/ERXJ3y7F7eMtLtm2jmTjeY8EBLZ+T
	 gRxZm7UEY2ORYIPtNuFe6tT5GcEVp5w1WgMS/+VGgtT7hCAAoSPkajlBTRMutN9RbT
	 WlZ681AldlKzHrRDs3DylO5HbUxNCUo+BREqWjY/S69/ispOPyVr8zQUnWIy2sLNPt
	 fDQK8lTDH+krhIxjEHQTk/VJrB/VE/y23Twdpd28OmiUNkloFdk+byfVtj4IV/6J7D
	 QEt+c5s0UwbWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B944740AE3;
	Fri, 30 Oct 2026 10:02:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 100993AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 10:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0111260AA7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 10:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMpSvHz-E4De for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 10:02:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E9472605EC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793354522;
 b=I9jcCyv44nGst5yDaWs2wXt7/T1qk0usGC3dm/u7CA7cK2Cy6b+4gbGsvkATA35deanL
 3qYsNZRi/YUFOBEUxGdH1f+e1DWKQmKVmA7Pd4OnX9TLZ4ofeFiilYhDsyI/y8Q+EmDcq
 cwdPHJ6jO4LBvRqj3sKh4CzMRpVXJusrnhy+HdoHLfLWEJg6Zg0MEVyCabPBkjYfdXaG0
 BlDuFMziGUFJKl2WEXkE6Zsm8NWbcFaCEuavNmvCjwUInNu3YSwMr+Ij05lKL8YAgazUV
 y+Xo2wKaO+kbseOmO99gQgZaCrrZ0vexd9CD+qaieKlTGPyOoHTFhSQVT3r9C1e1JNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793354522;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=80jN9bNJz972Tr2XbVrCQVUQF7+U0jqHdsgnq7f2py0=;
 b=hWKPeIVB3zIP76L21FwN9eqNtt/8Ifoc3W/e9F3N46Pv4R4ubSxdilQT0ZutlA1cVjBT
 b48MUQvvL7JZCsVcM6B0Qeg0kl3/KC5+glymSrpVY3vz47jJNeQDHuwVi/4U1oHOpZwTF
 dBk6Rl1FGT4EocYm7MT8oarG3ydbuaj30U9Y9knMuRpoAKtY2qeLb2hq+NtrN5vNzwKti
 kHFldQ6NgXwWvsaoXowOB0eB8oYJ/yjCLODHNGBmMcaAhDjBVWSqZHPJlHtWGx6IBXiAl
 omDttB34i2d2JYEnXNKn/PzBZQYTclvOStDFuGYLRNhQ+KejeiML2Hei7vQcJzRbKkg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Q8QCBXaa; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Q8QCBXaa
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9472605EC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 10:02:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so4179555e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 03:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793354519; x=1793959319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=80jN9bNJz972Tr2XbVrCQVUQF7+U0jqHdsgnq7f2py0=;
 b=Q8QCBXaavgs+88CLjp4AjkQJUqQekeUbX7vNe+ya5ZQK3ymD8m4hLCMlaFeZ1eEfjz
 NNer+kK5qw7LfoNxvyudd3UKLjVlDXDlVivOVuenvpNHggxgcdaXraIPwTrI+k7g8lvX
 m18EeckPMg3nOZA15YD2zijmDDYB//66ulYPStmsamO6Rkob6/VSfIiAZ6NaIZxNlRu5
 CR110tIMuYA3LQ0/5VhmWlM049VJADUgiAnl/LFxQZpFFtx9Vsc4Bm1WrWfmCDOsKxPP
 QF5NNLbTzopqaOaR3OiuQy6CIWJ0gxQNLngUFP5z9GmWtYGRcXycxAXEYgxPeYfGf6aG
 XWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793354519; x=1793959319;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=80jN9bNJz972Tr2XbVrCQVUQF7+U0jqHdsgnq7f2py0=;
 b=ZHqRsZ9HM4Z5Cuw11JwyyFxGVoTsKV+2j44W090xYj3AibKkUodOMI/I3iBT4SEznJ
 byvmkvdQXmkUP40rwD5RpFXb1qfzYInie3vFLqeZDuCNHFLonJjo/Fxkk5mugPVcFEVS
 RNneRFgbIsPpuC9ACbaLn4HKc02xeZ+jzo+RD6Hur6IUzFrGijoBaUcLhvH3JJ6P2biM
 kEx3fAmbJjR6y25sELp0qlqbFx1YZFrLYQZcukim7ATLhjC4PvmALt5D0dxICh6kG8Wb
 vcl8YfnUQk8K9oeoJr11jwH1M5WD6RQSS2ubx61eYzbmWxAhUPupPedzAhz7wz3txxTq
 0vVw==
X-Gm-Message-State: AFq9FYK+P/pzBF68xhNVJrKg5v754N0VaD2BylnlVAVhMsUcIW3w1TMR
 5f86Y22o4CAa41czpTr1Gq0RLalddZVtQ4KTmpHxEtEJnLY6UGCOEfNYKbNX9w==
X-Gm-Gg: AYBFou22TOcQA6DLnd/B7P1QXDkkQ+yEIDNrJg5X2gzAn2RGG/kQYHKNR5n9T0E8yII
 3p/eKxn7bL9xSdnXtkhcBoiOoLJ2xOKL8yUW6QS6qtunITqiwoyOjLXZVnTbqopr7hyGU0bUmu4
 stDZdtsTswDEsfLlNZ5Ga8Z0SUSi/fe7GYE+lVuJQ2uRSfANuvHb1d5SKE/h14PoNJ7zoLFZdGv
 8YJc3NOaj2lxmaizuaMaViyGWJSHc2j2TLxiZm0GSO5zGIyYTwwaSS3+uVTBKrlmK2+N4+JOiH1
 kvBM5rUO5zzOP+k6AQndVBA/pi8PZutlGuNYGg6nMSX+6Obu7Dh3PVvWyG6y3rZarRt8Exsw73e
 r3bIoXaTTm1UHsnO8NMBRrwtm4ns+UEueduldhuJzYLS+9uuWAYzOMGuqtY6JOTZWPJwvFhmDx/
 NNFP5EG0nPQNsB2yu9LiEVSYlGax2VnMhAotDt/jDykptbv4/7Ibaq0hCWhG34blpiNZHTj/2zE
 dvXVT1LJFrPtMvqf/Z2CXdZWChwp9rEG5E7N1md2sdwhKi34F+2eFs+Pu3XFie1KfA4NwygM+ly
 xai+V1jktGVqfz7PJiPgnHz2qNismczkcuKjudFCQyP5Ug3kQDTmow==
X-Received: by 2002:a05:600c:1f93:b0:49f:ce78:356d with SMTP id
 5b1f17b1804b1-4ac180f2fd3mr37580075e9.30.1793354519318; 
 Fri, 30 Oct 2026 03:01:59 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf723b5dcsm49351445e9.14.2026.10.30.03.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 03:01:58 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 11:01:56 +0100
Message-Id: <20261030100156.2223140-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/10] package/htpdate: bump to version 2.0.2
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/twekkel/htpdate/releases/tag/v2.0.2

LICENSE hash changed due to copyright year update.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/htpdate/htpdate.hash | 4 ++--
 package/htpdate/htpdate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index 44d73fbe2f..fdf45eccf7 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  4c771fe3fc5c4ab5f9393dd501bdc51e4c067297cf304ad1e74e1965ac1c066f  htpdate-2.0.1.tar.gz
-sha256  74096c67e102bb6545b84487b5e7f18edd038fd5fc0199c8a0b25efb3c522f06  LICENSE
+sha256  3f5effa9355db140ef8ace6d17800d48815d1afdcef9d1096510451839dd8de4  htpdate-2.0.2.tar.gz
+sha256  fdb40e98438999c792a5f55c347d63bbbf6f5551d8bba12f5d12360af5a681e3  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 8d4b1e073c..7a5ff62fad 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 2.0.1
+HTPDATE_VERSION = 2.0.2
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
