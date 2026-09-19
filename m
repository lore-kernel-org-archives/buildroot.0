Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B2DC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E1E540BE2;
	Sat, 19 Sep 2026 16:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFyd1cwQHtEC; Sat, 19 Sep 2026 16:09:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6E37C40C8C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834160;
	b=BWGRpaubkB68nlPMdgvzsMG1gQ52XW0lPOmJSUz0utuJSaLGfCnlXJqc7d41f1yBmLsh
	 LIZCxVNyNMgwxxey8S1HGgFRWVzRU4MhkvZ9yWHWe9G6AlBo1pPIaAd8XrpBT761r37UO
	 ZoST/TPDvsped71CzAlwMTKhtKBRrvqov9i4zgqNr1x74BoUawyAz7U7H0MUNxY32/PfF
	 3kBAx82sCBJUdtkA7+lHrBp/om5Cf6MVwV4j3USSizTMq11JQpYSo4umh0Jb8EBnWoYfc
	 Su2+71M3UOL/KyOHB8NYvSAQLO9S4Bnvriw3RzHtZHKAVvbsgdvCX9rlsKFkAhn+SKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	b=l+Z6XO76AbfzFRwLRaSk4hRbfWKK59HcTG04OTik6V9cwD9wta1pD7THlefpdnqcMnsC
	 FD79n/1GO0vTT/TcyuKviNP0vF7yZCpY8ymzvC3zvOEZXy/xHaka8fkG1m0OF5WWpa8tZ
	 us1xGOl/BZWDuBSfDV+88t5oI+6XvXkC3y6K3+uq0AjdflylO5XYv0BNkBjHLc4DAJ+n7
	 HEKvEu4ZXBLuqImugrfDm0Bl9MMPzic9Yo1j9wKOVAhd4ohPq6O967NcHTVeGcVKKX79A
	 P7kMrptPNBQl/rynVebYLJbzudbWxth/VpCUncqACm0rVLmvsDG5RfmchcyaA1HtUXw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834160;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WsdsgpH0yYS7uyQg6JvYE3MYYaIuRwY/PRi8BlTkAmJTwfOztOFGJQOMG3EnL2usS
	 32mpDkBqeAGhjvB+CWzPmlzSXVGWu358ZTmhaK50dhiegMxtEy768Q0/iKKbnMqdHu
	 DebJ94bEVI+zYefyVk4siR90k63dInQbhEg4KJPQpgnwoOt7PhEEXWKRNZSCO6vHL0
	 fBx44q8Hy+L45rBnmV6xS7y3af4fQIqGhcUrar+MBrbhaglOMWOMbYPhdCoioZ5/kw
	 4bv9p/Q88hFDpRqZrhY7Yz/UdySJJoLNeYxRO1hSsrK8hzheeZ48+t5aW5qQoyOjIx
	 zB7gr+/QMP9dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E37C40C8C;
	Sat, 19 Sep 2026 16:09:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AAF7324D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 914EE606A5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id og1eQwGFi_5O for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:09:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 90D3C6065F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834158;
 b=Lj9gJV7lKU51hBDMoJM5OkXAqaHnw1/OGhrZ2id2pkBrSjsMXLEmwojM/VM9sZYOodXt
 RKhr+1wEdv2nZDE52m2Cix9LgeHtyC1dIW8O5A3EAnmTMyJoxBNI5TpuzSFndBwqZgLm+
 pI9R+S+NMJILY0/vOIeK07zMn3+dt8ooXtaw6nJltVpV0E4J0L5Mrdi7yscXBjeMcTDr8
 dxNEOWi5UDOxcqauX3/OPyaWppDUZVXBlGoiw+EhW3ruV+1R0nf2kDa6c4BX1vBGSM1Qv
 XtCCZjQwqLsb729gRUeQmv6Bq2F7iB+9em5CN25hLiTzUTgJlmnC1/4cdeT6H1wc/9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834158;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 b=lfo/C4luzuWfB4SbBArC2mkqG+zV7s+cZZUMJZI+O1GhR0bqupcWNJRktUqcMNbivzCq
 VhRiahxbPRPuHLcru5CgxOa20Phs3c/s0sUBRHzJyCADd1d631kjLvYwwVNpz0jRUf02z
 tbcTFBVTm/+RrfLJow0yuXkY94GmZVo7d+WT0o+pwI4yKSHqjvGQqjmHALKkNZZ0iuDHM
 66kTtm4D9h3++io560eNkLLUJ5845ulxqz36/Q5FaES+MZGG5zeA+AmrOkLtXzll5w0n2
 1p4y1jycPWGCWGKqoHo6qlcgd4iLLd4DZogBV9rjor4PeC4LqStisYKQJHd0O1ji6bA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nYj+LFGt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nYj+LFGt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90D3C6065F
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833549;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nYj+LFGtSiPMTuyHlA5ESv1FL1Ke3gzoaUqkkkKwHd4KcH2TIUodZy0l3OHifxprJ
 tBsuMCGZDXsKt8XfH81+pFXqs1na/2VSGvINixm5QTN5wKIuV+u+WfwqRaclKJzoOu
 tmfYUwbgmppp9V1zXlXo5DQNRHjq7n6hTkXfmszBouZ9IQ+W1DiQf6MwMQFF2UflbP
 dpMy8hRdhSN4jDWimRnswOyK2/Wf9JF9PyQkRfoIDfQV3prH+WOqIwd6+tvKioYwXK
 Rsx3uPnktinE1G1p69i1Ry1/wiyl94xel2Fw1j6X1PEYv77xmvXSq/XGmRdQSvj47Z
 8ETSwU8kqYvLQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:WyqUgdzIkwnADCTftXt18ZJfisz8rmdUoAY5TN+fjGQJTTWXNwFvlLUk1LmLwoQl8Y3DNr1C4qGFV2UNmJMO+WW+9t/amHnEIm5iYdZstqAQa5Z3NOe8L3bg7qq3H0Y9B2uKsz1uPeOOgmnW1b4j5P+jMd88iS36ya+DqibhGPzEfgHfj1R55tBoERflXfxDyhCjmtvvLh149y3t5AlYt/xfY44YQeAMjGWmlxbGmZJ059H20bd5iMQ3XGq4G+118kKppdNxl4gLHi6VJzXMDI/B97Tm4ZnZKSlx4FZVfmvyMZQTz5yqBiM6+E2J+ND1X3BaL+ifE7f18oSiVNFN2wWAfggxXcEdl371dSLYXQEdU7SE7tGLlyumAV9r5uGzEZ/ESAew4NMdbrHn61C030QiaiHFeBOQdTTgtrImWwWSAPc4gMfLjE5PfVPsDRw9moTkks6aEdaCGYRZiA2As9YAVkz/i2Y/9EbpMm2ssxGRtqSSV6chYhIakojm8n77nKdbXUDTK/+sj8zkxXnw5d7cI4Kkvmo1dgZJbP/zJHrGiK+W3Y2V/h+q0aVfs2WcOd6ov97z8nYNjQyH4w86w++GzAGm8k1m+6kga/5nvNJr1K
 MYGtcHnCDCQhs5JTnOlrKtc44+QXnhWkXlO9wZJoMiyJdpzk6pJaM6kLX4jYy9Q3c1Rs9v
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1C86A4C47C6;
 Sat, 19 Sep 2026 17:59:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSp-000000005Jx-2N73;
 Sat, 19 Sep 2026 15:58:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:00 +0200
Message-ID: <20260919155845.5776-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 35/77] package/clamav: Fix build with OpenSSL
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
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
