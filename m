Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F58AC9830B
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 17:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C40842674;
	Wed, 23 Sep 2026 17:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qh-Cy9pq6_yS; Wed, 23 Sep 2026 17:43:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8EA42419C3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790185307;
	b=gIYM4hoN4bbTvEbdDaMDquOkYEWU3kLIKpqkfcQS7ox8livBNkGOzqx91KUzMm9GN2rH
	 nnjHjb3eljNUVLDceLDi1DdfLn2E/iIljocAtpKmp+uqliSl//HaSB5rElbLcGPOqwDVX
	 Gdt5b2ci0A+Q8U/EB1cyFM6gwiuANtfbu4BI/dXKFbT1eY2lJq2INnsGKctK3v6VTbXjS
	 KjnD/iWue+LVwUUpp5DbqvyJc0WMWlE5UVblvxbpjsxOeHdEWFqeJfYpstgZRSBCANLlD
	 cNlbtnlpSZVIV6O6QylL0jm7NNS/wHrUXu1bGC9U7sFH34MDakH563VM7De1IsNEwzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790185307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=68LYXDjCCBKLJ/Bs10NsH2RCda3fMCSVKpNzoXSe3Ys=;
	b=kPbgWQoJa+t8O6jBxW6x6b2EiHWB9KNOog7SYxeC9GW7baLQH4XMC8vzYvuJupKWneaM
	 lbGMVSW/STL+f3C9EFO7k4wWAb3i8y6s3EgM8hQQqwxNIOlC+LpCNlMPnROPW+mKzDmUo
	 u1vIVdtJedffKaeIGIUBFcTl9kuvntBXbta04pg1VqJhjbv6YnihDvzxJfHsw1DpzxqWa
	 sMOCgmwAy3Rxd7Aaf6z7QGoYez+NKlFxxqKsJUDFQ6wDcdr0wSYapDQlOlSKaqKAnJFHS
	 ywEntK3+2+ptnkaN3Xg9L8C/X0YjGdmhRWCn7N2l/R65/Bs25NaNZ6dAr3O8/C0GnEw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790185307;
	bh=68LYXDjCCBKLJ/Bs10NsH2RCda3fMCSVKpNzoXSe3Ys=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qtzFE8q20shcJNW0ndoaOvdIf8ellG0fUATo4bMzjfMEVlBmZz66Q4adwwcykgsmE
	 tlAFAxROgpg6qUjYHsjsVtN2zhsJs3eas1zyqXwhYAhbpyBEi/YJ8n6m66TU2AlfHt
	 ZTKg8dv80JLbs7F+qfkIM0n1sNGZEunqgEVI3fjZIydDiG+hFXb3lLujE7FzQinppv
	 FCR/jXbNdP3cpWrBbu85CxICDdx+soJhoWJZSMuuPpryuIsLEmiTWMCZuAqraYVzX1
	 ALDyKg8d8ij/ur0m55st0G96ERZCdUHDbZDhLC7v4INA8GmqQe2kSF0jvYSiDK/dq4
	 7w+/T72v9TMJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA42419C3;
	Wed, 23 Sep 2026 17:41:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 289373A9
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 17:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F4882045
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 17:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYXY1oBcslwQ for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 17:41:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3CCE3839C0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790185303;
 b=D91kZzd8kCkeYUWtvps/M5xMj1SIeUncnYb+RycVveP1od+jlwe8nqsCN5aORKSpGW1d
 W4h2UmdC3qV5eOd3FElIGFhH8RhYa4SsIpGC6nqhE9UzFu0XItukoWXCBglpvhOOqtPWt
 66/Ga1AS2Jd1rg5bzP+WHx9AdWOuTQkubAPBeCsvW5W9wQRzyuAZ58OVIfI95cteLkNPb
 Iuj0tPgeHcH+E5qfxetnSL7u7ljWUo9njWwfQotw04+kgrSB1vcgwbFEKDIKURSrCoUOX
 1sVn0fbV5D2V3boE7Up8YM4dIyoCd/85hKwWr+tyOC+7fQKumwooC4uwCk1jvTZAmSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790185303;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1UiZBXH6tgtw4sSyIkQB54AXp0dmR/oVDJlKtJlfDsM=;
 b=bTFWlXkjF1zlIl4UOgI3myYZKRp7NMoFafezh2T6v1GYI8X0rc9jZVc9u0INAS+qub12
 7fYCqaLXICdEn4mrqIQcsT0LgXA4ExU01bA2txf1S5uK94PTEeDUpYM7XJobXJ/KSX7UQ
 Jo0nhq313ho7/lG7dv/kKb2h17vK1iuFPdNopo0j/8xi6TN5xoYzLvPfGjFNKY5e5yOGg
 VcmHk/A95H3pzNfm0/X7CjCcqIM+6rgoFh1uA176bmWfIqwoV98my4uElpKoyQ+P1v6SI
 Z0Esip0on9B0zau9RlXBJJ4+Meec+Y+1P39Yl5AGTqCH2Z6EcMoz5LJF6fjSOiBzXEg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cjaXMKGa; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cjaXMKGa
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CCE3839C0
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790185301;
 bh=1UiZBXH6tgtw4sSyIkQB54AXp0dmR/oVDJlKtJlfDsM=;
 h=From:To:Subject:Date:From;
 b=cjaXMKGa+m73nbRLl7QaUwmuEdibYLxJTOSSaDDoSFgnLb3cZhXvXewaHz5usEGp0
 2klgI6HfOyxjOlx28QKlHJJVZl5v2cGRVHAUr4xsrW5PSSx0InZN3t+GRYrd/KJFl8
 2EPEeNhUzKM/2o2Lqni2NkxKADS7VtRHrBcBiQIs/u0UTcm0xgyzf7WNMq6CwiuZ/5
 cotbju55c6Bt1ANAbilc2ZfyhvXrMCIVB3xyTw/elZ91OPS5jiS9FXzF6/PAXk1Bnu
 v7d+VGspQ0qvku14b1u0Ebb86EuLpiBE0Hu7tjVOzjcQm1hNdO2lk07NXmu8i4kImw
 uOk9UEQanM36Q==
X-KAS-Sym: v3:f51bdf72230551df:rEY1wRlR19tLcJsTuA1QsdN49xSi7qBRnTJUGgrQ863Fj
 rjterHQ2MoA1GrwT5Boog0d2yDCbPOZ5RaXT7i0wrAjfOmSS3ofz0lHq9Kt3cdbB3hWXHT1cKu1
 lYoRwmsJry45ettdLGAEAcNFVtwIq7M3H7EOTo0k72vgYEM/lRqd6WSq3NHgGEp5UxdeElWi+nv
 WS8A+EYMfjzUTRWrzxlyA6Jb+NZhL+EhpYt5xge/dr46gxf158L7rctw/cLbOpPJgeWLyXMlpjM
 8INkmqcyG3kXV1nHTSZW/95WgJORYPSFxnS5UL0bVapIoG8WGgItoZYuzr1R9ne940HaSNLA==:
 bPa5g1CU79oOBFUc3+uL8e7ZSPZB7EXN58YDop5jaxmW7D8kig6WlzRAxFXv7plf5CEwIMVPre8
 hK3uFqez5lJ7dCm5pZxmZD+aq7aGKFVUn5LR++K1OQEkah+SKCJEsv3BmucZJZymD1mvulhkBaY
 aacjpWk8mLc+i7TcxHgOhUN9QbifHD1AR6uW+2fT1spSjxXgpXIq7AEXRDIcNGFeZK865/7FO/0
 RhlfvSc9SxfhPuuLrb6PgUWTymnbkQcEuTLhrX9v54g5TebxiA9IOavZdCr9KpzMk7u129bJPgs
 gIip8HJtsg7YLElX4dKSkpG9W4Uhi/G4G3rWuS+PD4G4kdw5Dyq7hBuZsovPDFWok4Uf8d9jvkF
 hJsCMojRAGzYCzRvAH3D4GNpBKFJg04fZER47SCAY21bC8aXDaYrTUji8weuTk+NfRFWxgrb3Vv
 KZz0LCwnm/Ack+0VYIxFVmiEobXiHoo1gPgQBtwCEaKFE+4YbWgriB48zT3YK3bdlvFphJTr0wE
 dGt8qzpq5YV5R3xonOS3CLPaXBqLfSMyqxGnBMJqvoDzrNdjpAY+txurc8NN9WvcnjzppO+OOnZ
 QSdD
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ECC70A4C48DA
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:41:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49522)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x9QyS-000000004zN-2vzB
 for buildroot@buildroot.org; Wed, 23 Sep 2026 17:41:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 19:41:40 +0200
Message-ID: <20260923174140.904490-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.13
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

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.13/ReleaseNotes

TROVE-2026-012, TROVE-2026-030, TROVE-2026-038, TROVE-2026-041,
TROVE-2026-050, TROVE-2026-051, TROVE-2026-052, TROVE-2026-053,
TROVE-2026-056 & TROVE-2026-058.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/dd3ebe041cb1ea402288f3a858cd1359889373e1

 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index f0ebf5d909..92e5fd4782 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.12.tar.gz.sha256sum
-sha256  c0d307c9dcdaee4848a8ca53e9d6c4ec92823e4f30be12790b0fbddfc6515f5b  tor-0.4.9.12.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.13.tar.gz.sha256sum
+sha256  5e748d3272cdf44a7d7741173f371c8def3d96eecb77e93c89c50663ce9cc792  tor-0.4.9.13.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 3fb4f52973..8de7ba50f9 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.12
+TOR_VERSION = 0.4.9.13
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
