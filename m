Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9352606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PGUUKTFC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B3D3606BB;
	Fri,  6 Nov 2026 15:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFbBSGxeOqGA; Fri,  6 Nov 2026 15:58:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 85B9C6085F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980713;
	b=cZ5fnQA2Hn0ExedyW7aymnIv/t9VJ+I4sqI8YI/mEpGw/fNS/bZyCSVnGzEMyoLjE33l
	 li7fV1Ot+yq3g6ih0RZpsChoSoVa4w4oG9va8RFb0Q3+0irK71ehQGs5IpT3gKC3w2nhu
	 0GzQJvKaJJAnRwXK15qZSo24AJ+zfE+ILVqxVlOqZT2ilxj2oEKEU+GRWjVbqbibRDJ/C
	 sU9jCEJgXdrMb9wZLjowyeVYFyXXfrkCDuEfEl9JU6Fe8O8uGsR7Qf/Jet3n5pu8l7pTF
	 xhGbngeQunJrMUWoEbENVQ4PZnmxssrgsBRzvs/spdyNawZ7sRdAeAwO8clpOa3Ilgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980713;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BGnt+Vh7O78y9IzfgesXNdaOTuJE20yuclgD6Elkcy4=;
	b=byBI4schQXrSOh/IN1G3YhyTc5WW3uW+YhE/kRe0t1tduhrWjHMPnRi0TDAe09HFsSnK
	 hhrINb6IkjR6MLsRwSJUa2PREDPC2yeL8Tk4EbcUZHgqwM9nd/DsTKCt0w4Lq0RDGIjr6
	 1at74dfv4yHBotfQxV5cTTDuEPCUQV5hng/7+uW3XluCwQIlfrznZJD1HcZh9F/We01pW
	 M69qLKWl2TEwVga0bNHYxKqzcEMemskO7yrKqj2nfRpm9rd9+9SK/kYaGuyGdBg+nz4jV
	 fIXAQRTsBYUIF8f01PAZrUcPOhLcrlF7RSLfCCevKDAb5EyvpBWjOPl0uakiSJFnq3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980713;
	bh=BGnt+Vh7O78y9IzfgesXNdaOTuJE20yuclgD6Elkcy4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PGUUKTFCT3U5AJcKT3VgHkhNlIUyEf0ncgGUzSAv7LNZnKxSPoBCQNJJXiWvrkCf5
	 8tInBi/IxHb4e3Vs+c+FXX+e+egr71qEO/s8zntXbYJoFsf8GSRSdd8SncxOrxta0Q
	 mbS5hmSP7sGqK15Pl9kqjqsdqsy04NBkKwL2B5DAF9+lrCtnaHu2tqDaQVkTt2Ow+8
	 7n00xiQ/MIfgHDiq6vni34txKsQHTWAsStxe/yiPGVzzuDMydU0lYhIUW3u6A4Mh24
	 rPh3ClOwt+ZwAp1BT3S+kEIBkoMHkJT5RAYTmWJCAtgDdAH53a1AbSXqR5Rk29bEsp
	 lKJTGhGkqkWbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B9C6085F;
	Fri,  6 Nov 2026 15:58:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9160032A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83923403DF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EChC1O0HuL2d for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E6921400AF
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6921400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C3A39E09B; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Nov 2026 11:18:14 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6e8c29614091f1f0d0964dd0a8cc7d309b83b902
X-Git-Newrev: cc590a05af7976d9f3aa42d21f127557ee3cfd56
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.1C3A39E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/iperf3: bump
 version to 3.21
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc590a05af7976d9f3aa42d21f127557ee3cfd56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/esnet/iperf/blob/3.21/RELNOTES.md

Updated license hash due to copyright year bump:
https://github.com/esnet/iperf/commit/010381c4b8fa19e236db571e787a246c31a414ee

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a9bc1ef49a88515a24b880b5e71675c02584568c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/iperf3/iperf3.hash | 6 +++---
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index ee60d717e6..cce50581e6 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.20.tar.gz.sha256
-sha256  3acc572d1ecca4e0b20359c7bf0132ddc80d982efeee20c86f6726a9a6094388  iperf-3.20.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.21.tar.gz.sha256
+sha256  656e4405ebd620121de7ceca3eaf43a88f79ea1b857d041a6a0b1314801acdd8  iperf-3.21.tar.gz
 # Locally computed
-sha256  7c9ba0385fcf35c4c9e08ad0c0cba72d4315f36f0f742fef4de826a28cc33a97  LICENSE
+sha256  6c6e9abd761ff429c11189cd93bdee5bff7e3591253bd614b253a5f4fd30cbe5  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index bb8eece6b2..bff9a40865 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.20
+IPERF3_VERSION = 3.21
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
