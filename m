Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E90CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B8E960DF4;
	Sat,  3 Oct 2026 08:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OG6gAe4EWqYv; Sat,  3 Oct 2026 08:45:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3FE5860D93
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017121;
	b=OOd4JQYhHGSVaHICYxO1qBauFa/O1HBf5Bq7R3QfGs+64v3a87RDWqwUkqfj8PjnGYpT
	 gtO1hQJdTZzUI5X/edN6H3jehAPM8O++HvzYQ5aVwYqHkLdV0aEh5dIUeH/+nt6OiiJfH
	 CuD3j+3d7H6pgfSqcyursWxYz4MmwLYlyw9uYEfObm9PRJ4B7nK+YWFO/mAAPVd+maNCL
	 aVfp7w+6k47sB7owcp5rhC12w7UwRgR9mmhXII1ii6TUNLcT/iL8xnjPSEEU5PC7qHXuu
	 Dl+FlbYwaEtdep5cPXVLxs4cdVYt1ib9H2tW3dplfNhrTvc2KE532Vo4xfVH89QjHEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017121;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=W21VbA5MMOYzjytHXqBIqcBJa5tyb54zzp9MTsfu5hU=;
	b=TOohCxPXdjPhtpODlanHBxtLWYjkRE7AkyTSzBWIYcE9+0D5pTQN9NzDzBo51Lbx0pxS
	 nS8AwJligQOp544hiyrTEeNyo3Z0ChQqOuNyteVo+z1SKlrAI2A8XTSeu5oARz7suFTMu
	 6F2/pq6kyzmsFhKlm6dbJVefBNsCykBSuUbJbDfO1Lv1toyWo7XGtUm7r8FH2aq/ckw8f
	 EEFPIdXBNLU1ZueXZzqSLntklhMd0FWZjrIshEZfIZYbE9uLKI4NFDARTRlAaiZZF3+lf
	 E8vU93cXRFwpGECeXCRhSYeM0uBA7Oz/5iGxxAfujvhUXY+l0Us0yx+j+vrKZDUDmiQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017121;
	bh=W21VbA5MMOYzjytHXqBIqcBJa5tyb54zzp9MTsfu5hU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JKfMzug+RFxkiXZ2Fe43xiTLk3BfJQ9++0vSItuEJF9AS1WwF8l7jeQY08TNJ9FWs
	 /sM7OlTLMmyAFGKD/eijh4CwPesGit2aAsRJOwG4uQGGackTKktYR4azhbPcOb0T4L
	 kCWBkBICV1n0zTin+RDdTbZqFlz0xdAYenhm3UDp6qCXy+P7nXoIPhdeF5jZBKD/qB
	 UQjYw8PVmHZpHnB3l33Aia2nfLS4oPhlanYCLbKpkrbqGYBwBB/mpmTsBEAVt+2pfW
	 77HkGY3MsYR1vrBm3otDx+gfXqoXIN94sARgBwgT9UCVlCJVoSkgaz1LCtpIlyIlqC
	 TKYubexmPxGEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FE5860D93;
	Sat,  3 Oct 2026 08:45:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3821632F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D5D340070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5x9TtTA4wqln for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 46B1B40059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017119;
 b=LSGlYlMIQPcMjdWjPFH/mJBxjrpbX5uJ9lR6b2ZLNLXaZUIcHqlP2BFgdJH5Ev1Nm0H4
 NdbiQtzT3Kh6GmjxhsAiAUZFlILzUG2ZB7Uk2E8PX3t2/+4zkJL2jQOey5POn1TJXf1JE
 sBnfKqPRSlqLRMQLEcqV0s7EcT0tc46KDyQoGkW6Eu21wc+XiV7uNjDggACjJSVKpi4bb
 bEugj5jdOBhQ6RqjaSKSvLGyoo2MYmJqkHttHkZP9O8nVzKvjH0JKFlAb7QuWKyrjGnRI
 jKIFJ5fJtr51Esv2/BWzoghg602dWnXdrPU63xV1/AqkShsn8/oZM2Mbmg2ldaSSv7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017119;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=SFruhFVm4OILqV3+urC0foIcTWaPTtKkNJZdUGgHkjU=;
 b=CJRZz/kVbKqGtvdqcOCMTmHyXYjnORxI6V/cWJ7LQkMYZkWRv3FcpEJAAk4hCrt6kQQE
 Sxs6T8/8382ssUcT8foMl1BMTOT3xV6CkvIs0RJI7sx1li8ZxqDRnVs4CMC38MqFHQB3b
 tD9LgboyiXPuBcmgzUJk32rQRYLtj9Fxfz55GhJVWmA4dE8N3j1Khy8KtJhIqhH1GCUxa
 zOQLXHY/8dPkjiKLgYvGZuLfJBGQljCIXHQYGForQqTI+dI1Dcr6x5TL9SC7i+RGEBdwT
 VJsFVZJ0cEfNRA8irgWChljf6LTOGXlEBJ7MTinJkBjuPXtAXWe75SUIx5MmimKcsZw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UzZxMqQC; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UzZxMqQC
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46B1B40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:18 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-82380ef9395so349214a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017118; x=1791621918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SFruhFVm4OILqV3+urC0foIcTWaPTtKkNJZdUGgHkjU=;
 b=UzZxMqQCvTjCCzJTiwq+N9pGDqCWOCVOua9J14U5In9PvsgfeKJOuWqZ7CqhYKecO0
 3jSgdEu841eVXBoBThdvf5+CoWR4Yu4ZvlGwTwyQRok0A6KTA6ICfOVt4dYcmOxUVisY
 ybOddEXRFToC/Ctb98/kwvbT5M/MUYVZMBjlZt2uLXpIcO8NcA67Srrohf2mkU7t7UNV
 KzBKi5iBsD2FfgJrDn/qDiDoICwdoPlexTHps7BEqrv8N2B93ZYRN+CVqRF93p3HG3WL
 N0Ej7dxc4DMaF9lcFsKf4lMY1nekZ7pXK7XdFgdx0QIhNhnosQyefbXiPFO/MkhRgOB+
 bYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017118; x=1791621918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SFruhFVm4OILqV3+urC0foIcTWaPTtKkNJZdUGgHkjU=;
 b=spqECqjLobbf7b8ykusbuUHtk0Z5BifbVYD7UxNxC0Ehymh/j/2u86IbJtjiO3x+Sg
 /dQwHSCsc+4OPMq4RvUwyJHJdeK+WjeWQfdXUXVWP48wPh8ptaIzcdRJ6SO64otsXKkI
 9Ez0VTki5fskrhIkDQaxWgRPl4YNyRCx7fgbhZIrZK7LPyd1AFVLhIQJxbT+BqM6f+Kk
 6/38idQqYIpJHrPsOb8DaRZW3NQrEX0xXLdYmiFSMyQWUXDCCSqN9t1qbZnll/GNkcvf
 OxMAZLUagRR3//jl6Ft4EBs06E9OBWPK+F0xWGt3eypJK+9kIpFZr25Tcq9NYuETn/zk
 WwwA==
X-Gm-Message-State: AFuF++muFS9UQYn7sMbHitpKP1AXsdbcKWK2kI0QzYxOngXNS7WeKZw/
 CgxrQWaqcV7pC5qFs01TgxAB1waJEz7w6YXisWQWlO6t8wSH8CsJCVjwT5T6lQ==
X-Gm-Gg: AYBFou29zw1LgrKEUtwuI/fpa9cutdF2gyGXTLggtf2rXyEmUwS7DZoNs/7/6UtWZ6J
 PH1o0Ws32YErrkBIX13Y67anETCXcBR/tEnyLnpcoTn4EdTAp83S8aHPF4qGyRj3rW7ZGv7lt6k
 DK8nHD092oe/caJoad0MnTuoYEsmkcqTzXs1TXxUbXnUlnysPkjxM9AnZAj++dps6kIZgTbZsMH
 mKstd81hp+nhc/Him6eDN7I9vD08RTedTSsyHrJgf25lJTolcSW15a0KDNkXYcugbtOjAdlQv4Q
 63X4w+JrQ+Fu0OcWYvm9SMnhw6aCzpZBbF0sOQzgWKSr8rrnuuN9KELd8BqRRA+RO3z/Ta/sQyr
 vtZdirzx29cv+0URVcCSSIm6/BuXSpdjU4u76MpFUS0ljQljKWzbozC64gBbX2LlKYK17pnKenz
 4SbtBrRFoBa+hcs1DjVB5lPdXuYoe8gtGAjk9RDO0c3cV8BzrYeax2yOQt6CZcL7WEaBzG9yP9Y
 B/lBkYR5U9R04W9Y4GZVEM8ytFWW78kp4SSuz17x/khatkoN10vNGMCNuBJzu3KTeX/oNydFQYg
 ZtqmrwsygMdt4QRxu/MWguwd1HypNRaEGOYMT2QOV6eeC6Gc9DkMHl+gz5e2QhYNTCtEWV1mP7H
 Sp3cLh6cZyQ3b23/+4G9LtLiKLP6kS74glHuB/uiL3g==
X-Received: by 2002:a05:6830:668d:b0:81f:8a6d:7b52 with SMTP id
 46e09a7af769-82285a5a02cmr5052362a34.24.1791017117756; 
 Sat, 03 Oct 2026 01:45:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:57 -0600
Message-ID: <20261003084453.545653-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-gunicorn: bump to version
 26.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://github.com/benoitc/gunicorn/commit/95b7ffeeaa75612d24d873f3fedb733c1a51b09a

Drop the no longer required python-packaging runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gunicorn/Config.in            | 1 -
 package/python-gunicorn/python-gunicorn.hash | 6 +++---
 package/python-gunicorn/python-gunicorn.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
index a670dd4814..76c3338999 100644
--- a/package/python-gunicorn/Config.in
+++ b/package/python-gunicorn/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_GUNICORN
 	bool "python-gunicorn"
-	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  Gunicorn 'Green Unicorn' is a Python WSGI HTTP Server for
diff --git a/package/python-gunicorn/python-gunicorn.hash b/package/python-gunicorn/python-gunicorn.hash
index 5639697c51..7e78324243 100644
--- a/package/python-gunicorn/python-gunicorn.hash
+++ b/package/python-gunicorn/python-gunicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gunicorn/json
-md5  18b666db62a890579170639961c5b064  gunicorn-23.0.0.tar.gz
-sha256  f014447a0101dc57e294f6c18ca6b40227a4c90e9bdb586042628030cba004ec  gunicorn-23.0.0.tar.gz
+md5  c7a1a922dbf9bf8bc4fe6df851cb8272  gunicorn-26.2.0.tar.gz
+sha256  62b864895d9ebff0b2f9867ba04fe811c93121596540830c9c916d0769668447  gunicorn-26.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  6646cdbba2e99e3421dd18c22173579a1fde347e831dae6adee80eefe331e951  LICENSE
+sha256  1457e30a8f71334f34f241b9f267e7f5556544937bc2c1751bc58b52250c0543  LICENSE
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index 8e3b87fd51..909806c087 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GUNICORN_VERSION = 23.0.0
+PYTHON_GUNICORN_VERSION = 26.2.0
 PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
-PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/34/72/9614c465dc206155d93eff0ca20d42e1e35afc533971379482de953521a4
+PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/d9/8a/e4ef6ee11701b6cd64702848415ffb69eeff85cb388a3c6c7fe86f22f3f8
 PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
