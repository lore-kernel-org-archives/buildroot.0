Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAA7606A326
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q/KTDpTO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJbzOhi2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BFD96072A;
	Mon,  9 Nov 2026 13:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdZAG8A6-d_a; Mon,  9 Nov 2026 13:15:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 490A660703
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794230114;
	b=MooR4mqOlAtcahBan1c8VSmYp5fWuKuoMlmo7OIWbjZO3uIwb/AdhKkGPvH04nq2/Ozs
	 Kaj09PPPZVIkeGT8m3Wwtx7dBmSZmuELUtB5QgRQIzLnnvOB8R+VsE1L8a88GLHGOaPLK
	 EshaAMA7ZU8mJY18LUfoSzZsr1smBrSFHNukVNf0beuciJpdzZBKIVDIvP/VMBaO+FjV5
	 2ZGyCT/jE/ILTUNpyOhB4SacVdwvuU4D7UtgwolwubeA3uZu5cYFmxnxTKB5KFls7Lg7K
	 /7YUSUoV1gGppJRyWiNWY63Q6iSa4vs9VCcLmiCjgv1pL2jze3XyY4E2dFOCDqKvnBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794230114;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9+akeUG94gKxhem67XdKmj8oYHJdUsEPuYY2QAs9mwU=;
	b=JpiylbBQVOpqJ/SK9cCBoE71dYeqvyntM73PFlqmGKgp4hSYgSl9EQYZPAFytklD/q27
	 N8Okx0urjOHH4Mq4+yJVuCSUgqkkeS8TnttFTFdV9ytQJfg6YFPKmlzdwpqVM+8MeYFAR
	 bcMr7T34WIhNJsJkxQcs/JfGZz0tsP7fRgbs896EDYvk6IwYXGUlzk+wQEQjQpRQTzQKF
	 jtg7PIzgS/99UQQBcvEmZsQcTcDI3YIbwLMO0pVYo9HBnHhFTzMCNdA5iWDwa3L/QUIWR
	 obnToMKEG893G+JEBaPVu2v25A7tU29DgxG5MJqXcMJU/7YvslWNebyi4as4W3314eA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794230114;
	bh=9+akeUG94gKxhem67XdKmj8oYHJdUsEPuYY2QAs9mwU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q/KTDpTOx6pTdLm4/KAI8+DsKmPT/ntb+CdrBavztfI208mqzkXTThAi3UsN5kL6K
	 Me/OCUUnxOSmAMcBa1hOs/FGO6R5nwPfPH8BWWjywa9mtFK9F0pufZyK/7KY5KQr5g
	 VhJkBPK9Wrx6+4fkEf2C+a2IQ9Q7/bZrLzivhBQ2OIjq2ixJu24vDLWIle/WnDCZBN
	 ceFb/8gfLfGwfgL8/U7dJJRd+6E04/bJughQVVurfGoFJRIpK6l7G/pQ9LEaG1REXo
	 TgUEY8b1fThdKWTd/GOE+WGprWbnvkIVjRT/mJY8VyH9wMPJbkEzhEMaETXO/fT1c1
	 6MOdxk5LRD96g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 490A660703;
	Mon,  9 Nov 2026 13:15:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD17B111
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE46F406CD
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5W3cN53KFZQ for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 13:15:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CCE0D406B0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=pieterjanca@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=mJbzOhi2
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCE0D406B0
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:15:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4b7252a32c8so8897745e9.0
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 05:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794230109; x=1794834909; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ubzqTGuuRUmC9kMkK3oAyqL5myyUuBBit8gxvfT9c/M=;
 b=mJbzOhi2iHGha0mfbrurZ8KqJLwzvMbnAWRf6SQUA0dMtR3eg4ribDL0q2jk/MMa30
 wRlMOfm4NtHLhk53WPJ05PahUC4/abFL/T2MCBo3hMq0g45qmxrChuQySSMw8QsBoHwG
 1csM5lowpa7oQy8mALSuo4s8zdxQdT8l2PGwSdi6+O3iZVtAaOMrhlh5ogmmd1GowVZ2
 3fdKHL5c+fOhCY+USSIDrZLitY+VJxblF5/ZmHbduZsxiyUsJXvglIHy+XM3yiaKtwkL
 SxC1iJHPBkMKD59a+3rOd61feSII1N7/MIySo5iQZQmiJ2pcGhNefsTCxZWZ3Hl/Pz7B
 9ExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794230109; x=1794834909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ubzqTGuuRUmC9kMkK3oAyqL5myyUuBBit8gxvfT9c/M=;
 b=DanUE8KM/3g6Jm9MfUqZLCwRBhnk8XUe8O2+wATZgW288/N76Dg9LNu8zbNXqdDRTU
 Vbybv8fT2p4/t2kWAPeK3/ze32z+g+G/dyUVoKXxCpMv1A39ZjIvG4GGG6HIDV8gjOUY
 Cfsnl/1XKBkdP5J3XovR3mQTjrB+Q2SQeNBVJPSF8AZC0tCeZnaNbCZA3UFc8vvBXzBy
 mR5++bkV/hrLL0rxANfoAd/V5N71mozbAnuAia+S0HeXpAPNatL7Tt2p58Rz/ESqOtF1
 kh+peKXjnh9THSNy/bZDSYc8qjhDHHAmSdzTEFXDsgQFUw9gsXGzJbKpTEurxVUySdUQ
 xSAg==
X-Gm-Message-State: APuU4Z9IuexlrWAd8R1uQlcpKkEMaMp2JrM1aebUntGzFHKQZ+Xh3OE9
 l4CqbCxHZ8WfTJglHvA44D4XXtahQczMecjz59xMo6EJ4nVlTdRl32iDRt7T
X-Gm-Gg: AYBFou2HLH+7nSPFZ4I5rRcUWdKyofTpCX7l8W2EYV7mM7it/uFT7bpdYT0GHp9WORo
 fTKX0hLkI2BtSoLiB1bgLr1win0/roeRnQaTogFm4A/iozv312H53dACjVmWOm0E4eObfomGKiP
 6shLdBws90tuZ9zG5z95Aaac6z06AQFTaDIyp9nFJ9Xn9tMhKC5Ba+hGc/qHxOz1HKEIwC0hONs
 ro2D0VyaWr7aVp5wjTWm6rWVB+z4wgzak10ax1/dMUUmWbIWXgh0EZjxJt8ZGK/AuEATvCj66qm
 vBOueHAUdTZcZkhbK3wXUlNVBqOfUG69CxFaQ9QYLGJa8K3Be9U8enhHZV2/u4SES5OS0s1oC8s
 dxTDx/Whomz6WC+YixaZibdTYWy2ydfLf82NMrpSPRnPEr52ZaW/YNGHp/N/u0Me4xZkGFCP9cn
 vHlhAEow6aU2+JCkL8ToRHrEkj+LGFAwCzV7Hqzx1ZZ+Lvim0drbFEGknAuM+S5tytWKQWhhmzS
 QXfdLSrSdIpy28POX6PZDh05DiHZZSi1wd4ydOm7JpbxI1Ye/WbF5nXOys9IvzsubO7IzcblpMz
 X6Xi5XzkW1/NxFz+fq3q
X-Received: by 2002:a05:600c:4e87:b0:4a1:fe55:88ef with SMTP id
 5b1f17b1804b1-4b963c8dad3mr71815675e9.20.1794230109218; 
 Mon, 09 Nov 2026 05:15:09 -0800 (PST)
Received: from case ([84.199.255.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90619bc91sm132208825e9.2.2026.11.09.05.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 05:15:08 -0800 (PST)
From: Pieterjan Camerlynck <pieterjanca@gmail.com>
To: buildroot@buildroot.org
Cc: Pieterjan Camerlynck <p.camerlynck@televic.com>,
 Aaron Hallaert <a.hallaert@televic.com>
Date: Mon,  9 Nov 2026 14:14:33 +0100
Message-ID: <20261109131434.545635-1-pieterjanca@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zeromq: fix libsodium support
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Pieterjan Camerlynck <p.camerlynck@televic.com>

Since zeromq 4.1.5, --with-libsodium no longer takes a prefix: the
configure script only looks for libsodium (using pkg-config) when the
option is exactly "yes". Passing --with-libsodium=$(STAGING_DIR)/usr
therefore silently disabled libsodium, and zeromq fell back to its
bundled tweetnacl for CURVE security. Since zeromq 4.3.5, tweetnacl is
no longer bundled, so zeromq is now built without CURVE support at all.

Pass --with-libsodium without a value, and add host-pkgconf to the
dependencies, as configure uses pkg-config to find libsodium.

Fixes: bcb8e31e0d ("zeromq: bump to version 4.1.5")
Co-developed-by: Aaron Hallaert <a.hallaert@televic.com>
Signed-off-by: Aaron Hallaert <a.hallaert@televic.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
---
 package/zeromq/zeromq.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index f1a1f02f9e..80e72e3958 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -86,8 +86,8 @@ endif
 
 # ZeroMQ uses libsodium if it's available.
 ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
-ZEROMQ_DEPENDENCIES += libsodium
-ZEROMQ_CONF_OPTS += --with-libsodium="$(STAGING_DIR)/usr"
+ZEROMQ_DEPENDENCIES += host-pkgconf libsodium
+ZEROMQ_CONF_OPTS += --with-libsodium
 else
 ZEROMQ_CONF_OPTS += --without-libsodium
 endif
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
