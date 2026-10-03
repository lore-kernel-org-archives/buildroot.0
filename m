Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86562CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 561B660E5F;
	Sat,  3 Oct 2026 21:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvzFdhPgvdx8; Sat,  3 Oct 2026 21:09:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7F7B3606E5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061765;
	b=ptMsOXyFrrwDPoQNlpWcwbhyOe0Cb/asf2tEkWDUcyl9WMxvoaNS5IEAYNtHudC8y5Yt
	 c1oBymUaw0J0qurGi6BiMQ8gUpiBf+veC9t2ghjEfhq+HF43knAPM6wtXSbvNgeYugeEp
	 5bPKDIdyjiGJ6naoQA4KCD8DCdPv9j/TWEBegg6pHE4rk6L+4lAIQy4H+BlIQVo2G92P7
	 Fzp6aYBDmX+iBEdDBad2A+ULRUep2iB5fRBvYELEvfWxA8UC3U3lReVFnye9MyoOlRHxf
	 IfOC3v4IzCXgz2AODJPwaTniNkgUiI+w1zdbxK4+k2Y+MMG9EReFhfuAZxtziJW6Arw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061765;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GiN2BhGaOI89TuMTRnYq1ByBgXPm+oiBwVbrfy6JzK0=;
	b=Z4l/0fIRfAhNdOvvTst3w+ys9lUkdshrLB4CvAi0aTzTGP3hA4WNQuPOsfbm+GM2VsTX
	 Q0DwncIqsOv3mDJ1menkygD3VIdvc93SkfoUjT2I4Xo0JREOFfU3hiK59zkYKYFL8zECf
	 1q+MPM3rRkagZH1qlwyK+TQpRfax3hqhe073b7nQ/kBfUIoPbX4vzmBuH5HuCcjHxEQ3O
	 VnV6J7vIP5r5YFWaO0qS/RVu/qdZCW5cuV1PSyBDyXlmMndCk8E4x53xO8l+9A6zpWrEL
	 LSWOZWAMbDigIEKu2HD+m8ZWUAEFtMjhOBa7/aXdjr7UClEDi07BwMwbgywl1ycjVfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061765;
	bh=GiN2BhGaOI89TuMTRnYq1ByBgXPm+oiBwVbrfy6JzK0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=eTwQJj8jbSoYbRhlk/BdUdYppIR8iYPic6vj1JPBB/XUTTY1XW8acrxpV/kXQHA8m
	 jXGqYuar44dE18DKCll7WWvMXDPOYY9aMa3kHppmYljOyQrpun6raC8d+qvXj1+0/n
	 x2XOCPB0f8XUjDK9J6/bIUts00j57nvO3JE4FytxYTFqaIg5ZlFa3MdccmbSPRqVGZ
	 7OtQiLL9Coioij/X9EmcnoARXjGrtEhrQeAD/RoFzRImRB10k8bzRmNfZJShfkcnaB
	 SlOH+K40QmN2zsU6iiQLinKboN9QNz9/yfZ/mYhSEQu37cOD4mZKe4i0FtmBJEiGBe
	 RqzBfMyUtp1Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F7B3606E5;
	Sat,  3 Oct 2026 21:09:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2B682E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 949968156E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cg5niQF80l2X for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:09:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AA5A68146B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061755;
 b=AyroKrBt4aQs532/IyWQ2ypRcUfVB+giKAYb4ejz7Gb73F46XVsJQ1BNsSr5NkS88rm8
 O+DpVDAgvPuDTqO5LRuL9bd73oz7xlhVrGKAcnxayStjEzxLtReDx7PnSbzgAdd2/qpfw
 WbruGqArtHzxsFRCsRHtWF+BCvpEVfHFwfWyORHWqSyizEAmUm+gZI5AT2xAUj1mW6ZuU
 K1zKu/hYAiWzom/90E0SHkymQt7uz8TOVf/qcmgLg6Dbke7q0FJDaCisYUGZzM62BmvYt
 XJkO/44oc3M3ZB8g20I/vHoGDtQYT+/KA6FL5NO4SYx58Y+X4Qbjcwt20xccJLEj+yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061755;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=MUxl4tU9QJuEof0YQfdKU9E+NEsUsR9nB+mTlXpcFtQ=;
 b=tMnB2BmBOxGJklx3PG6Q+EJ1Tw5v0N2MzV/AFJjQypnpsg8/QTqnDqP7BjjiC+BitehP
 yZGaTs1/S5PC9XhZcL3Sk3NP8UdElHdDSTvxC2Nf6E9VJhwkD4nUGvAWC7Is/fV6XPPPI
 oeihfOAb+ydm9dwT/fJYzjbOVuwG3Ed2jOgOAZsv18zVmsaYbGHi6VwjfRlg8c25ZdFxW
 k7Ln7St2O426YPCmg3VxwS2vax1Bw55IL52tEIvcmqD7MYBBzEhI/c/ccFOosM8P64WWb
 xHveazNQJyFhSyZNw9EPY/dcN75eztQa122spFpEu70t3ucdeAyJciXz1PAegFeNQiw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lon6q3io; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lon6q3io
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA5A68146B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:09:15 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-81ae6aefdceso812806a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061754; x=1791666554; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MUxl4tU9QJuEof0YQfdKU9E+NEsUsR9nB+mTlXpcFtQ=;
 b=lon6q3iomT1gGXeAlr2TuF+U3wLND3ApKcRQcRDRQe7E9/QRCIXBBX6CRD44VC+wcB
 3OPpjo043suUOFKzBBoXAbaHWkRnnS34G3TJYlSEZBA7EC49G+9gdJf8/oSHUHmaLcWF
 KwNV9MNqRXzkN8EV7zdonZSGz4bXaSMZDi748gDDk2JsvzXycYF+uXZZ/iF0piucDAVQ
 MWOFZW/gFmT8L7HkX8NR1iJd3UhyUe589n7ObbERxUFTywC5otNaggE1+xENVeMv9bbD
 97dfy2YRkbczB7LitGXOE6Ai6gxlQUgBanCQileVViH7EZdGTkBUCkB8BZbx6/qdj1Bc
 h+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061754; x=1791666554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MUxl4tU9QJuEof0YQfdKU9E+NEsUsR9nB+mTlXpcFtQ=;
 b=G3olm7OHold/iMZWORm9zlhu8CScpXI9+i7iwUegTvEtlIx/uZUcNmczjDWSQi0zkZ
 3JaUWH/XnndJb8wWvJmoOHoJhtmJZSMdyiKo2uI5qCU2+vbrEPrkC5lqDIm1VhMsOVAx
 tthjuWM3wj5ash0I1q9LATlQQYAsDTgLwaq95FZGqKNVNx23m6YPB0+G7y+ShHKa2oJX
 P7lXQzvtZAXrsO34tPb8S8FfBTcHhiTvKsuVCCfx8O6lxDilqTTnDe2M2V7/boEY2yG/
 oXIcHlMpwvnSL2CTu8biuIExvOp81tMSRgZp0m+f7pLr4Twf+l8TUvIgHTW+WBOvFjIW
 YHqA==
X-Gm-Message-State: AFuF++k6ao5mHkWDZyBfkdLJE2I68/HP0syniKqaAcJU674jA/NkvILs
 Mw9+dB/52LrhmsDuVtHbBV7kEVss9ie9EN/m3Y5r20b/VUzcC22zu1UdTUjAKw==
X-Gm-Gg: AYBFou3OpiqWxjK05RffS+boYNz59PQWPGO3Q50cpc4CTP1M9hHA2ALgiUCLJCfKqcy
 Da/Ay7f44D2MM8D3Gx+d1T0p5q8sL4Szr2Q08Tn6PaYBEZupWgJh3o84swUULNIQsF2Ru9VU1R6
 29Nos7yvju0y0wMUXzbyMANkjNZ42kXba+1aE6ouLh2OPooHWlzabQVvyD35m8WRfcu/cLMYRLz
 mQ1KS+93XoZrUkgMEP8OwI2fqAIc8RjiubY5oLAZBT294ApxHIHLh4XHJDX6jvk76IpR6nxpXKu
 cLH3UUtjEi+hpJGetjrIvvn+Eh7uyVDIBVfux3oRJ+qx4YkYCoSls/bibbZSod6GP7GAq2IKMRO
 nUQJ5KrUBQFQR6ZavJkA/ju6W/BhamZE4uu4VvTTBiG5s/mLZA91AQguN4sd1Pce680aIrT7LKl
 TIUiHPntLn8auEVpR0TgfyIVwAYL22bYN6r4+jjyeAUwA8ScyBtvSiC9grZfzuEU5c91WuXlNG7
 qt76zYuVtW6/CoJfTLwU7Adl45/8XZ/MPjl+sFQslEZFTjiKm6kZr619hEdEm55C3FgytDN0cbS
 f4xqHTmz1dB1nOM2N7s8zBN9MF2wTyEmdtYJNGz04NyGwtEjejCv7zxOV9VxFlBtlSwJkR/ZxP3
 I4Y2W/WJBo9DAHiFqBstzdJ1AlIand7/gY6/oP7Ph7Q==
X-Received: by 2002:a05:6830:719c:b0:822:a76e:95c9 with SMTP id
 46e09a7af769-823fca269fcmr3177327a34.14.1791061754595; 
 Sat, 03 Oct 2026 14:09:14 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:09:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:08:10 -0600
Message-ID: <20261003210833.735937-20-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to version
 2.1.3
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index f3a55962f1..b9f597861d 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  d02bc876368c10e73feb00f82803093a  sqlalchemy-2.1.1.tar.gz
-sha256  fcf3cbb33bb23bad75d2150157c21804618745731e9931ab27e61879a9f6123b  sqlalchemy-2.1.1.tar.gz
+md5  2b235deb7bfe0a97a716c99c66ba3964  sqlalchemy-2.1.3.tar.gz
+sha256  ade5281df06038c6394f532590d592d3381ee5d11b9e0006a2570aef41145118  sqlalchemy-2.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index fdea9e4325..e38f49a4b4 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.1.1
+PYTHON_SQLALCHEMY_VERSION = 2.1.3
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/a8/cb/7c68da82239ffae9378eca076afe14c310e17a4f01e3d315112f266e26c7
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/02/4b/81d972a46c9f1d978af1795e2abc988855c711453552cb45d75f6e4abbf5
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
