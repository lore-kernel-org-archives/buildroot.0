Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A354606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 22:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tIBg+cQP;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim header.b=bCJk3Sfg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0B0660B0E;
	Wed, 21 Oct 2026 22:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WScZ2oeqvxgm; Wed, 21 Oct 2026 22:31:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EC33260BA2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792621908;
	b=LMynaIMu6uVMKPPtieV1XA6C4t8s7jAeEhJoKyT4V7TrHKyUGv3u6J965YRb2rIG2s6d
	 7x1ms03n1ILkHS50dZPu6GIOv9+9knCMY0bEd96GE3F7WolPQkYl8djEdXE+afefMsTpX
	 JWXri4DAJjIad1RbHwmew6kRSHwN/NM2uBp0/B1cDLJxxgWFZYZYjuIbcYffRP62J5vO8
	 qLNZN1ZY8fZhv7xKPHBMRWgkuVrrFbSIEng6YsZ/OdCaq1Q7IJzV3rqJMTYSA44JBOVEH
	 +k3bYuOru6pn82nni/4PB9xNKgu54etv/XomW+B2F23Lk8drD62iFdyI7+PApCjSjFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792621908;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=e7qbuEkHe7zSmTMbGMyq5GnXjLeO1Hw61Cc6wt8hu1Y=;
	b=RNyUkhB8Uc87h/doL9SH3qqqXNtXcfdpUQ75oHawN2eqbBN7tv19TN/bXyVw4UnJkw5e
	 vZf0eAhZq72D2zVaa6cIYIwnVLiDw5w8oMmx7ABxesgv6rDG8JhDMpLlthpvGeZYRk4DW
	 VZ8wNs8NKorUVglhjoTeZOQGL85SoGFdChXo/Fe12kFaWAhxMyWQcOiAVV3zcwqeSAlWS
	 +w90rc+DEbO39eU7xp0ku3wGWwezqgv9FpOiyBzgAB5UQqkX7L8fqBtmTswZcRZY9uB4m
	 CP4tCHgL9tm9frTcPTU2Q9UEpUxvEYi9JaaB9O04jFSB63OiAS5MfxLP1wo/8qobDMg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792621908;
	bh=e7qbuEkHe7zSmTMbGMyq5GnXjLeO1Hw61Cc6wt8hu1Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tIBg+cQPQ0lKCGfmusPBOIx+dMfPl8T7BAndAYhayG3GfUgbCZhbprsqeH2mhQoV1
	 yufxYjc5dW7Ofxh/mt0NGOrYtM8VdCWd0jo1Qp4HON2C7Kx/YT0yNoRtLlUE2C351Z
	 GuZ0k4CMmQItQBz4z6DescdrO2F3g4LnEfbWa+EXHhZ3EZmxzyr8ifRCApa/Qfvcf8
	 SgHcQgBEU7p6LoPFoIrqTQ3v51XyaEyyzQUipmCPYdkTTS6GS2d+OITLfyB2HwN4aS
	 KOYkbCdonYBByueVIasZ3G+bOlu4GVo9i2APiouM9ikr39XazEciSOuxKdXdfOpDDo
	 mkIm96tQT4zCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC33260BA2;
	Wed, 21 Oct 2026 22:31:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 523043C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 22:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 382D580D3C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 22:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o43ljTRMXp85 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 22:31:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CD2EE80D36
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=136.243.2.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792621906;
 b=cOk5cMIzuSRuzZ2KHzkkTvfbPHPPenXSLzzcoSPLhuzgFINiZP8+ukXV3Nq1LoWyHFZt
 CLj+TALgfhA/qTcwQCYLovhd/0t2AFJvBJK/2RNHpowMVxiv6q9IqghRP0VJmGNepawfs
 hOAplGBPhqYXwxzFaQwbkvlH3F2NSeRlEsljYhtI7+NRMLztj2HW24VwL8bsOkGu8fI3G
 Ku12MVzLDdDvrAG8AQV+tFXoKEB6rzN9JqVz0n3dw/geXiKdK7sHaWVk9a0iHM2mdkwtm
 aEGmwSCN8QfhgbnTFYhawtHKKfdbwbqKULHSVFo+KRYeNIUKtrmz+S+kkLh91aEz3gA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792621906;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=0EOGWt5e3/MJgLljAQjjllNFU3ZuhxQ5sfzOX8GzAS8=;
 b=p6WPJ8KxRLmJnqRH/z6OFmcY1m4eKkcvEYh62SkzAGsQ74Cph0S5poLE2ORRr7HrdluF
 aupukU+mBTmpTIy/BpRRsyPUzSBBHWPv2yj8O0+DDP3w3u4T7NirsuUtXbyoUG60pV9+w
 qs3WkWDnMDjMJnMkZzpZxsCorHKlPcRQHQ9ZtDpwXymsn9cbOG0Xbj3oS7GFxPwepzcS7
 u/xTFZU0q8pO6Y23Ab9PrwO4Luw7GqAKxGrSHLOo46t7l+GY7lxFM9hZI8HIC5uw2rHmI
 yblYejp+BWEUlUG55/FxR3DHiSJn3DYXyonWLJdKGDL7kmV23jndMy8Y/T+8fEt8U7Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=n621.de;
 dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim
 header.b=bCJk3Sfg; 
 arc=none smtp.remote-ip=136.243.2.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=n621.de
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=bCJk3Sfg
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD2EE80D36
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 22:31:45 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 665A1E004A4;
 Thu, 22 Oct 2026 00:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n621.de; s=dkim;
 t=1792621902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0EOGWt5e3/MJgLljAQjjllNFU3ZuhxQ5sfzOX8GzAS8=;
 b=bCJk3Sfg/SHhjBE28WGv8G7pcbiGac9y2Z67Tnj01myIq3QKqeiBXZp/EPRkvkKsv+si1y
 orbIRYiC4C8flPREj4bpRFQzlYshE5H4cVM5RyqgkewnMSFube+TywhVEys4cs00jfIWDc
 2PSoTEA4jDfsRfW54ykvRv7k+EyV+1U=
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>,
	Florian Larysch <fl@n621.de>
Date: Thu, 22 Oct 2026 00:31:08 +0200
Message-ID: <20261021223139.26912-1-fl@n621.de>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/ca-certificates: remove roots
 chaining to eMudhra intermediates
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Import the upstream patch removing the root certificates chaining to
compromised eMudhra intermediate CA certs as suggested in [1].

See [2] for more authoritative details.

[1] https://emudhra.we-have-a-problem.com/
[2] https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE

Signed-off-by: Florian Larysch <fl@n621.de>
---
 ...-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/ca-certificates/0002-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch

diff --git a/package/ca-certificates/0002-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch b/package/ca-certificates/0002-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
new file mode 100644
index 0000000000..16ffd36894
--- /dev/null
+++ b/package/ca-certificates/0002-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
@@ -0,0 +1,31 @@
+From 4a0203e5ce4ce1a064b97387f52ca6a00c97185c Mon Sep 17 00:00:00 2001
+From: Salvatore Bonaccorso <carnil@debian.org>
+Date: Tue, 20 Oct 2026 16:39:15 +0200
+Subject: [PATCH] Blacklist "emSign ECC Root CA - G3" and "Comodo AAA Services
+ root"
+
+Closes: #1151413
+
+Upstream: https://salsa.debian.org/debian/ca-certificates/-/commit/4a0203e5ce4ce1a064b97387f52ca6a00c97185c
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ mozilla/blacklist.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/mozilla/blacklist.txt b/mozilla/blacklist.txt
+index d84ceb9..ba3635f 100644
+--- a/mozilla/blacklist.txt
++++ b/mozilla/blacklist.txt
+@@ -3,4 +3,9 @@
+ # Blacklist explicitly distrusted certificates to explicitly ignore them and prevent build errors
+ "Explicitly Distrust DigiNotar Root CA"
+ 
++# Blacklist "emSign ECC Root CA - G3" (cf. #1151413)
++"emSign ECC Root CA - G3"
++# Blacklist "Comodo AAA Services root" (cf. #1151413)
++"Comodo AAA Services root"
++
+ # Expired CAs
+-- 
+2.56.0
+
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
