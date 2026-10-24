Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0A8606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e2jyTLh/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=J0SDQ7E/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78AD4403F9;
	Sat, 24 Oct 2026 19:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGaBQ3vjm3O4; Sat, 24 Oct 2026 19:28:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8D928405A4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792870128;
	b=PpBFCMlDz4NmkmcO4M6pidpzFciwgswcnEUBHCy2KSIevu4JqRmwTZ25YoefbfPw15FN
	 gOmUjffd7/7in83gzZ1AVr0fx7WV9/ixN23aXVNA9KxcSvwoy+MfMTTG34ZNLQNdfLxYH
	 VtVbJJMHfY/tPjEGwjG2R2YKy28PCcFFtYk95RyhVQia/ema+6AWX5L73cjjYHD0No1Ql
	 nRaKdvQ4nRwM8hdFbNQaYYSdIT9i000NeJdYBWFPZzUJdf/skrSCyPriKb50jtmxdF0xV
	 2pQdei5dKGbesl0nHMe5TPlRLOOEy5T/tAoXgdCTFpAn7jBfa9E/O+iNKhma969eNGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792870128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZP+zpfVGgbo+MJ0wG3aHy1BesBBjrQzjjql4LMXFKo8=;
	b=jr3wRR+70DXDBpat+c6XxYaiSnh8DIfWVb3+K6a4cJGnEKjHyiHrBJbzzpYkyLd0riz/
	 C7Z9TQOkcF2KSnXhBx5G6f0Ss4rYtomPXtEjdxcEO/csug8zl0DK132EwfyZqzgaSwuID
	 J7KmrMWXmSM96LeHNPPRXJXRrdMozPHijXfK26D2a5ngHJ7BBdmXXb46XPTxMzhquVU/8
	 pjuFfahmgI0eW/9PCDcSUQw0cm3Ime/nLwPsBzhlPopkQqJKuprhU/Rwia+PaQ/CwXjaR
	 aUi6Qw7dStexEMnDV/UnorZgt0sj57BwMvg6jyjWUeGAFAMYAOa7QD27JVz2stfADhw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="J0SDQ7E/";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792870128;
	bh=ZP+zpfVGgbo+MJ0wG3aHy1BesBBjrQzjjql4LMXFKo8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e2jyTLh/ZuDqX+bXrlGYc6L7g98iD4KRLLxUTEZ0BywYKkK5xYFGgainYE3YWJqBe
	 nsOUfFTaLDOtB8Lao76BFEZ90yUIurTxqSKelBqyapOOBdr0CTqpDBwbXx6eB5FfWd
	 tkRKQyhgdXgAU1gk6wgo8E4IE0MhiB1uD8pGIgMl5+QvnJO5UDQi+Vxk1nejfp7Gdz
	 Wx3mYfu1Dc+CYU4Erx2udj0wLzwl6NRzQWrHO6ON/qjZmjDsqTtMVJd5EQYTnAOkQC
	 dT2Px23OsjLdCnk9YYR09tp5qH4ttoWUEWGJ9RYdaGOl2qwb+0dPsJfaOjeFdMdeTf
	 THYDAsCHGT2AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D928405A4;
	Sat, 24 Oct 2026 19:28:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C14A3D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DCFA40514
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhcU147wEBUQ for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:28:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1ADC0403F9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792870126;
 b=aXLZBjEIvgW5lHKuwXoCXWsD9df3rzYPNPHaIrkt0mc3M5PBwCXhVimF0Oi6w+V/NbkS
 xaIAB6YCa5XBPlZJAdqpVfYz2CqfBeuExO2brNib6ziPNhFhijRau2k94KLy4NndEvTAn
 727scjsJvhnjZlDAsvsDIkxDfI0u2hoTCKXRVPv4vQuuoWrYfZ1j7OUG5COJc1gOt41MQ
 znes7DRA06hFcp/jobrAQ55JrOmri3L+tZ8MTlZ6bbDzPTntz9gFpA3O34Aivj/ezOZPc
 GXRzlrjMKiFI8MkNFAD0ZdfxnbEWMS4hLvig4Ier29NS0N4EBrlOX+CTrphYa/FV1mA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792870126;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=x3X/vVVfVfZ0AP5dKil5TE92pkNRUVwcjsb+NpRA1PU=;
 b=HLuzyOamHK7qjILYnc6uv2/VzlKaJceTjlpEU7+XrTy5jDwVf4DYMix+LUy6h4zBTws0
 511fnjhqimADH7aYoLU7+5Ze5xuaDOXDFMbbL1VCF9mn+d73lCvvEQxKtllIdn8N1o9Av
 AzG08Jl82oQNAQ/3N4VlS7Ogbj8xKtAeHZ9cpLcBKWj85sq5HZ9XTEVNRtee/nlb1k0tt
 otl+/2wslx5QEHTHPEPlVIWtTyF6g26Pqn9s3pM85gcF4U77v7HpgPVkN6HwE5rBT5Tss
 eYZ23UFR3hlo9QNahQUM/3J/ogKn6wxFpL5aXIX8wurmWba1lvx2Vx/9jE6pJQPHj9A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="J0SDQ7E/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=J0SDQ7E/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1ADC0403F9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792870123;
 bh=x3X/vVVfVfZ0AP5dKil5TE92pkNRUVwcjsb+NpRA1PU=;
 h=From:To:Subject:Date:From;
 b=J0SDQ7E/naDz76Ku/KVT6o7PKv9AdoPlBFTse6ACYU8rAnQCuZP9H6ibJSKSYt5MO
 aVM6JmHq7lE/8Ex0LG+oBjCMHHD4KQiFAYlng3nfP1cefG/lsLKju5M6wCBffIniOa
 IkXbMsZwp+jpRkldxXRhy9IeSmQXJajBMImG+EiEpfC2eH2DvD6Zaa5ryZt9AurmqT
 dMS7240WRvFxeU+yLFg6qpRbFOFPq8JC5jQdfZEm7kAJKEU4tChgcaVIWiPnVpcF7z
 zX7e5ZPWbsU+j3h/Vn+RktzA1iANNtlk2pYIgb5YKNCl+6bbQcBC4QnG3uK0K0GLaE
 5SLmPHfWBAMdg==
X-KAS-Sym: v3:f51bdf72230551df:LeAQDhOZ1+2ikTUoEi4XGJkQ/1RsldAnNoHtMl3bTtpa1
 QgRdRdE/7tGnEaFOAdpDbPMF/st29yIzmPop0e4lw4HlCJ4Z1I5xCOY4eSSMRjhkc9EOQsJP2hn
 88fD/gpnAW7gBNYhyQPGbeTJ17pQVnyHOt40t93aySsgjkceVjlHHmlT+8O34nVWedBCUrRQibH
 PhX9lR6x6PNR8JwLugdvEWlWcotyxrgyx0/pz3e+HDXX8M/YwhEjSqT9fkGxXhmulGbTc8hGMnS
 qMNyOHHC+ql7tS5zz1C3YNMZ6aRQtTQUCNKFXiz6SFN3okdKvfKrHxFJhQlvejRGJSHmgKug==:
 RQR0J72ccTzmChTfTsL6jVjiN857pz/2rJYVjgTRoDlgJ7hM48wwYqPamtxIs7g4VBvBxssykJ+
 GCR6lttKruOXM7esgPCMCYzDTN31gZ97t7FwlrBGD4iFZRNKjxRbpj6dsPwN56reK41L5VLHdlB
 L9ANmmynmOkSRtFfgbBsQdIS28Xsq8/+SC7SIC1C9z5/WCutbLG8dlaLyzOQwAVQ7qCXNtqkm3o
 OXoOtJ7anTPtlqyZ/RmlZwdHnyVIdq44zx7Jp4/tA8XHi4NIGWuRZBAmziq5ESblvK8PV5QEalH
 d+hLsF1xDE1U3S6qHJlaQ46cK7OG4jQ3A21xAqxwfJmUMPdEc4lfIkFJJW88c7PKplPar4Nm+pi
 cRyDB38T+n7XTyTszyybC0JraynxmJJq5Y/nwFJgKVmGjJpibRNpiqauUzoWJrj0vUuIRFqKodL
 OpyEKvUJ5mpHe6JgVGRDjVHU1LNpWu7LOnPQIVXfMUqkKNIrRSAe9nYSPALYe4CaTaVGniNZXkO
 bLAjZfoj9DpXw1Gc8myVsQwk5qv6Jzagyr/r5XlqcNcL0GlnfYehWI2ut9+voLl0E4qVnwa
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 45E86A4C6948
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:28:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36982)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKhQ3-000000006Jq-0pEq
 for buildroot@buildroot.org; Sat, 24 Oct 2026 19:28:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 21:28:42 +0200
Message-ID: <20261024192842.3292701-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 7.2
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v7.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7ba891c56a9c6b141228cd3ec4bc4848428f2853

 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index f19f646832..58b4f60cbc 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  4d78c26edc0255bc92f4b995b5fd66108d75ff966ed4694f6025a6d370bc2496  ethtool-7.1.tar.xz
+sha256  44256ddf4631ed08d816b7b8725f4b2e0f05e96b8c7ca64ee5c81449da2b6507  ethtool-7.2.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 77798971bd..82ec32897e 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 7.1
+ETHTOOL_VERSION = 7.2
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
