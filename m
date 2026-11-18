Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED1F606A32C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 21:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I6Tipyl9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=E1xFajl/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54FD5605B5;
	Wed, 18 Nov 2026 21:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZdmBQXZSXpW; Wed, 18 Nov 2026 21:29:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4F5EC608B6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795037368;
	b=I8UUUzj8FL/pXPk72EnLePyHlBC5tng1XT7xFvw/ut7Hbf8qMF9umH5VgqT9Bwru412H
	 r3acfDOXBLL9KXqKkrogBqCYUFFpck8m2IXQvc8jerqNjndJJqOKvpQJfwweQXKyMjRBc
	 3a1D1e9/4fdn4ysjwde5urt+J0aBxhgASqjU9G+8A5gBJ16p1nbnhlcmsiqCJT5CbjoRv
	 zmFme3HrcelQl70cTPisJwkKKNkaOyI5RQnNYTIXOamRIo0I8KQXS/an0Hg9YbZU99dIO
	 bDcRiPB7inhbhzqSjIanCVJ2zdlhwQqTL7Lwcdq6ib6AyvmcX1NxBBMb2V+EdVoQW8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795037368;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=7Z/dknDuUY7KRtqRExsE+Bd/yxnCuOzESLzQxbih5ls=;
	b=GBt4fzKZdxhImd+rjNKjoSw5570DM96+gYAujSvmdv0QkLc5vB+Nbo4ZWBbOcws0uOZB
	 OIjz6uzRrgZoEiXD+P0fbJz8PcIaaH5I7MW2aJno5OVC4v6Q8/Cg/G7E2H11Z0PvP35TG
	 MkAQDxs0bij84DwX5Rx/q5AwyBZNYHnx8lBDO7djaop8i4o577WIhWItlXwoB2utwWSSp
	 FSmMzwRF6/9NdyMw9DRvAMRw20pNjX7wtQ8A2YXxv2jzgz5mxpOwr/LWMGNaJLrRX9K0N
	 eg/x85Q0XKdWEuVlbhOK/0oeurACgQoUUXnMji8UDLhXjvZ7RJwLbnHzos43fkmETyw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b="E1xFajl/";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795037368;
	bh=7Z/dknDuUY7KRtqRExsE+Bd/yxnCuOzESLzQxbih5ls=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I6Tipyl91IH7V7h9vVyCR/cBxeDoT5Hx9jRbdK5Uyg6iubD1PdlQSyp+UTU/HslD/
	 Uh7OJkB+dXcxUD5MawbZ7UTcp3rYwVEm8PCKEvkkc7XubgsO5UFqs4QjkyunF1+CB2
	 zWUMQ24BRqsMAeuNbrBZvfQW33WkntA8KVJGwb4Ilv8obM4IYs3GvPhnOuWkmPvgMc
	 RUirlHDF3M0+tkn0dcVv9OMuJM3TbDxjZk5zgkija1XNLl1Fb9E4fvCH9eVXRvnhTa
	 +rB36XILxPgPMgf3qak9lfwpHAMbAEJ16IOYsMeOtmh8w3RcPC+wpG15OWefTdMT4C
	 Jk1B2aL2+XpWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F5EC608B6;
	Wed, 18 Nov 2026 21:29:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6914CA0E
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FA0F606A3
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpfbUKI1l-3d for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 21:29:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1A556605DE
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.147
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.147;
 helo=smtpcmd13147.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=E1xFajl/
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A556605DE
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:29:21 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id TnDTxCy5rmE5TTnDTx9DXV; Wed, 18 Nov 2026 22:29:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795037359; bh=f1EE5Qt11mfwHghRskNlEbSm4NrONGNHQ0T3pd8CSlg=;
 h=From:To:Subject:Date:MIME-Version;
 b=E1xFajl/Zzsnhlfg4nnj2H/JU0h8SDWpKsR/xg7cdTgTsQUuwyNhbqcnIw9tieeQ1
 lxw0wrHy+/i+d4cMCRM1NtGddOUIvxzFlUEsndYLKW70Tmpjk789sllL7GTBT2EPXO
 9WPzKqDSN1gSFA0HocTcPHtfhElaCmdzzl/t0zhfvTvlf5jovDTCipTKABFVL+qNVH
 iF9ZvUeBcIBaIpKO6gA4nkG53Z7Q16qBFtVJqTdSS01vZSUfj1JAPvcorgx/e01Qxi
 o7em+WgI8C+bu4YaJ2e7ZJN9zv6fSB8AE9zh9SsWHS7sbhWoh5tPdgTLgVlmvA6ziz
 uPIZLuTC+QuNg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Perale <thomas.perale@mind.be>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Wed, 18 Nov 2026 22:29:18 +0100
Message-ID: <20261118212918.956781-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD1/w3+4o70J1w3eyrLMJIP+loz9OSQZC/UE9L3G2mFIo5HAvyMG9bccsPhSrUXZCAJk3ekjjh1meKVFja8Wx304n8+iX4j+VW30TTJMvrsMt25cdAor
 ohjWSgJtyWl6+Ufrua3BrlTnOe36S0DDkZdnviFG40KKvNHgVlPSp0QrKiZWd1eteszED/rDTbXuzC7GMD6l6oISzfMFbjccEkNFkwozxo9eoxZRxqnA9Srx
 +vgOp84QazWx1axbgQBu6rz4eRtaaCFcvX7Y8pZJyR81pQi7cTA4DgEsemKZgk1NC5hTYWwJ/bVIMcqYrdDAo/zhc8Y5G4shjP4njmT0MGrQWvGOyLjfP9N2
 xL/yCW9s
Subject: [Buildroot] [PATCH] package/bind: bump to version 9.20.31
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

Release notes:
https://ftp.isc.org/isc/bind9/9.20.31/doc/arm/html/notes.html#notes-for-bind-9-20-31

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 2d6aa2fde4..b2413515c1 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.30/bind-9.20.30.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.31/bind-9.20.31.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  9e1443a40a72a30272cbc3196d020a6b2e26937111c83e59e101e82e1e3b4fef  bind-9.20.30.tar.xz
+sha256  9bfecd503ec79209d321053689c794da9f8dba993a24e9cd6bd7aa87cdf4122f  bind-9.20.31.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 7fb07fc83c..df1c6f02d7 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.30
+BIND_VERSION = 9.20.31
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
