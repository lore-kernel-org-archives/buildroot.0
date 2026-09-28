Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096FEC9833E
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 10:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A76580C94;
	Mon, 28 Sep 2026 10:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMgftns2q2hf; Mon, 28 Sep 2026 10:56:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C202E80D2B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790593007;
	b=J9tIG29siXgkyKGZmLrgqu7yWwxV8fU0o6QgnQ97E/s02pbHnbppPdX/EapVRsRlyuNM
	 JryrY+mcYyFZoVrBcoLncCw6xH3m+57n/HXy7vf/OaMBT8RIhXQlq1/3a6EnKeHuljrBv
	 U2zvvWRXmfOJRuDiZzA8lGiE9TcSMymn/ZA49wV20li6gorZjQCra8R5vwMBNSs5Q1x9w
	 BHCciinkpwAglj1IXQJyfP0pyAqtpORNlTsCccxZ8vgHEosPd8BqmN4UuQUkgS+m+N/MX
	 ikv8IViWkvsn2EhZV3RpY/xcaAxNaW0nUctahrlo4rhyN7/W3tYZiSPgA8E+yDZfgFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790593007;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5AoOMu+Pj7BKVvDyIw+zMlSmF4LsUf7k8wEh31uvHhI=;
	b=dQ+/mexYxKKyYYoFC1YMrOjR+DXs7F8MkUEcyKnFCLnw+dyGSlNKVQ83pucbttfV9TuK
	 P0wjj1WmyDBrNJXMZYXNl0HYjyH3cayzOS2NeaszV5uGjED37WhmslvZ+gcVfftEnoudd
	 /fpMIm143L/B9UpeOgE6mEc1SovUgsU61Pvg9hhy8KoVUd22XYZyoFYBwvTnlqj0A1bpF
	 TCeNcBBjjZigk4vj9qEoLXI+z0B6CYwryJfgY9j+1cIWXXLMW49Pid3Nqv0NOO5LBUCkR
	 Q29D1LkXrRZeSeW9NzyBvaZFm26gVl20jYvkN2n6MP2LatNYCPnuhqomy0Fh/sS02HQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790593007;
	bh=5AoOMu+Pj7BKVvDyIw+zMlSmF4LsUf7k8wEh31uvHhI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=rBvgJ/QoUCxEhCE+4O4DGIdqF8t5baBQyBBKijU0EoOHAM4PP+I29iQCU45v5zKsU
	 /KruFa+R3MT34qBjVPM7fr74jAjjjOr3cvmIQ9uCvfP5XD0OnSpcOl3CECfeNUm28I
	 6NkGqRjv/0Ulz13H0k7VzXqNgdRGtXR1URHD+NhtLHRSPaFRICzc8cw4OqnhNJSH7a
	 3NleLQzX6HWrcbnLHllLoeuFjJDPbKnwvD1qoQyKiOq0QkHgMxMVApTWjWh0LDX86i
	 QB0u6TgDU3qtibVS27vgO2jOA3+i7WcOk1cg20TAHFtF4Hm5lUE9w6tk2OeXhTj2YP
	 txJejmelqu23w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C202E80D2B;
	Mon, 28 Sep 2026 10:56:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FBE1361
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 10:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65AA2405D1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 10:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SjuQeYPMRtt for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 10:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B601540583
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790593005;
 b=blBLOMS5cK8C+vOPxa2BDQWLNnCUH29b/bZvraZCXH3LxzFYwF+7QT9MzJIev+q1xer2
 tu7YpGP06PtCVS2ZAZ6zEGFdKzdctTgCA2/PkI6tnGvQAadqN9cd8Csv0H1ybgNJ3iwyR
 nS2FXXFvA1zvesm/XJ2o0Q2vL6/AJfp0F7xpJQ9b2v+BHOKf7CbDmcBPkx6COIJChevyf
 a0QtNhsubnxNUQ4jiLNCDhWHjDQC4rlngn1TbbIXtcWkS+lAs06+xu0bKM9twfBfi4/qE
 eL/WtGDdfeDypk3PAFx68Nz/RLlVIEIYkfVlzHbVUgHZKrpr29oZLSGv+iCjvYq6srQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790593005;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/ci+NYvMnr8YK7BgKecW98VcNuCYvaTo9f0tOqFaEVo=;
 b=Jjbu1AOLCFEDbb28yLjGAZl2Jmo2sOV7um3OPtutuWrHVZrOhcCVz5XR33TqnjEsVT2A
 xS/mnS20AN4+HdNpYm+r5WeGArWH9cq/yR1P82ACdOqr6SSP9jUEfCFwYuf/qTMLUAe+B
 tUgcawXSFPV05EZLbQMo4RiAeEK7dyLjatr235dkP9LbrCjqNqgMt1djmsYdbQF4ykfCB
 vwyw7mRUhbXVuAtK3grFrrATjDeh2LC4jEVnFitXcJ5YMEwmTfhhoipQGzeQPdXIC7gHG
 t+tqkreeQRHGfVLty47/rvZtslRyEfpcGXYeKzH3td+RxWAm6zoouHKSHKXr917Czfg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AM0rITh2; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:33::f;
 helo=mail-ed2-x0f.google.com; envelope-from=titouan.christophe@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-ed2-x0f.google.com (mail-ed2-x0f.google.com
 [IPv6:2a00:1450:4864:33::f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B601540583
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 10:56:43 +0000 (UTC)
Received: by mail-ed2-x0f.google.com with SMTP id
 4fb4d7f45d1cf-6a99cd5115bso4781492a12.3
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 03:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790593002; x=1791197802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/ci+NYvMnr8YK7BgKecW98VcNuCYvaTo9f0tOqFaEVo=;
 b=sd/ia1jd8EhqHdrtmEknQC2I1pzOYxPdAMde7Xaa0VyR2s5J3r0cxTN6dCaRWVNIGY
 tM8uVJZ/HFCFGiEphOtoLKCKOTtTFjwdyC7wRtJNgUKakpnVU63DG30RSggw415F+5RJ
 To+hwZJNn5XSijeea7pwSyFKJjDEE9TXFXML0IU31TeK3fJl2PQJIaHo/XVjNeP/TGE+
 erujf/O8jnldMqirQulqJ4VdlOHCi1XrKR8O64kCDv4orNiWtHyz7gfS3ZJ6g2zWo2dA
 CXvvsXWG8FuohldD+YMyyZXkCfGNCTEjnZF2URbWtZCs2FeI2xBBGOSspOs0W56mLxwh
 7Q2w==
X-Gm-Message-State: AFuF++nMKf0kEOi8UxxAsY2+K9qP9lNtG1iT5epxez5RiAUmXx07TUM2
 0a43wUekDZLjee/9yYaIARkGyf4CoeiCHft8n7WJlw0yM2RC1kDMN1YmddpfBE/AasuXSGVb7Kn
 XHxiB
X-Gm-Gg: AYBFou2INDFCCf3X7rv15OnF4gA7QFHdeRpkPMgYk0rtQpU4RFVR6A8I90jo9FlzYb3
 xd7FvF6ytZD+XWo8XZslgJ14Wm1lS3ci47UPpQ3gC2oZSyagXs7jQOt3QR3U2xL7RHcNmd5cYu5
 BXValWlt1Xe8Fd+2/OcMvdVPn5LecHvygKj8EWwSd+KwkM6YPX2Le7Mfn3Qn13dfZ7IzdmYXsA6
 GNAn+zJFYRqfXOw7Tgbu8TGkD/2/sbagsEhGvxtKE6mNXNk5OOj+W1AX5GJ2XBMnRTbfjHWKL9Y
 TPVxEZjmUgQh2pzg2t8Um7k8K6hHIOH5wUaH0XYaAP8JoMyjZl+nL2l7LgmJc3lgP7fEI6gD+Lg
 aztHyPZJwdPAx1F4MXVcDABmM3/T9sqU6G3+emlJrKO516asb9P/CaoEspy1dCM0U8OIWYIfmXU
 JNQM6GwMNDgwqOhmOAilZxEEhIxX/rFUQUTb7rEe8B47H2CZhWtj7CxtQULdM+hMrO6m/fk2Qz+
 8532/HtCxd6uUBh9FDYRWRKdZYJHW+opzFxE1NePlEx/5Or9ks=
X-Received: by 2002:a17:907:6c10:b0:c2d:bcf7:37f9 with SMTP id
 a640c23a62f3a-c2dbcf74374mr386246566b.26.1790593001596; 
 Mon, 28 Sep 2026 03:56:41 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2ae757857bsm444989166b.24.2026.09.28.03.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 03:56:41 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 28 Sep 2026 12:56:34 +0200
Message-ID: <20260928105634.825845-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/php: security bump to
 v8.3.35
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes many vulnerabilities, see the changelog at
https://www.php.net/ChangeLog-8.php#8.3.35

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index dd336f0e65..99ce84673e 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  e293ed620cec74651bb4a071317892a478aa6840fab22db45c72d77cd42f9676  php-8.3.33.tar.xz
+sha256  ff4630fbbbd94359134b7d3c223db59329905bdc4f5a9ef93d257b48e358619a  php-8.3.35.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 3389b9c530..497ccc49e4 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.33
+PHP_VERSION = 8.3.35
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
