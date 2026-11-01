Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69588606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 10:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LsEzOAiV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Zzz5gAze
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4598C80D7A;
	Sun,  1 Nov 2026 10:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zgji38CFr_DJ; Sun,  1 Nov 2026 10:49:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5233A80CDE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793530167;
	b=h35ECFHUtMRL4yDXUi3nnmTJEDPPOafjz9xQkznp2ZypUEgXIM9uC5qtNiq0Vg/qTsGj
	 1YGKxACpQo2t5zSivzm4WUlkkjtZMj4hvlZUy1pp2Ee8yHQCueuBg559zDr4p08k7ol61
	 lJjo+aVdAtydd/mGOZaRSaNphogRTOjWdV8JPaFPxWOoEXBOYGflOhZNbNu2vhW41DVeh
	 22ZmqkzDfYaZeGL4D7wQGOTnNKgU41riohY1tb2l/hjf/4MG+Xa8SVRY+wHMgH3Ywp56l
	 OqLlxw/Po+6KQU+9YVLgqRMQpRleau4bZqFXFAJxsyk86JKGdmcDfTr96XGnEZ73exA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793530167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=I/ek/qbXIpqzw11xmw133lhA+NdG6BjlL/f+yUeO9Ag=;
	b=ebSYeqy8LuwcKLdGXWw/Sn2ZxWcka6z1hHc3eKhZZdX/ktOeQABNCILh894P9atN4Vus
	 5kMicngyKB5u5g2VgHewWgdHlOydPj9uIfvvB2QGl4ofMWuB80jJbS6ptGEVv/X2kKzrQ
	 cMuXt8h+azcnbjgPjpBkFLXnfiaIE6bo8JeFy4JUKUN3uA6pcMAi/CCCA4IJq9uRJ64Wd
	 4JiiOuc1H9CuQBvNc+4J1jK/GygJzhlBE0JE5UAnz2dsqrL/jK2BO7gprcXTlC5V5pTUY
	 xlYJbjTNwCSiJZF8/yM1TajpWYNCypVq3mZcCUwrJBVAMrFvBSBXlYZbW/fOyQwcK0Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793530167;
	bh=I/ek/qbXIpqzw11xmw133lhA+NdG6BjlL/f+yUeO9Ag=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LsEzOAiVcvaGB0GfxYMVIUw8ydW3xecY5nCP3B4mChLP2ZaT8tSp/gWxZbZq//Sn7
	 +Oxlo3DeWIJJpYklRfFERjrYn0g6GwhG030mEYhXmfXvlgEIVj312WGk+4wHVNDBHP
	 SrS7gJ/g611dKI8P0SagT5uL513gmrh0ZKYEdWD2HXuaQCUGoXZCVskvPNlhmjYyyM
	 iVUAdbB2licMgf+yegoEJvPe0gQJvJF/qzab6de0NsNwlF++6g1wEhKXj3XyJZE9Ex
	 6y/xo3n0iK6cs7Cvuw+CElglMzbmpityBMr8A+BB9vwZDiIOZeFmh5Yj7yDoEgr6KN
	 SuFgTcNJd2Few==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5233A80CDE;
	Sun,  1 Nov 2026 10:49:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE6EB2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C484340042
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ln-y6C7tPzAF for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 10:49:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F110F4009B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793530165;
 b=Zj8umjlfMUOAx51wDsM7ih3GNTiBwrakcVhOCtB5soDpMvLZUuj3SRcGnxBzCRHLb3Wa
 bp8HIXAk6B1SSle2sa2ttbaOFEUJvEVndWTcIr6GHBySMV8POVKzFLaE1yalGhaTI+YQ1
 LNTAV2f5yaZ9g8PEt5P1bJREkmKWqRCAfItdZDEq8mfejeOfISKfAjzJWIBBxvMJMg2jW
 Szk6O7OhFiilM4adiHp3B980XNBTCgV6YAPjWQ4reNnj2LPUaEbQClNXSP/JbSpYe9twP
 Zjn3k5dStTO0yFOEkiLXWHkxyyBQWUpH+0E+HWnqk15l254NUTtb0Nhlqdbib4uIwBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793530165;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=b6QVntD9p6RvYjdh4Y5CB9MndilcofUBiUETDJOE6DI=;
 b=HvZJAnPksUKmwOm+eYVOAUiZss62LyPNFbOwUWVq+1udaFgyvA9BzdLsCb4Xrv8W7UC8
 v3CXHpozLCRUnoqi3wTVpSsyF9RvtwVwfXyUWsPcF5Muw7vo0lkQY2S20HPgcqh9OcnX7
 +5Ozs68XLh7WzHCdQGY/Zh+NI/ZEN4TdgZg5cOJD4+qR86pPBKASKh8tsY5DDMi18+QRR
 t/hOTDd4O10gvmxDScY4gKHb2SGDPJB7soc0RKpSfkrt7ZpQ6GOpcgJLeUaEpQYGUR3JX
 ++DuKpx2fM+0bvqDkB163PbOIYlh7dVFvTUfJ1uHdQfJEA1NNpDy2kTH5asdFMczC2Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Zzz5gAze; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Zzz5gAze
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F110F4009B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793530150;
 bh=b6QVntD9p6RvYjdh4Y5CB9MndilcofUBiUETDJOE6DI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Zzz5gAzeMJUSjUlGtX0FVxXS5bj3FgKopbU22EG3G3YQvEUZPf0qYmAiPsQyOCtvT
 gk+mDEfzprR6BSGTqbCvRLbxV4CQfvQPjlTNvdt4AGmfX22knrR/h5X59vyZ7QwWKd
 Hl2zLwFCLz4tm2C+xy+SoFullHFB14+b2Rpfg2iAWae9lfcAmFY4eE9u7m+DcjO4fe
 v9P/RXuKXU+fkEzcy8wSCAM0jUvuNsWTF/+VqIC7wtS3WQWDI0Ac4IZwN1k/TotyzT
 w0EFuklRIT8wBsGFcn3khcml47WNsFZvHIb86/Uy2cTREuP2Hmo6/3wy0efXtc22YM
 klBujlvcbDfDw==
X-KAS-Sym: v3:f51bdf72230551df:ucr7yDXRooWdslSDRqcvcYDSgJhetnl3KDrZuVM6Kywq4
 vP2bL/whU08maPRhLd+FSCef9vnSZC35lHpFL2dy21u4T2gVVboWp98rCs80jHag6st+EioXS7x
 fp1tdFDXbDtnJ8UXvra5BJnUbhuXqz+tTX11gLYv3vjqRDHfVO4gddIYzgUm5doC+RyhT4S553c
 gX7leJ6pvw5lR1uI23sElMEqtBgPRpmIqDE3uej1DHjNW/WV+lJfjXj1EqVcMS5k4/qyOz8UK3z
 idTcP8d8stTEAOnneIvM6kNfsA3Jvuz1xX9hDulWnvZzK+fxs2O8TfNboe1TVIItYWk7tWDA==:
 bXd9zd068H6vW+CKQ9CwTnf9ogJMgVm3FWp9DbmUZIVYNp/npZnC0vSIkL6g51npYPJRUZOOpqH
 JIffY0x7LWGJoEDbCCJhEyGIG7U90n5uwScMTn8+Wqnrzm3yiov7pcg535O7H4OQIQ99VfGQjDZ
 sc75S9jGyPDTt3/vGPMG4zrC/3EWRgjBtjpFGchv2FoEltIipyM6I/3QOi65k0AKkX83SBLrFa7
 rdOq7EOum/TMJGOj1dLEa3HMDf0iTGEB945AoJ1pmDsxGiDCzskUWrtINhzjmVMym2UDT3GlurA
 tLXxQEtjlXirsIniQWUOf2AY6OVBOrvR3t3yErOKTH20S3bXOO6zYyC2UVlkc1ErxsPxacWRQkq
 /yzXSbL/OTs4BZVdZBNDlQhZXksQM2SwXbKepwVCU9xnNpjKa1XnI4pQVPIw/dpdEDhLWPTwYsD
 xDga98AFRg0+XBl0sNiIUMczwX4FST5rKcp0RaBmy1cZVy0zZh0KFqDLXNOb9opTDkcqFrRpQv0
 ooh2a91t1XQkPU7mAmSVQ/yVUUsFvAtbitgpMDncYZ1KyaOasbl7I17skXs2oBOWomwqILa03+u
 d45j3A==
Received: from fli4l.lan.fli4l (p54a1b880.dip0.t-ipconnect.de [84.161.184.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9A702A4C1AA5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 11:49:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46434)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNT7e-000000004tm-2GhC
 for buildroot@buildroot.org; Sun, 01 Nov 2026 10:49:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Nov 2026 11:49:10 +0100
Message-ID: <20261101104910.1700974-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101104910.1700974-1-bernd@kuhls.net>
References: <20261101104910.1700974-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-waipu: bump version to
 22.10.4-Piers
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

https://github.com/flubshi/pvr.waipu/releases/tag/22.10.4-Piers

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 08a15e9f84..68efb3a6e8 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dad83d50c2cc4584139a1e3b6def77c23ef800f69e5b4ccff70c54376e14476a  kodi-pvr-waipu-22.10.2-Piers.tar.gz
+sha256  0ed514daf78e805c02517f3c9a7c732d235ab7b0f9897e82d68b384cba724154  kodi-pvr-waipu-22.10.4-Piers.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 5f86322f65..9ed62e0da2 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 22.10.2-Piers
+KODI_PVR_WAIPU_VERSION = 22.10.4-Piers
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
