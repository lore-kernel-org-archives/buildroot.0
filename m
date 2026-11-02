Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B08606D823
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 20:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h2QND26v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=MFZRwXg6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C48605D8;
	Mon,  2 Nov 2026 20:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xi-1pepCyfZp; Mon,  2 Nov 2026 20:14:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C3A8F605DA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793650482;
	b=nEyhtnFEQIjPDMF7ev/zEwa1Wne0/dtbtNu7fdlmSqc5GVTu3v7wQws9MCxpSLIWN5LF
	 Zg/xYOhASJi6Xei9BU7ADkai2SDALoY9r8loKeZuRPhCa2At9Fb3XMTNnRe+/PJ8WNnyQ
	 7VedK0lyvjMNuCkKHmiWalh89RThZewWyOYPUPvZ6HPjQjqo8Dup68kU7HuEIxm2sWHd0
	 lZElQp03WAU+0L64QECDt3mgTjvKXCn2ugrOHAUo6wXUYJOPAv9gFX3KBssqvFv2nFZ0h
	 l934e9iiy+icARpPmVA/OzRqS3x8J8a7uGNBscZ9rT5T+Py5gZAsKaGxFx4nIvbJTWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793650482;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qJnJWc9cRfqac0831ibsOKbWLPjfbQyO19cLueF+Wbc=;
	b=UtaSsLtpf1N3F8N/khEVhATKsRmdvkXPzNjAJzlDvAaLZ5REyKSQZsKrUJ/5nxkn+5po
	 Tor+BdNIgwEwhXtqxhLvktEQPxQPsbRU9JObjuttSiOhDhI7A8SFWV4Pyh8MG9cOV+jMy
	 kBTDOhHn976Kp9cO+0hDSl+DB3wRruR7iU2FGxG0aRVFPxQdranW/wRpNikaqgtmU1rRk
	 1Fe7xR3Y1xhgMoD9CMZCPJ/TG0lFZp1Kgl+qsT58VSyNfFmz2ISBKnO9QWnFJByN5KUpb
	 R6Nh/LgyAdZ2TA5ZvcotxosqGkUt0vA/FF+X21ZO7vNialh1Wzqhj3mBSbSn2PKTE4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793650482;
	bh=qJnJWc9cRfqac0831ibsOKbWLPjfbQyO19cLueF+Wbc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h2QND26v/3H2AaNFhdWnHsVWaBopP5P7gMFBoZ2x3Spd7NFMiiizWNdIwnhJD1PuZ
	 wpcoxfbIeJ4fLZ9n5fhG+7997RUENByjwDOuMcpxtRM+vzJlCYxFNCfLhpREXV7hMl
	 M5yDRe/BmaV8tInZhTmhfuzyMont5ZNy+MoMvflOE9XGaxiq7d5XNtYSI8RLzY0OGj
	 hiakfG1SiFJi2DnT8RbA+rm2vahoGIT7uGRE80fhB0wNBEdd8Pus3kFvnYJzy4f2Nm
	 FFZFv2t4YwJbXQrL9KrCfNd90M5wLY9Tvv7I8AugY64RgUWikD/EvwfcSMHNV80yfz
	 1ABaWw7JZljWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3A8F605DA;
	Mon,  2 Nov 2026 20:14:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11996411
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDC2280C6E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGBkRYpLLWHI for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 20:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3EBE780C5D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793650478;
 b=XjRlN1SDZMhYZeiSFpqCBe407ysRw6ifodPyUR+ZFZr3itmBG5qHhKPxVanJ1Qdykn6w
 UGUQyAk3mRxQi90QXu3rAMebnFkvcg2jgpizgf2C/kYznBUVmbPH20KDmx6vOHpyGcD+Y
 uLyYjSRS6sum9xwjRlDs7p3kyw+ZUHsD/fMb/TtHY4WYyfQ2zUCUQAl0sz6LfEbTK1D9J
 gMzF4A5jWNoZhjBaOoAtK2m0ZICTbYj2TAoPiDDCwdDxVKalFrOCHXEXniG0fIPJbRNS7
 ciGbULIWlyTvf3AD6bdh4iEwgZk3TIWcxtQIRA2zLW8Z/QV+os8JGMJ+Mw9G6fAJ/JQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793650478;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=8L2r9WGbzECrBK/d+W7mZdbKDdvgAQ/71fQ4v5J5LhQ=;
 b=pjUN0tPO2Fiu7TvWiiMRunT3DSI+kZClO/HgVSDfmOZmUldv1OafwZpDwUB1iX9XY4LD
 8o8w6OG7AhDy9o0QGtDkgYONtuZe0OOgj5bbn/ZrPjg9gl3Do4U/z2v1V8JFL6Hf7I834
 5Ca51l9y8IChfoYWVK0AQ2bmnYrB9HvwEHvyeSsfGPmB62kh1oiRPqeb4ZWFK/BcwX9kq
 gr501pdVzQbT31orY2okAgXHBQQV/OY1/D/IoiNIaNjmapr5WtZH4iesTRFa+JzDhWkGp
 z9vWR945hZiLRyLBN8SkYZDv/rvSpvooyloFUwGKUFsALBfWgVe9k0eTkuyQ3Jmy8eA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MFZRwXg6; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MFZRwXg6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EBE780C5D
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793650475;
 bh=8L2r9WGbzECrBK/d+W7mZdbKDdvgAQ/71fQ4v5J5LhQ=;
 h=From:To:Cc:Subject:Date:From;
 b=MFZRwXg6gAardJDPd9pacd2nd80S3o4XcXFb8tm16RyuUdDoqfAFzV3EqoqM3/wqH
 QlQTArm6x9Gu+kDZ1KHGZASgMAPD42lsTIIOxNJVu3ZMB/hU95hWl+EUsWRwLNK9QM
 QzkUdb6AugoOGKBt9qr+0GVbG6D3YlBbzSTMewP1tAY0tnbMl9EXppldSoE1qQrn6B
 Oxb+C6RPxUQ1OEI8/k5h+FAV1l5de2eiivsmNBlgrw/X5fYA2VvlQEMySxkKO8kOQ+
 gAsociGvC78Nwxh8B6koxVbExifugHg9FA8WDDG5USE0GROSTVvYJDTVzScVdrgLZx
 pZ+4RO9YE927g==
X-KAS-Sym: v3:f51bdf72230551df:Xp0McvTuVdI6xYIdn/GKl0xgZgA8qMiClKkPsmgM2nlEd
 mNlzTNzUwPMGiQJM3Amt1M7jy9O4UxyeuTrCmaENZ2RuXHEqk3UlRPpaHqVjOvvDio62Wv+6baJ
 /zOy+IzLLpBhVH9QFGAQ/5soQATJQ66i1SlM/Ow8xPk1KfeM/xaQaxQYj1RQ4upr7W16c1TzUZ1
 S7l1mR0v0ABdXjCR3ayIp1oM6wYeyXZXgBBIC0kt5bI6/x/ZIBP+eVo6Tp3qLZAiyUpy15SeQsZ
 ZKYVSV9FEU0f8iymgrD1P/3+92olV5syCYrQUhimgnV8GjdIQsiW6DK1IOl5wq/SRV4wP0XQ==:
 Ih/ZAjLCgiClZGvf6TyLOkK1JpbNxp1sgehpU7XNbUU7arZn5AQ4fFnKktp7ekHsDZ+Rfqrxann
 jPQWVGqMKskhFdwvtwqHqLrca2RcNpuknYTuNaED33YtCNnkOxR/9mNxokvxRV1BKVDlJm3jiKi
 7Oz2WvnaLdzQB6uC7gqI7EEQNpq3wHjm9PGfNbdEyKRJXwqPowLDIlYjuMu70hpFSRp3xIue4NH
 fw7ng8/ct7LC274gdYpHVKt4zHT7N4OFS6FveXcv8l7tvtc7g+RBJSplj57m8IdoGaTCtkNZU5l
 ui4eJHw3SccSzjdVwIa0dxoESiv22pVd+MXffRGyxr0dwAae04pwGIoniNCcAVm5AguDSqiI+WW
 su0c9Np66EBT9yZU7CKqM1cJN2BiDS8Ifcd694IffpMTQQNlQe5zLv2E3NKtPCc2vz4ns3fL8rQ
 Ciq6AW2KOy9SKNfWvVj+N2E/RoksqQnteSlU1Fq0NJck9anfp1GacejBysWA+RgPOoR9shchQLS
 EUSAjFQrShk4eFdgdBhsC0TBwJZoinOWQ6KOiozXwbboWqEdfXWKgAVip6ZQ7ij6YQ38brdxByq
 jEk=
Received: from fli4l.lan.fli4l (p5b3a07a5.dip0.t-ipconnect.de [91.58.7.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E964A4C0CB2;
 Mon,  2 Nov 2026 21:14:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37368)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNyQN-000000007Wm-0Nj2;
 Mon, 02 Nov 2026 20:14:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon,  2 Nov 2026 21:14:34 +0100
Message-ID: <20261102201434.12138-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/clamav: fix broken database updates
 with OpenSSL 4.1
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

Removed patch 0001 and added a patch series cherry-picked from
https://github.com/markarce/clamav/commits/perf/cache-evp-md-fetch-1.5/
exluding all unit test updates.
The series also includes a different fix for the ASN1_TIME type change
previously solved by patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/2e320b39e415e4e8dcec431b8de24d2da4572445

 ...SN1_TIME-through-accessors-in-cl_ASN.patch | 110 ++++
 ...-crypto-Remove-cl_ASN1_GetTimeT-1731.patch | 136 -----
 ...EVP_MD-handles-to-fix-per-hash-provi.patch | 501 ++++++++++++++++++
 ...en-EVP-digest-cache-failure-handling.patch | 273 ++++++++++
 4 files changed, 884 insertions(+), 136 deletions(-)
 create mode 100644 package/clamav/0001-libclamav-Read-ASN1_TIME-through-accessors-in-cl_ASN.patch
 delete mode 100644 package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
 create mode 100644 package/clamav/0002-libclamav-cache-EVP_MD-handles-to-fix-per-hash-provi.patch
 create mode 100644 package/clamav/0003-libclamav-harden-EVP-digest-cache-failure-handling.patch

diff --git a/package/clamav/0001-libclamav-Read-ASN1_TIME-through-accessors-in-cl_ASN.patch b/package/clamav/0001-libclamav-Read-ASN1_TIME-through-accessors-in-cl_ASN.patch
new file mode 100644
index 0000000000..3881c8d9c8
--- /dev/null
+++ b/package/clamav/0001-libclamav-Read-ASN1_TIME-through-accessors-in-cl_ASN.patch
@@ -0,0 +1,110 @@
+From 923cc3d3b4e22a5fb8adeb8cc8404040ddcc1987 Mon Sep 17 00:00:00 2001
+From: Mark Arce <mark.arce@ironcladhq.com>
+Date: Wed, 28 Oct 2026 16:17:29 -0700
+Subject: [PATCH] libclamav: Read ASN1_TIME through accessors in
+ cl_ASN1_GetTimeT()
+
+ASN1_TIME is opaque in OpenSSL 4, so reading timeobj->data and
+timeobj->type no longer compiles. Use ASN1_STRING_get0_data(),
+ASN1_STRING_length() and ASN1_STRING_type() instead.
+
+Parse a length-bounded, NUL-terminated copy of the time string. OpenSSL does
+not guarantee the data is NUL-terminated (ASN1_STRING_length(3)), and
+OpenSSL 4 does not terminate it, so the previous strlen() read past the end.
+The function also decremented the month digits in the caller's object, so a
+second call on the same object shifted the month again. The returned values
+are unchanged.
+
+Keep cl_ASN1_GetTimeT() through 1.5 so code built against clamav.h keeps
+working, and mark it deprecated. main removes it for 1.6 (#1731).
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+
+Upstream: https://github.com/Cisco-Talos/clamav/pull/1873#issuecomment-6485066645
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclamav/clamav.h |  2 ++
+ libclamav/crypto.c | 23 ++++++++++++++++++-----
+ 2 files changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/libclamav/clamav.h b/libclamav/clamav.h
+index b41d39e39..a12391983 100644
+--- a/libclamav/clamav.h
++++ b/libclamav/clamav.h
+@@ -2605,6 +2605,8 @@ extern X509 *cl_load_cert(const char *certpath);
+  *
+  * @param timeobj   The ASN1_TIME object.
+  * @return          A pointer to a (struct tm). Adjusted for time zone and daylight savings time.
++ *
++ * @deprecated This function is deprecated and will be removed in ClamAV 1.6.
+  */
+ extern struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj);
+ 
+diff --git a/libclamav/crypto.c b/libclamav/crypto.c
+index dfbdeb9cb..13f7fea03 100644
+--- a/libclamav/crypto.c
++++ b/libclamav/crypto.c
+@@ -55,6 +55,7 @@
+ 
+ #if OPENSSL_VERSION_NUMBER < 0x10100000L
+ #define X509_CRL_get0_nextUpdate X509_CRL_get_nextUpdate
++#define ASN1_STRING_get0_data ASN1_STRING_data
+ #endif
+ 
+ #if !defined(_WIN32)
+@@ -1757,7 +1758,9 @@ X509 *cl_load_cert(const char *certpath)
+ struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj)
+ {
+     struct tm *t;
+-    char *str;
++    const unsigned char *data;
++    int len;
++    char str[32];
+     const char *fmt = NULL;
+     time_t localt;
+ #ifdef _WIN32
+@@ -1766,10 +1769,20 @@ struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj)
+     struct tm localtm;
+ #endif
+ 
+-    if (!(timeobj) || !(timeobj->data))
++    if (!(timeobj))
+         return NULL;
+ 
+-    str = (char *)(timeobj->data);
++    data = ASN1_STRING_get0_data(timeobj);
++    len  = ASN1_STRING_length(timeobj);
++    if (!(data) || len <= 0)
++        return NULL;
++
++    /* Parse a NUL-terminated copy: OpenSSL doesn't guarantee the data is terminated, and the month
++     * adjustment below must not modify the caller's ASN1_TIME. */
++    if ((size_t)len >= sizeof(str))
++        len = sizeof(str) - 1;
++    memcpy(str, data, len);
++    str[len] = '\0';
+     if (strlen(str) < 12)
+         return NULL;
+ 
+@@ -1777,7 +1790,7 @@ struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj)
+     if (!(t))
+         return NULL;
+ 
+-    if (timeobj->type == V_ASN1_UTCTIME) {
++    if (ASN1_STRING_type(timeobj) == V_ASN1_UTCTIME) {
+         /* two digit year */
+         fmt = "%y%m%d%H%M%S";
+         if (str[3] == '0') {
+@@ -1786,7 +1799,7 @@ struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj)
+         } else {
+             str[3]--;
+         }
+-    } else if (timeobj->type == V_ASN1_GENERALIZEDTIME) {
++    } else if (ASN1_STRING_type(timeobj) == V_ASN1_GENERALIZEDTIME) {
+         /* four digit year */
+         fmt = "%Y%m%d%H%M%S";
+         if (str[5] == '0') {
+-- 
+2.47.3
+
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
diff --git a/package/clamav/0002-libclamav-cache-EVP_MD-handles-to-fix-per-hash-provi.patch b/package/clamav/0002-libclamav-cache-EVP_MD-handles-to-fix-per-hash-provi.patch
new file mode 100644
index 0000000000..9c51ace292
--- /dev/null
+++ b/package/clamav/0002-libclamav-cache-EVP_MD-handles-to-fix-per-hash-provi.patch
@@ -0,0 +1,501 @@
+From 9ecb626030494cfbea42663f69b70a51343f6f8e Mon Sep 17 00:00:00 2001
+From: Seweryn Chlewicki <seweryn.ch@gmail.com>
+Date: Wed, 5 Aug 2026 00:42:26 +0100
+Subject: [PATCH] libclamav: cache EVP_MD handles to fix per-hash
+ provider-fetch churn and a FIPS memory leak
+
+On OpenSSL 3, the hashing helpers (cl_hash_init, cl_hash_data,
+cl_hash_file_fd and their _ex variants) created a fresh OSSL_LIB_CTX and
+called EVP_MD_fetch() on every hash, then tore both down. A freshly-allocated
+library context has no method-store cache, so each fetch pays the full
+provider-bootstrap + method-construction cost (on the order of hundreds of
+microseconds), and this runs for md5/sha1/sha2-256 on essentially every
+scanned object (whole-file and section hashes plus the SHA2-256 clean-cache
+lookup in fmap_get_hash). The per-object hashing plumbing ends up costing far
+more than the hashing itself, whether or not the host is in FIPS mode.
+
+Fetch each FIPS-bypass digest once into a single shared, long-lived non-FIPS
+OSSL_LIB_CTX and reuse it (a fetched EVP_MD is reference counted and safe to
+share across threads; the cache is guarded by a mutex). The FIPS-bypass
+semantics are unchanged -- the shared context is still created with
+OSSL_LIB_CTX_new() and digests are still fetched with the "-fips" property, so
+MD5/SHA1 signature hashing still works on FIPS hosts where it can. The
+FIPS-compliant (non-bypass) path is intentionally not cached: it is still
+fetched from the default library context on every call so it keeps honoring
+the current default property query.
+
+This also removes the per-hash OSSL_LIB_CTX_new(), which fixes a memory leak.
+The previous code allocated the context before the fetch and did not free it
+on the "md == NULL" return path, so on a host whose FIPS policy makes an
+algorithm unavailable (e.g. MD5), every hashed object leaked an OSSL_LIB_CTX.
+Because libclamav hashes MD5 for nearly every scanned file, a full scan grew
+without bound until it was OOM-killed. With a single shared context there is
+nothing to leak per hash; an unavailable algorithm now degrades to a clean,
+bounded failure instead of exhausting memory.
+
+(cherry picked from commit 5ebb747956febc49438009b2da5388947c5a22ef)
+[Backport to 1.5: also drop the fetch-failure OSSL_LIB_CTX_free() calls that
+a221c927f added on rel/1.5. They free the per-call context this commit
+removes, which the shared context makes unnecessary.]
+
+Upstream: https://github.com/Cisco-Talos/clamav/pull/1873#issuecomment-6485066645
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclamav/crypto.c | 231 +++++++++++++++++++++++----------------------
+ 1 file changed, 116 insertions(+), 115 deletions(-)
+
+diff --git a/libclamav/crypto.c b/libclamav/crypto.c
+index 13f7fea03..865e38789 100644
+--- a/libclamav/crypto.c
++++ b/libclamav/crypto.c
+@@ -69,6 +69,10 @@
+ #include "str.h"
+ #include "iowrap.h"
+ 
++#ifdef CL_THREAD_SAFE
++#include <pthread.h>
++#endif
++
+ #if defined(_WIN32)
+ char *strptime(const char *buf, const char *fmt, struct tm *tm);
+ #endif
+@@ -163,6 +167,103 @@ void cl_cleanup_crypto(void)
+     return;
+ }
+ 
++#if OPENSSL_VERSION_MAJOR >= 3
++/*
++ * Digest handle cache.
++ *
++ * On OpenSSL 3, EVP_MD_fetch() into a freshly-allocated OSSL_LIB_CTX is
++ * expensive: the empty context must bootstrap a provider and construct the
++ * method from scratch (on the order of hundreds of microseconds). ClamAV
++ * hashes md5/sha1/sha2-256 for essentially every scanned object, so fetching
++ * per hash would dominate scan time while doing no actual hashing.
++ *
++ * Fetch each FIPS-bypass digest once into a single shared non-FIPS library
++ * context and reuse it (a fetched EVP_MD is reference counted and safe to share
++ * across threads). cli_get_md() returns a reference the caller owns and must
++ * release with EVP_MD_free().
++ *
++ * Only the bypass digests are cached. The FIPS-compliant path is fetched from
++ * the default library context on every call, so it keeps honoring the current
++ * default property query -- e.g. if the embedding process enables FIPS at
++ * runtime, a non-bypass MD5/SHA1 request must start failing rather than return
++ * a stale non-FIPS handle. That default-context fetch is already inexpensive
++ * because OpenSSL caches provider methods per library context.
++ */
++#ifdef CL_THREAD_SAFE
++static pthread_mutex_t md_cache_mutex = PTHREAD_MUTEX_INITIALIZER;
++#endif
++
++/* Single shared non-FIPS library context backing all "-fips" (bypass) fetches. */
++static OSSL_LIB_CTX *nonfips_libctx = NULL;
++
++static struct {
++    const char *alg; /* string literal returned by to_openssl_alg(); stable */
++    EVP_MD *md;
++} md_cache[8];
++static size_t md_cache_len = 0;
++
++static EVP_MD *cli_get_md(const char *alg, bool fips_bypass)
++{
++    const char *ossl_alg = to_openssl_alg(alg);
++    EVP_MD *result       = NULL;
++    bool cached          = false; /* true if md_cache owns `result` */
++    size_t i;
++
++    if (NULL == ossl_alg) {
++        return NULL;
++    }
++
++    if (!fips_bypass) {
++        /* FIPS-compliant path: fetch from the default library context every
++         * time so the current default property query -- including any runtime
++         * FIPS change -- is honored. */
++        return EVP_MD_fetch(NULL, ossl_alg, NULL);
++    }
++
++#ifdef CL_THREAD_SAFE
++    pthread_mutex_lock(&md_cache_mutex);
++#endif
++
++    for (i = 0; i < md_cache_len; i++) {
++        if (0 == strcmp(md_cache[i].alg, ossl_alg)) {
++            result = md_cache[i].md;
++            cached = true;
++            goto done;
++        }
++    }
++
++    /* Miss: create the shared non-FIPS context on first use and fetch once. */
++    if (NULL == nonfips_libctx) {
++        nonfips_libctx = OSSL_LIB_CTX_new();
++        if (NULL == nonfips_libctx) {
++            cli_errmsg("cli_get_md: Failed to create OpenSSL library context\n");
++            goto done;
++        }
++    }
++    result = EVP_MD_fetch(nonfips_libctx, ossl_alg, "-fips");
++    if (NULL != result && md_cache_len < sizeof(md_cache) / sizeof(md_cache[0])) {
++        md_cache[md_cache_len].alg = ossl_alg;
++        md_cache[md_cache_len].md  = result; /* cache holds this reference */
++        md_cache_len++;
++        cached = true;
++    }
++
++done:
++    /* A cached digest belongs to md_cache, so give the caller its own reference
++     * to EVP_MD_free(). If that reference can't be acquired, fail instead of
++     * handing back one the caller would free out from under the cache.
++     * A digest that was fetched but not cached is already the caller's to free. */
++    if (cached && NULL != result && 1 != EVP_MD_up_ref(result)) {
++        cli_errmsg("cli_get_md: Failed to acquire a reference to the %s digest\n", ossl_alg);
++        result = NULL;
++    }
++#ifdef CL_THREAD_SAFE
++    pthread_mutex_unlock(&md_cache_mutex);
++#endif
++    return result;
++}
++#endif /* OPENSSL_VERSION_MAJOR >= 3 */
++
+ /**
+  * @brief Generate a hash of data.
+  *
+@@ -197,8 +298,7 @@ extern cl_error_t cl_hash_data_ex(
+     EVP_MD_CTX *ctx = NULL;
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    OSSL_LIB_CTX *ossl_ctx = NULL;
+-    EVP_MD *md             = NULL;
++    EVP_MD *md = NULL;
+ #else
+     const EVP_MD *md = NULL;
+ #endif
+@@ -219,20 +319,7 @@ extern cl_error_t cl_hash_data_ex(
+     }
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    if (flags & CL_HASH_FLAG_FIPS_BYPASS) {
+-        /* Bypass FIPS restrictions the OpenSSL 3.0 way */
+-        ossl_ctx = OSSL_LIB_CTX_new();
+-        if (NULL == ossl_ctx) {
+-            cli_errmsg("cl_hash_data_ex: Failed to create new OpenSSL library context\n");
+-            status = CL_EMEM;
+-            goto done;
+-        }
+-
+-        md = EVP_MD_fetch(ossl_ctx, to_openssl_alg(alg), "-fips");
+-    } else {
+-        /* Use FIPS compliant algorithms */
+-        md = EVP_MD_fetch(NULL, to_openssl_alg(alg), NULL);
+-    }
++    md = cli_get_md(alg, (flags & CL_HASH_FLAG_FIPS_BYPASS) != 0);
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+ #endif
+@@ -331,9 +418,6 @@ done:
+     if (NULL != md) {
+         EVP_MD_free(md);
+     }
+-    if (NULL != ossl_ctx) {
+-        OSSL_LIB_CTX_free(ossl_ctx);
+-    }
+ #endif
+     return status;
+ }
+@@ -357,8 +441,7 @@ extern cl_error_t cl_hash_init_ex(
+     EVP_MD_CTX *ctx   = NULL;
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    OSSL_LIB_CTX *ossl_ctx = NULL;
+-    EVP_MD *md             = NULL;
++    EVP_MD *md = NULL;
+ #else
+     const EVP_MD *md = NULL;
+ #endif
+@@ -370,20 +453,7 @@ extern cl_error_t cl_hash_init_ex(
+     }
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    if (flags & CL_HASH_FLAG_FIPS_BYPASS) {
+-        /* Bypass FIPS restrictions the OpenSSL 3.0 way */
+-        ossl_ctx = OSSL_LIB_CTX_new();
+-        if (NULL == ossl_ctx) {
+-            cli_errmsg("cl_hash_data_ex: Failed to create new OpenSSL library context\n");
+-            status = CL_EMEM;
+-            goto done;
+-        }
+-
+-        md = EVP_MD_fetch(ossl_ctx, to_openssl_alg(alg), "-fips");
+-    } else {
+-        /* Use FIPS compliant algorithms */
+-        md = EVP_MD_fetch(NULL, to_openssl_alg(alg), NULL);
+-    }
++    md = cli_get_md(alg, (flags & CL_HASH_FLAG_FIPS_BYPASS) != 0);
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+ #endif
+@@ -426,9 +496,6 @@ done:
+     if (NULL != md) {
+         EVP_MD_free(md);
+     }
+-    if (NULL != ossl_ctx) {
+-        OSSL_LIB_CTX_free(ossl_ctx);
+-    }
+ #endif
+     return status;
+ }
+@@ -593,8 +660,7 @@ extern cl_error_t cl_hash_file_fd_ex(
+     EVP_MD_CTX *ctx = NULL;
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    OSSL_LIB_CTX *ossl_ctx = NULL;
+-    EVP_MD *md             = NULL;
++    EVP_MD *md = NULL;
+ #else
+     const EVP_MD *md = NULL;
+ #endif
+@@ -642,20 +708,7 @@ extern cl_error_t cl_hash_file_fd_ex(
+     }
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    if (flags & CL_HASH_FLAG_FIPS_BYPASS) {
+-        /* Bypass FIPS restrictions the OpenSSL 3.0 way */
+-        ossl_ctx = OSSL_LIB_CTX_new();
+-        if (NULL == ossl_ctx) {
+-            cli_errmsg("cl_hash_data_ex: Failed to create new OpenSSL library context\n");
+-            status = CL_EMEM;
+-            goto done;
+-        }
+-
+-        md = EVP_MD_fetch(ossl_ctx, to_openssl_alg(alg), "-fips");
+-    } else {
+-        /* Use FIPS compliant algorithms */
+-        md = EVP_MD_fetch(NULL, to_openssl_alg(alg), NULL);
+-    }
++    md = cli_get_md(alg, (flags & CL_HASH_FLAG_FIPS_BYPASS) != 0);
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+ #endif
+@@ -781,9 +834,6 @@ done:
+     if (NULL != md) {
+         EVP_MD_free(md);
+     }
+-    if (NULL != ossl_ctx) {
+-        OSSL_LIB_CTX_free(ossl_ctx);
+-    }
+ #endif
+     return status;
+ }
+@@ -795,8 +845,7 @@ unsigned char *cl_hash_data(const char *alg, const void *buf, size_t len, unsign
+     size_t mdsz;
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    OSSL_LIB_CTX *ossl_ctx = NULL;
+-    EVP_MD *md             = NULL;
++    EVP_MD *md = NULL;
+ #else
+     const EVP_MD *md = NULL;
+ #endif
+@@ -808,23 +857,12 @@ unsigned char *cl_hash_data(const char *alg, const void *buf, size_t len, unsign
+ #endif
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    /* Bypass FIPS restrictions the OpenSSL 3.0 way */
+-    ossl_ctx = OSSL_LIB_CTX_new();
+-    if (NULL == ossl_ctx) {
+-        cli_errmsg("cl_hash_data_ex: Failed to create new OpenSSL library context\n");
+-        return NULL;
+-    }
+-
+-    md = EVP_MD_fetch(ossl_ctx, to_openssl_alg(alg), "-fips");
++    md = cli_get_md(alg, true);
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+ #endif
+-    if (!(md)) {
+-#if OPENSSL_VERSION_MAJOR >= 3
+-        OSSL_LIB_CTX_free(ossl_ctx);
+-#endif
++    if (!(md))
+         return NULL;
+-    }
+ 
+     mdsz = EVP_MD_size(md);
+ 
+@@ -832,7 +870,6 @@ unsigned char *cl_hash_data(const char *alg, const void *buf, size_t len, unsign
+     if (!(ret)) {
+ #if OPENSSL_VERSION_MAJOR >= 3
+         EVP_MD_free(md);
+-        OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+         return NULL;
+     }
+@@ -844,7 +881,6 @@ unsigned char *cl_hash_data(const char *alg, const void *buf, size_t len, unsign
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+         EVP_MD_free(md);
+-        OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+         return NULL;
+     }
+@@ -865,7 +901,6 @@ unsigned char *cl_hash_data(const char *alg, const void *buf, size_t len, unsign
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+         EVP_MD_free(md);
+-        OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+         EVP_MD_CTX_destroy(ctx);
+         return NULL;
+@@ -885,7 +920,6 @@ unsigned char *cl_hash_data(const char *alg, const void *buf, size_t len, unsign
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+             EVP_MD_free(md);
+-            OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+             EVP_MD_CTX_destroy(ctx);
+             return NULL;
+@@ -902,7 +936,6 @@ unsigned char *cl_hash_data(const char *alg, const void *buf, size_t len, unsign
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+             EVP_MD_free(md);
+-            OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+             EVP_MD_CTX_destroy(ctx);
+             return NULL;
+@@ -921,7 +954,6 @@ unsigned char *cl_hash_data(const char *alg, const void *buf, size_t len, unsign
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+         EVP_MD_free(md);
+-        OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+         EVP_MD_CTX_destroy(ctx);
+         return NULL;
+@@ -929,7 +961,6 @@ unsigned char *cl_hash_data(const char *alg, const void *buf, size_t len, unsign
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+     EVP_MD_free(md);
+-    OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+     EVP_MD_CTX_destroy(ctx);
+ 
+@@ -944,8 +975,7 @@ unsigned char *cl_hash_file_fd(int fd, const char *alg, unsigned int *olen)
+     EVP_MD_CTX *ctx;
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    OSSL_LIB_CTX *ossl_ctx = NULL;
+-    EVP_MD *md             = NULL;
++    EVP_MD *md = NULL;
+ #else
+     const EVP_MD *md = NULL;
+ #endif
+@@ -953,29 +983,17 @@ unsigned char *cl_hash_file_fd(int fd, const char *alg, unsigned int *olen)
+     unsigned char *res;
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    /* Bypass FIPS restrictions the OpenSSL 3.0 way */
+-    ossl_ctx = OSSL_LIB_CTX_new();
+-    if (NULL == ossl_ctx) {
+-        cli_errmsg("cl_hash_data_ex: Failed to create new OpenSSL library context\n");
+-        return NULL;
+-    }
+-
+-    md = EVP_MD_fetch(ossl_ctx, to_openssl_alg(alg), "-fips");
++    md = cli_get_md(alg, true);
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+ #endif
+-    if (!(md)) {
+-#if OPENSSL_VERSION_MAJOR >= 3
+-        OSSL_LIB_CTX_free(ossl_ctx);
+-#endif
++    if (!(md))
+         return NULL;
+-    }
+ 
+     ctx = EVP_MD_CTX_new();
+     if (!(ctx)) {
+ #if OPENSSL_VERSION_MAJOR >= 3
+         EVP_MD_free(md);
+-        OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+         return NULL;
+     }
+@@ -990,7 +1008,6 @@ unsigned char *cl_hash_file_fd(int fd, const char *alg, unsigned int *olen)
+     if (!EVP_DigestInit_ex(ctx, md, NULL)) {
+ #if OPENSSL_VERSION_MAJOR >= 3
+         EVP_MD_free(md);
+-        OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+         EVP_MD_CTX_free(ctx);
+         return NULL;
+@@ -999,7 +1016,6 @@ unsigned char *cl_hash_file_fd(int fd, const char *alg, unsigned int *olen)
+     res = cl_hash_file_fd_ctx(ctx, fd, olen);
+ #if OPENSSL_VERSION_MAJOR >= 3
+     EVP_MD_free(md);
+-    OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+     EVP_MD_CTX_free(ctx);
+ 
+@@ -1866,36 +1882,23 @@ void *cl_hash_init(const char *alg)
+     EVP_MD_CTX *ctx;
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    OSSL_LIB_CTX *ossl_ctx = NULL;
+-    EVP_MD *md             = NULL;
++    EVP_MD *md = NULL;
+ #else
+     const EVP_MD *md = NULL;
+ #endif
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    /* Bypass FIPS restrictions the OpenSSL 3.0 way */
+-    ossl_ctx = OSSL_LIB_CTX_new();
+-    if (NULL == ossl_ctx) {
+-        cli_errmsg("cl_hash_data_ex: Failed to create new OpenSSL library context\n");
+-        return NULL;
+-    }
+-
+-    md = EVP_MD_fetch(ossl_ctx, to_openssl_alg(alg), "-fips");
++    md = cli_get_md(alg, true);
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+ #endif
+-    if (!(md)) {
+-#if OPENSSL_VERSION_MAJOR >= 3
+-        OSSL_LIB_CTX_free(ossl_ctx);
+-#endif
++    if (!(md))
+         return NULL;
+-    }
+ 
+     ctx = EVP_MD_CTX_new();
+     if (!(ctx)) {
+ #if OPENSSL_VERSION_MAJOR >= 3
+         EVP_MD_free(md);
+-        OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+         return NULL;
+     }
+@@ -1910,7 +1913,6 @@ void *cl_hash_init(const char *alg)
+     if (!EVP_DigestInit_ex(ctx, md, NULL)) {
+ #if OPENSSL_VERSION_MAJOR >= 3
+         EVP_MD_free(md);
+-        OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+         EVP_MD_CTX_free(ctx);
+         return NULL;
+@@ -1918,7 +1920,6 @@ void *cl_hash_init(const char *alg)
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+     EVP_MD_free(md);
+-    OSSL_LIB_CTX_free(ossl_ctx);
+ #endif
+     return (void *)ctx;
+ }
+-- 
+2.47.3
+
diff --git a/package/clamav/0003-libclamav-harden-EVP-digest-cache-failure-handling.patch b/package/clamav/0003-libclamav-harden-EVP-digest-cache-failure-handling.patch
new file mode 100644
index 0000000000..becb9abf89
--- /dev/null
+++ b/package/clamav/0003-libclamav-harden-EVP-digest-cache-failure-handling.patch
@@ -0,0 +1,273 @@
+From 1786ca8681ae80037a998a0eb3eeb962981a6d12 Mon Sep 17 00:00:00 2001
+From: Valerie Snyder <valsnyde@cisco.com>
+Date: Tue, 4 Aug 2026 23:29:29 -0400
+Subject: [PATCH] libclamav: harden EVP digest cache failure handling
+
+Preserve existing libclamav error codes when digest acquisition fails, and emit diagnostics only after releasing the shared digest-cache mutex so application callbacks may safely re-enter hashing.
+
+Require MD5, SHA-1, and SHA-256 to remain available through the private non-FIPS context. Add deterministic Linux failure injection for provider-fetch and library-context allocation failures, including Valgrind coverage for bounded failure behavior.
+
+(cherry picked from commit 23f5de9660ed3fef475fdc416070383f8f7ff1ea)
+[Backport to 1.5: resolved a unit_tests/CMakeLists.txt conflict by leaving out
+the check_xlm_scanmap target, which is not on rel/1.5.]
+
+Upstream: https://github.com/Cisco-Talos/clamav/pull/1873#issuecomment-6485066645
+
+[Bernd: removed unit tests]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclamav/crypto.c | 119 ++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 84 insertions(+), 35 deletions(-)
+
+diff --git a/libclamav/crypto.c b/libclamav/crypto.c
+index 865e38789..6c4245bf3 100644
+--- a/libclamav/crypto.c
++++ b/libclamav/crypto.c
+@@ -179,8 +179,8 @@ void cl_cleanup_crypto(void)
+  *
+  * Fetch each FIPS-bypass digest once into a single shared non-FIPS library
+  * context and reuse it (a fetched EVP_MD is reference counted and safe to share
+- * across threads). cli_get_md() returns a reference the caller owns and must
+- * release with EVP_MD_free().
++ * across threads). On success, cli_get_md() returns a reference through its
++ * output parameter that the caller owns and must release with EVP_MD_free().
+  *
+  * Only the bypass digests are cached. The FIPS-compliant path is fetched from
+  * the default library context on every call, so it keeps honoring the current
+@@ -202,32 +202,47 @@ static struct {
+ } md_cache[8];
+ static size_t md_cache_len = 0;
+ 
+-static EVP_MD *cli_get_md(const char *alg, bool fips_bypass)
++static cl_error_t cli_get_md(const char *alg, bool fips_bypass, EVP_MD **md_out)
+ {
+-    const char *ossl_alg = to_openssl_alg(alg);
+-    EVP_MD *result       = NULL;
+-    bool cached          = false; /* true if md_cache owns `result` */
++    const char *ossl_alg      = to_openssl_alg(alg);
++    const char *error_message = NULL;
++    EVP_MD *result            = NULL;
++    cl_error_t status         = CL_ERROR;
++    bool result_is_cached     = false;
+     size_t i;
+ 
++    if (NULL == md_out) {
++        return CL_ENULLARG;
++    }
++    *md_out = NULL;
++
+     if (NULL == ossl_alg) {
+-        return NULL;
++        return CL_EARG;
+     }
+ 
+     if (!fips_bypass) {
+         /* FIPS-compliant path: fetch from the default library context every
+          * time so the current default property query -- including any runtime
+          * FIPS change -- is honored. */
+-        return EVP_MD_fetch(NULL, ossl_alg, NULL);
++        result = EVP_MD_fetch(NULL, ossl_alg, NULL);
++        if (NULL == result) {
++            return CL_EARG;
++        }
++        *md_out = result;
++        return CL_SUCCESS;
+     }
+ 
+ #ifdef CL_THREAD_SAFE
+-    pthread_mutex_lock(&md_cache_mutex);
++    if (0 != pthread_mutex_lock(&md_cache_mutex)) {
++        cli_errmsg("cli_get_md: Failed to lock OpenSSL digest cache\n");
++        return CL_ELOCK;
++    }
+ #endif
+ 
+     for (i = 0; i < md_cache_len; i++) {
+         if (0 == strcmp(md_cache[i].alg, ossl_alg)) {
+-            result = md_cache[i].md;
+-            cached = true;
++            result           = md_cache[i].md;
++            result_is_cached = true;
+             goto done;
+         }
+     }
+@@ -236,31 +251,41 @@ static EVP_MD *cli_get_md(const char *alg, bool fips_bypass)
+     if (NULL == nonfips_libctx) {
+         nonfips_libctx = OSSL_LIB_CTX_new();
+         if (NULL == nonfips_libctx) {
+-            cli_errmsg("cli_get_md: Failed to create OpenSSL library context\n");
++            error_message = "cli_get_md: Failed to create OpenSSL library context\n";
++            status        = CL_EMEM;
+             goto done;
+         }
+     }
+     result = EVP_MD_fetch(nonfips_libctx, ossl_alg, "-fips");
++    if (NULL == result) {
++        status = CL_EARG;
++        goto done;
++    }
+     if (NULL != result && md_cache_len < sizeof(md_cache) / sizeof(md_cache[0])) {
+         md_cache[md_cache_len].alg = ossl_alg;
+         md_cache[md_cache_len].md  = result; /* cache holds this reference */
+         md_cache_len++;
+-        cached = true;
++        result_is_cached = true;
+     }
+ 
+ done:
+-    /* A cached digest belongs to md_cache, so give the caller its own reference
+-     * to EVP_MD_free(). If that reference can't be acquired, fail instead of
+-     * handing back one the caller would free out from under the cache.
+-     * A digest that was fetched but not cached is already the caller's to free. */
+-    if (cached && NULL != result && 1 != EVP_MD_up_ref(result)) {
+-        cli_errmsg("cli_get_md: Failed to acquire a reference to the %s digest\n", ossl_alg);
+-        result = NULL;
++    if (result_is_cached && 1 != EVP_MD_up_ref(result)) {
++        error_message = "cli_get_md: Failed to retain OpenSSL digest handle\n";
++        result        = NULL;
++        status        = CL_EMEM;
++    } else if (NULL != result) {
++        status = CL_SUCCESS;
+     }
+ #ifdef CL_THREAD_SAFE
+     pthread_mutex_unlock(&md_cache_mutex);
+ #endif
+-    return result;
++    if (NULL != error_message) {
++        cli_errmsg("%s", error_message);
++    }
++    if (CL_SUCCESS == status) {
++        *md_out = result;
++    }
++    return status;
+ }
+ #endif /* OPENSSL_VERSION_MAJOR >= 3 */
+ 
+@@ -319,15 +344,21 @@ extern cl_error_t cl_hash_data_ex(
+     }
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    md = cli_get_md(alg, (flags & CL_HASH_FLAG_FIPS_BYPASS) != 0);
++    status = cli_get_md(alg, (flags & CL_HASH_FLAG_FIPS_BYPASS) != 0, &md);
++    if (CL_SUCCESS != status) {
++        if (CL_EARG == status) {
++            cli_errmsg("cl_hash_data_ex: Unsupported hash algorithm: %s\n", alg);
++        }
++        goto done;
++    }
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+-#endif
+     if (NULL == md) {
+         cli_errmsg("cl_hash_data_ex: Unsupported hash algorithm: %s\n", alg);
+         status = CL_EARG;
+         goto done;
+     }
++#endif
+ 
+     required_hash_len = (size_t)EVP_MD_size(md);
+ 
+@@ -453,15 +484,21 @@ extern cl_error_t cl_hash_init_ex(
+     }
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    md = cli_get_md(alg, (flags & CL_HASH_FLAG_FIPS_BYPASS) != 0);
++    status = cli_get_md(alg, (flags & CL_HASH_FLAG_FIPS_BYPASS) != 0, &md);
++    if (CL_SUCCESS != status) {
++        if (CL_EARG == status) {
++            cli_errmsg("cl_hash_init_ex: Unsupported hash algorithm: %s\n", alg);
++        }
++        goto done;
++    }
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+-#endif
+     if (NULL == md) {
+-        cli_errmsg("cl_hash_data_ex: Unsupported hash algorithm: %s\n", alg);
++        cli_errmsg("cl_hash_init_ex: Unsupported hash algorithm: %s\n", alg);
+         status = CL_EARG;
+         goto done;
+     }
++#endif
+ 
+     ctx = EVP_MD_CTX_new();
+     if (NULL == ctx) {
+@@ -708,15 +745,21 @@ extern cl_error_t cl_hash_file_fd_ex(
+     }
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    md = cli_get_md(alg, (flags & CL_HASH_FLAG_FIPS_BYPASS) != 0);
++    status = cli_get_md(alg, (flags & CL_HASH_FLAG_FIPS_BYPASS) != 0, &md);
++    if (CL_SUCCESS != status) {
++        if (CL_EARG == status) {
++            cli_errmsg("cl_hash_file_fd_ex: Unsupported hash algorithm: %s\n", alg);
++        }
++        goto done;
++    }
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+-#endif
+     if (NULL == md) {
+-        cli_errmsg("cl_hash_data_ex: Unsupported hash algorithm: %s\n", alg);
++        cli_errmsg("cl_hash_file_fd_ex: Unsupported hash algorithm: %s\n", alg);
+         status = CL_EARG;
+         goto done;
+     }
++#endif
+ 
+     required_hash_len = (size_t)EVP_MD_size(md);
+ 
+@@ -857,12 +900,14 @@ unsigned char *cl_hash_data(const char *alg, const void *buf, size_t len, unsign
+ #endif
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    md = cli_get_md(alg, true);
++    if (CL_SUCCESS != cli_get_md(alg, true, &md)) {
++        return NULL;
++    }
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+-#endif
+     if (!(md))
+         return NULL;
++#endif
+ 
+     mdsz = EVP_MD_size(md);
+ 
+@@ -983,12 +1028,14 @@ unsigned char *cl_hash_file_fd(int fd, const char *alg, unsigned int *olen)
+     unsigned char *res;
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    md = cli_get_md(alg, true);
++    if (CL_SUCCESS != cli_get_md(alg, true, &md)) {
++        return NULL;
++    }
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+-#endif
+     if (!(md))
+         return NULL;
++#endif
+ 
+     ctx = EVP_MD_CTX_new();
+     if (!(ctx)) {
+@@ -1888,12 +1935,14 @@ void *cl_hash_init(const char *alg)
+ #endif
+ 
+ #if OPENSSL_VERSION_MAJOR >= 3
+-    md = cli_get_md(alg, true);
++    if (CL_SUCCESS != cli_get_md(alg, true, &md)) {
++        return NULL;
++    }
+ #else
+     md = EVP_get_digestbyname(to_openssl_alg(alg));
+-#endif
+     if (!(md))
+         return NULL;
++#endif
+ 
+     ctx = EVP_MD_CTX_new();
+     if (!(ctx)) {
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
