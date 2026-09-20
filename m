Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A501C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03FD340DDE;
	Sun, 20 Sep 2026 14:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgA5ipAfpw3l; Sun, 20 Sep 2026 14:13:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B6F1440DE1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913610;
	b=LrE/lOPp/dIzGknZIPJYQUVu2twSSgH3lyRzksxGZLW40LpVDFI2wg9SK5zeBno5PxMe
	 wOqehO1UkW/YELR5vvyd3QUYtsKYO3MqAPcBka0rTfF1TXHDLfBrcX8ukzqbeRf+16WD/
	 1KJP++Ne1KMgAF0Ou2yARCpJoxt8tdCUs2I+bUN0tuy0Ee/P8r3t1BIX64MtypqetZt/R
	 k5dMFKxgiafWIyD8FR6Dhai31GyJ2bG1PP6wnBm3NZAv7yrc+dKR2YcadhJDggNPheC3V
	 P4gjAO0lmtbLr8UMTVCCS4f/bHlfn2h2Q4pYXf+dJZSab4x5jUhd14ybV1VMVa6lSZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913610;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	b=N8LYLQwzSs9LnNkKL6NDycq0vBkUl3n1uS5PGpFxLPpDIUgaFneBGBq6NWj2OJf5Mbjk
	 oJeFlJ5BilvD2cQFGg2z9xDaMWUD04w0BgcCpXSJvsnSHit/uymVq2tZNKy36vGyHv/Bx
	 w9Q4y9IzrnR45Tfdj6S2JkOnUs3q0y523YAYUKmXCba38WoRiC8bgkgCaBYYpUUHGJ/NT
	 zi3HbtHlPyeL7SKTui5NeLaJIqe4QaGDXSANNqwU1vMzFnlZUyWzIzhpdaiDcDgIx8//N
	 x2q0vVXjXp2OhjbParytXYKMQ3hV6WDNNYdl99Y4BkYF0o1dGD8OPmtaQpfwX7GWcMA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913610;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DG7N2/eaz7HNIY0fFPxsxDZz9xov7RjEDOLXX6OP4cCE9Rc3PG/MBrSIjgfu2t8QF
	 ROiaAGlRGI+YnBOWam8/a4Ep/xu0SvgGfhHFSxVqk8Kk8J3Cjmr1zXQu7ClzY4kaLN
	 DD7eQgI9yex+vtSq6tUb6kYti+tMNqHO8OVufyUd39xoHhICGPFoIIa+5FIZ2AWp2O
	 qev5VoEwBgb+pdANBdpi+mPv0xnpmcG7dVebeJaQrgVN3Jt4f6/zCvATwWpj04K/Do
	 3yhprXnEhwiz6yJQEIdh2K953rzTjC4EwlVESbuiyL9gnc5Nh+MMp958ghjo+awujt
	 khurDJRaETx6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6F1440DE1;
	Sun, 20 Sep 2026 14:13:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 931083FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8562960693
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lZNdlBWFZNy for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:13:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4E51E60699
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913607;
 b=MkQZxgP68XzWSjtYooihXAcH+fSVrQNoLhHCRVu6jNBgY2514q0dRAE6eXysPMsgUktj
 bafrdMXTBrLJ+PONs5Qar8rz5kBR49MUysf3JwTxvCzgue+47RVS/vio1VWtvtw5js2U/
 +QZPlEoDOcgn7JnJ+2k/lE3bOmc5cwCNKMp4lVEkPVFggUXulAoG8BBJyPDWxgp1Omg3O
 +dkgaih+8YWMHb7ljzXaOOHDZDqIi1xeQjyZzDYJ+Lx7SQGARVjU54rg3DjHiBlBofnmo
 Gq8EwZGFW8shJmKUzo4603jUpsFwlq6KGUgjcVeQwNVkm00NtvWprURu63tDD2GwctA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913607;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 b=PzoLH8hZ24Th/Qb2meoxiSD9m1RnUXmdzg6Jq21Cm/+T6HuddGGfouHxOI8WPVoZcAP+
 W3viz93YwP/NJfp1V/K2xuu0qSGMb6Ympcbzfte1486dZyNftVGy09vm+lnNA4b0YJxdN
 0AT9K347PDA4JYXbK2vm3FNY9zA9VKQLqEfO4hvzKcfQKAKCOdRGyhQI86B1RaFDpvQd2
 Ho4e8LpUA8ohlYgqLv4Qak87jQehaq4iDTV87rHhsba3jc8WScV0todr4KiQwt9fuuBBr
 BXnEXuP5DJ0zWIAnT2HkQ5H7U3csQLOddoDRA0DiGCVpyOkCCGfz0+GEug6lqSQIc/w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HpVFk3Lf; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=HpVFk3Lf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E51E60699
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913235;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HpVFk3Lfa+kls8i7rhROg6SnHyaclIolaI0zaz6X5Q1S9VVfoNxRUNolOthfJkMX4
 BjQHap4NgmHg3FNSDednahPkEeDf1/det2ZOP6dGsmXv4FEIiHKP+Rkjy4lWkPPnbN
 SEumIgpoOfYj8d3h3lGDtOVf7a9NJfvsxUezO1dxkaBp+oQiXG6zhtMC/6QWsGSror
 bEf+0EZglwQ9v9aAY/vCpY2UMarir/7DPxyyMJ1tNH9eE4laaQ2VxKSwkhMT3yrqLw
 fjxnclqsJahm1YDXIsaW0cxBIkfgGu3cfMok8XCsq5LF6babx+OjskSFvykyjneWfF
 SAGeLBtGglJwg==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:jzDecRhK4lLEPVKUvQLMoHaPEXjaoteLayjhLcjMZE/G38VlcrjeNoR+GTPFHIMc9+KzOmcpOZxtnOybhFhkEwQTKku2FQ7ebi+Uc8Tp0Yu+Fl/Ecp8vQFSAPGreYc9zZcgbUQiv9HR2YBNY91tIeYXGyNM1FB4toUs/tFI1K25cZy0WJVwu5W+dwReejtmFIYR/ub4Hc0En68U52NHmKzD4T5r009Yp4xl33jugMgDMLiOH+Sw1g824Wxl2q2Mqhxm7XhSq/35jWjKh5ya98fjBW6PUC4If0w/2dtL1mjWmqphsW/EVWxk9ZHOu+1ZaRyCDRXWi4V/hL4QH/QSWx399dwYuMXwzmXnLpql3QcwJYpxgEj/ri/ahXV3rv0+Qt/vIPpHGQwRE2rmozr5OYmxT1arHQS4fIQQsYYm6/32+8S6JrkyP2W+O3pyTAfcTgmTJMBcY+S099x27e+saQLMMQRyYDyVMDszT9qLmdegG6i0zJfQ7iOT/CW8UxfrXvkKcWRTDweURqM1zao2KHSMp+K8tGEwBuOb2WsyBqeIIRX8kBVaE3NzfqZVdU8kMTbD4n2+6cD3dShE42O1Gykor+f64euPlQ0Oe6mMdYv0SlS
 MoeZZp2H/8RQ5m2j8fMgHXYMjugOv2Phzg/+n71cSS5sC738WirORHlwM+JWKqsAZ87QbrpfH4
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63933A4C4871;
 Sun, 20 Sep 2026 16:07:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBI-000000002J9-0WGg;
 Sun, 20 Sep 2026 14:06:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:23 +0200
Message-ID: <20260920140605.3005461-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 25/66] package/boinc: Fix build with OpenSSL
 4.0.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...fix-a-build-failure-with-openssl-4.0.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch

diff --git a/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
new file mode 100644
index 0000000000..22e2ef65a7
--- /dev/null
+++ b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
@@ -0,0 +1,26 @@
+From 9cdcef8261be4891b4814c6f728dcee65027e5da Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Wed, 26 Aug 2026 12:27:54 +0200
+Subject: [PATCH] Adapt code to fix a build failure with openssl-4.0
+
+Upstream: https://github.com/BOINC/boinc/commit/9cdcef8261be4891b4814c6f728dcee65027e5da
+
+[Bernd: backported to 8.2.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/crypt.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 17a9b57b3eb..b54e2f050ad 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -774,7 +774,7 @@
+     DATA_BLOCK sig_db;
+     BIO *bio;
+     X509 *cert;
+-    X509_NAME *subj;
++    const X509_NAME *subj;
+ 
+     if (signatures->signatures.size() == 0) {
+         printf("No signatures available for file ('%s').\n", origFile);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
