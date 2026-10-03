Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD31CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B0340E4B;
	Sat,  3 Oct 2026 07:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWL_ZmXJ5pJz; Sat,  3 Oct 2026 07:08:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 46D8040E3F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011320;
	b=c//UmbiV6SomEccQ56p40NMfx1pqEzsN6+m1B4pquJqGhPYwzaUqHfoisbLOdYJVv9J2
	 HK43IkpZb/KYYqfTr/xudBbfs+gtsI/NFjp+5MBwtwN2JIJb/4s7RmPpdJWGjC+8VDKpW
	 IRZoki3pPeCrhiswd/+cww/NkC8FaFFf3EqEa+xmqEvcAu9S/+3vCpSZguzhXncRdpfiZ
	 NCHaW92tHicAd4+RfhzOPOiXWhG+Ty7kJ6qQUbS7B3VWft/AZKAZvtlKbvmlHk7iCRPPu
	 HIKby5pQYHBZyWXo5uinV7Ej2Wu5GxxjZXY88woCY5+GXAt5YcH9z+91DVg/Ei/r8nQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wIknZLciOARitXDvMR1XSE0S/gxrCo5Eq5iE8hblLA4=;
	b=BWXlxmRxnSgyiz14WsSaC5ZV8HhO6IXb8330lJpu24EfQX2YYHPoBwYy129qLK4ZHsnr
	 rsqHVMspU3tu/SQOWJyg9Id3Cbs/UoXw5cbk1kwVZ/vRLWJRK50yCtT/HJCb9i/+Zwakn
	 G4jvlh+PJxillJrQ3s59VWnHeTcOLoDPWxktuKYX+Xyet+xCcIyKNhVtMmdalB9bXRMEl
	 rOTgM3FAvjsr7OLVfSJph3iQNca8d/ZegZ9QeffyJ/rW5mNzZsTVCAy4v3T4f+9TrYZLA
	 FBsCjyNgH7cie4v8dxsKtnCkhSaySbESAnhNnC9t9R81mAmra5CrxBGgtNH3WhStcEw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011320;
	bh=wIknZLciOARitXDvMR1XSE0S/gxrCo5Eq5iE8hblLA4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HP8lBNskXfmKKYTYaeVKcRzLv2VjuVqHOP2F2/XiKgUXYAyLvfXduKh8ASDKOCFJy
	 TtJI9j4kE4ulG4LTtRTE6QY53KRKrPwMUPskw7ngTqmniEK3YmhaGiiSJeKWXoj6gI
	 Acx9Mjf0CJ4Lmt0H2eQ7/4Hvn0XKyj9UE5+jq3YdNn6EjU5EsjauWNz16P1pGGmsDJ
	 To/l4Ntl3LzEh8DJiCndHH9uTha7Oc6OPE2I5F3NVhdvs2AspCVPQLZAYIzLiDwYD5
	 XLuWWT6JknW67qzUvfJsZC372lIo4okhxNvzd1BjTw4Yd/VgHVlQvSDCPJNxsRwRl6
	 0MMAhfUSE53hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46D8040E3F;
	Sat,  3 Oct 2026 07:08:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44032263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 288CF810A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dp_U4rAqdi_j for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:08:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 326ED8109F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011317;
 b=RxwO3t66gJNdQdNQdpquY4BjHmEztVwY16zHUcbJVwqR3lAqn+fo/qV9Dlvsd0fa+fzu
 YEXy0sitzq/im9WJkfZ7WEJEN4XvcNMDhIe6To1rVUEmc6f7rnboLFdosjdobQ39oTiOX
 R24rIfbvS1/uRWDKsHE0Ud42kASywF9xHavmRdSHRg0YiuTJiV76F0dfUIn3Gwuv8FGi/
 /D70oLkgNFS3CGPDmH0G710GrUH5aB3n/SqtY7/HHhoUnvskajJH4/GxrDUh1dH1Kwvg+
 aQeVGcpOHCxDNIWIHTMjJr/7L8qHuVvD43mNctyapXAPAYfQIOy9w3qx1ym+gUUHZfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011317;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+ItV5F3GDqItX1KCmqFay0sF2+z1X3frIF9j/N90Bag=;
 b=BiV5qj6gErOY0IWeaNFqyDzL1P+DXQahUTalC5AYq3Dx13b0U4ou2L7wdpxYLc5klqpe
 aXKX2BjtxfAZxdazFyzVxtcz5ZE7tfEO2VMvuhxXnRmVNQaYbQr4EMI0NPkIT7euTSh5D
 OwfyZN2ivQ0jvU0zaPUrnnZ21pnlPG3RNNx59JafYymYCyyGbljW5OOsOoF3QY7miLi0E
 dku+IkrHakIOqVoLtjknr5ZXifSRWzeB4FzbCyH8cAvlJEh/uP0IP+EWL417bDNpaNqKC
 HzLg2NIb8TJkGjXp860g73Q8S8spswtsMMJAzAzh7+Es1358PggpXYg2d6X6/wDLSoQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BIU7icZC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BIU7icZC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 326ED8109F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010928;
 bh=+ItV5F3GDqItX1KCmqFay0sF2+z1X3frIF9j/N90Bag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BIU7icZCLZmuqcbnLesNW5fs7w/C0C9/UJrlu4BK5trTgSUoTXvHNB3Zb1ixzWV8F
 ETIjOlAMYbkc+JqveTs5uskD7Mw7rczbCc16rwKVal1pK96eBYjDHSD6POz5x9zaq5
 Nz3yjRNADqhw0zsLSIU0R+HH4T6Sorp/dNP7eKvJrH8/NREJSeV1NfMfwnunoD2Tan
 qzb1vNHOhh1JhOZbKqP7Fm6uUY2vAK1qHPSrrck363GVWaXXzZ+zX0+8VYf7BYNvuT
 Y5AaOpjuLD8Vlc1/tHadtO1Hiuz03N13LlDA4P/kZujIQFM35QQ6wvKQo3VAT63cZo
 BcFQtrv0ZfbuQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 efhrf6gFvbJ2E04iM+TqZWYUen7kUu5pP3F9MKJ4Nhvjs7gKPd9bry21RnZF8xWw6nC6iqZN7en
 UA84vOzq+7fN0ECPcGmlVrfokxDV7Unqwdbi6QjlkC/UbAfXXhPATHnYsQW/0On5f1QEesO9GAE
 iiz780rZMDOYNyzO7LrZ8OMAtTPUak6QvWBGZqlRMJd45q0uwVClmJz9k2iHaO5A6DkCAxbWpJM
 DqTbR6tTdmZOWVgG18UqnrKOPlr5Be23ay7eaCwGEQQzDd3NCEVSgEQn5zxtTm/MX2yk9fvpz1R
 QkkfOAUwsOdLKKg/D2aJVc+AaYbfwWqM61PeYrObgBp0cm08u2aExo9MjfhQ3vSazjtZhL2OeMw
 Y7g9CmL7YcKyS7J1QazXLZ4K++FGYjSm/16YPWtQjGPrjcg2SuFhl8EQt4qgXa27q8Fz1auFZQh
 N1Q7vQMLdw98yzLT6YE1QByLwvmWa4h4sdOd7FZsTc64uYGfQyNjSocFfSoW+Y5L/SJfvETNKkb
 01kGADTQP3U4z2Cz8J9ToN+Du1a+qM6T4LREO/DZzka3LE7SlKSCsxCkUi/c2BdybLp6NtMtqgE
 V4q9TXokgHGInf/578MI/t5ePJusaSR0H9oK/ZDzsRNWPHwRYBCUaKAJ6wjqChU9Fw6QQ8DMvi1
 oNWrm3T+e0MQtgUq55fE=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18427A4C542B;
 Sat,  3 Oct 2026 09:02:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-2xBP;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:44 +0200
Message-ID: <20261003070128.1295458-72-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 072/114] package/python-pytest: bump version to
 9.1.1
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index cdfab80acc..b1cb9d8cfe 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  0cd1c357553d2e3eb850d71843b375d1  pytest-9.0.3.tar.gz
-sha256  b86ada508af81d19edeb213c681b1d48246c1a91d304c6c81a427674c17eb91c  pytest-9.0.3.tar.gz
+md5  31f635913c0b1bce9438be52d44398a8  pytest-9.1.1.tar.gz
+sha256  1088fbde8f2b49d95a549a195707afa7a76a3ce9bcadc26b6d71f0ffda5fe313  pytest-9.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index e949eff8a4..6de425cd23 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 9.0.3
+PYTHON_PYTEST_VERSION = 9.1.1
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/7d/0d/549bd94f1a0a402dc8cf64563a117c0f3765662e2e668477624baeec44d5
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/e4/47/b9efed96c114afcfa3c9d3fe98a76a1d14c74a9e266d397cf6eb64be5e01
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
