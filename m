Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39174C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E207B40D9B;
	Sun, 20 Sep 2026 14:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4eza1CxWHfz; Sun, 20 Sep 2026 14:49:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0279240E6F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915791;
	b=c6oq7eJwhoJrCCtUaWthE0wHduJ59h+TeN/MG6yiC0piprSJuIpWV4VvzxQLpi21vl+q
	 5s++vlegUozSqKi51wmu9cSHyC4rM9nmAlquVf69fTXY3XbBfTKDTtcUwDfvac3T2rP+2
	 EzmH0xJvsfJuXwBrnKUfMi9aRSP7iyd6pfgVMwkvv9v2LDn2y7AO8WzMNAO2c5UED9qNV
	 ZS4Oof0nGchOlLCG1wVgLVw5DSrM55TGACoQvvSxyucu86oVxw/O3SHjTd0UPp+RsYGWY
	 9Ucug9YZqVZRaLIppPQh97cpnVv6SivNkRIMYk8R/ZlIkobvU4hvAQpIT9J2iNUIRtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915791;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	b=k6dFOle5Q0GJAKWGhMrKxNIYkVtqRLVdwTFrQLDo7+i+qfvch9CI2zh5yN64ubQe567s
	 Pvr/pezEvA/gyjbD8g3w4im4/sXTVGrNLlJsOcrb9OvCnDD0k/tOAfQxnjxL0AnvcZfNy
	 hQ861+bhm9jvCyGQfctewN91m+9d/1we58Zf/0FBCNyJMH7yR4RTCCKzauqefca+d8dHF
	 Fm+pL82YaCsfUkUVLgHYRS+Wbe8HSPTyh4/oCexf0wFDll6atsAz3MJ8KbunHlsuplF/l
	 yF5CYxQNYMaXUBwwhBYbWHy25cdDgwRDGTZi4g6Z2oH5/yG/bBwNwXXo1dyOjpgtlGw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915791;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p0/6Xmq/2r/rtRKFfjLiAcRxylR3jFhy5VfM+iRxchsoXm4UguzpYepsHgoYKCeJU
	 pWldyAqueAQN2JHsU7xPvJOOUArUERRSzkHD++Xoi+bZg/zOpD8+wM/l7H1aIpbuRy
	 nwlUHoqTpZ5Wx14mx1BiZtvz/gFl9YkALgKPThoY1RIJVU8gX10JA67oi5VHzkSb9h
	 3vxq9JJDUWWKDnrZ4S0q/VtETaa7ecD2eKmB3y8ib5EsgSYvvSleSHnKD/CJLtLESE
	 3jwgTXlJzRCF7lyMx/zzKJ6qJuBtN1YeFXGIepAYGY8IWl9gI6YbeVGMstDrzXi4ya
	 sFhgmrcmT+zGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0279240E6F;
	Sun, 20 Sep 2026 14:49:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 509C03FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 429374002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVX45Lh6QJz9 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:49:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 451CA40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915788;
 b=nF4OoDsGOZn+YGdef96LG1kGsBv+s3DoIV4hSkUj0167KJaaWWy0SFD44py/smZh0FrJ
 9Ilf/G93kxVzBCbSFS/nFLSkeUD59s/WLZtdnRr/OHw5fw70XoPBPwQbRu3bXJVka8SUi
 JYGRv4QeOz2B507QlXPZzhvKwcrMnbk0GjHCeoCqeWy0TICH+24LJGXiEOi6DsWYb611i
 ry7FL17Wd64lfGH7Jx6O85dEVVJuz8SdcM90AgQ3rtp/hQ84ysth0C13cdNw7jQLABFdy
 ENrzQ6eQzTRizVHYmhqHaRZqjuARJJ8ZNNgRtF/JkvHlq0J8Z89RPe8RuzFbuPwpJVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915788;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 b=Kh2khzhjZOITx+bElho5of/8oA8jLyd+6XIAC3GfjthEo5wpai8q/oguGhG/aflxIgoc
 oUUmusCjCTZoZxFH+P8gFTTmyPNR5E4ese9hc4tu5LrcpWq/5wXhQA8nNfSvvQsE6lxfc
 P+TQoEq1SQSO6JCCFQyP+TUmhbCEjh+vStkWijWt4KEuT0UVvPZjxyjK6eZxQ/WSRSJIe
 lDYIJ7AzK/QBNY8fRfH+C2i+K2q7+D63VIgM2+5IylUz9p7HiSRDsDpD0GwhPMOQPGAWr
 rKfTdrBBIroTJH0XCKhgeLAwYygR4eaiSE+whfQ52gMFd3bK4ySTKupWD6Nu5lTOrMw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=txpf+2Z9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=txpf+2Z9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 451CA40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915502;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=txpf+2Z9MLWOI7CxvNbH4EmLXbTIT2OEbhlWZfvzUE43XRni9qGBKvtY6jPtDb/Cx
 kxYK3JLUKjp++TdkBA5pT1ZV8WH82lf6A4rMJyTAEK7mJmMX7merefHsGPJ7OpI/6m
 Ag/Z41AKHNnElKHcxAxiOX4eRUpu4lJ8TXclYDAregnKNdg+vmWfrz1KzWosn92ErH
 WPugbLLvj+CymrRJcogDTTI6Zr+yoO9aZX2a8kDBlrQUEGo9fq/xdVIzv2FIYZWKKA
 Hi6QtIiDAQ7jA/qjDIAyN1+I1WufVo8ef5m7pIFFdBcnMOY1PPA357alp/k1R9xdok
 qcH+BavLoZr4g==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:z166y0Uu5D/ZRPMWO0xUiMI0FrvseHBJ2yycsCGh4pAwdEc5P1Q44tebBMkLZtTnEnUVYBTarRvijKJim4td0GPVrw7IW5deflT1JaC7E1y8sHWxeyYi3eW0M69e767XLoV0VK+meyXMOpeYdRnH4gDCuAeQ6l/eK7V9a+KhUvowiS+qI4Rd7FsHXT8DZqeRGbX4pHV5I7ikDnDUM+JVcgdvu4kqryjdIK5TRbspU1rUH51rC4EFaLh1WZCVlg7NWgrvI141+jont8EHz3p9UWQuMiiaj+gJ46mhlqLKWqg0AI26msUZrUF4vhLw8h2qfINoai+3AemJwmM8s7i0bbE+ClNz9Cg/2ol1MZnEvCtZutYB3UiITl9KGzrFQznRjKapNQloEB/YeACTucAS5bgJ+NfkeuhNHNxWaovbiwOcQaajqGZ6XinYBrQ8UOT0a5qBDt3J0R5vq0ImsELtShj9TjjTQIxbV5nJ0iirG3saA8ccEPJlasuZlyk567nF6TQjhY9VKTNWl0nbjdcnIE/Lr8wyDDRu4391bDGtAm5wzFmQuGtSB/Ex8NFEhZkpw+bUhNDYa/gnbpKWHoPKzdEqj7fXKIM=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0299A4C4887
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imi-000000000hB-0VrG
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:48 +0200
Message-ID: <20260920144428.3009612-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 27/66] package/clamav: Fix build with OpenSSL
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
