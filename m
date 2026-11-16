Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C00606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B4A8rv2l
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CDA380D85;
	Mon, 16 Nov 2026 09:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKUx_wU3ITfC; Mon, 16 Nov 2026 09:26:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D7F2980E38
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794821168;
	b=FaeazgoI8X9kfIV2ymGK/C3I+ysy5IMh6izmiRTVOsGMJW0rBJOpLsNo1j26c2oSTpL+
	 oNhT9AJ84fKzF9iRvaeqbmb6/rQGprg7tmJO0oSgiJ9uhySbS8kVpK1fonb5ns+eSjI5y
	 KqLxIeqGxMVkjKU6htpt0lh3wNCW3G2Lvw59d4N0NUGmjxkLVKowNX6qbRWrKZ97kg+2w
	 a9XUqqNiOHoyBJcFNmP/+w3oQvQMob+oWYllg0pLcmsFG3nTBJQPZELQiYhjCxi9I0FQA
	 4w+B+eHbH2MgAPP2Kh8AAfhcUN6cmok38UvrZS9rjvGPhqGCd4NyUPSB8hi53FM7Ldg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794821168;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RKbbvYeRpNVnSwrifZcLmNMWiGRMDDpsk4nwEh5wH8o=;
	b=g7PiVoVvABDDAJwhTj4Pq2eaQwY+1GNlgng+ILQwcZ0lPi8cTChGU741gf3OK2gevZDB
	 PeP3JahhxhuuF6hQriw7TpqmOkv+RWtDAS6STZJY4UmZfObjDywJnwD3ObS2HJzAhp0ol
	 TQhILp8BgES1uRqh8z/gr07zS7KVm1f3DFGuZjsM8GsrdTqGoECeLZDv5yEpWp0AcaZ5z
	 Y3X8jIJ0DitIADqWZVp0KEHz3S560uoRKFXMssSrWYAZvetR74VrrQ1u/WmbRbmaUdzYc
	 4POXR+/REvIzwes3CBcGSew4yAX2r3i49DoFrPfu7sKSc8uHLF0NEcJk7Y/5aTQ1vdw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794821167;
	bh=RKbbvYeRpNVnSwrifZcLmNMWiGRMDDpsk4nwEh5wH8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B4A8rv2lMMyW14hEby/LXoEjzpqdqNviW46qpSBJg0x8jdKFK7TLJUGHztui9eARi
	 MuKZ04XXMNsTA2Y1MMvM547jS0iI4umcIW/yy24XOrgnSWiVQfj1/h4kUm84Vq1h52
	 SOEyVlWuA3Tb6hJv5lW3FmNcMfwQaU/Rj5nJeN2ZlEnUrm2G8xZ+JcxQCqacSi4B+R
	 qDYNYrzbDzcWmy8qTAUSzFuj6Oqs4jiEn6YEPHo/iUGUg7zs6C21CRxUvFYaILOokk
	 S1+s8utxUShjdWDj+Ji3YBUZN5EuzUKBbZcJ4LF9MSJkIkCoMiVNDyE5/hohq45mBz
	 aq/aCr6XTIn+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F2980E38;
	Mon, 16 Nov 2026 09:26:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FA182FB
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 09:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D5044009D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 09:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORCT1Cl3CAf4 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 09:26:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 060E140012
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 060E140012
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 09:26:02 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so20483265e9.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 01:26:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794821161; x=1795425961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=NmcwM6b5iUjnvZQuQZriVP2eitLAKc9ndQqFR5MDxcI=;
 b=QrIL1nYRhDBPbQ39PAKha9g+BEzq3pwOuUiKdYHGP4atFNlrMLuKnnzEC+h47Xc3qS
 zq8Ik2El9osExsAfB5iirVlLkKwPlDPBvONDJNR8M4jrnWs/YQvAzKz8BOLscACgbf79
 hOnoTpDR1+DyGepsUGp+U4wNHlHfHzYOTWenvVKGoqjrKf3geQrzBrr0TmYQ3xl1nfvS
 bwDIfZ+9L1GBApGhQOtH97hyGwKMh3vr0fBXcIbARbV1Q4lRbNZFDSCI/n1iUMq29K1T
 7eHApnw612hNz7DzsjQwKFlA3BQoQuMCCDLunaQhTmn/Qw6cbXQ+flPBxgPMJssg6kzU
 L+CQ==
X-Gm-Message-State: APuU4Z+5EShPIovBPolycOGbIEhYN23pZGvv7gl+SOhF32v9mbopLp18
 hLnljcOSaoL/+MRKJM+0mDe2TbtfTKYi3HrcSPhiS8BWLdzloqIC2rig+xfyUT4cfH4HHt7/N/V
 QJcAY
X-Gm-Gg: AYBFou1vGA/tPD//8yPXX95y967FbKQUDB+QElqAxK23txAMFNh3bPOjd3CLn9yEZya
 L/RfyVH/9qgHAfARcOP2h8LRj1XhFAlZ1wpDZ0Q7w/9nxJ3nAvcn4osP4PeAUAwrzcr14Wi927C
 jPCU95G3YAFqNtrq1t8CiUBvL4aSYcSIrYPOd0ruN00TPIqZ9yaUlJZ/QCUxX+TZUzBKoSdtZeM
 U8fmB7tOnLXYOBnJql8VzfAj09xsMnEV0CEXwwrJAZzlMK42cZdUEW/EWvcmTnWa/JeRyRHUlI/
 n+uEchImLGwNs7HlJl6BxUiZwElMMVp8VJk4pR51/DIQiII8c3taKQW7GH2KVLHISjUVINMMHED
 XDL7MIIE0ijiyoCHT5kmEGDjrKElVGz6vb+c3q30SrjmRBHLRbscZ9gyj1T6Il9gMQC2Q9zEqdh
 jA3zVw/X68Cg19kbf0E8BAFZx6Ao5TtktkYWYOYixUZDrKtB6naxY8V4a7xYT9twnzD7vNuqjg0
 I6Xtr+7zehjIZOabKkv983NXSsR+7jqMy6foOBqDtewCzDME1FcvH3E10YG2JEBzTSPFJOpVn1F
 JeP86DKaFcff/EXYn1MQZ9kTkST4m5ld4HR/ysRCMfM=
X-Received: by 2002:a05:600c:548b:b0:4a2:1364:252b with SMTP id
 5b1f17b1804b1-4bb55ab07c6mr212868665e9.35.1794821160703; 
 Mon, 16 Nov 2026 01:26:00 -0800 (PST)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb69ac4e16sm101701685e9.0.2026.11.16.01.26.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 01:26:00 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 10:25:19 +0100
Message-ID: <20261116092519.279386-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/redis: security bump to v8.10.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From the release notes:
    Update urgency: `SECURITY`: There are security fixes in the release.
    - Heap buffer overflow when propagating a `PUBLISH`/`SPUBLISH` message
      larger than 4GB over the cluster bus in cluster mode

See https://github.com/redis/redis/blob/8.10.3/00-RELEASENOTES

Also, remove patch 0004 which is now included upstream

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...ecated-X509_NAME_get_text_by_NID-API.patch | 101 ------------------
 package/redis/redis.hash                      |   2 +-
 package/redis/redis.mk                        |   2 +-
 3 files changed, 2 insertions(+), 103 deletions(-)
 delete mode 100644 package/redis/0004-tls-replace-deprecated-X509_NAME_get_text_by_NID-API.patch

diff --git a/package/redis/0004-tls-replace-deprecated-X509_NAME_get_text_by_NID-API.patch b/package/redis/0004-tls-replace-deprecated-X509_NAME_get_text_by_NID-API.patch
deleted file mode 100644
index 1b9238279d..0000000000
--- a/package/redis/0004-tls-replace-deprecated-X509_NAME_get_text_by_NID-API.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 8bc1c4e147761e7c9d6ff1bb92248b9d4dda43ab Mon Sep 17 00:00:00 2001
-From: Arpit Jaswal <iamarpitjaswal@gmail.com>
-Date: Wed, 30 Sep 2026 07:56:36 -0400
-Subject: [PATCH] tls: replace deprecated X509_NAME_get_text_by_NID API
- (#15227)
-
-Fixes #15221
-
-OpenSSL 4.0 deprecates `X509_NAME_get_text_by_NID()`. With our
-`-Werror=deprecated-declarations`, a `BUILD_TLS=yes` build against
-OpenSSL 4
-headers fails:
-
-tls.c:713: error: 'X509_NAME_get_text_by_NID' is deprecated: Since
-OpenSSL 4.0
-
-Homebrew's `openssl` formula points at `openssl@4` since 2026-09-28, so
-this is
-now the default macOS build.
-
-## Fix
-
-Extract the certificate subject field with
-`X509_NAME_get_index_by_NID()`,
-`X509_NAME_get_entry()`, `X509_NAME_ENTRY_get_data()` and
-`ASN1_STRING_to_UTF8()` instead.
-
-* The value is still built with `sdstrynewlen()` from the returned
-length, so
-the embedded-NUL CN fix (d22066d09) is preserved and empty fields are
-still
-  rejected.
-* BMPString/UniversalString names are now decoded to UTF-8 instead of
-copied
-as raw bytes, and the fixed 256-byte buffer that silently truncated
-longer
-  names is gone.
-* The intermediate OpenSSL objects (subject, entry, value) are not held
-in
-typed locals: OpenSSL 1.0.2/1.1.1 take non-const `X509_NAME` parameters,
-while OpenSSL 4.0 returns const pointers from `X509_get_subject_name()`,
-  `X509_NAME_get_entry()` and `X509_NAME_ENTRY_get_data()`. No single
-declaration is warning-free on both ends, so the calls are chained;
-within
-  any one version each return type matches the next parameter type.
-
-Upstream: https://github.com/redis/redis/commit/8bc1c4e147761e7c9d6ff1bb92248b9d4dda43ab
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/tls.c | 32 ++++++++++++++++++++++++--------
- 1 file changed, 24 insertions(+), 8 deletions(-)
-
-diff --git a/src/tls.c b/src/tls.c
-index 4e7d91510..18b780be7 100644
---- a/src/tls.c
-+++ b/src/tls.c
-@@ -704,16 +704,32 @@ static sds getCertFieldByName(X509 *cert, const char *field) {
- 
-     if (nid == -1) return NULL;
- 
--    X509_NAME *subject = X509_get_subject_name(cert);
--    if (!subject) return NULL;
--
--    /* The name may contain embedded NULs, so use the returned length, not
-+    /* The subject (e.g. "CN=alice, O=redis"), its entries and their values
-+     * are all owned by the cert, don't free them. They are deliberately not
-+     * held in typed locals: the const-ness of these accessors differs between
-+     * OpenSSL 1.0.2, 3.x and 4.0, and chaining the calls keeps every version
-+     * warning-free. */
-+    if (!X509_get_subject_name(cert)) return NULL;
-+
-+    /* Find the first entry of type nid (e.g. CN), searching from the start
-+     * (-1). Returns its index, or -1 if not found. */
-+    int index = X509_NAME_get_index_by_NID(X509_get_subject_name(cert), nid, -1);
-+    if (index < 0) return NULL;
-+
-+    /* Decode the entry's ASN.1 string (UTF8String, BMPString, ...) into UTF-8.
-+     * The name may contain embedded NULs, so use the returned length, not
-      * strlen, to build the proper binary-safe string. */
--    char buf[256];
--    int len = X509_NAME_get_text_by_NID(subject, nid, buf, sizeof(buf));
--    if (len <= 0) return NULL;
-+    unsigned char *utf8 = NULL;
-+    int len = ASN1_STRING_to_UTF8(&utf8,
-+        X509_NAME_ENTRY_get_data(X509_NAME_get_entry(X509_get_subject_name(cert), index)));
-+    if (len <= 0) {
-+        OPENSSL_free(utf8);
-+        return NULL;
-+    }
- 
--    return sdstrynewlen(buf, len);
-+    sds result = sdstrynewlen(utf8, len);
-+    OPENSSL_free(utf8);
-+    return result;
- }
- 
- sds tlsGetPeerUsername(connection *conn_) {
--- 
-2.47.3
-
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index e0dc5fc521..15f28da924 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  b9ffee226b5eecdba98a679260dad764b2a4ebd90dce4ad5ac9e9f3eef9c02b3  redis-8.10.2.tar.gz
+sha256  edde778f6bdee7581e42fc139ca9e07e2822212092f7501f99989656e3629d02  redis-8.10.3.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 8b03f79cd9..a9d4ff6d0b 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.10.2
+REDIS_VERSION = 8.10.3
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
