Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCDC606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kzxCLtKC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A6C0406D7;
	Sat, 24 Oct 2026 21:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9FayUU8O7Ew; Sat, 24 Oct 2026 21:23:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 377834069F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877008;
	b=Wt8E9ndd1XqkNgUuk5u39CcjSQudhQvEfrBKlfWsWWa5aJdtl0VDcbG4u+pvIfiiKMF7
	 guUwuA11DBikV6euagvpOM772g25P3c5bCZXxJqOey9G0rbT8NlfxnLB9lJAdf8bmNsRQ
	 C7+n/tIfwIvj21sLsvFjoChYPWUGImbNOFnYHoE1ExbFWGBE/CAGHeO83CtoCc99wUGR4
	 B0zSzHa2zjmjtLpZEuVtOM/aZMku/I7KjGYBhJ3UojY2gt5wtRPD6W0ZRMtiHU7kdUWpw
	 tW/sO6l2vCtKntRkv4fFxX+0SKIzK6QwCu4Eg+HVnDO8dKa6I1208wOcTHd/v2AGPNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877008;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2/fbdNJyK8Na0e+O6Up7vETDeVj/axRJUjAtr9UlCL0=;
	b=o9va+qWFuYgiK3B/EQYappxjhHUOBemIO5AqdoagZovbxXwtcoC39QP+brDnjMz68EFo
	 qF3OAWkMSU5dlxoFCQeW/R1dYRny8UDZ5ydh0o0Lg+2xMbaM44M+QledvPjV7MWQnz96d
	 /H6rZ6wVmMNrKnb0c4Ay9glYdbn5l3pXUFrizRxwsQmQxnHIBuvBBAOLtg1rUbfqmZ4Cg
	 SwuY6mWsoJvjCXKZqg2c3AyyHhVs1PCRrdBBW7ri2PNTEKqWzYS8dmUsxkDmTdmspsWlX
	 MRIfh1d0NrMK25UBFsOYzXT9nbiB27gaHZBk2ZR+9AMtNeJWtHE0zjRZ69JXfF5T4Pg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877008;
	bh=2/fbdNJyK8Na0e+O6Up7vETDeVj/axRJUjAtr9UlCL0=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kzxCLtKClWaj3hRUf5E5KwLmtktEu7h2nLYSxCQstARsUzy88GAzCGXn3bDHLcl3O
	 1Nht3t/VqI/zQVbtCYwWvEc0dqcReEz/06vGzBhkNbfljR+X6TKcR8ghGE0By3ImVB
	 zd016iAGYgeyL4YlDn7nmHliYZetVtWqNpGU8wmGN9noxgED4yDky1Bkt5I2EEApIf
	 PYmfM1+8XvOwxY9CGDVQdru2iiZl1eFkaLMfm2S+mwTHNfj+Jt0RKUXGkoBSTJ+RYs
	 SgIU27402S9qvx0gUesiccdxIA8VPRDrmqOcekgI4zHxRhwydnZFGwKbN6gXoE85FM
	 URq8SAfF2wIMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377834069F;
	Sat, 24 Oct 2026 21:23:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 355ED380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B9B74069F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJbThXk3_bRk for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:23:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 352EA4068E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877005;
 b=PWfO1uXxWP367VFAeeoOzCWknsOIB6ur3R8YmZJZ1vuw3Cpe8GWiWiqG97Q1PHCw17Ma
 xouj7IjH2SxkyDINGMId6NZ9ZB7LubbLu7R6uMr8ktsu3+QVwcwiZGJwd2mR1U9mqaWle
 15GDvIdmSs8m76GvOxQnIHKA7oUNerb30k2V3oSysHrdjKMUGXizRbaf/lwpY3Yx6H3v2
 4ec84j3D414Az7BSBrQ160qab8xWFOcG9hU9YYtfhZ8LjuUoVR4ws46kxjydsk385eJH+
 K2RrrYhG7csA0Fvqi8W1scMRNmNU8dBgMD3rTIV1ulFUT4WJRwkBpLvNH0mK9gq3/FQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877005;
 h=X-Greylist:Received-SPF:DKIM-Signature:Received:Message-ID:Date:
 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
 Content-Type:Content-Transfer-Encoding;
 bh=Av0LHS2eMHdR+Fgc9S8bUdDFvgYj02P6ilpyNzlqSAE=;
 b=AX6Vd9vLbL19oOjNjFfyz+eo6qbI9DYtcAZ2V00u6Jm6aU6NVGe5tM9eBoMiga5sYomi
 YnyZondc6sI92XMFEefugeL8YBVwhpN0vDRrbL6c9DWT/Et0eSuf3KZUPBEDeFdNdgOkY
 ioSOs/A0cB2l3q4lWi9xd4OOVPIpEVg/Uj+AGkcmrav+eQDLJRSvW4YmhmrO65/Zr57ga
 K1s8GZ36Hs1f0cCb+qVq41B6N6Nwmh01RYPonwVVcuuV2iKdaoB26TbEHYixk5rZAIzIE
 4li067LWvQJ6gsjK1biGNUcEvtdqrC9rc3aHS14wpt8aHszXRxtOxQga3H0kQM4c73w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=grenoble.cnrs.fr;
 dkim=pass header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=kWBG5sCN; 
 arc=none smtp.remote-ip=147.173.1.68
X-Greylist: delayed 513 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 24 Oct 2026 21:23:24 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 352EA4068E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:23 +0000 (UTC)
Received: from [IPV6:2a01:e0a:1164:dba0:18b1:c327:2b47:590b] (unknown
 [IPv6:2a01:e0a:1164:dba0:18b1:c327:2b47:590b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519) (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 0FDC8182A1F;
 Sat, 24 Oct 2026 23:15:44 +0200 (CEST)
Message-ID: <f90ec3b4-bd18-4f71-b4fc-eb2c385a9978@grenoble.cnrs.fr>
Date: Sat, 24 Oct 2026 23:15:44 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
Subject: [Buildroot] [PATCH 1/3] board/acmesystems/acqua-a5: remove
 linux-headers.hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit a8b9c6f9f512 ("configs/acmesystems_acqua_a5_*: switch to
Bootlin glibc stable toolchain"), the acmesystems_acqua_a5_* defconfigs
do not build a Buildroot toolchain anymore. Hence they do not depend on
linux-headers.

Remove the symlink linux-headers.hash -> ../linux/linux.hash.

Fixes: a8b9c6f9f512cc3ef18956b53a99b93ba74a9e8f ("configs/acmesystems_acqua_a5_*: switch to Bootlin glibc stable toolchain")
Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 .../acqua-a5/patches/linux-headers/linux-headers.hash            | 1 -
 1 file changed, 1 deletion(-)
 delete mode 120000 board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash

diff --git a/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash b/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
