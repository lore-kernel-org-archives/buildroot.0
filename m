Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1166CC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE17740D90;
	Sun, 20 Sep 2026 17:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jt8gHhgJNJef; Sun, 20 Sep 2026 17:19:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DE29540F2D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924789;
	b=gWhvNMiqXAUgsnhYTXTMEzjmYdK+68hN2mqkV9M6smPHhTln1+gFgVnNomTbUoI5dUGX
	 ytgt/Kd/pp97FV0fMK/Qv6QHEjRFcgly4QhNZM80rCRPXurYAQOYmEi5F/0eJHhCUKP4y
	 /I2+l7DEYQkRYYjdBAkq1TTK5S8v2OqxXX87RKm6fgJiwmWfeQloDjGvZAvhT4ejvyMLK
	 cb5/MAiKEIAaoIanCedyq5kVrnTmsuyISoxiP3alOLNZ9FsCWdYixU39OBao15PZ0Fm0C
	 neY57p91RlIf48ksKLKtvfslhOueSjQvK+Pyc1fvy4WuYCE84x+UNEysS828frSXeWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924789;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	b=H3pcLX4G8gKkhyNU/HvSUd/43v5LbdIRwue9qKCaQ9aST0rhDiJ5a5kitkORXwCRpmtg
	 9c3UnMjdl/ER9tynClN2bxh7JtgRU5Ex0c2i5x904+1L0x+I2uUEiZ6M7rmF14NwZtoXt
	 NcnP4Vp8Sf22cCYTspcLUfN8LN7NfU84ZU0Ckl10XywJvq5ghA+CBqsjFKLMfsPtJeJI1
	 c6E3QvuIHYA7gh090gs7FUTOboyktdjc43AnSRpdZagyNTopxAwRVgJFhFh/nonWhmIVK
	 jLG6uWg+nswfsvMo/m7nhkBnDGXpnmwCoqdpP0S4IwXkWh7KFdsCf5cigsz0rqU5rcg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924789;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Wo4nNxtpF8d2bertHq7B4QvDAspxd/+p95xT4TQjM/M0YBTPl05Q/s2ZX/Mtd4y2T
	 MmryIpyfVaTcVoGxRBBVmAiGl50kEQjMZNXXkkHmHEKUIx7GwD7XwWAkB5C5+GuNpk
	 rMwTt+NJv+p397sa86BwPFEoDITvabxyA7FQX8KaDtn0xSeg7uTiDMDQkFxpP9MjnI
	 +U1iRACd+LFnu8mVOPZojZwy66b2FBgP7XLTBtlqCesS71XnUUE+wpLrzytqeW3NeS
	 DespsmA0rz90/eM8NKVdQHGzFni4m6qlhW3t9aEx8DOEw2Jv3WO5cRoVLG5UVfCkBO
	 kqm47oO5L4OsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE29540F2D;
	Sun, 20 Sep 2026 17:19:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A5733FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C51E606FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XAKfwnSNeYx for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:19:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4AC4560601
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924786;
 b=eO3UANDwJ921+gQxONaSW0otDmMKJw/7vU7tqAtjKKzP4I3IF038lGnJEl5gbCm450aI
 Yr06henOSKFCBKrMUsm6YUMYewmhg1xJXn3eUopqjXFAzRhW3LlZdPNouvh9Mv2n4K5Ew
 afwCIpocEczjSC71O6MeXoZg83gT33pTrhuCLJvfJqK4L/9MUgBmqplaCFh+hDjjqv18L
 qMPyeM+hy6lsiCjYj1tuHaskPtLukGoBICARgO5tmA6Bev4Yr2qAoPwsxfkGWp76vvSrV
 Jzq+qNSpCXv9zhzBCKfFa+f4D9yt4WkqqzLjjLbqsqu+1mnRsSJwucjUTO7HVeE0Acg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924786;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 b=XiXoyxLOJ4MGsYsT5aJDtHdmg1NQujKnc/0PFZ6wzPpuhBX8Qe7K9ygmfnUVBMFMozsB
 ELMZtpewe2lf92biFSc8qAvRaGgZT4X3nFN9qeTJqPbikkSBx0jv7rreiT+8DvzwXO56K
 DFlbUtsWHARDLU8JcxxRANFnBOJzUnHdTSAxMssghfOvG0vW2wagVabFxmH+/9vqPnjF1
 ozcBQ4cfW0LDTL0N6hTBJI3tb5Mel4E4KvrWcLF6KRQPLk/+DV+/OqRfN5BkrBZV3vEXr
 mQ6HM/Q0bLjCYazStpiSrSwkhSyjFVebzxO1SABplp7SEkZZywx5naqzYgq+LlnV09A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=opPvjDSg; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=opPvjDSg
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AC4560601
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924163;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=opPvjDSgui8U7Y6yWI6SaT0Y+pqOY8Qqgp8rbBJ9LZIeuTwJQV2iMje9JOsH2xEIt
 Xof40Eo2NFIoUBCLfXONEQsH8/seBQ0KHcMG1QGO5NikTOMkIZfl2VMUqVvHTyxt/2
 tjiUIoAzzVLAWrqwWgSM4yTgc2ebmaJWyxuLxyGLeBK5hiLeLvwqobiB7NB8H4eRfv
 Fu3+oU8qaFUJdq0U/KSNenkWXQN532QATbBpCAL3ojoP5FqYRdxqao6rEBUpq/hssm
 VTGIsYFmxojSyp/kam5cQhVIHf7ItFtWtOcOuEjkYoec1CaZJbOJN8Ov773y0CBBaZ
 Mzp+bjZ43BcfQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:7c2TRLYh/K6aUDjk8SzvvE4T+g7HDgT5p4FGN6fqs4vuZWJeqNCkhlP+CtEnxPRJ4k+q4lo7dQOcAFAQKRFhDLfW4z1xkP9VQM77Kue9h3KmIjsejKAVbJ7Pipat8d+qtxL/cfqFuGdrdUfN/cvPSr1PPJ3KAI9Lp74GH9UcAtRtT+7OMG80rBrq7YT/71Z5QFsN/WSgwXXeRF9tNOJ9c3opy0ffWFX1P3rz4mwTKwAnJJr1ZGUY0hbwUJzSV0fN+6adPuV8VXFnN1DMBgb8lKv1JANe0mIhLbq4/KAICZUAvb3WUGiCpcD/A/LUgG14lba3jUHkqgWD5vWoIaw9t1U1tqwXX+hUmxdvxu6qL+P0NPAvXyG1Ao2wMWLvkrKTVdnhwYdAJcCon/WXykk07iV2J4nRvCQb7a64URKB6q35v6s6t4eJ4e7QgO6QuS78jjZ8tBv8+r9lHW9DwrDucg+d0HbeksbBT68IhLFCxEAbCuZZuzJtaZDs9ufNc/dnmy83s7xaORaJZDoKH2USHFyWSJa5k9NOptqsXh8ZHGHtyyEY6EbaUYD2HrkFYdiMt4WQDim6R+uCqvmgJklGbwkFfB0PZopxNVekHMts03cAN7
 ZBg4VRrzKEwJaIYs450qCm9Z2OWEgC6fPFcoiQiY75jds7nd7d4UvVyqZf+1qaXOH+oFZbbE4=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5C3D1A4C489B;
 Sun, 20 Sep 2026 19:09:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1c-000000000o7-2wCK;
 Sun, 20 Sep 2026 17:08:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:50 +0200
Message-ID: <20260920170815.240247-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 43/67] package/netsnmp: Fix build with
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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
 .../0002-libsnmp-Fix-OpenSSL-4-build.patch    | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch

diff --git a/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch b/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch
new file mode 100644
index 0000000000..e92dffff02
--- /dev/null
+++ b/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch
@@ -0,0 +1,99 @@
+From 1c70efc4334629ba278ea75a071d4dbabc198df8 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Fri, 12 Jun 2026 13:52:20 +0200
+Subject: [PATCH] libsnmp: Fix OpenSSL 4 build
+
+[ bvanassche: edited patch description and fixed OS/X build ]
+Fixes: https://github.com/net-snmp/net-snmp/pull/1101
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/66736ece08dc2b4050acaf234e6959d21c89cb02
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ snmplib/snmp_openssl.c | 39 ++++++++++++++++++++++-----------------
+ 1 file changed, 22 insertions(+), 17 deletions(-)
+
+diff --git a/snmplib/snmp_openssl.c b/snmplib/snmp_openssl.c
+index 4471a7a9d3..0bd1a65882 100644
+--- a/snmplib/snmp_openssl.c
++++ b/snmplib/snmp_openssl.c
+@@ -234,6 +234,7 @@ void
+ netsnmp_openssl_cert_dump_names(X509 *ocert)
+ {
+     int              i, onid;
++    int              oname_value_type;
+     X509_NAME_ENTRY *oname_entry;
+     ASN1_STRING     *oname_value;
+     X509_NAME       *osubj_name;
+@@ -252,8 +253,9 @@ netsnmp_openssl_cert_dump_names(X509 *ocert)
+         oname_entry = X509_NAME_get_entry(osubj_name, i);
+         netsnmp_assert(NULL != oname_entry);
+         oname_value = X509_NAME_ENTRY_get_data(oname_entry);
++        oname_value_type = ASN1_STRING_type(oname_value);
+ 
+-        if (oname_value->type != V_ASN1_PRINTABLESTRING)
++        if (oname_value_type != V_ASN1_PRINTABLESTRING)
+             continue;
+ 
+         /** get NID */
+@@ -268,7 +270,7 @@ netsnmp_openssl_cert_dump_names(X509 *ocert)
+ 
+         DEBUGMSGT(("9:cert:dump:names",
+                    "[%02d] NID type %d, ASN type %d\n", i, onid,
+-                   oname_value->type));
++                   oname_value_type));
+         DEBUGMSGT(("9:cert:dump:names", "%s/%s: '%s'\n", prefix_long,
+                    prefix_short, ASN1_STRING_get0_data(oname_value)));
+     }
+@@ -433,30 +435,33 @@ _extract_oname(const GENERAL_NAME *oname)
+                 rtn = strdup(buf);
+             break;
+ 
+-        case GEN_IPADD:
+-            if (oname->d.iPAddress->length == 4) {
+-                sprintf(ipbuf, "%d.%d.%d.%d", oname->d.iPAddress->data[0],
+-                        oname->d.iPAddress->data[1],
+-                        oname->d.iPAddress->data[2],
+-                        oname->d.iPAddress->data[3]);
++        case GEN_IPADD: {
++            const int iplen = ASN1_STRING_length(oname->d.iPAddress);
++            const unsigned char *const ipdata =
++                ASN1_STRING_get0_data(oname->d.iPAddress);
++
++            if (iplen == 4) {
++                sprintf(ipbuf, "%d.%d.%d.%d", ipdata[0],
++                        ipdata[1],
++                        ipdata[2],
++                        ipdata[3]);
+                 rtn = strdup(ipbuf);
+-            }
+-            else if ((oname->d.iPAddress->length == 16) ||
+-                     (oname->d.iPAddress->length == 20)) {
++            } else if (iplen == 16 || iplen == 20) {
+                 char *pos = ipbuf;
+                 int   j;
+-                for(j = 0; j < oname->d.iPAddress->length; ++j) {
+-                    *pos++ = VAL2HEX(oname->d.iPAddress->data[j]);
++
++                for (j = 0; j < iplen; ++j) {
++                    *pos++ = VAL2HEX(ipdata[j]);
+                     *pos++ = ':';
+                 }
+                 *pos = '\0';
+                 rtn = strdup(ipbuf);
+-            }
+-            else
++            } else {
+                 NETSNMP_LOGONCE((LOG_WARNING, "unexpected ip addr length %d\n",
+-                       oname->d.iPAddress->length));
+-
++                       iplen));
++            }
+             break;
++        }
+         default:
+             DEBUGMSGT(("openssl:cert:san", "unknown/unsupported type %d\n",
+                        oname->type));
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
