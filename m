Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ED4C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 16:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F2336060C;
	Sat,  5 Sep 2026 16:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQueH20mzkA1; Sat,  5 Sep 2026 16:14:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A83B3605D6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788624891;
	b=U6obuR0TQERBhx7jhjD6BfdH61PCSuKRBVmZWzebOEPf2sJOYfsRYEIq6W37Opjlj6h9
	 7hISNipMjJkkMHptLRRBMitMjcoZA2xFW4NrJySDQX/QIp6NOcblGHhJZiYv8XA5/lUkS
	 M036BjOoGk+xQ4IICNXgMc267oVE5K5wY//3IZJhErZFaFKlLn49CbzHx/ivBPwQFfYA/
	 6JkIoLiDbW66iHhfzB3Wji6FyqU536Ia2NcrvYikQt5j1KdK2dYUz5XgX/K5Lx79xLIfD
	 FMaARu3S0TiX2Hbq286cdvd4o3VNlPyEl+kSGRlZPcjDrvZeeA+kf8VtJ7VOflmbmzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788624891;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=qsmXBZvPRP2FlfZjyybzslNyuFpS82SMJCuYcDrZ/1g=;
	b=HpADhR3codZxkvRRFn0NCy2gA5OYbwVt1LjOYLhfeoVSFpbGF5LXRJhXUS+bW2qVWeYW
	 5JFm9SZjvvJojLj7zCYsYTYb2ZbM+IzpUAjmiTr5xLopQ+bhtZPOOYKQRnZAUIsL+Ob2z
	 bfq6zpe1oV+0knB924xeHXSkbGdekh2fx99CtQXp9cks168dim9OKZKAy5Dg24CQA1GoV
	 ZFOkv3iJ6/rE2UD11/XaeAX34+5WOycCF+Lxw0QyWvXOac6nrpgdA2wGVOsCjsf7zx3hQ
	 hN5tavwruU9oAMT4tKgpjzRBXF7+oSSsfpoVgdbmwovoW/8qC03yIu8DZUnsntRNvSQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788624891;
	bh=qsmXBZvPRP2FlfZjyybzslNyuFpS82SMJCuYcDrZ/1g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bPeyvlgLDHpjAcStbzpUs1TxzLKVi7vYFZV6JSoubeQJUIRsfwKY/CERqx0wenm2v
	 EaAVpZNagU7u4pW+TByvuerMa8ZIx7V3bMPf+DYb4IOcRSieCqecERLpgbSO2z2fXA
	 8IZkj4M2hNTqeP7+iy9rKmnvcLVtqAB+KSjWA7pQtRWrevoRsKixj2CWnEGDioIs2T
	 /R7F7RBV2H6foZ8RBNszG2RSXInjjvDCw/E+TcBD0TftsT6FBz3Ua8trIBAOFPIBKQ
	 +Z8iYwj8jPEGnguAsv+Gh4IJ2bL+fkw6JZBloQrLh/ul0xVIuM3KbiFdGPLb+cKAjG
	 ih2u5sI8IOazg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A83B3605D6;
	Sat,  5 Sep 2026 16:14:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7548279
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8B10810A4
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jn3YXYkeMPy for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 16:14:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3E92681082
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788624888;
 b=W9Sx4iPV/y10+GshUb5/AQcTNl75J1yZLnsaA9LKcVwiRHWcyDAftPpPHsEtBeauxpDd
 leCY6BBDgx37fdihZNOOTXVhE9HDGvLWirnOYRVuUAiZn3++aAxOSIeBYYsADPf6CejDs
 b/73gkJsTBYH+TOKMn6L3YHCwcsTxuh2nTHWH9NGUzaR7WYZu7iNi1uIcUUduShhoQEcF
 VLvvmsELUjdF+RJz9PCfzy/AoOJii39X8jjQUOkCNfULkf0E/3G6/KH+JVUbKQPVTwaKr
 3qIZEPv9uk8J+48+v/q5xxxYiAUPrezMrQq0SDhjRnmxDbzT8dyjlOtq/6EQskZ6tPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788624888;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=qIED96ZDtt5HiXKxJ4HSw+eIaRkJ0gUpkLXEV9ib9L4=;
 b=EgZfFRaYiqGuxFVjva264w7kl4DfLyhDqpkiD19Na0p/ekWutTLU2OPqYk1n0R77CRaF
 INzTaKdt70BqmoK28YM1YvaCB8qafjt1KFKTWMZKEHraApmDzzx+Z0D9XorFnygOXfiq7
 AhtkLLBJW4uENr4Pz7KlxOEaFscyaQTEcvSWzk3VLbUSHB1MOY3xPFurStEdWWNQ5SAK8
 nNlWiu4Xh3lcXikDsrhDUWXrkF6ZnmTm8RWO/gZXa4QcskY4Xu+cqbZAObnsNmjoy+2V2
 UVGrpEn8VTPLR4X0uERRMQ310dz3vRekGfSEIghrbNdPUzHrHdFc20PI6jS7UzZKWqA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EEe9bU+r; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EEe9bU+r
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E92681082
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788624883;
 bh=qIED96ZDtt5HiXKxJ4HSw+eIaRkJ0gUpkLXEV9ib9L4=;
 h=From:To:Cc:Subject:Date:From;
 b=EEe9bU+r2xs8uIz/QWsp5XDmwdNma+Np0Th0+QIm8Ul0aTc++TwQ9YAFyuKgMH2Qx
 d9KR9O9mC3Uufg2O9CZo91C/5lza54Y0jU5HW5FdEGHvGhODl+Ry9liwc3CsTSHhjm
 MQXd7De0MlS2V+wexLdmabXck2qrP1BhsTWCYzi5w+1olTVHh2gxbIw9A0DBpsyk/A
 ZLg8rJQGO95LjfpqHpqcT3t/dshIj0OzcsdPgr3HxTbIbx0/s+TWIayhchJX7nDFH2
 q1al6rqjpH22TK8BngmO7oaOoaLh2fS+5pI45qyXascwhsi72cqCjLiauagTTId0kX
 fwVLLEHgAlIaA==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18B1EA4C218B;
 Sat,  5 Sep 2026 18:14:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37408)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2t2Q-000000005tA-3F8P;
 Sat, 05 Sep 2026 16:14:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 18:14:40 +0200
Message-ID: <20260905161442.548037-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 1/3] package/strace: bump version to 7.2
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/strace/strace/releases/tag/v7.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 8df107c948..0be750c96b 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
-# From https://github.com/strace/strace/releases/tag/v7.1
-sha256  81743ecf2a5b44186b2f5038afdc8beda7e5c70aed15b4fbfbcc6e9ece24490f  strace-7.1.tar.xz
+# From https://github.com/strace/strace/releases/tag/v7.2
+sha256  4bde6246926890dcee824f6e6ac42a06752f47d77e5097d86e3c0d6d4b709fe5  strace-7.2.tar.xz
 # Locally computed
 sha256  b897cf6bb865cdd72f49fba6ca7b66ad075b9bc51d3cf372923220ce18b5350f  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index a0688939ca..9634a6d02b 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 7.1
+STRACE_VERSION = 7.2
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
