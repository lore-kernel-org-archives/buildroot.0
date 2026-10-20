Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DC5606A31D
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 21:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Uidnmo7a
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E3E560730;
	Tue, 20 Oct 2026 21:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-dZqqo-m3xA; Tue, 20 Oct 2026 21:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A1D56073D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792531095;
	b=Bqsd1HspYbE7e4YDJyqkyqNQEgm3cNzQ0lYmm6dHpyOaYt2EWBmBZd0ELPirz8skKvpj
	 OJ95Ujgxyr8ktnf0ApL48C64rZQszfGYhmlaWq9G+jEC3GvdLe+DDdZ9AQOq5IeqkUWfl
	 QjJpGOuh2CXcjY9dp+FRiJCTc4F+N1W+O+rqTLq15haxbZd58mTT5EZzvIamtROw5D7X9
	 fXnhX17XWmKk2tJC7R4Uft3MGBmt6MyltQe83+lPINOlSrXH55YDndImm+s6xgdfbRzG2
	 plxqU0Py9wJeFLcakF0oZkM5MKUBugZP6LhK5w8RRgXhXqyjTTp4dBfyo4o46sWwPDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792531095;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OpSxyP9Ek4J0jxkp004cdCPyMG7ATa0ZCyTNv2JQcG4=;
	b=bC0u/YhcxGPoxCfroJ9DycYUZr+T97hX1RB6/JsNezc8stYkZQd9DRAVOtVRhr52lYXe
	 qb6gvMpN4QzfaoSDuM35kJUsXJAM+VleWXxLdc5yRwL5jOyLa6L2AAmKZgRbDRJ+jQ9+X
	 5N1aMsTfcYQ3WYWUnS4tPLC4pWgSsIhJ3toHcq5Y61LpPBriKDtesxVyfPXbgUAl1nzEI
	 Rq4/5tBuCnH/OWfL0xgQdDBPf7clvAs4XMyRjd0WqQXNXUwNqCv7q0hR1jrr3IQQcTFWV
	 flrBm32V4tCFg+rLUNRi0ORyQ97WkRoPwKrvwpTgVQXRfeEOqWnYWjdZz5pSFndeq7g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792531095;
	bh=OpSxyP9Ek4J0jxkp004cdCPyMG7ATa0ZCyTNv2JQcG4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Uidnmo7a4y2keq78w+lggXMVzBSLcu/zlGKKR0S8mBcfHFILfbRTG4kgN4isjncMW
	 BCimzxEHT1BcNsdEUP+7UZq3N1hsvSyw6A4czh3LAPR64rVP4UVvkqIPp6Gf5s8OS9
	 51hsdERwo111egccVCzBDawOr4H58Y/oLCQxB/kcBtaHAt+G26Fxo5qFADMDurj7yl
	 rIls4rO+sbR4Zy2BR2wsdoZnLPjxtC4lKbGpxxx/O29QzQJ8YJoaII0tbMx6actggK
	 5amwOdv8eTWsPAy2QJTmMztP6PFC5wryR2VnqROzhrSw3IMcmzaaimDX/HMXoKLdG9
	 JD/QABs8Qhzjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A1D56073D;
	Tue, 20 Oct 2026 21:18:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 976333A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DA3E4006F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eopDQbdua1vY for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 21:18:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ABB5E4005E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792531090;
 b=k72nTsK+/iM5/XQM9+6p0ROtkgLl31OcRShaHtTN4rzC+l84ZhBVnUnwpcGCcNaztBKZ
 Ena+TM4a6y4X3bwiZnPVABbGoYe8Kiwbv31jY4Xh8dEtphwRChNmfK8WBBF0xJM5o7Og8
 cUpiGBnooncCZV++Oi+WFzcutRtx8mjTB2LPLh4IjvcOXBalKVStfFfuAZCB1LvUgc/xM
 vrnL0IZOhYUEy2JM02fmKppHbdo8zxBlrJC2FkdqSXIR76Ck/AD23JAOaxHMBOlP6lpEk
 7NBfZp3xYxcQp4/su1Kd5Uomy/vW8yTTPyyPz5wURnPJNUcj2upW8CiN5Pe0kV0I/jQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792531090;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1CMDihGWtLRRTBw/3n0AeZJLtx1GOUz49gSa0T3rZPE=;
 b=UTQVuLfHYj1MJuNR9Xp8tgSL/HeiaYpEMQeuPKOrjZJW+4X5fLIbQDpT1ikPQSSbPK6h
 /FxVSD0UjkVnZsu4Yml9slSqeHL2svaDZh83ZW5YUiUWWiw0vTtugulonVHkDFKLcWOvP
 xU+rHrRvhR2kjPzbicboHxWZJlDUuU4EIUAAopd/fer0dm4ZIbz+ux3bt7I9yvhD85hdP
 N1bPGs3rLgT4xVjZXUtO5JDIEtmmZ2pRhg083yN2iBosMnjRysZohFaSmBBYx6ljeNdAj
 XlIqFF59vSTIqTR6Y0IqWiE2X/RBhuUFaXOoN6jcMnRMmeeyAEPMwkJMA3a8OaxvcRA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABB5E4005E
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DD38999AA; Tue, 20 Oct 2026 21:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 23:03:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f14e138f6f643d208455c500ca3ba7cfa9de30b4
X-Git-Newrev: 854abad276a73134867fe2fac98333a120b8f197
X-Patchwork-Hint: ignore
Message-Id: <20261020211647.6DD38999AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tailscale: bump to version 1.102.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/854abad276a73134867fe2fac98333a120b8f197
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

LICENSE hash changed due to changing AUTHORS to contributors:
https://github.com/tailscale/tailscale/commit/3ec5be3f510f74738179c1023468343a62a7e00f

Fixes:
https://tailscale.com/security-bulletins#ts-2025-008

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tailscale/tailscale.hash | 4 ++--
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index e2d600f03e..5683610ef2 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4830cd822a838d5d44fd5eeebd07a2aacaf0255fb3fb7d3852d57659f54e51bc  tailscale-1.78.1-go2.tar.gz
-sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
+sha256  a4c0e5916bb4cf5a8a46791788534e8931a622ffac32dbff5bd8f21df7272029  tailscale-1.102.5-go2.tar.gz
+sha256  a7ca6186a7963a0a60740f6047760eecd7a0234e8c38bd7e1e0bbcb324bda45b  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index f231022476..9c24d6aaf3 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.78.1
+TAILSCALE_VERSION = 1.102.5
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
