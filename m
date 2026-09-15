Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E87C88E53
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 11:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE5BE40585;
	Tue, 15 Sep 2026 11:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_t3Ngia2Jez; Tue, 15 Sep 2026 11:09:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4BBD240581
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789470559;
	b=PEIVNULyHrhCpobyyxcG5+05oruoSo+vWMIUz/fxm6i0nW4kFAxEqAjGSMBVq98AXFzf
	 ZhdunU7Gemt9G9R/YIM0dsi7f2gLct6dhbcrOwxgBTc7x99ljedldxd+dn20lDLYSPPbo
	 KHOytECNK2HSVtY9zUZZKf5+HC5vueYLeGEasNl4y8VSivNLsgL/Sw6Q9A57rbInxxJTk
	 nQzIXtDuZ1XqxE7IYQAHULZA5sM6a160PtPQo8+nuCeojiyYdXjTlzpGR/tIAonRCDmjC
	 qfKOr/e7DM+wOCIKWv14vGWb0wGYoB0mt6LdinHItZLlbtCsC/moh1cdVqdEobjKxyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789470559;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=Ar3SeP7z/7hm1gza/JtuoOjaJ9GEgojAvNZdxi18PUY=;
	b=GO6kOth2Di2kGeADEX1+EDLzRRwqQS4pTARm30Dy6Ti3iqDj+lYfdpX/dYxJmCTVEU+E
	 LB51PDwXHh5RDJpGKPzXiaD/0FNiwXOyfyh15pE7CJqHSLsZxEAe1msKj8Abg7bXTnVZ4
	 SgHujpJTkKW7gsjXFFZBqZZzCIi7OElkyQom652fEXQFKehJgaExwwX5r9vLIr31CpDeq
	 k/jVqE3ZQDkpmD+6Mrmmch1uSI2gjgmAVRAYOvniwreR2yIZLJJOzR4CdeAeuUg+8MOGR
	 nnAm2SuaPBvCrj3Gzp6DfKskGLP7LWqzouv8LrogQwtj2/0vnRvFsI3uaBJh/+2oq3A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789470559;
	bh=Ar3SeP7z/7hm1gza/JtuoOjaJ9GEgojAvNZdxi18PUY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cbAc7KkEcfr62RwY14J0tkWyRLHo9YryyuyWl7H9hQ+KnF48Vhgm7Y+gOxAEZpKyL
	 mUVNQeJnN00Ly9gbogWyXRbSYbMmuBSKCfUFplhwGkhkgXs8DKWipc7k+DCCvP1U/X
	 bobjFM9fMmQZA6NI1P/+Jk+puGOk5zZNmDhVsi5VU4hh3gQgOkEb2U/7u3LqPgbd1G
	 rw7re9ce5pPtYOmvDB3dqN4vqG57sSs8KcwvJUNH72s0kmlv0fZiwz429YiOpIcOm0
	 0jbhPbj2Ggjni9dUxGG+sHm8Qx0E2TbFXaHm/aeOt3jgShBnKwluZoZkEg8kpHY8MY
	 JJLJFPWHPvi1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BBD240581;
	Tue, 15 Sep 2026 11:09:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EB6A362
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 11:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 909FE60743
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 11:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrjwDGFrLoH6 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 11:09:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4A3F0605D7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789470556;
 b=ByAiL0WM6juDMlN3bKkTuz+3sDVgjfkn4n8ZmcmtPP+gllIIKlyMlPwpqdg1HP9ijubE
 DQlRlQNsxXeAdcyFruSNBnq2MvhmWXt7V/fNrmEl63QJSPwTVS6Qw7cH3W7cSHx5qTlk2
 ZKryLGnHWq8cUWaG85MjAGTtPRzPMyxK4ZFTYYF1tu5xhXj+efWhbZdeHIgEtyIXvhxMR
 /L/V7yjvLNSnVy8f3yCZ8OqxvCnMwkwSU4h8oa5U3hZjKf+vDQFLhWHs5ryI4bdYHvLKh
 QztWM/TsQHhIwFC0lf7ZaUeJ4+F9LXOIcIFSrzWaMkxMtQU0HPMF86HiA7iaeWefuug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789470556;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=W5mlEQHvZbLwgAesfR7kobipGYYb0IlwoQObqrUjMMg=;
 b=NHfnF65KMkyGyacB4wWG7y6PlmV7ABJOdxaN2MxIfvb3zYy4BALdGxi/cHZOhoMwlBMz
 c6DBBgjpEh7KxIImZwzxUS13QqBsNqsRhBF7uHP8YfbLbWt5I0cNy4ZFpFLnzf7pJcF7v
 WICB3n5foFuZf0AxGGEokpOuXoKQ1Lb5maXG7ZPW4To2KZNDJsvfTZebJzEa+rmV61F8U
 dV3Bl6wztPsLYZwaUNoQfi2a0FLevo10k1NmF18FHPb0bk1kLZBnWqu00wJqwf+oHGRKy
 SZMMKgVfo9Sc1usvr49Tvzy+Fmon8vICwLhUF3SX5k5ne2Fl+S1VVZhpBhIch/SCpzA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dfMJk+tx; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A3F0605D7
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 11:09:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6B0051A0828;
 Tue, 15 Sep 2026 11:09:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 33B0260498;
 Tue, 15 Sep 2026 11:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D771211C7AFBF; 
 Tue, 15 Sep 2026 13:09:09 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 15 Sep 2026 13:09:03 +0200
Message-ID: <20260915110904.1918014-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/netdata: propagate gcc version
 dependency of protobuf
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

Since the bump of libabseil-cpp in commit
76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c, it requires gcc 10. As part
of this commit, the protobuf package was updated, but not its reverse
dependency netdata. This commit fixes this issue.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netdata/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/netdata/Config.in b/package/netdata/Config.in
index 527d4d39af..2c7d456528 100644
--- a/package/netdata/Config.in
+++ b/package/netdata/Config.in
@@ -23,14 +23,14 @@ if BR2_PACKAGE_NETDATA
 config BR2_PACKAGE_NETDATA_PROMETHEUS
 	bool "prometheus remote write backend"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_SNAPPY
 	help
 	  Enable prometheus remote write backend
 
-comment "prometheus remote write backend needs a toolchain w/ gcc >= 8"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+comment "prometheus remote write backend needs a toolchain w/ gcc >= 10"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
