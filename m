Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C34E606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Lt/6lFoX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=ff3YtHnR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B91C4076E;
	Wed, 11 Nov 2026 10:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKdSgCo5TMgS; Wed, 11 Nov 2026 10:41:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DB90C405F5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794393671;
	b=YrKp5tMvH+2Dh2FKvEX7h3YQ8cArZpe6SbuxjL8pgnMF+kqz65MLRgxK7l6fQrgpRHYB
	 9bFrpwamVbmq7n0BJ3sJh6X4eKxGn9HoD2rABH7Kzu0i2SiqvJboaru4kRbtYgW9iAzhs
	 Nn7AgLsAW+3OmABXe78+cbNK55nnboSWWYetu5BNCuiNleSTgCs9mOyDomQ+O2S4qbgX1
	 bYM0+QdJl4EMSrzSJqYTQwbSyHA4rOdNiXeSV9UD9b/7rfc128PCnQAl4zUKxyH654yo4
	 F4AAm2BKa4AJZDyTypfBHMKKCtHwt3Oh99hZcVSKH/EpxaOLYL+byK0P3YUhyiSlEmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794393671;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=zheJYqwBR55vdUVFwRZnDZROkjG+3OYZRH9QCM+kznY=;
	b=Qy0+f5OmYu2jav/zk6m/B4vcqsxtQVlOqZEp6TSDLOeGhg3NVEWi2g2vi2OC6DW629vS
	 rLSWW0ZsE82fZTd0UfCxK/iT13k4PzErZnLrA7PTRIFMMpRiVXv9eTAIfSbbVuqScqdMQ
	 t1jekaWBeYw7MFP7sF9z+0vM1S1KkprMBhXUs2luqyMk5niIfA/Qfy+uuF/XbPLHwD0dW
	 yuGw1LRZcekLqpIbtgGTrDs2Q3i8o9WGAU+MuVLqGzWSFpXWYRIWYA6umlNBNTUptwBYZ
	 n3Utn2ZD7f7kNEFZXF8Qjf9CVt1zs0iScmRW2i3zRDvv8eVwL0tvn5Laidd8oEB2XBg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794393670;
	bh=zheJYqwBR55vdUVFwRZnDZROkjG+3OYZRH9QCM+kznY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lt/6lFoXV5od+fnVP8EGdu2YmB4t0ijh66riHMB1HiK3XZBcLbQI/r+BDBv9f5Ih5
	 blHbDxVLT9EcSIHmW6hNDsRPcxqY4O0NBElrvCgrjynw/6dNC9rOks9pO75gtFNLMr
	 kfCvQ84tsAMswui6/O1T+8A5w7YlK5WLWdk5Nn6eihzMdnfqA2fuk5qbbHxqQSDUCg
	 pnW/tSB0G4P0Rf1ulXWo9GyNT+AP/ftE1eHA8kTOJcl54xv4S6lvYZ7RNaBWRvUDwM
	 KBm4GfW1eWwxnXJnbSdt9NHxm6tfNkPISf8OJk428s2rep56vIUJaiiRAgwxGJryn4
	 1v4tm/l0vfQwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB90C405F5;
	Wed, 11 Nov 2026 10:41:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B868117CC
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A973D6079B
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKnwC8w3iu1G for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 10:41:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F2D8B60793
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.155.101
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ff3YtHnR
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2D8B60793
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:41:05 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id R5lFxhDUB6KjvR5lGxAIj3; Wed, 11 Nov 2026 11:41:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794393662; bh=nmJL8oZOxTySrw+KR2YKWVDe3IN9GYoYlwN7obwZclQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=ff3YtHnRy3t5GwjbxiQc3tDJundgZ5wbuOQJMt5yVU6bdS0wFcjVYsRHqaY7NrGDT
 /+nG+DaXvdF8/Uoc7KfLPMHkMngFV1sCk9ehECLqpvaVEf5rd8N/3zNsOc8gB1zvmJ
 N19lUGI8/93Kfju3AR1+11D2BGr4J7Neu1Nx0GNt9eYtaZr1zz2DnvBFsLCHOwl215
 9RlmivcY8wCmVdtGv9QmNMKs6THSj3wgx2zSpC8zlURRm0tbDLw0G+kCPUtBXpVhqO
 GqAKbtWJX+ovu375AxP3PWgesillEq3YmNf67niGS+PTYBKQmWhjdXfDPV0XdPTDgF
 6gaBWz1z4xHmw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 11 Nov 2026 11:41:00 +0100
Message-ID: <20261111104100.41443-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDUBsExDll5HphVvLVIJeEkxuOSTfPqCxJY0gsprdakUfLqJs1JMvcs07MzDVrua4ypaiOtbSgar2wZxRVJr0S3KqC5M1Lfnx1i7671THkN8gzy4g1pT
 Fu9hXEF+qS+3wVaIYXJPFG0XGd1CPL/TNlz/RKZ8S2ytQ8lALUuxaPQlnqv8SbE9JbrCDJ3v0wpLcGosDcZQuGMVJaEsXsZo7dne9CIPfA5j5FGYYj72Qavj
 3Y8lstEZXzLNA6zY0NWViv6CPd76qc1zSbGKJ6rAPvdhksJwN++T24GH75eJ9CygT9d8JuXBOxqxokOK7D36Ow==
Subject: [Buildroot] [PATCH] package/rtl8723ds: bump to version 2026-11-11
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This commit allows to build up to Linux version 7.3

Fixes:
https://autobuild.buildroot.org/results/9f59601d90aa6d764e722466be990ca039c1e349/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723ds/rtl8723ds.hash | 2 +-
 package/rtl8723ds/rtl8723ds.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index 580f5d09f6..8557414e0e 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a04bc28cbaead30aca2894633ffa93d4bf0bf407a8c5b7120dd9832ceaf0310e  rtl8723ds-122a574f780da32bb0de760bf089a3a9ec1e8f87.tar.gz
+sha256  e0cd998331f37d4ec5b18df695638ff9f3c2c564bcea936b55ef4b40d9c4613d  rtl8723ds-83191afe47af29d622701bab24020e2dc8b0fc48.tar.gz
 sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index d8072f14bc..8dfda059f3 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 122a574f780da32bb0de760bf089a3a9ec1e8f87
+RTL8723DS_VERSION = 83191afe47af29d622701bab24020e2dc8b0fc48
 RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
