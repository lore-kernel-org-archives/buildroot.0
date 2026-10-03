Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D81CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 18:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BBDE81498;
	Sat,  3 Oct 2026 18:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q75y_tx82ka9; Sat,  3 Oct 2026 18:38:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 229D681479
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791052693;
	b=NhTS+AWEGBBxnbdDxCq19d7anl4EAfJvk1enqDp4IZ+/3XZZArdMmNcx5F85M3Hvyj/+
	 WTBmqRIlkGsNdRPtpP7BX46AaKmx2Qpsihf367TrfmO5UMQ7+Y6VqZRsnvYR45YHsekfW
	 JV+eeLvW3tAclq1JDXhT7w4iQ0sudG3qceLJu4A0e2xEb8k8QYduBYgLBt6YUtxGzqoyG
	 cwsSpe8N8LC8KNe8122Ty3LSsjbJwGbmXQvkSbY3nLYK5kxPGFxc2TE/69ujTAl7KoXen
	 IrgnPd0Kco4sVcvFbxf2PT6dwu19g9Zmp61yyegCfGeFEdF22neRGdkGo3LCRbZ1wDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791052693;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=AqEoDnd1rA8nPFfpCGsYXP/YphuLCn/bvhZ2qTzRVN8=;
	b=stRwEVpZUglXEAWG8LKdBNElaxPeEnn3mWzbgAmxaYr6wD6abqeEzsMeWPRMBoI+n+IT
	 0Di3ok5XEOlSnWD3JHx9/U8y91sN1D+g2NWv5ffEHvbYgdTNUEdSfpkjFVUQhTOayKYu2
	 6SZcxAZNDRuoiMug0mMf7C04WtdAJAqsk9Xfb+Wto7BTRGu41LKSEF8/ngPxnoXK6KEi8
	 qzxgektC8r5bSjulJ+deO6pSmP+w9V0whIUyqjwN5eybjL00Qo+wLUwfmXsNphZIXaXAw
	 MmDHhZwpu4CyITVtPpOp51bxil0RMS0nPPBu2EF+D+W1mbGCYdwh8fcQErlUODJ4SLQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791052693;
	bh=AqEoDnd1rA8nPFfpCGsYXP/YphuLCn/bvhZ2qTzRVN8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ol59FGRSoxAd6KvtSLoelW9RVvDlkUiiI5t2/09JlOd9NSTaO8FVAO6h5ZrAWrqiw
	 UlTfKDxwveRhwkWfvpTlPELr2HgVT4ZkJA8MyxeMiQx0AipuyGjG4JADsmwFEnCgFG
	 fbLtbKyTsvI6w4or1RU6F44TGsji5wB5ARYYiRrQWEmP65erreE4b6vdzk8QgRlYhE
	 t9DvNxrvN9sEgpPRUbM7kj6axDVkAvkz23IUUVl+1sWss/KlfsIhvDR+qicNKc//ry
	 wxrtnva7PsiKrdi2QIGng55vYMe8ZNrsQbJHBLizCKR9AOrBFQ9aOicB46b0S/KxTT
	 BXcZSZmwJCa/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 229D681479;
	Sat,  3 Oct 2026 18:38:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCB48435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD3DD81479
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1mRARBv3SYZ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 18:38:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 222DA80F82
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791052691;
 b=skX92B00ux39ztd06kH+DYDTTfRYisI8ADhZhgTwti+F0AMck2Tvyi+C62//Xg4en5P5
 3KA/v0ZQyeApU2fnv4B4oDaMyvZgGzp9oTd8zeNk+fJCD4+lW4hgmuhNXAMLiHC3oL0V8
 syYJoORHBoRe9UZ7mfPqCnUGp7Cm8V4bC2JU8sINklw8H2GS0h39J6vuJzbNaS6g1f9V9
 e8lzc12W8kLsqsRHt2Wa0Or03V+XzHCT502mRJlbHoRDIVqYScxoP97NZT3/0vhDlR1h/
 sJ4Dhm6cb7avI+lziDrGfvQbesvf2zqDBg/vMeqwOQAvMzvRttcbiyGah+JUT0mYCsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791052691;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DnwDDlJWsrkveiEJ/1agLTXG7A9rrNdSWUI62gDH8xI=;
 b=nlQY2/Ci2wX9vzbIAGwBnGnxYbbEcx8amuGh5rlUx+Z0NHV+I7x+EzzJS03RgbyiuUF9
 /U85h8IJ+yPQor5BSAhOF3G9gbAlE2IBC44eGaCwFU6kqjMMKdG2ispEhJNMDOtUdGtkm
 ReOW72byV9RtrWvnqzdyxDnecx8TCeduC0MbhrDoh8Q4p3qDeuHK38Q/bm7I+YXtEijGH
 /xLA+ToekTQ5iYPDhSqm/IAsV/nr/IsSAsyWficwfq7mWFPq98F5rUfwKjxKmLi8XfbPF
 t4ceyU9r5NCch7IV0oKyYJ5ZECpZcAEa4A3L1Zt2Kn8wIW9FGbllb5wb73AI68sVG9w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 222DA80F82
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:38:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50C7E886DD; Sat,  3 Oct 2026 18:36:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 20:37:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9722f61382cd86a55e80585af3a088b4d121def4
X-Git-Newrev: b174bfd0b29b8ad81b4e583c022aa6449a6f237c
X-Patchwork-Hint: ignore
Message-Id: <20261003183656.50C7E886DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk-bin: add proper CPE ID
 information
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2979831506527648797=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2979831506527648797==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b174bfd0b29b8ad81b4e583c022aa6449a6f237c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The CPE ID on openjdk version 21.0.2 in NVD:
https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:oracle:openjdk:21.0.2:*:*:*:*:*:*:*

HOST_OPENJDK_BIN_CPE_ID_VERSION has be overwritten to match NVD's
versioning.

Signed-off-by: Bjørn Damstedt Rasmussen <contact@bearware.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk-bin/openjdk-bin.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 5f1922dea5..4a21cbb460 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -29,6 +29,11 @@ HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
+# Override automatic CPE ID because '_' in $(HOST_OPENJDK_BIN_VERSION) is not used by NVD
+HOST_OPENJDK_BIN_CPE_ID_VENDOR = oracle
+HOST_OPENJDK_BIN_CPE_ID_PRODUCT = openjdk
+HOST_OPENJDK_BIN_CPE_ID_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
+
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 

--===============2979831506527648797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2979831506527648797==--
