Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B2FC79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E6CC80CCE;
	Fri,  4 Sep 2026 16:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sE22D_8X0Z5j; Fri,  4 Sep 2026 16:24:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7EBF180D5A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788539097;
	b=HuSRhfbEJ7gZntFHt2efz/0wNZclsRiQruNL796X5eu+RVidNyp044pcFXCuQ9LMjFJk
	 S7D4h03ZXbspESE7IuMg8eg2lye6NQo0zEu8S5XmLvwBgJgMx2LTX2BugZ+Ks9kEsx0dk
	 PJ60yvK93vL1zoHeepCmZEkqwpGRX37zx/+35SrDkEN92U+ns2OWaZUFC7c2SQqiDsKUm
	 sM36acYZLFcDdg0GrGc9BT/owz3I5XKkpVnE6WQlnksZYPLM0JJM/wmxsY9ERyp5HOAi+
	 zPhBw9okwoJzWuIltnu/l0k+pEB5CHjXQiMmpr7bYbAzCjUK56vpYf80s+AWTdqgr6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788539097;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/JdwzoD/AOI2Ludk3Nu/CN8ZUsCHLlHiAk9qiV+Yvik=;
	b=pzkRsCV9E53OCFWawYltYJjMblguvqqrydHrwmka336vOOYNuCLiLbFyYKqDt5CHaoEy
	 5sg5SqK3UXDsgLWsC0SOWeQypEM4lVKLA47s3K+hb+0bdAvrwwhfBTiiGKEo3skp3HyOq
	 PxsigN8SUypY7wpWewDwUjnEu/3VI4OBq88181jjsJMkmZ/sK9yVHjS5lEceH2hXX3qpS
	 yE6Dsr6DIABePWUb4RguJG2ewq5eDrX+w4CUDC/U2h+ENRbDUH2SDep8zEPT6oa3Qy8v5
	 ebJcH0kWqeV5qbd881twA6hYlksPirryEm0UFs6nONHOsnYTmApygadBfPGWTLjA91Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788539097;
	bh=/JdwzoD/AOI2Ludk3Nu/CN8ZUsCHLlHiAk9qiV+Yvik=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nSSO1TlTq4HoOVuz8YbThuESqRRgbRuzXTwTOJNIBorvhJCC/Oa/p1+Dz3tZCQhC5
	 8XbKa35rxgi8+O7zwjzkq6zzMTXuAQydXEeMhB4ir5DQhxxDC9UXrEA/ppiMSXe8rI
	 dbyuwaNd/mxoJBu1AxcrPa6LbsYYE3JJB2zOCTY2dSW8T2XC/pjzAlJPiKrcl3dWHm
	 WzfklXHeoLFmRVXZpX/rr8dTpPqWy0kkczSDAz4mbD9O/WvHjPIzt7Tkc0GRGG9fEx
	 MGub5PzIjNeuUl/RGhQOWJ8OVYpSgGkemlBSSmMWjqVIfZsdbrkqjC71SyT2Xx4fAH
	 XS4X9bXZwYoog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EBF180D5A;
	Fri,  4 Sep 2026 16:24:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36CC09CF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CE7F60681
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZBgbkE3YStq for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:24:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 37AB9605ED
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788539095;
 b=Rm7WIAbzWKO1nBwXbp2GXucPRE6TnJJ/D3oTnJM6Ht9dDknaWVgecTz0JLKiXBfD9rQO
 iOGnXI3eJlMtmy3qZRy37n5y7FeVGbTvmw5xN6o12Whn9U6PlHPrirKExhxrcLW62h63h
 jRplfIKggAKP+fsylbcROnGkgmZQrsz1aHOw5V4w6UOB3Ni8uBG2Zl8LOl3DwNQTpHgMM
 e0HBUlCviCFKDAXr0ryNC0m6sj0mbIjwFP1kogIyBTvv9qrJOSn1PYppWUcEyQlmyzk3j
 NFtynfBaDfmwYVTHz64Bu2vZnn2WF2bYwLbgEDXqrg8rauVT0Fg/7iIot3/uSMtNBbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788539095;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=VlL0oCTCUt8nm6AZexhf6sViV8To2Eq6jQ584OBkhlQ=;
 b=RUU2UlT+zwHUrQelvoSxa9HiCA/X/hGeIiHwuqGxs4GBVwI9Y49BXB3vMMP1ycbskahj
 L/bkbDK8HyrSiJKqoQ7dAkF3mCD1aUkdAI791XpJu1uwCyHXFiEQ7CFNbXWsE/pgQzZ9U
 GV0/1IozJzAoqz2uTy4tW/dLf8/ZUvd2VBBUDVdVW092C644ByfPF3/jAvm4ZPGWajVs2
 j2Mefk/a2LWnnCN9F28vnm953LeqD4i/57JjxSBl1g325V2DWMNALWE80tUYMiDCq0ha+
 GjNVACj/OXJ8azhvjmP2RbclBBElyMB3SdQDWGbMjwlRyYWd39466aBcS8hpgH+4CDQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=drnjHJBr; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=drnjHJBr
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37AB9605ED
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788539092;
 bh=VlL0oCTCUt8nm6AZexhf6sViV8To2Eq6jQ584OBkhlQ=;
 h=From:To:Cc:Subject:Date:From;
 b=drnjHJBrTJP+imVxF1z3kcw6nIOYdSSOyjV3jTTXeBOpZ1UE8bRtH3HZa8mbXxyC7
 yo39YCP16tYf6lgKHnWZkPO65FnqsYltcswsNPa3OkSCeJSLJ+VgVQdXIqSBWJxMBP
 T2KAmYBZK8FDTVeSXK2pYGe8OxOe1VKST9ePp8/QmS7wfxIlfPv2CcWhf3ijrXcZEk
 IPdYlc89rOr4kqDbYk4VPFaweNDMdtQvWemDyltr5ZUVUjfaa22ycjp88WncMV7sCe
 14KhPsqLOmQcKpdaFfV5EaRoqu6eP4SYvOmymLAwjxR7c+hhjcq6dsyhyL1PBKUAEr
 DDULnQxcaFMrA==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82823A4C2EC8;
 Fri,  4 Sep 2026 18:24:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58152)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2Wii-000000004tJ-0yS9;
 Fri, 04 Sep 2026 16:24:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri,  4 Sep 2026 18:24:52 +0200
Message-ID: <20260904162452.118307-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.14
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

https://ccache.dev/releasenotes.html#_ccache_4_14

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 46ec78bf06..10256c1741 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.13.6
-sha256  a7de667ca08cf67c3c8af9f213f6aa701a1188a2b3163fb74483858ce5e79fbb  ccache-4.13.6.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.14
+sha256  b093ac5d38204cb4d9f29b0bbd570675aa5a592a78e6675b2c506dbe045234e7  ccache-4.14.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index a7302d6361..0d88545bf8 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.13.6
+CCACHE_VERSION = 4.14
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
