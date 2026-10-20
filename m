Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0C606A32D
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 13:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WxC4NTBX;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim header.b=i7BRLXfD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF01810E0;
	Tue, 20 Oct 2026 13:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DI0-x7kM5BOX; Tue, 20 Oct 2026 13:14:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CA7A781004
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792502084;
	b=p2jUP8eBPG9ZAFoSZqT/bhqvYq2rfybT1qsUVBUuDZGAocgAy+I0+dwaKP+zXkL9NnxN
	 Dcj5L3C/gPyvG/SsN4/PScJwFgk0qJau8fal8rKu8RCblK/+fMRB1MvEVe21NYwQeOKlA
	 X6aMrtOgLAXUgs8cZ6e5w9CPrVRSrAih6Kkw9w250yjMC++x6+cy8Lc5yUCpug0be+o88
	 Iwzq3FKyOcWrUAUoOwJQ5Fr8I4smmE0HXaGnK/1lFZ7Chk9+NL6WF8aX8J1nO4VBW7Bcd
	 F+ZmXBlqdXNgwqLbmo/C95m5FGdC7Apr2smpQZ923ISIsalxWy71oFS2ytymYCddRIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792502084;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DDnjozbjdidyvMBIupxnyyhMvyVunnKBl/tJTG5dfWQ=;
	b=A8Wu9YSjT97Ta+VrqD0aaTu1fHGH+LzD8HjTfrSlPR1RkR9kVTPtkIR1m17eoGUZsw8m
	 /lquW1HgMcd9xDUaXcz3rIehUgE+TRbHI5H0uKedwhyLvK1oHXHJmak0E7Kemr5GQBrit
	 UCh48YTkerGmfmGCIo80Udb9cuigqA4ezR0aKp42T6JU8debqqViWbBMU2yVreSZdZkx3
	 VVdNY9ZI+LKuDM7ZDqbwKch1w4JZRwCLW7ezdZlgy73OAX65NVlFXPkTYOnllcdwoVWLL
	 qPykDm1za9A6mtmQqfH3XoSCADDkoHxhM26puSRAzO8cxnb4d2mZA8U3S9oEY+6GbVQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792502084;
	bh=DDnjozbjdidyvMBIupxnyyhMvyVunnKBl/tJTG5dfWQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WxC4NTBX2LejxBfCzyiofBrgeZ4r9rpFzWmw65oEjiVbreX8HNTd1Zp3FmeJ/Je/f
	 JJVSOfVBVUzdYAkcsk0CG3WDSQDu950txSXrYlWOA+umJrq8BFeR4FIk345qeT35QV
	 MButzSwU/pmmvLLro92j/8eFvdvrXa2l+15PYMfqlXNOZTY2o3GdlM+u04jNNaG/j3
	 ta7z++dKudlEqG3hTeUI+9aOOegGKRkdQuhNnMWUZYuTLHDLUc+oOjeWg3W30wrUrr
	 J3+DGvS3tL1gBUumswxM2H1mXSpyXhli0GMoEu7gid4dDWmEWBf8FRdiTJpy7zq7Zk
	 cZdaT12s7fq2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA7A781004;
	Tue, 20 Oct 2026 13:14:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6469675
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 361676077F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdEbQ0EgGkBZ for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 13:14:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EC44B6076C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=136.243.2.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792502068;
 b=gND1nKZO7sR80m7ewpi7r6ScrYGiIhOGm1k6JfmDAHPXbKP/lvr1LrAlyWF0UAay2L50
 o2rhR6z855EAvYFN+QN/L2gX/B9hVWqt8OBDAG2NSEVgir8eLUEA1IVkXxo7gPB9dTMt/
 ikVDi9eMQoJgwUE1/KBkOZz5JOc9ZvECz5/lnR/IqsqEoere7XBNKpHUY2jlUdOjhLgXw
 99gavbmNVcsR5KdcBmiT9qeqpd1C1MgJ8kzwaFL5uI7lwKDihIhTQ81b1/sOC2mEMjBj+
 pbvXSyD5ZevRSIY1V1XSMNmagAoAqsnAWiawsgdrpx8E3Z+UbXHJuPd3eGVjlC0G/uQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792502068;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2osLiUfTFqx/0v0WdJsH9kknGUT1XdR+QzZ1htllzFY=;
 b=KB4GOLyJpaFofVafG9DO8FE2fFBKpNWRov7P+eDEZdBuCp0996jYHSG5eJivLNbjvqHZ
 dWhLfZHnPoOa69Ao0t/t5l3T6gv50vemrVTSqeTM5oYijxT44+89GRbUXSwBPJ9NGOjGZ
 xzRNLIuLYt8NHZe6JnRuFUBugdR45iHAPmVgMQgGqvfivx5A+MTQv/0P4hHB/PO9bzoe7
 HWd6MyeKEBOmoWZ55wLBwzF9JkiPi3oQmQ65XNZt+FY3eWmxJAT7rDY8mFQTeir2ViIay
 EImfQdPQXV0sKCu14xd171Sxq//ql5WH5eW77Zh7UkCIUj/wFiPox2t5mKezKmdUxQw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=n621.de;
 dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim
 header.b=i7BRLXfD; 
 arc=none smtp.remote-ip=136.243.2.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=n621.de
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=i7BRLXfD
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC44B6076C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:14:27 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id B0D4BE0023B;
 Tue, 20 Oct 2026 15:14:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n621.de; s=dkim;
 t=1792502063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2osLiUfTFqx/0v0WdJsH9kknGUT1XdR+QzZ1htllzFY=;
 b=i7BRLXfDMufuBKgdRSgJKBIkf65Gv4SEjgiIaRclItp/zzCZZfNTAhGck51kUYww7lhnYd
 AHASeAtXjn+JpAxduSdb5xwtMKv+GwvfRqquZXboInnNGDF88UdepPVhYuG1iImzCUh9mI
 sb9vL+DAuN4iBdhXM64OO8iz9CXkprI=
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
	Florian Larysch <fl@n621.de>
Date: Tue, 20 Oct 2026 15:13:58 +0200
Message-ID: <20261020131404.7333-2-fl@n621.de>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to version 1.27.3
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://go.dev/doc/devel/release#go1.27.3
https://groups.google.com/g/golang-announce/c/66pojueaQek/m/tmWX2Pq9AgAJ

Fixes CVE-2026-111943.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6a4b03ad35..828f809395 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  03495da2ba64894d40f5c4992e49454fa78b50690604ff92b6afff5081b76e62  go1.27.2.src.tar.gz
-sha256  93dae4b7f463ed1e9c65e05561ce9fc5f7cd5c4ffca5e336248d48f3a2eab5fc  go1.27.2.linux-386.tar.gz
-sha256  ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5  go1.27.2.linux-amd64.tar.gz
-sha256  94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8  go1.27.2.linux-arm64.tar.gz
-sha256  e25a174051d8675f87ac720aedcd25bf89ac652c4b82f26aa47919524725ed95  go1.27.2.linux-armv6l.tar.gz
-sha256  059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa  go1.27.2.linux-ppc64le.tar.gz
-sha256  dfd01d1e08e4dbece2cd91e259953f87b858752037fd151da2f674c4fa09aeef  go1.27.2.linux-s390x.tar.gz
+sha256  6e7749035cf360f06b2575d162ea79df9fda8ef671889e5c375f8e50777f26bb  go1.27.3.src.tar.gz
+sha256  cfc243057c03dd131413b91269d16b5061f87f312059c1ed78681cbb95d6afbf  go1.27.3.linux-386.tar.gz
+sha256  65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40  go1.27.3.linux-amd64.tar.gz
+sha256  a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49  go1.27.3.linux-arm64.tar.gz
+sha256  d6f4e11dd7157030d7ac11c51c8f73201a2db932d593c3106b1da11cc32bfdf8  go1.27.3.linux-armv6l.tar.gz
+sha256  f180f01943865b7942ab3b4acbab6da6f0f669b61da999d004d16c537a49f7b5  go1.27.3.linux-ppc64le.tar.gz
+sha256  62e109a6280a073c9025e1b51ea298ec1d3575d3ce62238721311f5ff2c854e6  go1.27.3.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index df6f0049bf..88b4163ce1 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.27.2
+GO_VERSION = 1.27.3
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
