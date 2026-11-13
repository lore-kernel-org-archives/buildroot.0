Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F29D606A323
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pFLnLaoS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 702D181E52;
	Fri, 13 Nov 2026 13:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BG68OdFjDma; Fri, 13 Nov 2026 13:13:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 92CE781E43
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794575610;
	b=QFRpvKxBqyDAckZZOVtoKIHkQZfKy9yPzk1Pb5tsUZS3dnaEBSgQ2dOmlyQaYViKRUF3
	 6mdRTz3zSa9h8NfcBSfzNBCNCkF5eIwVTyFcOdJxypB+eOEbrjTEP58THP5N1MQC7dfXA
	 lrmVu7+z2IK3NUl7ZyPTuEn+fDkqMjYT70DT907tH4VYDktSsseA8yTww1h03bQIi0LqQ
	 KlMxPjoGqksrDw8/38vlkOY+WzVgqwELHar1tWgqdzHCGdzDxJh3eqxuzz0g8NaK3IjZ+
	 tERZcozLHKbo8xfKZzTevfRDifcgr1cHSD4dKTxmd9b1fF5tLohQ9A9KhB0/CGNzfnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794575610;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PGzurwKkM8IXP2B60O5ThJO3jU/lbKlGG0WKK0cl+Tw=;
	b=qwx3l5dwkt3KnqkLuqRgpKBmv3CQorzQTm80gU+kfIkjguf6A0Ig8MmnJYgMgtvhjscI
	 cGaf9+eOfKp+8U4mcOww6gMEy3UooYx8azs/474SZ4Bt7f7FsuE3kJMB7LXsIedRcy4h7
	 E4gulBjSI5xATYPvxl5IymDY5I8Mwl8LPaBnvvLv45e3vLQ7w20apRDDRT5uf4qdioAP8
	 LCdux4mNXM325sXV0pbQraZ5Zg8j8jLI8v9+71g10pp0jSbJ6dQQiRx5ohRWYAab9pk4r
	 7BQSp+QPidY6cPcmsM38YfE1WDkIRCK0XUJAxpProGnznZhNEE8DOlcjVDPJjDtVGbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794575610;
	bh=PGzurwKkM8IXP2B60O5ThJO3jU/lbKlGG0WKK0cl+Tw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pFLnLaoSKlwErshJk2e+BoQiovEG7wa2h56GDeQ9PmKQPwtYQqEmzH2Sal/GAzlqJ
	 wv97xUh0Zi7KbRil2PHCnS269ZHxH+TdbUMQcwLBGzqXbBH87/9ZrQWH2owr++09vz
	 2D0t+tkLNTNqFipdDbaNvIAQbJxSVT8nX/LiYAH9PK0Uy+HaaG8smMpgvNTrgzygFI
	 qmJYDsU38b9N0Grq5qEmbcIfXXh+O4EoiU7AM5N7Rywn4iw8qdAoFj1ljd0vH5hRK/
	 heetm9CcE5OxiCOWIQ9dNzIaevMzZjXKuz20W0LiWaVR868UzmSOnE+2kdQT1q9OAP
	 oIt8+55pLaRcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92CE781E43;
	Fri, 13 Nov 2026 13:13:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EB9228C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 13:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2024781E43
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 13:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wa6uSG95fdAq for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 13:13:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6596481E40
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6596481E40
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 13:13:27 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CAF932C84EF4;
 Fri, 13 Nov 2026 14:13:24 +0100 (CET)
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Sen Hastings <sen@hastings.org>
Date: Fri, 13 Nov 2026 14:13:19 +0100
Message-ID: <20261113131321.1408652-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/systemd: remove stale libgcrypt
 reference
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

BR2_PACKAGE_LIBGCRYPT is not a systemd crypto backend anymore since
systemd 258 (commit c38d7326e093), so the test deciding
-Ddefault-dnssec= is stale. Test BR2_PACKAGE_LIBOPENSSL only and fold the
option into the block that already enables/disables openssl.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/systemd/systemd.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2d41df7bc3..f5fa0920ef 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -347,12 +347,6 @@ else
 SYSTEMD_CONF_OPTS += -Dselinux=disabled
 endif
 
-ifneq ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_LIBOPENSSL),)
-SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade
-else
-SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
 SYSTEMD_CONF_OPTS += -Dhwdb=true
 define SYSTEMD_BUILD_HWDB
@@ -604,13 +598,15 @@ ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 SYSTEMD_CONF_OPTS += \
 	-Dopenssl=enabled \
 	-Ddns-over-tls=openssl \
-	-Ddefault-dns-over-tls=opportunistic
+	-Ddefault-dns-over-tls=opportunistic \
+	-Ddefault-dnssec=allow-downgrade
 SYSTEMD_DEPENDENCIES += openssl
 else
 SYSTEMD_CONF_OPTS += \
 	-Dopenssl=disabled \
 	-Ddns-over-tls=false \
-	-Ddefault-dns-over-tls=no
+	-Ddefault-dns-over-tls=no \
+	-Ddefault-dnssec=no
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
