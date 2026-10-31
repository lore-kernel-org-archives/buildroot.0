Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6F606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FcmnjXHc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYRXWPm4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70E4B6073B;
	Sat, 31 Oct 2026 17:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ze9hqM2YJHwA; Sat, 31 Oct 2026 17:21:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 023046079B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467260;
	b=pmgwWaSKDT1LhOhKHsIOKqGCoMdVcQpCd4Cm5WVprNAuMv2paP+1DOmAoHRzJtlWC5Q4
	 y3amS4ez5VXQVTrVG3bcG6i2vmC58xBaMc3h1OcMCgSs22Vvzc9V3XAvGAaYtskJ39Pwk
	 m/DRn+a0BVNIdY7l29ZyREBdfxREVbT8sZOLUdV3Hr+0/49u/k/YSJVrRXpklUpEKYxZc
	 e6vO6NysjbkdxIKTM7UAjWCdwpNAlBXUFa3uMMf4eAirIPWE+W0L+KHAcWPN4uJJOX/ez
	 LjfyaWlUG2ieAeD/R9G8gDlr6YZ1WWWqlsyTXFgujtZJSvsS3NDZO9BIihe5hmzsJ9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467260;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=j0wS+XyHThybfByWlTzYdVjyWsaiWWiKjf1sSafETl8=;
	b=ms2JSe++K1zPXLKgaJO75M3PFPKWyBP41m3ACvXIMLtj/rwbsrk0xZrKUP3XA5EHZTH5
	 psGEcUKPWEn/Is3EQCLImmE/KFyuOvc72wnukduH45f/tqHhKANvy0uilY2/jOBGhPure
	 IpNSBVzUYWcrXhI9ra+3UrEHV8gpuhw7sbqmfDt/XFRzkhnDb08ryAkJDwNU/r0nvhFUD
	 Ssa7RLa/5/mKTof+oNgqWnJgCb1T1nYuMYIFGfqawW8LYN5onCXWCK8C5m4p4hDh9eem/
	 fCLmgv2VkjNILiFBKGosn+4p2U9qWKzhKJGUNy2KU2/JXl3Iv2Q+KJ/lAjxTuyDKEDA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYRXWPm4;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467260;
	bh=j0wS+XyHThybfByWlTzYdVjyWsaiWWiKjf1sSafETl8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FcmnjXHc+hVL4axM9EwubsRTdZntH4PZqjxrr2LaJb6B+YU7XVQYA71ErYnaetlfO
	 8evzuv2wqAa3Atfd/RBiK+GlChmxwPPHy9lY9o/J3e+eVnlYagWr9Bu3K3TDoUsqBY
	 wOska/q+CdDEjnTsWynXNWACfJloYek+Yydkbbe+j3Doyh0KHNQgM3jiWZK72A0d99
	 WpJ2xSeGYPh11m5HdunI6f07JLq8X8X1k4pqGZlTLmoLsyl3eBqplF9rVcSe3lTRCH
	 oo8YqmwhrVjnv//dGQlvxRJmjHGgCB3fH/ktEHmvMKTWP3Lt3Fj0e9wgP0WgY9QhXf
	 fsQGk3o2Vriaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 023046079B;
	Sat, 31 Oct 2026 17:21:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B6F04E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A27E607EF
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YhHsYDFISbG for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DB48260744
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467247;
 b=hOJvgiJTm35DJnkh4YReKQzQKfXxFYMhHvp6Luw17+NptkQiNpeWd9jCA7Y9ZV+vssEa
 gAOkrWjc5jVZ45lX7xxtZlQgCC7AZqPEhMo8guei5vtVO0/1nKCtuyLm2LZWk6tZvSCGw
 MChuvafc6QsJfQk6qVbZlVGsDRVq6o0jg8aYG5i6PgybaPnMdb+9baJSJLUyDXSLCdebR
 17Nb+Ve7xmqnf0e06DJwNgqTEj/HEX0MzylL5a/aQXagawG1VWO2UF4NhWBQmPvXYUAQ0
 Exv/NB8PCdHFjwyKPPLYmgi5pZqOv3Gw95L1pwgUlg+vWFPywW+TcNYyGvzPe471rjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467247;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=MP7heE2ohPKr9eY10gI5zGVqNIet18vB87OIb9zQJ2M=;
 b=HJuKK9nAXRGG14YDJae8URTNsLtlwEdwPQRI4k0fVShQWKvkdxxtPDlo7scGgbKvaaFx
 h0ZszcOl6Xhchwfa3j+ICzLpRZPnaFvcn42NZw23msGDbTwdbw0aATpRa30rLmjYxGvy1
 EOrcoVX8CiJGqCPDUNt7SkU2M3p/FiUpqG7fVzzZY3yWQoiIHEOSdM7IzNgtdctFO+HkT
 4biPcpsKpCe8yd4z6ODYQkazfteT4TgyibimbMXTH9HHIfdcVHMVFSXScI73Lig6Ja6kE
 qIwRDIaTv4BSPBllCLaeif+JQEegj7oJRXcazF9Lpu6Mn2dLWbvtnsiITdfiBNw/h+A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=VYRXWPm4; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=VYRXWPm4
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB48260744
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:46 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-70059e4dab6so1104100eaf.3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467245; x=1794072045; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MP7heE2ohPKr9eY10gI5zGVqNIet18vB87OIb9zQJ2M=;
 b=VYRXWPm4fxNobv77DyqZTfNIxr5wLTUiryn40byLoiY8mDKhJ8yO61bDI8jYabMJDA
 l4nZtLlOO5BwDZZQtYRCR4u6wz6eiB8gH6bY5FcaGs6i3P+IT+yzbj3f7aAdSr1uuPG2
 aAirUamPttMDBAQf/g/Usgwa9HDkae5v/Hctbj8RG9JQZImldjCKYNWjpogbWSrVp+0z
 Bz/w0qnw2kVmX7AIT73VAsn+UI7DZIbRLCY4XOT10FIpjCTAzTKg9D8Ta9+FxwysXWJS
 hgHNnr7JiT3/ICRZG490jGWcX5p8sBkeFtbZ7hLCpHG8U9H78pP+9SPha8sc33L2EY6h
 iyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467245; x=1794072045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MP7heE2ohPKr9eY10gI5zGVqNIet18vB87OIb9zQJ2M=;
 b=wz79RsNqdKNxHjhuZWaYwu2BxirqAO2WfAYJ+XFMX65G1FHATLvpJlLE6fSquN6sx4
 80IFW9Yienmh9L7c+j3hY2Y2m3yqA/zE4XkQZpw7cMvHOKFyqDI2vNWkxnneYSb594S9
 Z5w3AtQSEkovfCWfz0tsvxn21mRQut914Bnzuixqu5vfh2qM7JLzdWs2Zoo5V7cDr/c6
 TMqiEFR6bAYTRhyVB73TZi2RUu9UU76ZLEO4dycuhnKv5nAI2crr9dLbmRZLxAqFHbJF
 Tyw0HZHV/0ymvCW6/0F/sciz9StYFbvWwoO8EemJh3qVb+Ee9I4u5/qntnXPVQzMF+U3
 OpkA==
X-Gm-Message-State: AFq9FYLDbgd3+wbe0TVSDv8U/xi5OfEdkKEjpSyDx95Kkn6mXDxowCAD
 GCRoiNUX5CWltql5sS+zGoHFzmlAlcsorRCafz/8mCI+Pb7udRewHLC9KVoXAg==
X-Gm-Gg: AYBFou3AXZ8ahpjH6v9yDeP6t1W5FFExuk9CmOh9HsnXiRLEQPG8R/2mrJ46PgT7+yO
 4hU50ecmf5YnL1DnMbWoAZWnCXlY42PpEG3DzWZKkvt9KHxT16KIRNOCOfM2kxMWO2fh4igVtIQ
 UUA6QVH+qERtSzm90wgf9FhvAgmWqXFabQTXEJjG9gDNk0NlJJLXky2bUCJNAsmB2ouKHQ20ZMe
 6F3mASdOd2wmUI7cBlmgnCOU+atr4FnXdH05Q3IlEaWxuOpHzyoOS8TOGzkmeoZuathjPjyWSOe
 Gmp0NdjLO+l55FPU01hDOqV52FsVEt39UqNebFGB8zRsiB6X+pUMRSrc7FDFghydzLrUhHTdPUk
 YjMSRkphRYW71onr7DnJ/VmjD2g5nscNMaC55mfcV+sB5MN88fMcqPpG2DNH4ftfpmuZupcdFAu
 6xXEQOdf2xD+OlDJvdGyEyt/loQSgNiwv7gUHjSfTagIRLuk1rOFsHx21OpHyhsAsUdhldi2z1m
 m9wQDtwstrcm9glAdjVIcb3jD2zz9vZYbkozGkSedGt4CJyRXHHOa1/10rnVnI5PxE3ibzoiEPX
 eAvAh5XNl5S/7EPQIZYPyL0uTX1xaLhRNC3Y9z6XYnj9SzZbygjTeBgQUJB4R2o3VlWjIz85fi1
 Mfrvwl/HZkZRCIXEFQIoy7Z/qwsKysZxId59gdi2xVEqCICaSwCEDHNvQ2Kfzliis/12qJkVbYQ
 7NomwqYafyAgec3ZvVSsII9aGRGGj9YuwLRi3HFf7UjKXDyMu1FNugInuMBR5dKAizD/A0as6aC
 A==
X-Received: by 2002:a05:6820:1504:b0:708:c01c:13f3 with SMTP id
 006d021491bc7-714f2553d77mr3438195eaf.63.1793467245495; 
 Sat, 31 Oct 2026 10:20:45 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:43 -0600
Message-ID: <20261031172019.2683287-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-opentelemetry-api: bump to
 version 1.45.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-opentelemetry-api/python-opentelemetry-api.hash    | 4 ++--
 package/python-opentelemetry-api/python-opentelemetry-api.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.hash b/package/python-opentelemetry-api/python-opentelemetry-api.hash
index 934c47ffe0..3db5a9fb79 100644
--- a/package/python-opentelemetry-api/python-opentelemetry-api.hash
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/opentelemetry-api/json
-md5  54bb20b0cb8b4d0ef8a3389cebc4a81b  opentelemetry_api-1.45.1.tar.gz
-sha256  aa38ed19bcc084ba42782a73255b3582283eced7ad6dddbd6695189e69adfb75  opentelemetry_api-1.45.1.tar.gz
+md5  ce7e35c4c1a5dd174e2f9efe0af1bae5  opentelemetry_api-1.45.2.tar.gz
+sha256  d7b0008e21e5fd61cbe7a7f34ca3b6905a78ab677d9bc395e299359c75cda6b4  opentelemetry_api-1.45.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.mk b/package/python-opentelemetry-api/python-opentelemetry-api.mk
index 46029d9f62..89a5c38554 100644
--- a/package/python-opentelemetry-api/python-opentelemetry-api.mk
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPENTELEMETRY_API_VERSION = 1.45.1
+PYTHON_OPENTELEMETRY_API_VERSION = 1.45.2
 PYTHON_OPENTELEMETRY_API_SOURCE = opentelemetry_api-$(PYTHON_OPENTELEMETRY_API_VERSION).tar.gz
-PYTHON_OPENTELEMETRY_API_SITE = https://files.pythonhosted.org/packages/2e/02/6e0ae9cc61bd3169d401077b507b3ebc344745171e1051ab430be012dcd9
+PYTHON_OPENTELEMETRY_API_SITE = https://files.pythonhosted.org/packages/19/14/cf3a6b6448849656e1e5f4e2101f3988dc6789724050096aba1bc5ccf592
 PYTHON_OPENTELEMETRY_API_SETUP_TYPE = hatch
 PYTHON_OPENTELEMETRY_API_LICENSE = Apache-2.0
 PYTHON_OPENTELEMETRY_API_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
