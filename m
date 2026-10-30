Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2737606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 17:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CTtsvBEK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=CHYNFjli
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46FF681669;
	Fri, 30 Oct 2026 17:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6aTr5S_EAyf; Fri, 30 Oct 2026 17:37:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7F9A78154F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793381842;
	b=PILuaMKJWJk0BzI8HH6FaFTUavF2vQrmqS/M6BPje2lo28pGLh9iLJ+Pez4qjC0nRzaP
	 XrKDRyDsylm04Z2LUFyeIqbw1rjiqnUF3MVNnl07E9R2+zlAFyuF9hAyUYGviXghFtEoo
	 NHQvEj49bD36+D1SvOogk54MW2i9wZy4FkrJyRKhCw857yxkp/gbqq5CDNcwMVSeuqT1+
	 FFwzly3CU0kKH7hMemRkRTRzOH0PwCOgkc/33VqvnUgMTOeNMo/xSstv/NAH3hfaV9qRE
	 5m5jBJ1LIRkaBb8q55Cv5jnC+GfwOP1lnVZHlcxhrr1PR/tT71SasTsEBUS0dxiDvUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793381842;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1oEZ4OBU3OaPt4pt6AhANqbCm5i8dYvGY7y1XJCFtxI=;
	b=SP2ikUrjvVGFIJP626ehW9sOdQmd00g0D+rzNVViO0ew8lS7Z1bpXZw5LUww+j9rAxcj
	 83E7wKzqBUIvkptZ4wle/iGGzz/+t6qswnhYO8TBC06S7bJdfd7m06KcJlNPmydTeElC9
	 PlZGrik5w5RGkliTr67L1Fiz+fC0MdnbIc0pP6nDy1t0jL5UMgux9P4gCsitww+ZXATut
	 OwQLlJ4lwUckMU+lt/1bMxkVbUGhkaN44Qg5WN39ZkNivejda/J1voKFE7wC5mEPVc4GN
	 rHGL+oV85Ifq9sPjhgutVf/4bk1u+CMB7UeviotnLXyf1PqVEDdJ0XEqHefKXDc0DNw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793381842;
	bh=1oEZ4OBU3OaPt4pt6AhANqbCm5i8dYvGY7y1XJCFtxI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CTtsvBEKQJD0JkfWf4fyQOdoYae5sTq5aHZZ1N95fvfW7aqH3XjeQDUmbKGM74n5P
	 4FDzHnmfwUxYV8W9wqJfmyL8XuaG2ZtpNStqR1S6lBy+4fKwCx79ZPBNsjcxt+cI8O
	 jMbf5aOJ/RCA0C1z1v7utACiWCPajMHYLcw5K0A/wurQGSk1owEYeI3BBl0izoNPhE
	 3yocXyXQ/g/YOTgxE2bLtzCxbzmk63hVjRaXlYH4s0h3B8fVjDeacPe2NiQcT/H9AK
	 Y7sHXNZD1Cm6Q3W4hmNgEHS21imXISaGWaYFoDmVz4gsBAO5Do8Ak0/LbIRTVp0Mcp
	 xc6v/BUa5355w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F9A78154F;
	Fri, 30 Oct 2026 17:37:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38BEC411
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 17:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28F2560AD5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 17:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSOntBRfeHhO for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 17:37:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B75E560AA4
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.155.132
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793381839;
 b=IEYSMhK+KzbfkIJHqEUViTyDB5V2ctwzv6rWD/zIa1iVvOKM3BUopYkjL3lSTr2OpS4h
 oiKXJkfQxEOnXI0z3xU2gjnRcgVIW2zgR1+BinX3GCv6D1hJ26hdHVI8GQHYuxSEdLBUU
 FkRV0IVvFhDVXiaKqWnRqxsDwgXzdAeH+LTGbS8ejYhnMylhWjdpTmK2zaWD7NxrZtvYo
 pHJzG9RIoYe0+e1aNGNQvM1gPzvmtzhAI08uEN2VU3eqbsuA216gjLKza7tHWCBsDZyd4
 uXmJDekJb6fOY+uzxSYJt+YKYP+fvm3DgYRQM7190kH3iWukemKaOKo4kl7/YXk9C5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793381839;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=+Ap7qhEkZHCsvjArXSEj9Emx+aZHlgwdtnDIyl+5SNU=;
 b=opkKVusLnYnXRiQMoqmaMtjjSotkElEjgreDmNP6GaGrhZJvoGdD30v78r5bixx6y8tH
 Y+NxUtr/7kTeA0ohplljNaKOaK3yPXrVGFPYLGBvpn1WUCvs3P2Nvdau0HTtUBTFSPnD1
 gE2z06XLoda5pcdTHAtI9mJdKwNOEXRVcjTDuEkcsQ+zlrwcfXTx0kbkNIzxIa+Ah7TOi
 KdZnRSLbd6sA4iNwxUjUddH8tqDxXSQu+57rzZGUpfPkv9EbVht3aFQba3vscfaO29Ajd
 GF0k89DzcZ+vlb0RyYAYp/6/WhHB/+50kXcIqcRQt8Vl+gLZG7b+kBa2hO89jULr0CQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=CHYNFjli; 
 arc=none smtp.remote-ip=62.149.155.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CHYNFjli
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B75E560AA4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 17:37:17 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id MqXSxqJa1gnmRMqXTxCAX5; Fri, 30 Oct 2026 18:37:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793381835; bh=473sLuKJFtvQM9iiunBQZA8IY9TI0GtFHCva/wkeClo=;
 h=From:To:Subject:Date:MIME-Version;
 b=CHYNFjliXGxhLW4fRlzZqtQkwMkLu0QJKHa7B3P3UnwCXlncylSrpSdbTRkIaf2L0
 9OwCt22SzvsMLWx6ESMMYoxJHWmNU8hKukifMXNcqUtiZgyStLPVT4PBMETXRM1c+5
 /rGU+8QCB59Mm0L94Qigbvy+OsVb5vfip0QGOMpEKLm1aG/xd2RLqPStVsT885WlYh
 2f3ufOoIPaf1mvcviQ0WcZcZ/LO5amOxEMVaVdxtzF7LUqSFI8Y2sbtOxC+/ZYhzuT
 uUxrcNQgs8EVKW20UAwkd5HHAtwkpKaOYLb0rG4s7AvguESsdHbCQJEKvHYHj+24gP
 9r1g/UW/NqXuQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 Oct 2026 18:37:14 +0100
Message-ID: <20261030173714.20684-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOsGCSHs2GBiMsMfVZh9a5j0Dxl0bBVr8k+fx56xcFhOCZ9DMi1EMKAWpCgfy6cwDEtPRwYcsiHbAKr9KtK0hqIeMliL1Tt/VX4DQSbOQosKkLJm58OI
 VsneuSVvEhpoSO2KcqJ18pm4wVNzFJuBhD9C53Q/sj5FP5k5eHzXuBlJTnrjlenI+4vYuMO1I3strdFfdxJr9Ri10+2jryW6lgVt8C/CoD866FA+/txZJSWW
 6Enpa0P32zUpkqa57w91rhuEdS57JS47WN7tBlf2KBRXNYxPhm60xO514Uc2UXxfdIeQAcpQQAT8N3eMjVDYzw==
Subject: [Buildroot] [PATCH] package/rtl8192eu: bump to 2026-10-30 version
 on branch 5.11.2.1
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This version allows to build with Linux up to version 7.3.

Fixes:
https://autobuild.buildroot.net/results/772/772d3c85a05336b8702ba12094ebe70457d87469/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 05e53745c7..de11e2e5ae 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  50e289e6a1a4f5cf455e7525b2e2003c0ce58b6b55c1c3ab2e91e3b9fc357730  rtl8192eu-9664b2bfc4bcba55ca5a1284e67bad15ed910081.tar.gz
+sha256  2e4310f7a68f93b50a98792cff8a3ab78bde92f611cc9e20d03bb53e5c9212fa  rtl8192eu-c9314e0d846d2823a81f7e896016b4122d7dfab2.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 91c250e07d..472046136a 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = 9664b2bfc4bcba55ca5a1284e67bad15ed910081
+RTL8192EU_VERSION = c9314e0d846d2823a81f7e896016b4122d7dfab2
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
