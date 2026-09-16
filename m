Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A07C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A7C660B7D;
	Fri, 18 Sep 2026 13:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLEOz1AfbyOt; Fri, 18 Sep 2026 13:05:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 86B6160D70
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736750;
	b=Qu0rcu7wVwce+LJDbnZ0chW1hx3zcklcSPHWrS+PXFt02UuZ2HZGo1avGg9dpwZZVJsX
	 /R3LwOAdDpjHoDt4i9OOU5Cd2TCJH2NJ5kST1xmeVuKzTMEKGUVbjTzN8in2Eb8XWYTjG
	 FHQOyDqPaA0z0me97jSJnHUbv4j8fXVKdy2R9Er2imG7LrHpDcmMWbIrAB62yfQlKF0M6
	 tv4+O6iEF/IWMWhLSaFG0A8ejoytJiFfLm1PVKgUHI0WT+/tnWAIR50mvzJCc7dWfB1BU
	 rkOsRgBDnsP3qyfHheVuxFIFyNHCa4dkb8Z52mmHxlfTVhChcPeBML8yj10bJHv6M+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736750;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JmHCQJ8XAdS3TzHrQfFG2mYDqDGLiguRb9uHm73/neM=;
	b=OAYuqqNnL0BziYslmmWAZZO+UyZ1c8S26mArJnLgpKS0ZxqL73VNJ0Rl0S1j8FKWZ/YQ
	 d1EymhMla/DZhIXQcV2vOgljrqkmHn62ReylKo13jBmOe24cBnAOZ3e0QvQkl1M//FJGS
	 idJh+wGXWCMoMk7mKxjbpNSn1JriVZOmAN+M5Hn/Zclxpu3TLFUMEkSTlA4i0iYfpdAa0
	 qJzqsL8x0DOtQBvstBKNMSFwAU3FQuv4/YuDA6o20kAyuU4WOQpLymerLDZ1yHf655vFy
	 fg4ih7YIKJo01bJ58ulMCkP8AoNoKomFbhb8ewAKIIY46Gxv6SQPqB/USw3mwpONVPg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736750;
	bh=JmHCQJ8XAdS3TzHrQfFG2mYDqDGLiguRb9uHm73/neM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zy0G4z1FSXJG62y5ZVMQ5yW5JSH03MTpSZtPEanIjt7qrL6YMD6cXIOLUZerZ9cAQ
	 pmLcqLnAl9jFCbFK3q2as3UFxRNl1Vk9Ne/sw9nlVQWwS9SVBNQHLdYvwulD1745Qd
	 jZDUjrOOR74k35ElerAGzQBxAuUMlbE/gP8Zm/zqEefLG3LjjvAjTNGOpuqTNflUGC
	 7i00tLQ1eJr8HYgwu0D+vHy4Vav3AtACxFh5ZFoVpQeuQHeM21cJelbZxCg0lHONNR
	 uAD/8ifeu2RBR4ue16HTes7dktj2tOS5qSVq1NKwTd4F4vla7IJSwLJvxj5LJLhLQ8
	 aY16uVz5zDxow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86B6160D70;
	Fri, 18 Sep 2026 13:05:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 410B542D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3239E812A5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15WZERTKARq4 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 31F2C81283
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=UTS7V3KBDb90syQn33YUEfYVJ0B0B9Mgs+yfHxhbt+nyXvkFZR/ElenmQQXPybkNU4nL
 FzUDzR8PLHEa3qpoWlHdEehy5SOz/PPCO3Nkh7L+xzJbtJ+O04uH8NKB4//ZPQyVpy9sa
 lrK7H2dV41kINwwkdJIuNyKVaxg4dB9NOP7Kbl+B/znrwzdNEfqd5ZVywn9C1eUjG57XH
 Xh50AqZ6eCzaEEVSHDLoDFrjIvuShT7r4YdIifcY2ovOYbtM14ST1pMoALhCmLjt4W2rG
 HajQ+MDwrhuhv4gJ42SByzsby7Gal04SO66MdrAVgKVMUY7cRf14fcdWFzFTtgvIOrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fo3FgH8gQRTr45afcW1ou7lWlEyD6WUHXCcmzGTaLkk=;
 b=QHjyVMuWfxnshySzxlU9yDjT79PV7w/L2n1v0WAOyWKqJ6CVRxd1/jy80lDdBqwerG8x
 vPodl6iejowy2EI0yRxg8ThFyiNzMEGb+ur0Y8QL2ft59rpZLsn5jBqQWypDsdJaKeGDo
 z5yxgCUltox4lywnYyVH8C5KDyPDbsBx3HW1/+4M0NuhQmdS/AAv19TP2tCqLxn632Oom
 2BHDFp8/5fZIM8RUIaZbYy2mJqA3w4BjWyqOfwvqdxpTlHFquauPBPhbnmAoJ8RznIxW5
 7IHffsLIIi3/uFj09aAiV9XMZzySOjGpNaqydYUxcmsLjflPima87QDABN6lcf3EtGA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31F2C81283
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE84597696; Fri, 18 Sep 2026 13:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 10:23:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6ca95aa8371adf66af77bf6bb9d8943b0137e97c
X-Git-Newrev: 09fb13df0c58ef507daa671cd13b9e93592494ca
X-Patchwork-Hint: ignore
Message-Id: <20260918130439.CE84597696@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpcap: security
 bump version to 1.10.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/09fb13df0c58ef507daa671cd13b9e93592494ca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.10.7/CHANGES

Fixes the following CVEs:

CVE-2026-0799: Access M[] safely in the BPF interpreter.
CVE-2026-31912: Mind the program bounds in pcap_offline_filter().
CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
CVE-2026-18313: Fix a memory leak in rpcapd.
CVE-2026-18238: Fix RPCAP_MSG_PACKET validation.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 446c0f85b8cb39c360fe684762132dd26a634dd7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 098b059fdb..87cc77338b 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.6.tar.gz.sig
-sha256  872dd11337fe1ab02ad9d4fee047c9da244d695c6ddf34e2ebb733efd4ed8aa9  libpcap-1.10.6.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.7.tar.gz.sig
+sha256  0b394ac90dbc0a9838ff97468e05c9c9a3e873dec2514cd58db65d859d296e31  libpcap-1.10.7.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index c4feee5766..a501ce2962 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.6
+LIBPCAP_VERSION = 1.10.7
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
