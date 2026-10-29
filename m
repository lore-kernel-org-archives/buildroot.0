Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF972606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AGw/nMcF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B77460A79;
	Thu, 29 Oct 2026 21:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKUhfnLhBBT5; Thu, 29 Oct 2026 21:36:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 955B660A7C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793309809;
	b=P2H9PF9L1T/kBlL7/H0L5BK66timxKCFCzmm3OClhaYTKnc5NQObq03Rx4Ec/Oa7zmHn
	 gjCQUNhWrmC9A3DC4wctYC1KB1anB9ms52TD7Q+Prxe+Zmi/qRbgyEfsVrP0/10OkRMcs
	 fgg/k2DoK1FH9YXHf1oTYseRgbsP32u8haK5uNX4kHIDghlcF7OIGFOJhRyleyt0Y3pV8
	 1ZPuGxeTmrCNFalAbzZS9ZMeQ50OhLFe99yLRxSQD1I8feQvZuwKC/nGwpoNWfDtp9Iur
	 OBjFH4TotX+r2qNjiKByGjYnv4MkDSySXJyAHrfckqZ3wAaR+mL8Z2QSxFYBeAj0F5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793309809;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XRVA/8+lfQbx9SWipBeD5tVErqhLBJnObdiaufZeG8c=;
	b=Kh4E7BCSjdo9R9eYDQr6h8LxL/kfj5j8z9CLkICZUqonhlUlxkwtqbRk2UK3dSqf7z/H
	 CqPucaZZikR+HCUM+rhhlDmGth8U81LOpIUmyg0vdeRjKlIZhq8y1yZrdFwNYILeVwjNm
	 7L/uTdyUAp8XNAA2Aw09wr9sxhErRFmKUzI/mg/gBHFALKgMn05g4bd/MDBpmxZe0iMoE
	 BiEgwBXc5/TWv4buWsvM401Q+jtrEVjko/cCw3k64f05Yf6u7UW7NjmEcouWo3h+sGUtG
	 hVc6JFuW6nrIf/2KOrsbgyvsfNqUZwtiby9d4iaScIguGC3dnCrUGlRAjU40e1QJvFQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793309809;
	bh=XRVA/8+lfQbx9SWipBeD5tVErqhLBJnObdiaufZeG8c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AGw/nMcFBswt6+0ZbnU5RS5UCTwiCVAZElYs/+hP98KvTfWJJW3RMD/F5ct/RjVyq
	 7t9UGx9unBneTGqWBDRytdHyoRoqyTE9mO+OwLFI5AqPtnInlk6pBj1PsaOnYhWV2x
	 kQku9MaMfFSdrF6GurY6fsFSBbESgGYoonCBhqQwoqCpuXqfNHFi45VNhSVvH4U4gJ
	 NP+/WRbuYNO5RQDdhgPw7fqurdmf8ipTp/2Kdx8nrT5jHvpCq6KYEroIXzwQqbyvia
	 +973Ns280CzWbBeS0TNTyF3/IH6ggph/cGRl0/DWmxetQaDHqYaEaaGQpztZyGXDnD
	 DGabFzwA0/WPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 955B660A7C;
	Thu, 29 Oct 2026 21:36:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F32FD1DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4A7340A6B
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiOdSz8XtEP2 for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:36:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EA8B040A60
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793309802;
 b=QWEFex9u4E9fws4g+ofjOsAPPg//YqNwZpR11j1Hiozfk+pJ9Nvfw8YuRoRKFE3pyv3P
 49vt3VVqoBEQPxUUmKFeqCmg2Ipdf+FJUEJhrP7JFAIU+oCG+jVfu0XHENha0u00JXoH0
 vkoQldwYdvTWnTps00X+UKNiSdadKh+1l2kgWUjs3js1+3DILW/HcsFdAbcrX/R/47/5n
 b/M5FfmOymdtU0deYvOlJTJpz34/rcyAzm/4yLTie2uGEZOmUN4zIBt137r/3eJFKWiuw
 pU6ThOwOHVEv3iWqV3OK7f0hUWDV31I2Tr/v7vfrL9s7GnVRCCl33iPnayRPLzaX9Og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793309802;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XpeDEbdZuBKcI+INdbIeHYFtSSCwswBCihpclouFobw=;
 b=UpOnI/IDn7vO+6DzIa7OB3+p02V3T+uFGkBsVrLcXgrydDPgWnnXG1OL4kY68tE9dTCo
 8G5VlKMBAXuoBMC2Xc85tle5+9LqpyxFnSlB/tpjNyWR7yUjv3GQnKdMK7JyTNjpK8duF
 dDdWgrNcJP9K7LII8nn796Tru67reZi2+nLulYJXmh4KyBD+SYLZEtBrw3mgcuKTCZaDL
 7uiDByBAKKlhFVkaYgFSqat0zFn5YkEHohtZuvtjVFvCHBlZiOt9fp3WMh1AOcuw66uoY
 /g6XEuvWxlIh9uTYJmJD6BBwGYYn+jeYdpgzj0P5M0xnUobzJvOg+YeNM5y1V3r1dJQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA8B040A60
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A8BF9D301; Thu, 29 Oct 2026 21:35:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 22:34:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: def7f1937fc8385d1c21ff3cb22064264aa5747c
X-Git-Newrev: 7227d18384e2807ae2cb25a67ff0a2e0bb6d9d73
X-Patchwork-Hint: ignore
Message-Id: <20261029213514.2A8BF9D301@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 7.2.x,
 6.18.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7227d18384e2807ae2cb25a67ff0a2e0bb6d9d73
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{6.18.58 => 6.18.59}                 | 0
 linux/{7.2.12 => 7.2.13}                   | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.58 => 6.18.59} | 0
 package/linux-headers/{7.2.12 => 7.2.13}   | 0
 package/linux-headers/Config.in.host       | 4 ++--
 7 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/6.18.58 b/linux/6.18.59
similarity index 100%
rename from linux/6.18.58
rename to linux/6.18.59
diff --git a/linux/7.2.12 b/linux/7.2.13
similarity index 100%
rename from linux/7.2.12
rename to linux/7.2.13
diff --git a/linux/Config.in b/linux/Config.in
index a722031fd5..9d17fba318 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -183,7 +183,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "7.3" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.58" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.18.59" if BR2_LINUX_KERNEL_LATEST_6_18
 	default "6.12.114" if BR2_LINUX_KERNEL_LATEST_6_12
 	default "6.6.160" if BR2_LINUX_KERNEL_LATEST_6_6
 	default "6.1.190" if BR2_LINUX_KERNEL_LATEST_6_1
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 27bd3da1d9..2f6ad625d7 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
 sha256  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953  linux-7.3.tar.xz
-sha256  bb18468a8dc8978aa00caa6446e753f7b6da3fee56b6b7f38b16f9430ba02d4f  linux-7.2.12.tar.xz
+sha256  08e7b0c4f2dd1971f972da274b5e589a98989390ac56acd7a1a5af922363ea6c  linux-7.2.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  069b19f9032c4dac8149ae4b6520c35debca0f42a9f6d52ee55ba6ca9b818013  linux-6.18.58.tar.xz
+sha256  53a55ac9863a5547e292b8e381d4e4c2240dd1127d5428a7c44dbc550be23963  linux-6.18.59.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.58 b/package/linux-headers/6.18.59
similarity index 100%
rename from package/linux-headers/6.18.58
rename to package/linux-headers/6.18.59
diff --git a/package/linux-headers/7.2.12 b/package/linux-headers/7.2.13
similarity index 100%
rename from package/linux-headers/7.2.12
rename to package/linux-headers/7.2.13
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 36d72710a0..100545ba6e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -487,8 +487,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.58"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.12"	if BR2_KERNEL_HEADERS_7_2
+	default "6.18.59"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.13"	if BR2_KERNEL_HEADERS_7_2
 	default "7.3"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
