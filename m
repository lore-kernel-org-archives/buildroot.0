Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1755606C599
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=focwc0Au;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=DeMyCTAf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE74560860;
	Wed,  4 Nov 2026 21:32:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMW09Og58sh5; Wed,  4 Nov 2026 21:32:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1B22B6084E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793827958;
	b=LVfGy4VdOdsYJ7ELh9UlL76dHL7nwKsXhXgxOwK64bxUGBvTbl5tSeM5e+vnT2clCNAw
	 qDYbCx4fmtwY2ppiNSajiaFp5v9268++8GtUmkqPkHwimciez5LihNnSegMvWx7xEgEzP
	 TtQCltAiCyj7VMZu0gN4MkSeVt7l44KxzwoG9q10vDe2/z4jcQhUNIgbWAyyjErCp93CO
	 mtyVzqn/WHjw4E1whDtKqVH2n9rQNBRAz7HgIv5fKbsB94/GTQUQebfTRaS3vpKX28kY2
	 w+Z2UNBT2qGYhafmwgo5dWbtfbJdnaEuLxKpT6kNJy0TUEwmCl04HbfP5D0vd49etRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793827958;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ym6WKF1SxbNEudE7D9K6N9YTtYE74qAVKpXUEKKvGGs=;
	b=cd0YB6UsEEw0XWaPohGyqj+FVpc1qiMyVLjOHFb10o76tWnBcpr/1KHFVvZ1z18gzMbg
	 rQtlG48gKqZWhD3BNJwmBxKVRQ4DEtEtWBS6S3VLOC5Tc/ztcAnm+iAvgodkClMdR9FnD
	 ccVdluY4AADu+/+dRj+W9CCvSb9N6ntvgiq+tvWEKGK5DSi394k9Nr3MTvtNzffUtaxSM
	 uHLeuCSAd80Yi3TIHq+fIEk7gcBoG3y2dJ0sywYGrSeksgevsqldGfGpRm0qll6HQgIrg
	 MeqlSA01jwSwknEHHaXCgePHULYOxMz//8jzF2UtesvtnFR1iHZwu4xZebYL7N363PQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793827958;
	bh=Ym6WKF1SxbNEudE7D9K6N9YTtYE74qAVKpXUEKKvGGs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=focwc0AuevuDpRG33u8wPoZPHZSXlRKXWESmfX8v7DDpuCAgNiqByh1L0gtfkuTMd
	 l/KHW2QD3jA/8qgMyX+5A+Pvxvu6LqVH4AiKCRlZkvuc3/G+XazBoIrC4mayz5yfzA
	 b3ahRBT7sFNFXpVDZrKAuEahp2nAOSn41kNkgpVNwYvTl5rtVxyUp3vmRPd2fD68bL
	 boqeZR/nn13DpPH7q71s+fStQnYhilzPhnJlk7tdZyz1ERgco4Q7JuPc+Qi+ZTGBFS
	 DzLFGRKY5rpftiejTRLsToOuAJQD+4qulj7iDH2uwbzxEHmLwZa4QT3wXah1pAj9fW
	 tT9EQdJVyzkHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B22B6084E;
	Wed,  4 Nov 2026 21:32:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F58B177B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29D3640217
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKCDR-YRFRTj for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:32:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 57F6B4008E
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DeMyCTAf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57F6B4008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793827951;
 bh=sxwsIVS3RU91gTgibDMQHEJPVPdPTzhc+PyCsxoUszA=;
 h=From:To:Cc:Subject:Date:From;
 b=DeMyCTAf2vzJUwafRaGa9SxRWTL/Qhmbbmunp/nZIVQLcKD5HacwI1/4JK/FURIoj
 6gDM8KTpDsySExSAGZlBEA1fjEUFuYlmQeb1mGtpQRTPePRP3mOWaSfZe/JkkwoD/S
 FaVrh3oajw6Jp/AfH9EAIAWT9LlGECvLR3PsyZrdzLwl5JKUQP/Qr4iqJU+Nrn9dHr
 BtyOYhcHRsHGfWA0tnBMSXIqSVOIgC8wcCHs7kcNrNJL8PX3PXJbjlcMvUeayh6lkx
 G4zaMtjRktDw7m2ycoy3fSy9tUyIclrFqn+JATniI6pHRvPJyr6yzMtsXre/IREHR9
 vZsYW8wlybofA==
X-KAS-Sym: v3:f51bdf72230551df:pFrN3BqyUOOiO9x4ok3iF7wuD1T71UTb+w4zj1WhuF1fk
 6TLn03Z/5rTekCV8UC3g0K30w1uTu8hT/qDn0jJ4I4sOgWt/Y9dyvi4u2lUH8ODgmocRBITKpGj
 8ev+rbvU1T8oYcOfsUdZQntxP4NULrYpMnY99Iw8Wbovr/keVBAPD21aD1+qc8F8n8DYXd6pU1R
 z12leW1ehEYInv1VhTgbO4aFEB8d588n9PXhITOvWKoYmlE5qN4b87OLIeMUr2FstNlejsN5W6L
 WJKJT9uvQos+WAo3kdj42Ic8gaLV3lfhhoM2ztpVZql2aCW2RYi8QLrFzy2Uh7Zy7ZpRDPfQ==:
 P9moUWqKVHB1037ufTclrta9aziJiB6jYUJls6obeyo1o8mDp6tD1lCh1Gx5Yvsvc+Odv8B6QQy
 tkzrJgzNgUaaqJhLJB1266GehNW+BlionV7mKfrWwN2PnhKpubH0X44C8FD4Lp3Jw9bm9I0kYRx
 w4MwbCMyl5h9hA16TvUkEqBR7ZdowzlPhWcA4Crc3nzMObSBkdZDJPg9C6r6zrp/63HxcrLzBev
 N6hDgj6c0WfV6UODnGMK3+RAXf3tL/Q7F1Whk0yGoTJ+poUED4k9KxtMtcwSmZ09drDs1pyJKhn
 SoZcQNY7TIqnLMeSoTLp0+6uRBlKC3TTIbv1QsKnAXxI0Wodl8CZDIQwpp7AQ5SMLw0JtaBRvYn
 t3ajxhWhK0+o2dEo8OdTXn4DcYMVobrqO1blAu/G+q5a7qz1E/s9xphoV603AaTyFWdp2gs8JUx
 BXCNsmHed8jVHWIbPjILftled7OubFPHMDX78c0Uyxb3WajNHudZOoDqoiiSBxWGovW14KLbO2z
 S8+yAJ6TJoTBuXlvedqQ3va1om+wFuPjKjKnvSdiDZ+WLEJ6D4RLjWlgn7mCRIGJSwKz12WKFCB
 uas=
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64B31A4C381B;
 Wed,  4 Nov 2026 22:32:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46262)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xOiat-00000000731-10aA;
 Wed, 04 Nov 2026 21:32:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed,  4 Nov 2026 22:32:30 +0100
Message-ID: <20261104213230.296551-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.9.16
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.16/ReleaseNotes?ref_type=tags

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b463c358f25fd2d21eb0bc948d5ff23baf64ca0b

 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index dc7d35fa67..648c28ae80 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.15.tar.gz.sha256sum
-sha256  1911f5b216a6814ed143a08bbcff1c6dc96d2ca3b505df9a21876080a92963f3  tor-0.4.9.15.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.16.tar.gz.sha256sum
+sha256  6180e193152f4525bdca5475168419b2a2035b963c3c60162a187f86e6160e48  tor-0.4.9.16.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 3f07cc356c..17a80d5bce 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.15
+TOR_VERSION = 0.4.9.16
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
