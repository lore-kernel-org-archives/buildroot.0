Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3F7C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAAB14052B;
	Sun, 20 Sep 2026 17:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OIEzGn7ZTxE; Sun, 20 Sep 2026 17:16:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BCA7040F2F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924578;
	b=fB+3i8a8k/lzwB8u/gpMQGbbxY7nZufMbkLD8IvWgWEEhWjcqhxFbLf49kuPif9EfRxC
	 0HAhc4JRvXQN+z88sKgJ7yuBO03XIzSC9jd6HWeCwiD36alGGioNJmd64vwDqihfwZ0Ah
	 Q4FHN2FLunOUSmohsCG55MWLHyCKfBLgt06xQ6y0tqEPsq37z74gmbxgmHIFfAl88nDbO
	 uxDrbrYYcTe53GTxgZszLmxMWPfTPK9aZatwsoqpsjfl0Bb6Ns9D/41/KSUfjgcbZNE8P
	 wsQMCOy6mKO+6Sd9fdKUPIO3MjjPgbBxXnQ6ZszsDihaWECIwvH+5uoXAWPkO6aeGHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924578;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	b=naxDvhAVSa2jRjJFkQDFHew9LIL/cSU1CLPJJb3wcrdriGsEihGAV8CmBnuObf7Y+M3T
	 n4Wed4Pi9vmh9/DUxFb91csVoXX/gYFOmSLQ/ySL1Pi6rkC2llJde4YPo9nLDNZsk0Fvj
	 hxNDXmbbsKNkHY8sc2likcmzf5JwXtouiJ2QSZZpcY0nMDh7uKcD5JmtX18nY/K5SEF3v
	 5fq9f9HS8VwxkGOeY+UP7Pp+BJtHJk1is7E1C4ftfXjzPVVsaZHI1f5KI5KU7fgk9Kp+l
	 Bs7YUsQCnnNzvnYmeJUjFfPce744lrSEuyyKg6gsjwZV3nOaYYa+eEEBPBRslU10mWQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924578;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=avT8hmizkOtz0LCXD7I+iggwPQAye7UKPSbnVguRotSwKz0U8q8QsmqkYm3MDngio
	 9LWJBzxH9QQQqQv3s1h6mWFnelZuwovS0UEZqTXql5nvtfE9lU7kRPwt3DmmeNVhdy
	 T57OFNFCYqHbQY0bS+6EX6p1wAjuQThZjC0xCLFKRdtUDsLKqEpKpJiQA/lve01KO3
	 sOpzBebWyFwbZcOEDv+3VWTvzJPW8RtAPP23rwkorLN/B5dM3IvuoojqcLOyZn4PcD
	 mhDOKPm8OxJHa4lWew7MX55PnxtBHr2qknEhxN1Bx+AxXWDcsRze0h2w2Nwyx4iJuP
	 d6oTzKok2G1iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCA7040F2F;
	Sun, 20 Sep 2026 17:16:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60EA937A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52C824007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpF7Et6Ii-o5 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:16:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2B94540022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924576;
 b=hfjaoy6WpCjm/B0CCeX6k5p6+CQ4A9ICh78Pohl2HYj8hVGgtob9I/lQmZqECQ8z62Hh
 88qDyvO2RdWSl+4UcHQTwE0Sg37EGtCHIBPWBEyGVkDoqk38PjrxIrH7K/WXXMeos8gR4
 GNHPnPFQkUxUmhKBPsvgZ0YNFaiJVAenPbrrvI9xkZk/TWJlhsRAOXcsfp5jhQvB0cYf+
 UFxNfX+YU3cKsea0xZT/8f6bt267M6tnSj+TF5BZ/0ecn9z1zCkmQCVg2EKed9pliBGgt
 ZOAeX+r0Pxz5IWEofjMD1I5BWMPBBt2YCjsukbeaqqDb1tgu8dJhKYsLCZU8bj62Pxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924576;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 b=euCN7u++4POvxH0sE1RnGpoHeu/QGtYQQXs2ZlKV7cVyDNoRr0jZWn9CwtK+EAFXh27r
 Qr0ohyyF55aJw/rGjwWXaftUUO54hBSBE2RizxLlK4Y7WOuwle2K09Qbff6dJrqcGy+Vd
 rkg0Jv0kcoopD4WJaZI/KBF0xQR6C6JIYgJuGpFvxmDVKNtcjrZSO5QXp80fcFrAGwkyf
 jrGuZ5pSh8zjlrodyHG8WvDT8/9Vh2fw4jgjJHwUJ56ZZIoh0blMvWQXVVs/KlQLyt6Ao
 ukpQXXfHvemWP8oJn044w8Z52AIx1fIekuU6OLlpHnkol3z9tJ+D4rmePCN5InGf+FQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PpvT+w1L; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PpvT+w1L
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B94540022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924155;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PpvT+w1LJrX/KZJ8xpTXuYCtyA4R/jiC2hAFyLrK/WG+ludiQP9b0mu6rHsIaxKzl
 BfuOwlQXDYNzGgA/OnbivuDdd3pnCr7rTrUEE0ulA6liC62++TkATle1dMQiHyyQF1
 t4JFvqeNo5Xzn2t3NwtDqoDL60QNQa+EXACNMxMl4f+R33ZiworHHnGm+OUgi7BZHH
 MxVG41NOfCYW9hnFaHtPef9C8bbWwB2nQWTUVo7z/R2Gcj4IY9BmKBXTQpKTVv++Ix
 nrnoNtL5bhgSDo6YAVkCnFf75+I7Bkb9EtSPTRyr81zqV+UVC0zNoZBWXYq6noUMZO
 5W/47CoiDLUJg==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:o0VvUDZ6lmnCLnYFUR+InclnE+T3D9YvS5PW8GtY0GltraSDM41/JMnDb9NCX9P1AGHLUqwcFBfEtCXtHNeNW+9ZpxT5uJzQ3HaiTAhCFBCFCnAD96hfn+f9nbKJb48OAE4DGdNOTCfRWjA1e8eze7Sk8I80Z+mMvs7CBubdhqFG7S6wojswZ1xN7Ne+gHQeaJ3Uu5IgvOIvqTXD1IeswsiI6FiYy9VFTeQSLHiDyBmHMreJTiQV1DwHn8DDN79Hv6PnxWo2xSkbwTDw1hX1aoj9cjWs8bEmQDRk68ARwObucau2UqYXiYUz2uBhO9dX9N3RVcijbOeG4rTXHDEUCaiSng90Ivi36HfsK623RbJXsnFpuWH2OKn4QXOQ7Oq527k4AS21D2ZbIFbLtC/l5eWd5T9ceI1aXYLHDwKWgBa8vLyoRS7qsd5xkGrzSx2Rf4k11+PmXsoEQZuWEj1DDQJUijrEvLLa3ZZExPywHg/SJ8hczcsPSJvKUFSnvyAfBcVaa1MWMCKvZJl15IUNmk9m5kgDrfIYSc4w72LWhxjdt7EYdkBkMhO0+ETLR9RHos5cg1UoMG/aDCoIQzFIr6xfMX7pMELO3ceAeZN0FKxPgU
 tG+rTuY3/mwy3t29hO2QWDqQJ0kHcwP5Gvd9CI+96nyzIWuxHMTS2AI+ZwG7s7BPCPj+XguX4=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E9518A4C488B;
 Sun, 20 Sep 2026 19:09:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1a-000000000o7-0r92;
 Sun, 20 Sep 2026 17:08:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:34 +0200
Message-ID: <20260920170815.240247-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 27/67] package/clamav: Fix build with OpenSSL
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
 ...-crypto-Remove-cl_ASN1_GetTimeT-1731.patch | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch

diff --git a/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch b/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
new file mode 100644
index 0000000000..60e29a1fdb
--- /dev/null
+++ b/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
@@ -0,0 +1,136 @@
+From 0097a6f99d9f6b78381e12b677a38fb62242c41a Mon Sep 17 00:00:00 2001
+From: sebastianas <sebastianas@users.noreply.github.com>
+Date: Sat, 1 Aug 2026 00:13:13 +0200
+Subject: [PATCH] libclamav/crypto: Remove cl_ASN1_GetTimeT() (#1731)
+
+The last user has been removed in commit fa15aa98c7d5e ("bb11594 - allow
+for compilation against openssl 1.1.0"). This function is only exported
+under CLAMAV_PRIVATE to be used within clamav, not by external users.
+
+Removing the function will not cause an ABI break since it was not part
+of the officially exported ABI. As a side effect it will compile against
+OpenSSL 4.0 where the ASN1_TIME type has been made opaque.
+
+Remove cl_ASN1_GetTimeT().
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+
+Upstream: https://github.com/Cisco-Talos/clamav/commit/0097a6f99d9f6b78381e12b677a38fb62242c41a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclamav/clamav.h      |  8 -----
+ libclamav/crypto.c      | 65 -----------------------------------------
+ libclamav/libclamav.map |  1 -
+ 3 files changed, 74 deletions(-)
+
+diff --git a/libclamav/clamav.h b/libclamav/clamav.h
+index 8a3767f78..fa75677ad 100644
+--- a/libclamav/clamav.h
++++ b/libclamav/clamav.h
+@@ -2413,14 +2413,6 @@ extern int cl_validate_certificate_chain(char **authorities, char *crlpath, char
+  */
+ extern X509 *cl_load_cert(const char *certpath);
+ 
+-/**
+- * @brief Parse an ASN1_TIME object.
+- *
+- * @param timeobj   The ASN1_TIME object.
+- * @return          A pointer to a (struct tm). Adjusted for time zone and daylight savings time.
+- */
+-extern struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj);
+-
+ /**
+  * @brief Load a CRL file into an X509_CRL object.
+  *
+diff --git a/libclamav/crypto.c b/libclamav/crypto.c
+index 8b398e402..968264811 100644
+--- a/libclamav/crypto.c
++++ b/libclamav/crypto.c
+@@ -1746,71 +1746,6 @@ X509 *cl_load_cert(const char *certpath)
+     return cert;
+ }
+ 
+-struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj)
+-{
+-    struct tm *t;
+-    char *str;
+-    const char *fmt = NULL;
+-    time_t localt;
+-#ifdef _WIN32
+-    struct tm localtm, *ltm;
+-#else
+-    struct tm localtm;
+-#endif
+-
+-    if (!(timeobj) || !(timeobj->data))
+-        return NULL;
+-
+-    str = (char *)(timeobj->data);
+-    if (strlen(str) < 12)
+-        return NULL;
+-
+-    t = (struct tm *)calloc(1, sizeof(struct tm));
+-    if (!(t))
+-        return NULL;
+-
+-    if (timeobj->type == V_ASN1_UTCTIME) {
+-        /* two digit year */
+-        fmt = "%y%m%d%H%M%S";
+-        if (str[3] == '0') {
+-            str[2] = '0';
+-            str[3] = '9';
+-        } else {
+-            str[3]--;
+-        }
+-    } else if (timeobj->type == V_ASN1_GENERALIZEDTIME) {
+-        /* four digit year */
+-        fmt = "%Y%m%d%H%M%S";
+-        if (str[5] == '0') {
+-            str[4] = '0';
+-            str[5] = '9';
+-        } else {
+-            str[5]--;
+-        }
+-    }
+-
+-    if (!(fmt)) {
+-        free(t);
+-        return NULL;
+-    }
+-
+-    if (!strptime(str, fmt, t)) {
+-        free(t);
+-        return NULL;
+-    }
+-
+-    /* Convert to local time */
+-    localt = time(NULL);
+-#ifdef _WIN32
+-    ltm = localtime(&localt);
+-    memcpy((void *)(&localtm), (void *)ltm, sizeof(struct tm));
+-#else
+-    localtime_r(&localt, &localtm);
+-#endif
+-    t->tm_isdst = localtm.tm_isdst;
+-    return t;
+-}
+-
+ X509_CRL *cl_load_crl(const char *file)
+ {
+     X509_CRL *x = NULL;
+diff --git a/libclamav/libclamav.map b/libclamav/libclamav.map
+index 809341f42..f3efe1a33 100644
+--- a/libclamav/libclamav.map
++++ b/libclamav/libclamav.map
+@@ -271,7 +271,6 @@ CLAMAV_PRIVATE {
+     cl_verify_signature_hash_x509;
+     cl_verify_signature_hash_x509_keyfile;
+     cl_load_cert;
+-    cl_ASN1_GetTimeT;
+     cl_load_crl;
+     cl_sign_data_keyfile;
+     cl_sign_data;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
