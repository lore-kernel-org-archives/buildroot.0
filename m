Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2D3C88E53
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 12:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3DBE6077F;
	Tue, 15 Sep 2026 12:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVs-FrBwYey5; Tue, 15 Sep 2026 12:08:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 853226075D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789474127;
	b=f68aIgMuMFsXc45q9LBDKN5FB3hmwjdZmGlzqsUf+7xPYCyXh0prsXaFs49jcwIXtZn6
	 yoyd5oXo5qTVeLwlokcyr3bxMgvXtVomLRT+fuLnL/4ljHzvXYptsAefSkH9MclwFUZ21
	 bd9H6hoMZaQGjIJmaK6nvtu4NyOTdiB6knozImFAqCjZfVFJ4cq4DfdFD8fXAmQXk6CYy
	 EbEbNXbBQMOUSFQZfw2p22y+NkxrofqsYQwZLujtMytTXh+jy0OttTa+XQsZjzdQso5sv
	 ej1CtsFYAmlaVVv0JDf9bQAnJa37eLNqGj6xmWPFldNYv0ST5hTHy7oNsQC1Pas+wcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789474127;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=AE340SfmWLlB1TJkOU2ZS0qKcL0qLNiE9aJXtKfTyqc=;
	b=gbUY7D76JXmqi9ZKOXDBOcywIKJPgRU//9eYf8roGYGG7i2dyDdmH4ME4IQjThrBbjFS
	 ziZyQtQVFSAoAyYSpKyj9SwyeFGPH7+zSkzN+iyXDN6UELzhfBk+3uqAok9kTzRXIjQlC
	 QGWSxUz4jHhf5sGAKdHKhytc+UOwSFkhMr8f7wga6KlVEWTpFSjRcFM2+Yfl2KMqXPdEi
	 8IvPbPbWDd6DRR6LSOLoUIuz9l8rbe2JY6Q8iV9bffQ+mZBo2ascnfIyrwSvpz8UkGTvF
	 IObohm7a9ry8e8EhQ0TxBI1H3351niMWIEp7UfSPAs/l5fxR/wvpayFBT94iPKVZIgA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789474127;
	bh=AE340SfmWLlB1TJkOU2ZS0qKcL0qLNiE9aJXtKfTyqc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hpBPUPYBaxCu6F2QGlst/sIyDk+egJbEUBg44VvU/jzhmxmIFrkuQ0sRGAf/X1Xky
	 zE1wmp0xlhmzvzwi7p09kBYQp3O6mR4bmXMqOIXUN532ONf7wYJB3TH2vWZip9e8JE
	 6dDB97c5pta4DhQPdo52osOa550oFAkywzzZc0MfzpI5gvnuUafR2fQ8/CO1Gtjju0
	 sX8ecyIhvD/tCxdRMv5lJ0CBDSu+6dQxkFOlkDss/xEYt+g7KFJ5QBYakOXu9v733A
	 RsO3W8JtsTH9gUZGGBDnKFRO11+hmxSo7PpkokpIT3ZdcMuSpP9tURdPziEogiIdNh
	 z3wp7A95QGdEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 853226075D;
	Tue, 15 Sep 2026 12:08:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B096224
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1102D4005E
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFZ7tcgRt0BL for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 12:08:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0E6B24002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789474123;
 b=nJZ1/kusKJ1E0tkQ9RmUdozAERrTy8gC4yYeMu6rH8FEZa4g/He00Cpq/rLOCMKTnKwQ
 d9ltHhDVewvaj99mnLD13tTGjPZadZWsOJrVGdeN8NL5mG19nTv0OZ0N+FBRfOVS3VV6y
 UuNktRSHnD5QiozdmN7JhuG5qwStUDd5K6eOGT2wiZ3Ga0PhOQ4qXm+sqFUyHxaK+VRXB
 GEP9veRWpH/1MJp1ezjXeJeViglWSPxM9j50GAimiKzdLTkBjGR7mqroP39VcpL3HP5My
 WWb9xRB2JXyLVpJBMx7R5uWZh7S5zL7ulmcTCJUnrFfXRV3oYqVZQWKD9gNLr0bj5QQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789474123;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=tbFe5IWqQ3yBJ6BBx89T7SUwqW8goNhClBKxZPJQkuM=;
 b=aDuZCIeteSVLJe4SrN2rbGlJmsf3kTIpIxb2p+isdZXKCjKsGpeEcoH2qGtNQ3Fq/Nhs
 e3qqgJ+9Loqr1SLSPTx9dswLL8DatPIIwNyJzVcZHbYsL/Hf07SRxRh3xqrY25/BJOEZw
 2k1yjLXeVi/mUkdooB093y8VKXEIoxuoP+/29CcHQQpJ7qs+lPa8gc2/X7O/TySfcZ9gn
 smBVuxqVz3975yEftVViNWox6FpsAZFCZYz5OR1PZipdhwE6ud0xgsM7+fX2a34SmiMAi
 KGryj+Ln79+qZFsKrirYQCFdCCqHo+GXkU1n8vmPreiB0r7UkB/sW02N9iUGZ8kD7Hg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=l5eFrOz4; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E6B24002B
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:08:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D3DE74E405F3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:08:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9164C60498;
 Tue, 15 Sep 2026 12:08:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8F87511C7AFF9; 
 Tue, 15 Sep 2026 14:08:32 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 15 Sep 2026 14:08:29 +0200
Message-ID: <20260915120830.1926973-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/strongswan: fix
 BR2_PACKAGE_STRONGSWAN_BOTAN dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_STRONGSWAN_BOTAN selects BR2_PACKAGE_BOTAN, but since
commit 10a70b1af67cf79986c2e401f7a54aa850ea82d6, botan needs gcc 11,
which was not propagated to strongswan's botan option. This commit
fixes this issue.

Fixes: 10a70b1af67cf79986c2e401f7a54aa850ea82d6 ("package/botan: needs gcc >= 11")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strongswan/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 10efcc1616..6847ca4f62 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -35,12 +35,12 @@ config BR2_PACKAGE_STRONGSWAN_BOTAN
 	bool "botan"
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # botan
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # botan
 	select BR2_PACKAGE_BOTAN
 
-comment "botan backend needs a toolchain w/ C++, gcc >= 10"
+comment "botan backend needs a toolchain w/ C++, gcc >= 11"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 
 config BR2_PACKAGE_STRONGSWAN_OPENSSL
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
