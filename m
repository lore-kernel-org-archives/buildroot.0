Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FD9606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e+0nIOle;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=WnaL1PfX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC34B40A33;
	Fri, 23 Oct 2026 14:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4bxf5ti71wS; Fri, 23 Oct 2026 14:55:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 198E240A50
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792767345;
	b=nSUTPtfUclO8KYC8t5QLKnhLMkvVKm3iD0Jb9qaBcxmj/OPzgnfuuBJ0jOy/P5SlsGeJ
	 giY+4FvW08JCcgYFHiY3Fz9cES2TUoKh0tC7e6pybRGSn3fu7lC0rt72/6KiZ7nSxxpFE
	 jJu6FIhF699Yf9aUMA6Gz9LWdPjmZjU64JjGrrPZyczaP9eM+ou7TsHFUuxuyd75hgFsu
	 i0jyvhHtviRD9EmGvCQR8M0Zf5lcUilcZj5yh7A7thKRHcSaoHf4t8d/OvBPrGCbSF5v4
	 euEntIYGDcXWqSkeXcdAzMMVzQ9qkp6fG+6z7oz0nGjIyPY1Eu1cnbVOkhpwDYlWQyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792767345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P/A9E22ROqxcTUNSvw9VYtnEyAUpMUN/79A8nq3Rgu4=;
	b=i1DpLr8JYBkrsPPcqmDiLL+57ePAL76j3UFm53SXuP+NSfm8VIElvW/3PE9Cjgl9dqo9
	 VDnXYlipjdpoLf9O9V1ophGmjhLFI8BN+XQEZEm5WLgOTjRXHazqzeWogxv0io4ZGePXt
	 FX3E9xWluFw10nHD6dPJHQZyrPPfkPAWQkPrsBOkepmBmDHyxni6e4jbt6cqvvsYO+fY2
	 dOt+0GFQGVYKefs4feTQALcmhhz+1u23p3m/Lm4VFu+AWi6a9C3IIigtCInPzw13NU+nH
	 A1jOf1zeqtwTMdFQldo/TjUO2W5rpnHW04+VyCrXoD5Mjl9CxEMqi+3ZVZe7JGmVj8g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792767345;
	bh=P/A9E22ROqxcTUNSvw9VYtnEyAUpMUN/79A8nq3Rgu4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+0nIOlePPw9Adf95Gceru6WPPBp3lO/8pRLUTkwqW+qTLknP7Z4gJm20ahkX+wWz
	 AmlW0GqQdOdjA/4QMD4y+jNpC+Yl2LthSUpd8Iagc4ZLfZ85f26hwXOz4LASTHtQSX
	 WBnJqYSfWAlPy/i+LqyGhJ5g2Jl/zzA0yCxq5EW1Pkb+fWcaWaDCt9y9X+TqjM5hnX
	 h/8Wy5qZ50AQqOxZhWMCw9SpcIwVxgEKxoFxmY5KA6INXh1oQaiajKkPDm4JqUsidi
	 G7TlkT5OxrfGAaQ/Y4XqG4UUkRL710j/PtvmJT3hXzAnpMaiF7obraWOB+3cBvO7wr
	 FPXTr8wl93Xyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 198E240A50;
	Fri, 23 Oct 2026 14:55:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4870612C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A5B560616
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtRpjWnB7Kyq for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 14:55:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9F52F6067B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=62.149.156.86
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792767341;
 b=e9uCooIK0nasqSUP5kSLlmFSTrkbt2PVOPIDbRSXemFqr0aDviAmBSZGq7D28fwtIwQM
 ACjvGmU9ygmY+05wc8rl67qypeCee4UmIOqcX2upDMcCsjxyYcQqvB9kfU6lxI0l/uWE8
 luTS9y3FGMV2VB2SNuhGO6dn4ivFhhlj4lTVjvSLnwEIuIVYG1FCIrSJi/uZHviBMW3Xb
 +Dal9IdJGacoFngSwTZZghxCEdCBZWL3ut9URI2c5hZUXV6XGj/3lyGu/it9cE5ncIUen
 2XuZNX36gR+//861LbUgFB6H1P/XmkKkBLxQcsIZGOVhtxzlnczpc6gYf6T1XnFuAQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792767341;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=7k8UPH0l9TtIKQFwaefB4WtGbsSmu59LViEtJmrMtOw=;
 b=ae7qFFgsvGOKOM9sVzZbz9igNluZ7XIgKoPHGp7255iT9HUkKAw+MSkvR5n+Fd4V5V37
 U8qrrxeTsv9t4rnROZbJTDZJciNOrDh/lHf/8p7ixF1qXgY6QIbzLO72gOo0Y+0X4VIjh
 A1t69J5MHLxjSZkMte73n6nxxORGzGcjYt7dt3e4o5AU38ST5XSNR2rK/WjlBWCFD6Ev3
 GRpaJhq1XueQovDk+GGuAG9JjSmDny1FV0GhHr+rHeS7IFk7Nu8H/S6f+wq6rn/rXCT6I
 GGYDp787D4ZFSAlr+x37ASBJYw/nm9eyJywsI4W56BuBKxguA80D0nQxTyYZyLDUUcw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=WnaL1PfX; 
 arc=none smtp.remote-ip=62.149.156.86
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.86;
 helo=smtpcmd0986.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WnaL1PfX
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F52F6067B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:55:39 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id KGgBxmCEGAFghKGgDxLdC7; Fri, 23 Oct 2026 16:55:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1792767337; bh=frBD6KAX2UBKceOva3t/ArOI+flIoEtXYakUDhF96Zg=;
 h=From:To:Subject:Date:MIME-Version;
 b=WnaL1PfXw/DhPMCT58IYzkuZPCgQJGZYU39Bd8upzCO6vs9Pok7ZApjbIdjFIfjV4
 Frc73o73qXP7PN0RfN6ZEr+2ZoRhIfN9/hwTYwL3jQlHc56GeJ63QIPQBOzZvzflO8
 BOife9X4YKsoKGaMsD0ufh8wK9o51vlyeEEvMW68f4ploilNxn2kxuG9l/TJGnfN1R
 DEc9a7M4DKJKoRNX20UYsYxEJoDvutASzYGULQMwwAICLymKGaGiWXN2DaHD4Su38X
 J/50IUpx0w51le+1bAvTfK6TZmfG+Bb49r662FkyJmnu/JrtjdMWSh75oJnyYV2ySl
 KPnpGTGMsAtCg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Pierre Floury <pierre.floury@gmail.com>
Date: Fri, 23 Oct 2026 16:55:34 +0200
Message-ID: <20261023145535.3038864-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023145535.3038864-1-giulio.benetti@benettiengineering.com>
References: <20261023145535.3038864-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCUjIphurTsYed42IWI10FGJgcLX9YVPq/2QCjIp9CIi0T6zFC57eUZcfHQkqVHrSRYN+dNPsBdmU60orYp3D9hDtXyox1VtEURsyjCvVoPcDSpPeZuc
 RwuhoV9CTjSGDt1X1X/v8swz9E+669xuf/FdRDGTNJ3+ks7D/iEw50lGjZZDMPef4ivfRnxInvWNsPfkePR9Dm1FFalADdRj7x/iWYJW6MWcqL8i/s2yu0Xa
 vtaaPLt5GJNESXjQGhcDuYIxD5GHYubiWxHa2tWyMpOp5wswK2cbU8PSMfIZSeLKYOg1RPC7S9BIQyQ/sqDcG7lJMI4C/oxRGhfZSY79dYj4lCp1gV418k3x
 uOIyWbST
Subject: [Buildroot] [PATCH 2/3] package/libtracefs: bump to version 1.8.4
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=libtracefs-1.8.4

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libtracefs/libtracefs.hash | 2 +-
 package/libtracefs/libtracefs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
index d4f6b95094..18e6631367 100644
--- a/package/libtracefs/libtracefs.hash
+++ b/package/libtracefs/libtracefs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  a9cd9cbae81b7fff71b3f72d2b819e49cec0402529e5f252e1d9319a62a356cb  libtracefs-1.8.3.tar.gz
+sha256  75187bad93e622c94c4a691173e45f08948d38b9a28e9b855b54a3e956d289a6  libtracefs-1.8.4.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index e9e577d985..16507ced21 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEFS_VERSION = 1.8.3
+LIBTRACEFS_VERSION = 1.8.4
 LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
 LIBTRACEFS_INSTALL_STAGING = YES
 LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
