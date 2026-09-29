Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA4ACA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27CDD81235;
	Tue, 29 Sep 2026 18:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKJp_F9jYtrs; Tue, 29 Sep 2026 18:49:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4496081213
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707741;
	b=eHBD1BCmE6a1CUpfvVCtKXGpO4NQjAPveRkMWt9oUTLDDoSg5Q/SBKxWX57DOeIwioYo
	 OH5URomabN0Z2HLmItF5bvLaWMKcGfFkIgfaqdS1yj+P+kdCncCrjj3Ha+7XMIjcb1CRT
	 NBaBXst3JCm9uehDfr2/OICrSv6zsEFBkadjB+o6bzTaS0qFTKbVK256IBMZOe9DPQ562
	 dm0/di0v6KJw++zXig9omIo9yQmqN94PGO7Q5Ail4yC/hXc9eo7aOtWgYZAobMl4/+1+b
	 myZQXsdzYzIVQWEF4L8S5rb2ryRyVMFTTFgNYx8rXolNqoRp5do2A2uNqTtIoBluNvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707741;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XvdpiigyWHxLQf5slVekUF7saI67N67UgLzWE3yf6Os=;
	b=fK9j9zsk+diYT6vLZxg2nIpOC/idQQNmX9WkuSAoRG+U1W4vim/Q5o+68fR00eo4xH03
	 XRpmZTfaoO5YDIJuq2pvSBT7byiwgc86uRzMQ9UIF4yiz8Q9ObN3zAdfS3nIuJaSZStA9
	 A+HAseqTkGp2VrhxW0khoHn/eBgLbIF8TH5uVGafUHgFU8ujsBPfFXUwphwYoejrebAeT
	 J8/jUn1V3raOaf4FA/fEJjc6nwKu7beUjx6jfnaxIR+5s25L84PTJEeymEvD+2wIpeU6o
	 nQfNH69iDtu6H2JTcCFStDNYWY3U/nzU1HaMlvseBOSB1tWN0oJ4QKpSxz9/BTZX/oA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707741;
	bh=XvdpiigyWHxLQf5slVekUF7saI67N67UgLzWE3yf6Os=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SR01eDTG+1MneMnI9j1nLBWXs2K0QvZ9jo36g8hqjqCUz/RV1fWhO5hGBceJMLy8S
	 Q3sqcEBDW0ABgPrFYOTAJFFzHEhXJU2187MLhAkLQlv+qcvZgZ/Cxi7bimbbJq7/gt
	 Zn91SQSz1peuGM0PNqrtORCSFcPWiIwGe44tEw/FYwFA5D3Tb0yCEIbxY+LYL5WwZe
	 YOdK4c2dBegtV7pLdWb4KQmqmx9ScRsd4xS0OiCjUWXa6nHwvnikBP6udmdVvwwtw6
	 NtM2/Xyl27bemNxzseOsWaXS4Nx6nxxdckxHIYfMpaR3qrTYRDMohgBrN8PIUxesCA
	 mhrJgLaUBE/Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4496081213;
	Tue, 29 Sep 2026 18:49:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 921503D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7840F406DF
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9zP_1OivL0Z for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:48:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 86829406A2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707738;
 b=RVFUXr9TkzmH7LcQdnSAoGoTHqlboSoRTFrhKGgKgPKgAJ8ZzRWLv8tqtSsUXwgMTRkz
 cvtH4s/5OcipE7R+GvGK1FkTmjKiAYHlir43LDMi4KCNa3UAHxrq+RXEtE+9trXwwH1NX
 ZTcCs6/mchqQD7GAePdK8JByEtZ0zihX4S6VYIqavg9C7DHDdyYrwmdheLXDX8kVas9R5
 Tzx9quHB/GeaYu7ZUkZ8sqgVspLFWWHa1qkW31T/cxiguo3dULxZfiI9CWdygj2Lz/iHm
 Uo/U4LbP7PPOFKw5K9s/uUXv4kZQXjAIVixWPty/ReKihxeuS3EMnFS9DG3j75q173Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707738;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Jw/B9Dz6WTyYc369jn5fCE56tPjRDnJFzVtOFWdp9Uk=;
 b=I4nhWgh9WEhk3RXR/kSJIihabg9jV/3zt/jQlMzEgZgP/3qh1LXAec6x1MNhxEdbYuSo
 6f2p9isXIwxaU0nKiMjm0GyX2gfZ+FUs+/J5c44cOhydddE9xjMVrq4WIvymlKynY0Dg/
 zQAtXQDGXKqbivMGD+cPBGo3+M5FOVR9U4dksM8oF2VkOeh3L13HGPN13xA7MkylMDZIu
 rsNsg6SNsuZ2mFci3vOnqi2gxhe+JdvWK2LGW/9Wz8gxnXD673cQeTxLp2qoebgFSsbG6
 j9603HTG1SoYB0K6uhBme0UW2LidgIVj57Q4y4YLYoHA5SbfjvANTKt4jG+lX3TgsCQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Is+50Vt5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Is+50Vt5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86829406A2
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707033;
 bh=Jw/B9Dz6WTyYc369jn5fCE56tPjRDnJFzVtOFWdp9Uk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Is+50Vt5nuRni7RS09NGSjtUPaVpPcYypRovEl6EOPEfBUAqnVBV+DTuKAupi4sAY
 mKjdseTeDgoZWInFXEMjdVfh1CnjfPbrd1P8Pf5oMpsPuIsJe2o02k24Yz+vth0vJl
 ozPXefsXladNebfZvz44t2857aKgpiLEBpg62O6c62C7gvD+RmlDnqovqbaygBRctz
 GaZ0msdPBRnu269aoKcSqqu0wNVEahyUDhos2DZmKVyOZS1z6SNmZhgTzr1aBQvmXh
 raIO/FjRKkRha3UpkO5LDv5knCGSbMUbiLr9vwg5kUTfrdSi4bvSax23XA31FqY+PW
 jLTO3pBcsbm9g==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 O6H1s0YhRux0M8e9WNyqQdctt28ePpg4bpbhxckPymzjdu0ma7Gd4YRQ4rFJzi2HvnOdgzPCU33
 8SJ1DFeYlbTtXs6PHdwjb9jpjLfdipzDL+pK+BYh0GZ0MrlqBBp54BFZCSlKpKizumbxRct1Jf+
 6te9JaMoWK1UDun8fu7Tr/rWCTkDC+xReEazal2MFXdeWNQC6Nr4KAJydO6Kk0uz/ifLmTiWge8
 z2cde/IbmlRY72bHU2KIv9yWRtuCcAhrWOs076yVPYKfxfAi7/GP6Yj3SHtJmLIqqddsXh5t8Jv
 GXu5Ys9/EBmbY62WrwWBPkk2pMtViLX3sXGdk1kka0KALa3At30Up7YDMBYj0m7mfYnDsTfhewA
 emHQA2+9ce3LDJGNcO2Bu8QLhORbj5AxbkJ6o2H1p8W16g1Taa/BKexrFyGkrlowOHjcS21H7fg
 /Kf7hUnST0fCHMGM3VCOT7lf7TC4OPr59SfCXkBwCfnN2gRelYzfOTWofFJyAqkzixlB8Fd7NAy
 CrtHGqwzvQIulvErf9DjDWnip+V613hRir9fKimG0GN0NO4YT99zEvBAKwnp9qTc5EvSLDQwGTX
 W+ZpEYK3LFWGQ4vwgUEULNHL3hfaAnzoCvCRv24gu6k6fxIJ
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 427C1A4C51F5;
 Tue, 29 Sep 2026 20:37:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgl-000000006Jn-47i8;
 Tue, 29 Sep 2026 18:36:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:52 +0200
Message-ID: <20260929183607.1849293-54-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 53/66] package/socat: Add support for OpenSSL
 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..6c53500d02
--- /dev/null
+++ b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 07:00:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream: Submitted [socat@dest-unreach.org]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Downloaded from https://github.com/openembedded/openembedded-core/commit/aa435ebaaf7446ec07a88586f2de4109e02a2d38
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xio-openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/xio-openssl.c
++++ b/xio-openssl.c
+@@ -1898,8 +1898,8 @@
+ 		  case GEN_IPADD:
+ 		     {
+ 			/* binary address format */
+-			const unsigned char *data = pName->d.iPAddress->data;
+-			size_t len = pName->d.iPAddress->length;
++			const unsigned char *data = ASN1_STRING_get0_data(pName->d.iPAddress);
++			size_t len = ASN1_STRING_length(pName->d.iPAddress);
+ 			char aBuffer[INET6_ADDRSTRLEN]; 	/* canonical peername */
+ 			struct in6_addr ip6bin;
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
