Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B08C982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 12:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FE8F40B7E;
	Fri, 18 Sep 2026 12:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhcT_Ued1hvU; Fri, 18 Sep 2026 12:10:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D6FDB40AEF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789733437;
	b=GELcfzYu3k98DfhPAMV/Qmu9CxHqfR9MwUILzgHSrUYRh5Wdj0ocbHFkFdyveYrl9zed
	 wVN+pREZQS5J4LR6+wfM1pQ5VWN88QubCLXOjLPgOD8Ajz3XZYDvwXgCbb1hXUSb4tcCd
	 ZychznTe/fRieB7ktdX4j1YvMOf+O+kDt14STQQzOMRgI7gXiPtSalOo8gRoEU0RMbgbu
	 hMJ4ZW8o+Tw7w+qMjcUnDeicn2bbTTgver9cJDanySvAQ45Ua5Ta9ZLTAeLgyaJ6L7Wok
	 mfQurgDg/NDNmZQLSZOetw/b8PB5myXVi+rP9y7RBi4OG/KXrEOyyAlGu0iBeBb3JNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789733437;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=+lT4/vTdiguohT7hGQCmY92rRr8Uq8kydUezJbWcvTs=;
	b=JJdwNwu225M9W0ilfofp+JU+D0ZPDuUAWZnsaR4ISEG+ouzebtlJhcCLKC9v9JL7xJ2P
	 WhwU+v3nfI3eP7aGK/8Xo4hGvXU7P6IaMMAAiiZqYBoyBY6Vn8aEoT/VKWGwb0kYwyeez
	 XGLDj86YdC3gnUDB9NI98yrnjopp2QfCbitIc+JP/IOy3G85HFi1fdV9QP7E0E515fyX9
	 JLsQZKG4v+s2XARdIoX9newcMm2xZnKEU9ThFu7D2kJsBv3ymn/+KfOtLTqhd11dB8Ci6
	 xqAboJKVuitMNgw+U1LQffup4GKOFxZaG4FxmHkBqf3K2DcHzQUQVD7D0Utrxa6OdQg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789733436;
	bh=+lT4/vTdiguohT7hGQCmY92rRr8Uq8kydUezJbWcvTs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tIj8x8qAkBxC8bdF8Nou03fe+/ZvNUpjn1UZYsN8EB73Q/VqcNzVNrHqWlPLXC0mg
	 bHYMWpG+nah/Ipd3BxuODts9F7AWtJcZSnjdXbwUABegvzNNfkh6dYx9LiRpafRfA6
	 AT63yBvMRhL8BZTp7Hk5Gmv4Jk//xZHifhPrs2XHwSlCfoXiNKl5TSko03qLDnCEPv
	 nGWEnvpDMDBTAO4bjk5X8AFNGbz1u/HHR4XsCMAxezewJZ0+8tUDxNNiDaw3jTXuxT
	 /fScvnu3BI+49w1FALv9MQFTnhI9EiNcV/C+JDlMJUgUFNzRxQf85s5iM0MxQ/jnbR
	 MMDj1HyMBDcwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6FDB40AEF;
	Fri, 18 Sep 2026 12:10:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DE62279
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4382640049
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJ5NzYbxDeeV for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 12:10:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DA7E340048
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=62.149.156.41
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789733433;
 b=IA+2pQcMmW9su/iMcc5r4aWtn0LloGcZ8pC3Wv7qBaUF0T6MY/pFbv6ARduvwEQH5Vp6
 e0Mvg0qA50cPcgPQ9cTQc/ehqFTtpDbbSxTynw7+wme8QkgDtqjLr0WAWpD8ulqNXby59
 wwqVlpdroysfPoRaf1FT+fS5O3MIPjJ/9swYxaEaxrqR1wqxI6jVFHlarQiT8qv0LD92K
 UOf3GbEu13hCIclPCSwzVZTy3Ueb04iQHQ6Z7GaGnHfMekNJr8GbAd/ImbRJ1klUEoQ7V
 qNBLcYy6eaDiMgD4Vnm7mSPZcgVMBlOGwTTvp1XKKsmj8blEgyQK2p29RSzWedjHAUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789733433;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=JJgJKhd7KXvI5qLH3tT89iuPweBPCTMhcogLXfw3sWo=;
 b=E8OYzvGn8CKno5Gu8239As8adp/w5FDPlrV4NsOirGUvyFE3fgxhRPr4/8yT5eo454wU
 Tj9zSgZjFhkHEf0ZBFIbPdNwYDBSx3yq3+KEiT4ENVRGCUfmVdHhRUKG9OCFFZQN7zRtG
 RBQxHSvtT1YPX5k2ejE02MDmxjqhWTHL4yhz2KNCUpPRUcJBr6fc8HT5AKP2nFn6EAxfp
 RR+8EwjxudYT5qVzjz5brUl8arkV/Xo+1wTQXuwUnl5OGkRFFoLLIM+smbeO5i/aqODlr
 xtQ7kuDmN38CoMOlGqfGpikTQziFJfIQ+5CV+4kRcDtkm9pzWwaq1heZ1gQ4J/JhcKQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=RPkEahSb; 
 arc=none smtp.remote-ip=62.149.156.41
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.41;
 helo=smtpcmd0641.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=RPkEahSb
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA7E340048
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:10:31 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 7XQCxdtuwaAGr7XQDx6sw9; Fri, 18 Sep 2026 14:10:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1789733429; bh=JlJRE5t6F/AAxlBMzNis/ANCbBjFkyznX3M14GpCM/8=;
 h=From:To:Subject:Date:MIME-Version;
 b=RPkEahSbVtsogw+PqZgw7RmQr7rI5wkcYIs+y4vAjHVTsZCl66gkj6CYSK2S1a7p1
 iyX+/A+ATRc4nHgkZvSeQq2BuacNLquJUIYkJp8tRLjos9VTnuqikGt5ImO7suA3f3
 kkod8EGHzogCOwzP1eIiJnT+1xi2NQ3+7Fy0HiOPLvCyT49tfA3dpMPkl+Z90x1dcT
 Cw0kPWi2zkC7uT0yRCmhKxwmB7euTbpxD9YIIExeMi2j6/jpN+aBsRf4XKMO9l/rde
 e5dcACi8yoW7dvPuKR8QZyPZQ6J4Te8C8SbpVhZpeBNCmfHhU6jHvE2SEoxEcigR/U
 QpcVN+7jDoauw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Sep 2026 14:10:28 +0200
Message-ID: <20260918121028.3385082-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfF285hau34leJMx1Mk20TT1/cIUNRvJrgyuAdD/spQm26v5YqxK4ck6SC/27an+OLl3vmdeet+tTfZ5Mwsuip7gEwGb9PIpatWLgEBvZHsI1OIjPXXEK
 u5Rlwj4tFACRjWbi3wHsEsZKC6yCrtiTjT9FvxEBX+qmLivBg/Cy6PnfJHrZK14wl1fbe7Y+Jli68ahfwdZmjCZpBuXe+5kDiYVRP06Sn5vDUW0g8CwVPgL9
 7o1U1wM7jspTx20YP+lCz6mOl0qnRSz/U1JZqbLba3OYI7PP2HH8pHsk1Av0xgEjFgza8EGLidhbY2zu9/S7BrkaDQ9INQwV0qDA0heQSfnHx0szweGT8g8g
 p181ixfq
Subject: [Buildroot] [PATCH] package/libtirpc: bump to version 1.3.8
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

Changes 1.3.7..1.3.8:

b2a58e4 Release 1.3.8
65d2745 libtirpc: Bound maxsize in xdr_rpc_gss_unwrap_data() decode calls
ccc1acf libtirpc: limit XDR decode node count
9c15036 libtirpc: Fix use-after-free in xdr_pmaplist() XDR_FREE path
01796f8 libtirpc: fix rpc_gss_get_principal_name to allocate memory correctly
468d4e6 Add missing exports for rpc_gss_getcred + authdes_getucred

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 0c94fd80c0..ec72a38304 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1  885aaa0b9c348d06dd8a9e2ae0a1a7343711eb1b  libtirpc-1.3.7.tar.bz2
+sha1  fe35ce7e81ccfa974c74ced9ac725207af9fa318  libtirpc-1.3.8.tar.bz2
 # Locally computed
-sha256  b47d3ac19d3549e54a05d0019a6c400674da716123858cfdb6d3bdd70a66c702  libtirpc-1.3.7.tar.bz2
+sha256  8839959bfcc7a0f4c609d8e4f53f1c67ae33de23775ec35beb39ff15adf11920  libtirpc-1.3.8.tar.bz2
 sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index eadacedfcf..243b9466c0 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.3.7
+LIBTIRPC_VERSION = 1.3.8
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
