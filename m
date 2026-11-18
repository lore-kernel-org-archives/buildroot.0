Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA814606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=b6bfby0Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=kltyYn7b
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E79A80DA7;
	Wed, 18 Nov 2026 18:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEKoaxhvxdMv; Wed, 18 Nov 2026 18:20:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8857880DF9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795026009;
	b=IcaNGNAAlRUdr+MShV9A7/1aY+4p4U2ev8+sm53KNoQxDW1tiMFG1EfEcZLJpH3w4+RW
	 c6hjA2EiRSEDvN77N6za8PmFW9yvHTOmgUfHi1gzhlyNXg9HrhXyePJnpn02guHFVj95W
	 FxBpkDXIxnm3cFtKkAvfAqwb/XwGOK8e+iJQTGtyuGbk0A3SvYmh/bbnqZj6r0kxbJaoW
	 JYFLdhrU7ouPQ2DkIW8uGZ0Evdlj+RnMne4z/MtGKNz5gOGBFuK2q/hWZHVxbkMWdf/rd
	 134pm0tjkWqRPc8QH3i2FDC31gh2hup/rm00SFsjrDc6UlB0Oupa7S4LQug0/OtjHPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795026009;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zacDv9FsgoFvMtuw6j7duCZyXJbsovj8aB2kXeIBFbQ=;
	b=ge6+l0ge8U4BFpBmRCL48zqgfxapUGOci4mWXbbYzhyNxASRFDSqbMxZrn/8/1VWbQci
	 6l1x/dQje25takjHnNJ0PHMd8/MmDFw9wAYIOXPClpOTRvMX5Z00TokFvjuZ/vPo1/ISy
	 OZuux8I5vc9NOC+8gK5gVBLcbR+M/6T1PI20Svu+E1Z9uR9TtQ+Z0q6j2fOgEg5mL7ak3
	 yXyeZNUUKRBHrhnLM/Bx32XDpVdaQcDs/ZMq6A7oshv9nMN81vmLxOF8zxyktlSoE/kzq
	 7+6EjH1vwyqnaN1jC5t0S41HqdEXRko5PQXNDiulnL13Km6+bRv9MkhzLR3+HC3ZxNQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795026009;
	bh=zacDv9FsgoFvMtuw6j7duCZyXJbsovj8aB2kXeIBFbQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b6bfby0QEjg4vuEKSrq7l/rBgY268fY0bbRQ+KMNn8Jos2gEGeYyoV/LkBsm9O2Dz
	 Uc3afrIKMD7LACak8ts/FrgDLn1OoA5Kx/8/dYzwAbxJNqJeL2qlqiG2/hLRxG+wIH
	 or2CJ9tUTJSLutIaO9+oWZHrKOQwfBwml6lT3t+JLt7/Kz5uBZ2Y2awafs7ncI6BTY
	 7n0O3FjT0PVg37yFcdmUIsbswDYEHoIdFx1pcP+w3fFVe/voa3pDTZJkH6i61YkG8L
	 LW94OgpCL2q6c8nvdwkBcrqWDdFGO6JkmZaSkaHD8KWNNGNDT+YDthneeDg08ehw9B
	 JyIrOmNYio5ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8857880DF9;
	Wed, 18 Nov 2026 18:20:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CF1913C
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AA1A606BA
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skEfQ2OHfJSr for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 18:20:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 39C246067D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kltyYn7b
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39C246067D
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795026004;
 bh=pSAVnh8DiRFyE3v7BhymUDrNLwDYrwZBAF8EthlDFDA=;
 h=From:To:Cc:Subject:Date:From;
 b=kltyYn7b63oNKlltf7NvyGi72f06H357hwpIDhe7clFhDCcBUpnv8KDuoNxLnTaAL
 XRsL3T57DBrk/Nx8alAN8whxOv1EBvC8xfkSw6TkO5GQEztKLPQRledzK2wektzuwC
 BppjefxIZzdMHzpLlHDreEN6YGCknTV2jc51RXBNgzedGs1+5m/YoFCr6JxDNMbVNh
 1lQEtcFoCEQRRCy3sytUiz5WOAAB6qmjnbSnginPEZUIg1R/7sTZE0wOywimb7BORd
 4ORXl0WFTYaHkVGfrY0lFm8nJ1jtBorv0Cz4K/LITbQa+DXdyQPID2yBJdEeMfUC8a
 gh4d/YdNVp41w==
X-KAS-Sym: v3:f51bdf72230551df:uTjvsLqhVvxkSox0d7Y5XZZ+Jjs78wyiQr9ZCKThLAoe9
 MtImAfJOaooxayjLNYA7mkEcmfce5S8OQcbG5wiMB8cjcZTc4L2N5FwLT3KKCmHjLyfzy/66vc3
 49pBdsohHmgFCw7hkF7m9M0zJItreE3fgdd8CvdrV9qQyFHFtvSaRUi6TOJDbz7LkJCMOiPYwJC
 KInrMQEWkIEWvviiDWvso5J3ESIX5WW4Ox3bz4THxUx4/uYdZX64R1GDXns3hoHkczEFNsbPRI5
 m8UJWOfELDH7JXbo80HDAHW0Rav9B/ads+yiSaL3JwtUKH9KV9nJJ30SMO+PoFxMzAdfZSrg==:
 zlhFHIIhtNeTljhAqlpzrVpfQaMzKwFdBdmM/SJvb96RFoHu6mZbCt2KRiUUjCuYLH8x5GNuPvc
 DGKehj8gBZQB1rN4U88thd8xzKHzfqX4I2XejOS9mUjoBQW/78g95EiC4X/EKb23l7WxVEMH/zK
 fICQpdPsTZs4K+UYHnJtjK0EhL90BYBq/zZEVPP2b1JvonhE8iBPPsVt5ZWeQypn/GjkegQHuNd
 J068WVyE71ijV7r0/N1GkRjyKlOnTKUvrNDK29cAsXG62+6bKix4qLbIeTHix2CD0wZ+9SVLWkQ
 zmOOZ689yLjaY22aLRmClfmAofaEzSIY7Q+boPzD2fhrgakvCuHAgbhRNpY75gkqhMHcn4Dwg6Q
 DVGHj+cVrX01FCoBQbbsmuh9wlADfkWfYetklsJvMOWdaOLft9Oimj88v81euUYwuDrksJrfEkJ
 CIcJ9OKK2D/+6edEua0o4fA+iSXAo78yczgGSGwLF+zuecise8oJUj60ujkEoSj6+sfO2qyX0rY
 G7fUXqFfqUM6QqqTj/2m0Yxdkd7kjJBfes9dB2zwlPVEsSwDuKm8EQYfUKvbzkUp3RT/bz0Sfrx
 oLt2ACRtDd0AaItoarAmyyX/r/J9JAaBpn5wJocxwrIdIA==
Received: from fli4l.lan.fli4l (p5b3a00de.dip0.t-ipconnect.de [91.58.0.222])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A673A4C483D;
 Wed, 18 Nov 2026 19:20:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38420)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xTkGJ-000000002YW-46ou;
 Wed, 18 Nov 2026 18:20:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 18 Nov 2026 19:20:04 +0100
Message-ID: <20261118182004.190167-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 1.5.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://blog.clamav.net/2026/11/clamav-155-147-security-patch-release.html

Fixes CVE-2026-76411, CVE-2026-76414, CVE-2026-76415, CVE-2026-76416,
CVE-2026-76417, CVE-2026-76421, CVE-2026-76422, CVE-2026-76430,
CVE-2026-76515 & CVE-2026-76516.

Removed patch which is not needed anymore due to upstream commit
https://github.com/Cisco-Talos/clamav/commit/f15e90cfa57753b6c475bafe044e071853215bfa
which fixes the problem differently:
"Keep cl_ASN1_GetTimeT() through 1.5 so code built against clamav.h
 keeps working, and mark it deprecated. main removes it for 1.6"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/14acf3869f3d455ee176f156b7f8b28617904cce

 ...-crypto-Remove-cl_ASN1_GetTimeT-1731.patch | 136 ------------------
 package/clamav/clamav.hash                    |   2 +-
 package/clamav/clamav.mk                      |   2 +-
 3 files changed, 2 insertions(+), 138 deletions(-)
 delete mode 100644 package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch

diff --git a/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch b/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
deleted file mode 100644
index 60e29a1fdb..0000000000
--- a/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-From 0097a6f99d9f6b78381e12b677a38fb62242c41a Mon Sep 17 00:00:00 2001
-From: sebastianas <sebastianas@users.noreply.github.com>
-Date: Sat, 1 Aug 2026 00:13:13 +0200
-Subject: [PATCH] libclamav/crypto: Remove cl_ASN1_GetTimeT() (#1731)
-
-The last user has been removed in commit fa15aa98c7d5e ("bb11594 - allow
-for compilation against openssl 1.1.0"). This function is only exported
-under CLAMAV_PRIVATE to be used within clamav, not by external users.
-
-Removing the function will not cause an ABI break since it was not part
-of the officially exported ABI. As a side effect it will compile against
-OpenSSL 4.0 where the ASN1_TIME type has been made opaque.
-
-Remove cl_ASN1_GetTimeT().
-
-Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
-
-Upstream: https://github.com/Cisco-Talos/clamav/commit/0097a6f99d9f6b78381e12b677a38fb62242c41a
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libclamav/clamav.h      |  8 -----
- libclamav/crypto.c      | 65 -----------------------------------------
- libclamav/libclamav.map |  1 -
- 3 files changed, 74 deletions(-)
-
-diff --git a/libclamav/clamav.h b/libclamav/clamav.h
-index 8a3767f78..fa75677ad 100644
---- a/libclamav/clamav.h
-+++ b/libclamav/clamav.h
-@@ -2413,14 +2413,6 @@ extern int cl_validate_certificate_chain(char **authorities, char *crlpath, char
-  */
- extern X509 *cl_load_cert(const char *certpath);
- 
--/**
-- * @brief Parse an ASN1_TIME object.
-- *
-- * @param timeobj   The ASN1_TIME object.
-- * @return          A pointer to a (struct tm). Adjusted for time zone and daylight savings time.
-- */
--extern struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj);
--
- /**
-  * @brief Load a CRL file into an X509_CRL object.
-  *
-diff --git a/libclamav/crypto.c b/libclamav/crypto.c
-index 8b398e402..968264811 100644
---- a/libclamav/crypto.c
-+++ b/libclamav/crypto.c
-@@ -1746,71 +1746,6 @@ X509 *cl_load_cert(const char *certpath)
-     return cert;
- }
- 
--struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj)
--{
--    struct tm *t;
--    char *str;
--    const char *fmt = NULL;
--    time_t localt;
--#ifdef _WIN32
--    struct tm localtm, *ltm;
--#else
--    struct tm localtm;
--#endif
--
--    if (!(timeobj) || !(timeobj->data))
--        return NULL;
--
--    str = (char *)(timeobj->data);
--    if (strlen(str) < 12)
--        return NULL;
--
--    t = (struct tm *)calloc(1, sizeof(struct tm));
--    if (!(t))
--        return NULL;
--
--    if (timeobj->type == V_ASN1_UTCTIME) {
--        /* two digit year */
--        fmt = "%y%m%d%H%M%S";
--        if (str[3] == '0') {
--            str[2] = '0';
--            str[3] = '9';
--        } else {
--            str[3]--;
--        }
--    } else if (timeobj->type == V_ASN1_GENERALIZEDTIME) {
--        /* four digit year */
--        fmt = "%Y%m%d%H%M%S";
--        if (str[5] == '0') {
--            str[4] = '0';
--            str[5] = '9';
--        } else {
--            str[5]--;
--        }
--    }
--
--    if (!(fmt)) {
--        free(t);
--        return NULL;
--    }
--
--    if (!strptime(str, fmt, t)) {
--        free(t);
--        return NULL;
--    }
--
--    /* Convert to local time */
--    localt = time(NULL);
--#ifdef _WIN32
--    ltm = localtime(&localt);
--    memcpy((void *)(&localtm), (void *)ltm, sizeof(struct tm));
--#else
--    localtime_r(&localt, &localtm);
--#endif
--    t->tm_isdst = localtm.tm_isdst;
--    return t;
--}
--
- X509_CRL *cl_load_crl(const char *file)
- {
-     X509_CRL *x = NULL;
-diff --git a/libclamav/libclamav.map b/libclamav/libclamav.map
-index 809341f42..f3efe1a33 100644
---- a/libclamav/libclamav.map
-+++ b/libclamav/libclamav.map
-@@ -271,7 +271,6 @@ CLAMAV_PRIVATE {
-     cl_verify_signature_hash_x509;
-     cl_verify_signature_hash_x509_keyfile;
-     cl_load_cert;
--    cl_ASN1_GetTimeT;
-     cl_load_crl;
-     cl_sign_data_keyfile;
-     cl_sign_data;
--- 
-2.47.3
-
diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 2daa66494f..9157c31338 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1af1117a228f1b5bc7fa91a0dabc37848a99e7d25188e9be8043332ce721dfd3  clamav-1.5.4.tar.gz
+sha256  90284644e5568732c15fc4f4312fd0f09ac14c14e5b29fba3909d4da4e281b1e  clamav-1.5.5.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 1777366fef..77b996247f 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.5.4
+CLAMAV_VERSION = 1.5.5
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
