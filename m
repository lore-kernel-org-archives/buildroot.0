Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74284606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GtpqjKvU
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C6F4812A9;
	Fri,  6 Nov 2026 16:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNAL9xXTSL0u; Fri,  6 Nov 2026 16:34:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3AB9C812A0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793982842;
	b=n9hFfZVR1+nbU4GT0A1UXHhdKwp8oXHpsPecjV+T76LQh29bGsdmhwG7N00zLl3+3UU4
	 MANm/EYLMFPd7ifULhIRzd5T9uYjY4vsG85veqUyFXFKGq2Su3AgWQnKzHIr9G9X4UrUw
	 tAeMc7MjUYHIv7g++cmdFs+/tXYAVBs3zxyA2tVZfUCooIQCL19yD9LZHDolAwo/nGnL4
	 Ey6p6jl7D8Uz3tyH03RByjtB4+XFOkhi1Sksnk3ABAuz7Z33KMDm0MvFpM9ODVyiDCuA5
	 Uh+JmkBHLzuDiDZOepGHUWrrP+ZqS1m5ZfBguwRhahHP6FcWqXdazVlvrld2wVqV+rQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793982842;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZM0ZfhQvoFsnLBf6DMhwGWraXJvUf9EtQD/W1nfHznY=;
	b=RFE5ApdXrE68hjHc5sfAlUD4lpYUBPr+nZtHBJfYSJPzmxgyTGWTOIC5ppCn70517W6O
	 AQVf6JRuHW27J1kle+1v/X6Pa46nYY6LlPr0mR8W7F+uNZlvthgfol2xMfNgWuH308Zxs
	 Qy+XCz5yQ4Cu+9whco4VZJi6h20q/3ekLRXDhKdXj5OgLcvEeDnBQY+yiFzrOfqU3HeJf
	 XEUd9mlfT9EXgZpIS6IDe1SOpQs6nOAanJd9wDZJGoWfacqmLAIOdALxuu6ZIn44N3oJM
	 qOoz9Dgz52IwOgflObxlimDtsxRGuKh79mC64v9Lj9hQppetAWDlFNdZBHhZaLvL8iw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793982842;
	bh=ZM0ZfhQvoFsnLBf6DMhwGWraXJvUf9EtQD/W1nfHznY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GtpqjKvULSHjCILdCdjz8XtYbRgAQqvF0sGA+/C/6g+5ilmAdY9pnasPUkNesER4i
	 fHUepfUCnt5HEC3fPwAmJUwj5DISKcJAvM0O3zdVeelgVKzvHlroK4r/XWta9giyHT
	 2hh++3DMuRhWgXjk9HQatXooHCbbRMpvpLEMRrrfVKWnW2O5gPHltaNmgKXvRzvCJW
	 NbbUX+PifEL0Gy7KApAPI4Ag7v1a/qMV+C2c0ljOIT6j81nH8dKtjW1KpDpK8yvJMi
	 BjvBAPzohzIOHa6ftKxAuI4JLtTuzHSPGKajTuCMsR5nN5oDIO4uUqCIxpFsu0y8AR
	 +CeFr15sQRLDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AB9C812A0;
	Fri,  6 Nov 2026 16:34:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BCC5B2AC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A27A940913
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cc7AAarZmDWU for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:33:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 85AAC407C6
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85AAC407C6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:33:58 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so941711f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793982836; x=1794587636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bMZHXdqsJMTybUmgnDUzs/wCYMORMq5GD+tUfU/0FxE=;
 b=Sq3gK3awLTmsKyFfXaBJkva+ez+kZZ+PBqv1bUWea3zyXjouBbcAdrr6o9Ezjtw5+0
 5yvETDHIllcF/25Y2i05G+rOwbCS/gnMxI8yWSShHv46C7cCizT5pEuvzSED8VVSZU6Z
 uuq1f4u2W2GBrhiUL6g+yq7zqGRowD7jSD/vhuRqZYipsmEnn9pyzyExmSZhFzeC7smw
 8hSnRSD5rRyRkOuFymmUxzTn1Xglq5iDtRmL4PtISNgAqOm1wk4KFVVrDI9M2pIX51pO
 z4u/nE/GEBerOLvoljQlXHysvN8tgv5PpSi0WunuXifiiAqGlQ51w/XhwVI1KpUCWa4u
 7P+w==
X-Gm-Message-State: APuU4Z+bINvvt1EEUS1qV4bda0UAgjFVhCcrSl81MCGrvaVyRwFmgG0h
 kokhtlHXbbbUyEXj1/GU205A2nGXQJOmLg4DKj4oEgn8KBEYgb3O/Pl0TCi6f/VUHUNuVNn3iHG
 k8FpV
X-Gm-Gg: AYBFou1YNUlol/SYJSbXmVotaEh1D8VvAZshEJmtdOuoj/OqbmjVlfL2R2JuwVShH7r
 ed0bybXIZ+gNqAYugd1WhgC5CDlk3Kqlphg4EAObMBaVCIrDxnGTkdoF0X4VXZw9Ts7T2+qqzsC
 b4H+i5HfSP2Dev/jPIu+nSUU81vbcPGPLS3zkH6Jw4+Ek6fWGk0bcYYKAUhEbBKo9hwtE3gX8Q4
 JvX5ggtbLhcgUER9jPAWwmiz7EvDNCR9i1dJTRD3e5gMVYU0jRbPs6zFObmHDdDO6UIQtowYVKQ
 Srzob2cmjhOV4Li+oBtrAMWg7vM/2+2QFtzRrAtyGuHC5Gc4i2HhOFfqnTYLuESLMFT2gFNiO9X
 eC8BAf8qjWwrbEgr7ShK/svduKboyxaj1z17GWy89LPINMu+PbjL7lVS0Y0V1Zyc3yuHBKD20OO
 hEPZOvVABxxz5gDBLgHenmc0UGiiSS6STQSaZsUbRVdNhMWN9qjJWdzSKbbSvqhorW8sPwxsGfG
 33DnqsBnvWiXXKPwzTXFhIymgsd7hdQ2EGluEooqaLb8gIjYIq/6pYyG119BD/Fcgt2YFiwnhJC
 OFbSFVSeweOFMT6HKBL4zPD9eVJialF3jrWn3gYOIhVtRCC7AzeX7LJA4OcPvDcpkg==
X-Received: by 2002:a05:600c:34ca:b0:4a2:8c5:5e5 with SMTP id
 5b1f17b1804b1-4b6dd63fd31mr51270105e9.7.1793982836077; 
 Fri, 06 Nov 2026 08:33:56 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b76cb7f09asm3559825e9.2.2026.11.06.08.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:33:55 -0800 (PST)
To: buildroot@buildroot.org
Cc: Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Perale <thomas.perale@mind.be>
Date: Fri,  6 Nov 2026 17:33:54 +0100
Message-ID: <20261106163355.833305-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106163355.833305-1-thomas.perale@mind.be>
References: <20261106163355.833305-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/strongswan: force libopenssl usage
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Building the strongswan package with LibreSSL will result in the
following error:

```
openssl_util.c: In function 'openssl_wrap_private_key':
openssl_util.c:163:30: error: 'EVP_PKEY_ED448' undeclared (first use in this function); did you mean 'EVP_PKEY_DSA2'?
  163 |                         case EVP_PKEY_ED448:
      |                              ^~~~~~~~~~~~~~
      |                              EVP_PKEY_DSA2
...
```

This can be reproduces with the following defconfig:

```
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_LIBRESSL=y
BR2_PACKAGE_STRONGSWAN=y
BR2_PACKAGE_STRONGSWAN_OPENSSL=y
```

The OpenSSL option had been introduced in strongswan in 2013 [1]. Before
the introduction of LibreSSL [2] in 2017.

In version 5.7.2 the upstream project added support for Ed25519/Ed448
(part of buildroot commit [4]). LibreSSL doesn't support ED448.

This commit assume that the strongswan project doesn't support LibreSSL
as it appears there isn't any conditional checks for LibreSSL in the
codebase.

The oldest autobuild error goes back to 2022 [5].

[1] 89719fce71 strongswan: new package
[2] be76f4dd20 libressl: new package
[3] https://github.com/strongswan/strongswan/commit/cbf07ab5b0b644c7bf5f7177efabc841b230b551
[4] da912a3d2a package/strongswan: bump to version 5.9.0
[5] https://autobuild.buildroot.org/index.php?reason=strongswan%25&symbols[BR2_PACKAGE_LIBRESSL]=y

Fixes: https://autobuild.buildroot.org/results/f2f/f2f8dfc1ea5c598b04e9e4e9f2504c633d4edfbc
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/strongswan/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 11c0ca7780..9d4cdc7e9a 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -46,6 +46,7 @@ comment "botan backend needs a toolchain w/ C++, gcc >= 11"
 config BR2_PACKAGE_STRONGSWAN_OPENSSL
 	bool "OpenSSL"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 
 config BR2_PACKAGE_STRONGSWAN_GCRYPT
 	bool "libgcrypt"
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
