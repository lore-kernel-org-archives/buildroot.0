Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59FDC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB1840E5F;
	Sun, 20 Sep 2026 14:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCaFTV5MZXLY; Sun, 20 Sep 2026 14:18:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2E9FC40E57
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913925;
	b=NzuvWVCNY9RlJarEPytAuXNMoj5TgMpskg6rF7gYULvGvMcqhvIpps2vDsCZcI1E/YLs
	 ST9qDPj6D+6Qc6VZ0in2ZOXmWv3y3ZbfGz1vaB5VmFUi0xyHHXD/jLGo/wLxSKN9Yo9iC
	 ihHT8tTTC8HXAwjUll8fxv+jkuPlbrcf5KKSt7/opgyNd2Ird+Ppf4YDTjfUrg1FCN1m3
	 FhTHvXr0pWZ+/G6C2R6/zX1ukZbvyznL26wbjeBqOeYEShE3n4aw1O4ReVk+AE4XVu/Wk
	 ODeVTfK8nBtZoMXF2n8lunHbDbfLHrb9XeWy/qhltuj8ycbkQA96JFSBKh4JWfGX6Vg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SejVdTFrYmIv/TQv7dQ48F1QCWg7uY75T27igrz1QTU=;
	b=YU6pk/lCq3wxC8lblKqynZqe9RJSXccWN8LUdzx/+PqHYmdFyqpYJ0m3YhI8LeN/k4Uv
	 CBjh4cEle36zdy9fTWAha4DeK9EicevOrk2mhUbL7KwbgNdSYDaK4GRrWYv7SfcL0Tyrk
	 og7iNRhQ3j7ojzk0wi6jzlqb1DMWeBZhh/SpHCElmsi81ABW8kOzx8N6cj+OywuUYQuTF
	 9vK6FxVWobKXw76iylhs/t17AkM44T+zhLbve548iOwBLPCA4RKKiXC2COe/Cf+AoCWz6
	 BUV9pSjmHa2MTXIeSB/2WPN2/l2T9P0keNtIdMa608sfp3pmv139NW+HbqexAz2WLaQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913925;
	bh=SejVdTFrYmIv/TQv7dQ48F1QCWg7uY75T27igrz1QTU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZkW6xge22Uck0PfHr6nfO2E313SoPdoA45Aos3xVdFfh9XUgzCVs48RR31uxTKGWl
	 NE8jjiD6SyGqaKAYukcWYxc6eIacK6mutNGVYvDMDcLaqvAd3v+Sa1F7OCOKiwXzQM
	 vv4qYnKETHnsJ2nBYJcCZ9XvE17H+ZR3gxcu/zKzS0+TpMcTH+VocGeUB4Tbk0CveQ
	 zcU2KoozL4EwaBagir/e0jGnEN/pAbr2cpNcUKrCILKgz9zsz6eBx6E5ehc+a+9a5G
	 0tNBM0urQOblpyNH2kpfteVykrz4+CehldU5N1f2pdwGZ/f0NHcQqSrhNqDJikcQaf
	 Af2IIXO61GX7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9FC40E57;
	Sun, 20 Sep 2026 14:18:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A4DC224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CB58400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvfRkM1cJOiy for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:18:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E529A40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913922;
 b=VleuPKDDpv8qabX7CcJ1/sQouE8ZAIWI4Ze1Q61B9b2kkXVSWUwAH5B6a4aTQ3UtWfNV
 LBEehvosknzxlMP5wpOv8oJV8BIzxDERvsfaM2siFRISTpbBb9Uxya7b7y5zJA8TRckoO
 IGyz6fdnhWjgMFV2dINx22/V92TgQ7q25lbaK0hXSCzpO2lysMvzQiw2NtdhHHQk6Ty+w
 oTsrh7OogRznXMiK/aqiNJOf8nLk/0ZZn+ymwIx5CnyVTKsxGPwo8LdC18cQvbsMEpGOO
 a0QjPvXhZZar7HvfiG/HYoCYIkiYgI3UZ8v3+2fHVCqehGUNgzp6GYx8iKTTTnEbg4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913922;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=wbb7Fhx7Eq9PL+6rS0pQNNwtXMerAQnvNerFGS28ftg=;
 b=eNgVcItDwZ3Emij+SMmP1xhvRh1dQAB/1adycjFWiFDfGow2hHG+kB1jtPnuUyC5Yb11
 Z4RXoRGyPNup3y8XKBzbt7o2lxOWxe9EXvLAywaomGFYXCYGB0hFFtEmayYVD1kCoJ8qS
 qwTRB4q3tKN1rpjmE8Zw5QF5eyhC2gLVeUNqDUbfhlKZ7lPYcKAIlPAj5cXz9lI2lAquz
 6We762jBaIz5PZJlEV6mEitNoLcmUYR+t/c34Val7unGexEwkUYr1uA6o9p71TbvbPM6a
 S1y3vNQBpKaFX7Csx7ObYHMS2qJtC8mxMXI+UKU8/YD2lZe1k2j909uIiJv91ZBc2BQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="AdO/3Mzq"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=AdO/3Mzq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E529A40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913243;
 bh=wbb7Fhx7Eq9PL+6rS0pQNNwtXMerAQnvNerFGS28ftg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=AdO/3Mzq2sdCfyLGW+8oj0OXRW+gBdmLr3Vhkae+i+3UYg3kQEndB7mNGJwZyarFt
 /SJc2bsnltUBln+tOGOcmp8u5j4B9fdv4jaT3+haHso8PVqLPAVsIJXpUr2ScAlNlc
 SYi0QSWKw+v9bJxRfhPx8Mjy5NtAH8gzqCRkBJawEB0OJZiib09G8W1ov5jbxhoOp2
 GAwhJ5hP2qKMHCyvxEdnDsgKqahWj9t2E4rqZ2RBpavvgDRP6ekcIoAcdBlTCNIdh9
 7qQY0FviQj1KYaiTGSCS1FDNIaXaH7FAF+c9wvbvQeNckbKOS3DI7Xuzv7d2kwXpBm
 zB7dhRlxG4TGA==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:bUGWFQNhUl+EqDqMGeJPr7EVMy8wqTgmiYLxP53Ct9EM+PpdkXgo4EB6Ed7V43O/TZaTBkER2/7tsnIE88ovtO3wPKKa5va0jfHnI67cIZu8oAnLFWH7FTuuO7L+5YvOer2yTl0RMFjfU3EKl++avKeN6W/9kww1UW3BchFwmFhvcnLjH7/KzbX2liStliSq/RN0b62zobjRXpFVcFlrzscenJMZZ8Bt+HR2G12G33rjeW5StZ7gxglgmAgr30QlG9CgN7aaFC7aN/yKJXqIRq4CRLVg0JwXbUm+idJK4E77L1IN1BBaS86ksZSTttSGZruIe/6Amt5lKNH7hGEAI4PmZq5kZ4tiL2w9eA0vCcNVWDlfUoau5i5Rt6BaNbhJ9Ce/5t58LyhVd45d3HTWWYTtdHCHcWYbjGi9qtHfq+HUprLUyR0+gCvMRGcyw6uE7+vWAcGQXjlmo+fbc5su+Zqxg8IvCSpuIRure3iWoh1u1UyY1iFOMDRwJFf5CZGcrRglYEvl20Y4dGC1PApONQD2KFbHh9inR88CTb54kFUPceWoHdy08/OY9YDjck8qdFsjQwGBoJrBvRSlo49hKwDxYWtjmidryhThgAXXCtaZcL
 COSXTOoRBg11O27M+z5diy1XTPAMM+zFgxVkE3QNL6oY4O3QLbv94DrFjFhJQT3kl/nsZKQxQwhTA69Y65X6zcj7rrCVlyvoA9vPv48cHTtZ/IuhWW6A==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 34007A4C488A;
 Sun, 20 Sep 2026 16:07:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBN-000000002J9-0MRQ;
 Sun, 20 Sep 2026 14:06:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:48 +0200
Message-ID: <20260920140605.3005461-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 50/66] package/qt5/qt5base: Add support for
 OpenSSL 4.0.0
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

Support for OpenSSL 4 was added to the Qt 6.x OpenSSL plugin by commit
https://invent.kde.org/qt/qt/qtbase/-/commit/e806630e694d89f567cffa9c982d1f471089ecd8
contained in the 6.12 branch.

OpenSSL support in Qt 5.x is not plugin-based, the move occured in
version 6.2.0:
https://invent.kde.org/qt/qt/qtbase/-/commit/d385158d5213ef568b7629e2aa4a818016bbffac

The upstream repo is not updated anymore:
https://community.kde.org/Qt5PatchCollection
https://mail.kde.org/pipermail/distributions/2026-May/001690.html

To enable support for OpenSSL 4 in qt5base we add a patch set mentioned
in the OpenSSL issue https://github.com/openssl/openssl/issues/29117

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/qt5/qt5base/0009-openssl4.patch |  52 +++++++++
 package/qt5/qt5base/0010-openssl4.patch | 139 ++++++++++++++++++++++++
 package/qt5/qt5base/0011-openssl4.patch |  89 +++++++++++++++
 3 files changed, 280 insertions(+)
 create mode 100644 package/qt5/qt5base/0009-openssl4.patch
 create mode 100644 package/qt5/qt5base/0010-openssl4.patch
 create mode 100644 package/qt5/qt5base/0011-openssl4.patch

diff --git a/package/qt5/qt5base/0009-openssl4.patch b/package/qt5/qt5base/0009-openssl4.patch
new file mode 100644
index 0000000000..19e70e876b
--- /dev/null
+++ b/package/qt5/qt5base/0009-openssl4.patch
@@ -0,0 +1,52 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: src/network/ssl/qsslcertificate_openssl.cpp
+--- a/src/network/ssl/qsslcertificate_openssl.cpp.orig
++++ b/src/network/ssl/qsslcertificate_openssl.cpp
+@@ -123,11 +123,11 @@ QByteArray QSslCertificate::serialNumber() const
+     QMutexLocker lock(QMutexPool::globalInstanceGet(d.data()));
+ #endif
+     if (d->serialNumberString.isEmpty() && d->x509) {
+-        ASN1_INTEGER *serialNumber = q_X509_get_serialNumber(d->x509);
++        const ASN1_INTEGER *serialNumber = q_X509_get_serialNumber(d->x509);
+         QByteArray hexString;
+-        hexString.reserve(serialNumber->length * 3);
+-        for (int a = 0; a < serialNumber->length; ++a) {
+-            hexString += QByteArray::number(serialNumber->data[a], 16).rightJustified(2, '0');
++        hexString.reserve(q_ASN1_STRING_length(serialNumber) * 3);
++        for (int a = 0; a < q_ASN1_STRING_length(serialNumber); ++a) {
++            hexString += QByteArray::number(q_ASN1_STRING_get0_data(serialNumber)[a], 16).rightJustified(2, '0');
+             hexString += ':';
+         }
+         hexString.chop(1);
+@@ -251,10 +251,10 @@ QMultiMap<QSsl::AlternativeNameEntryType, QString> QSs
+                 QHostAddress ipAddress;
+                 switch (len) {
+                 case 4: // IPv4
+-                    ipAddress = QHostAddress(qFromBigEndian(*reinterpret_cast<quint32 *>(genName->d.iPAddress->data)));
++                    ipAddress = QHostAddress(qFromBigEndian(*reinterpret_cast<const quint32 *>(q_ASN1_STRING_get0_data(genName->d.iPAddress))));
+                     break;
+                 case 16: // IPv6
+-                    ipAddress = QHostAddress(reinterpret_cast<quint8 *>(genName->d.iPAddress->data));
++                    ipAddress = QHostAddress(reinterpret_cast<const quint8 *>(q_ASN1_STRING_get0_data(genName->d.iPAddress)));
+                     break;
+                 default: // Unknown IP address format
+                     break;
+@@ -511,8 +511,8 @@ static QVariant x509ExtensionToValue(X509_EXTENSION *e
+ 
+             // keyid
+             if (auth_key->keyid) {
+-                QByteArray keyid(reinterpret_cast<const char *>(auth_key->keyid->data),
+-                                 auth_key->keyid->length);
++                QByteArray keyid(reinterpret_cast<const char *>(q_ASN1_STRING_get0_data(auth_key->keyid)),
++                                 q_ASN1_STRING_length(auth_key->keyid));
+                 result[QLatin1String("keyid")] = keyid.toHex();
+             }
+ 
diff --git a/package/qt5/qt5base/0010-openssl4.patch b/package/qt5/qt5base/0010-openssl4.patch
new file mode 100644
index 0000000000..8bcd5b1664
--- /dev/null
+++ b/package/qt5/qt5base/0010-openssl4.patch
@@ -0,0 +1,139 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+disable EVP_PKEY_param_check(),
+use the old versions of sk_new(), ..., sk_value()
+disable SSL_CONF_CTX
+
+Index: src/network/ssl/qsslsocket_openssl_symbols.cpp
+--- a/src/network/ssl/qsslsocket_openssl_symbols.cpp.orig
++++ b/src/network/ssl/qsslsocket_openssl_symbols.cpp
+@@ -146,16 +146,27 @@ DEFINEFUNC2(int, BN_is_word, BIGNUM *a, a, BN_ULONG w,
+ DEFINEFUNC(int, EVP_CIPHER_CTX_reset, EVP_CIPHER_CTX *c, c, return 0, return)
+ DEFINEFUNC(int, EVP_PKEY_up_ref, EVP_PKEY *a, a, return 0, return)
+ DEFINEFUNC2(EVP_PKEY_CTX *, EVP_PKEY_CTX_new, EVP_PKEY *pkey, pkey, ENGINE *e, e, return nullptr, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, EVP_PKEY_param_check, EVP_PKEY_CTX *ctx, ctx, return 0, return)
++#endif
+ DEFINEFUNC(void, EVP_PKEY_CTX_free, EVP_PKEY_CTX *ctx, ctx, return, return)
+ DEFINEFUNC(int, RSA_bits, RSA *a, a, return 0, return)
+ DEFINEFUNC(int, DSA_bits, DSA *a, a, return 0, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, OPENSSL_sk_num, OPENSSL_STACK *a, a, return -1, return)
+ DEFINEFUNC2(void, OPENSSL_sk_pop_free, OPENSSL_STACK *a, a, void (*b)(void*), b, return, DUMMYARG)
+ DEFINEFUNC(OPENSSL_STACK *, OPENSSL_sk_new_null, DUMMYARG, DUMMYARG, return nullptr, return)
+ DEFINEFUNC2(void, OPENSSL_sk_push, OPENSSL_STACK *a, a, void *b, b, return, DUMMYARG)
+ DEFINEFUNC(void, OPENSSL_sk_free, OPENSSL_STACK *a, a, return, DUMMYARG)
+ DEFINEFUNC2(void *, OPENSSL_sk_value, OPENSSL_STACK *a, a, int b, b, return nullptr, return)
++#else
++DEFINEFUNC(int, sk_num, STACK *a, a, return -1, return)
++DEFINEFUNC2(void, sk_pop_free, STACK *a, a, void (*b)(void*), b, return, DUMMYARG)
++DEFINEFUNC(_STACK *, sk_new_null, DUMMYARG, DUMMYARG, return nullptr, return)
++DEFINEFUNC2(void, sk_push, _STACK *a, a, void *b, b, return, DUMMYARG)
++DEFINEFUNC(void, sk_free, _STACK *a, a, return, DUMMYARG)
++DEFINEFUNC2(void *, sk_value, STACK *a, a, int b, b, return nullptr, return)
++#endif // LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, SSL_session_reused, SSL *a, a, return 0, return)
+ DEFINEFUNC2(qssloptions, SSL_CTX_set_options, SSL_CTX *ctx, ctx, qssloptions op, op, return 0, return)
+ DEFINEFUNC(int, SSL_CTX_get_security_level, const SSL_CTX *ctx, ctx, return -1, return)
+@@ -244,7 +255,8 @@ DEFINEFUNC2(void, BIO_set_shutdown, BIO *a, a, int shu
+ 
+ DEFINEFUNC(long, ASN1_INTEGER_get, ASN1_INTEGER *a, a, return 0, return)
+ DEFINEFUNC2(int, ASN1_INTEGER_cmp, const ASN1_INTEGER *a, a, const ASN1_INTEGER *b, b, return 1, return)
+-DEFINEFUNC(int, ASN1_STRING_length, ASN1_STRING *a, a, return 0, return)
++DEFINEFUNC(int, ASN1_STRING_length, const ASN1_STRING *a, a, return 0, return)
++DEFINEFUNC(int, ASN1_STRING_type, const ASN1_STRING *a, a, return 0, return)
+ DEFINEFUNC2(int, ASN1_STRING_to_UTF8, unsigned char **a, a, ASN1_STRING *b, b, return 0, return)
+ DEFINEFUNC4(long, BIO_ctrl, BIO *a, a, int b, b, long c, c, void *d, d, return -1, return)
+ DEFINEFUNC(int, BIO_free, BIO *a, a, return 0, return)
+@@ -358,12 +370,14 @@ DEFINEFUNC2(int, SSL_CTX_use_PrivateKey, SSL_CTX *a, a
+ DEFINEFUNC2(int, SSL_CTX_use_RSAPrivateKey, SSL_CTX *a, a, RSA *b, b, return -1, return)
+ DEFINEFUNC3(int, SSL_CTX_use_PrivateKey_file, SSL_CTX *a, a, const char *b, b, int c, c, return -1, return)
+ DEFINEFUNC(X509_STORE *, SSL_CTX_get_cert_store, const SSL_CTX *a, a, return nullptr, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(SSL_CONF_CTX *, SSL_CONF_CTX_new, DUMMYARG, DUMMYARG, return nullptr, return);
+ DEFINEFUNC(void, SSL_CONF_CTX_free, SSL_CONF_CTX *a, a, return ,return);
+ DEFINEFUNC2(void, SSL_CONF_CTX_set_ssl_ctx, SSL_CONF_CTX *a, a, SSL_CTX *b, b, return, return);
+ DEFINEFUNC2(unsigned int, SSL_CONF_CTX_set_flags, SSL_CONF_CTX *a, a, unsigned int b, b, return 0, return);
+ DEFINEFUNC(int, SSL_CONF_CTX_finish, SSL_CONF_CTX *a, a, return 0, return);
+ DEFINEFUNC3(int, SSL_CONF_cmd, SSL_CONF_CTX *a, a, const char *b, b, const char *c, c, return 0, return);
++#endif
+ DEFINEFUNC(void, SSL_free, SSL *a, a, return, DUMMYARG)
+ DEFINEFUNC(STACK_OF(SSL_CIPHER) *, SSL_get_ciphers, const SSL *a, a, return nullptr, return)
+ DEFINEFUNC(const SSL_CIPHER *, SSL_get_current_cipher, SSL *a, a, return nullptr, return)
+@@ -871,15 +885,20 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(AUTHORITY_INFO_ACCESS_free)
+     RESOLVEFUNC(EVP_PKEY_up_ref)
+     RESOLVEFUNC(EVP_PKEY_CTX_new)
++#ifdef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(EVP_PKEY_param_check)
++#endif
+     RESOLVEFUNC(EVP_PKEY_CTX_free)
+     RESOLVEFUNC(RSA_bits)
++
++#ifndef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(OPENSSL_sk_new_null)
+     RESOLVEFUNC(OPENSSL_sk_push)
+     RESOLVEFUNC(OPENSSL_sk_free)
+     RESOLVEFUNC(OPENSSL_sk_num)
+     RESOLVEFUNC(OPENSSL_sk_pop_free)
+     RESOLVEFUNC(OPENSSL_sk_value)
++#endif
+     RESOLVEFUNC(DH_get0_pqg)
+     RESOLVEFUNC(SSL_CTX_set_options)
+     RESOLVEFUNC(SSL_CTX_get_security_level)
+@@ -985,6 +1004,7 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(ASN1_INTEGER_get)
+     RESOLVEFUNC(ASN1_INTEGER_cmp)
+     RESOLVEFUNC(ASN1_STRING_length)
++    RESOLVEFUNC(ASN1_STRING_type)
+     RESOLVEFUNC(ASN1_STRING_to_UTF8)
+     RESOLVEFUNC(BIO_ctrl)
+     RESOLVEFUNC(BIO_free)
+@@ -1096,12 +1116,14 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(SSL_CTX_use_RSAPrivateKey)
+     RESOLVEFUNC(SSL_CTX_use_PrivateKey_file)
+     RESOLVEFUNC(SSL_CTX_get_cert_store);
++#ifndef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(SSL_CONF_CTX_new);
+     RESOLVEFUNC(SSL_CONF_CTX_free);
+     RESOLVEFUNC(SSL_CONF_CTX_set_ssl_ctx);
+     RESOLVEFUNC(SSL_CONF_CTX_set_flags);
+     RESOLVEFUNC(SSL_CONF_CTX_finish);
+     RESOLVEFUNC(SSL_CONF_cmd);
++#endif
+     RESOLVEFUNC(SSL_accept)
+     RESOLVEFUNC(SSL_clear)
+     RESOLVEFUNC(SSL_connect)
+@@ -1254,13 +1276,13 @@ bool q_resolveOpenSslSymbols()
+ //==============================================================================
+ QDateTime q_getTimeFromASN1(const ASN1_TIME *aTime)
+ {
+-    size_t lTimeLength = aTime->length;
+-    char *pString = (char *) aTime->data;
++    size_t lTimeLength = q_ASN1_STRING_length(aTime);
++    const char *pString = (const char *) q_ASN1_STRING_get0_data(aTime);
+     auto isValidPointer = [pString, lTimeLength](const char *const probe){
+         return size_t(probe - pString) < lTimeLength;
+     };
+ 
+-    if (aTime->type == V_ASN1_UTCTIME) {
++    if (q_ASN1_STRING_type(aTime) == V_ASN1_UTCTIME) {
+ 
+         char lBuffer[24];
+         char *pBuffer = lBuffer;
+@@ -1333,7 +1355,7 @@ QDateTime q_getTimeFromASN1(const ASN1_TIME *aTime)
+         result = result.addSecs(lSecondsFromUCT);
+         return result;
+ 
+-    } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {
++    } else if (q_ASN1_STRING_type(aTime) == V_ASN1_GENERALIZEDTIME) {
+ 
+         if (lTimeLength < 15)
+             return QDateTime(); // hopefully never triggered
diff --git a/package/qt5/qt5base/0011-openssl4.patch b/package/qt5/qt5base/0011-openssl4.patch
new file mode 100644
index 0000000000..23451b2912
--- /dev/null
+++ b/package/qt5/qt5base/0011-openssl4.patch
@@ -0,0 +1,89 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+use compat defines for STACK and INIT_SETTINGS
+disable EVP_PKEY_param_check
+map q_OPENSSL_sk_*() to q_sk_*()
+disable SSL_CONF_CTX
+use old signature of CRYPTO_free()
+
+Index: src/network/ssl/qsslsocket_openssl_symbols_p.h
+--- a/src/network/ssl/qsslsocket_openssl_symbols_p.h.orig
++++ b/src/network/ssl/qsslsocket_openssl_symbols_p.h
+@@ -80,6 +80,13 @@ QT_BEGIN_NAMESPACE
+ 
+ #define DUMMYARG
+ 
++#ifdef LIBRESSL_VERSION_NUMBER
++typedef _STACK STACK;
++typedef STACK OPENSSL_STACK;
++typedef void OPENSSL_INIT_SETTINGS; 
++#endif
++
++
+ #if !defined QT_LINKED_OPENSSL
+ // **************** Shared declarations ******************
+ // ret func(arg)
+@@ -236,14 +243,31 @@ int q_EVP_CIPHER_CTX_reset(EVP_CIPHER_CTX *c);
+ Q_AUTOTEST_EXPORT int q_EVP_PKEY_up_ref(EVP_PKEY *a);
+ EVP_PKEY_CTX *q_EVP_PKEY_CTX_new(EVP_PKEY *pkey, ENGINE *e);
+ void q_EVP_PKEY_CTX_free(EVP_PKEY_CTX *ctx);
++#ifndef LIBRESSL_VERSION_NUMBER
+ int q_EVP_PKEY_param_check(EVP_PKEY_CTX *ctx);
++#endif
+ int q_RSA_bits(RSA *a);
++#ifndef LIBRESSL_VERSION_NUMBER
+ Q_AUTOTEST_EXPORT int q_OPENSSL_sk_num(OPENSSL_STACK *a);
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_pop_free(OPENSSL_STACK *a, void (*b)(void *));
+ Q_AUTOTEST_EXPORT OPENSSL_STACK *q_OPENSSL_sk_new_null();
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_push(OPENSSL_STACK *st, void *data);
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_free(OPENSSL_STACK *a);
+ Q_AUTOTEST_EXPORT void * q_OPENSSL_sk_value(OPENSSL_STACK *a, int b);
++#else // LIBRESSL_VERSION_NUMBER
++int q_sk_num(STACK *a);
++#define q_OPENSSL_sk_num(a) q_sk_num(a)
++void q_sk_pop_free(STACK *a, void (*b)(void *));
++#define q_OPENSSL_sk_pop_free(a, b) q_sk_pop_free(a, b)
++STACK *q_sk_new_null();
++#define q_OPENSSL_sk_new_null() q_sk_new_null()
++void q_sk_push(STACK *st, void *data);
++#define q_OPENSSL_sk_push(st, data) q_sk_push(st, data)
++void q_sk_free(STACK *a);
++#define q_OPENSSL_sk_free q_sk_free
++void *q_sk_value(STACK *a, int b);
++#define q_OPENSSL_sk_value(a, b) q_sk_value(a, b)
++#endif // LIBRESSL_VERSION_NUMBER
+ int q_SSL_session_reused(SSL *a);
+ 
+ #if OPENSSL_VERSION_MAJOR < 3
+@@ -373,7 +397,8 @@ void q_SSL_set_psk_use_session_callback(SSL *s, q_SSL_
+ bool q_resolveOpenSslSymbols();
+ long q_ASN1_INTEGER_get(ASN1_INTEGER *a);
+ int q_ASN1_INTEGER_cmp(const ASN1_INTEGER *x, const ASN1_INTEGER *y);
+-int q_ASN1_STRING_length(ASN1_STRING *a);
++int q_ASN1_STRING_length(const ASN1_STRING *a);
++int q_ASN1_STRING_type(const ASN1_STRING *a);
+ int q_ASN1_STRING_to_UTF8(unsigned char **a, ASN1_STRING *b);
+ long q_BIO_ctrl(BIO *a, int b, long c, void *d);
+ Q_AUTOTEST_EXPORT int q_BIO_free(BIO *a);
+@@ -515,12 +540,14 @@ int q_SSL_CTX_use_PrivateKey(SSL_CTX *a, EVP_PKEY *b);
+ int q_SSL_CTX_use_RSAPrivateKey(SSL_CTX *a, RSA *b);
+ int q_SSL_CTX_use_PrivateKey_file(SSL_CTX *a, const char *b, int c);
+ X509_STORE *q_SSL_CTX_get_cert_store(const SSL_CTX *a);
++#ifndef LIBRESSL_VERSION_NUMBER
+ SSL_CONF_CTX *q_SSL_CONF_CTX_new();
+ void q_SSL_CONF_CTX_free(SSL_CONF_CTX *a);
+ void q_SSL_CONF_CTX_set_ssl_ctx(SSL_CONF_CTX *a, SSL_CTX *b);
+ unsigned int q_SSL_CONF_CTX_set_flags(SSL_CONF_CTX *a, unsigned int b);
+ int q_SSL_CONF_CTX_finish(SSL_CONF_CTX *a);
+ int q_SSL_CONF_cmd(SSL_CONF_CTX *a, const char *b, const char *c);
++#endif
+ void q_SSL_free(SSL *a);
+ STACK_OF(SSL_CIPHER) *q_SSL_get_ciphers(const SSL *a);
+ const SSL_CIPHER *q_SSL_get_current_cipher(SSL *a);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
