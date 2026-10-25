Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55A606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ePcnvfjH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Ry5ruf8z
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10EB860615;
	Sun, 25 Oct 2026 16:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9e4JooH2Oef; Sun, 25 Oct 2026 16:27:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 240A46060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792945633;
	b=I9CYOps3aIF1QV8H3pLXMqhMgFIy5kVZ+aTSgb8DMbqvnD/6oUbFCKF4vZRmH6ziWfQe
	 pfbsj7PFt4PAFsRO7yjoiCJ8QfTVSKVUDKGB5MCw3++NkdrthKhKXIMG26F1pM2m+r5Pb
	 6FjrIwFVWwzX/zq3RldTfVlDfmf4JjHdOcCKJWPTukjhORiDB9I5idwLn8ub7baliHJpP
	 3WwtuGYUGg9R2a0viG2jgGoTs4rviEZqFLMq3DVFguS+K8eAvP6crFsP1WoYelogHLsXI
	 jNk2FLF8+lgevHltKydy2nCdBDbMpNRmKRhQRyUQFBJJjjDcoTw5uDgrGIi6e6VfuRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792945633;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lqOCdA6u5fIIdnCStiaZQIKTulwY0T3FGjKjjXqvC8g=;
	b=ji7kYxoe+J2b6SW6BxBhkxCJvueqWMKyzV63g8wGifYBej06k0Ii4yMx3ZDlOmELrDv6
	 kWC5u7+/VJ32YI4Jb712vsiqtCe5kd7PM440zChkptHPgsPvvK82V0etAGHg4J7EwWbEa
	 XeJJhg2fokKlqnoFN1Jtw8O89Mg/2yW/5oA/r5rjHfWfBK74Muw728QkqwcyUB2aLGyD2
	 PTW6mhABOj7v8rcQ4qO9zQatPcBWOkCXJSywUoofFX8gZ/46bbQvqJ3PQ33kC/5NS0iqz
	 mrYKGHEo4E87wEJEqtWG/wB+QPa4Wu6YmI2JPZQwCeLL55NrDCK+KpU7iSrwjmXbGdQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792945633;
	bh=lqOCdA6u5fIIdnCStiaZQIKTulwY0T3FGjKjjXqvC8g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ePcnvfjH6gCYKFFN/ZLrYD7AK2WcbRO+ygPbIygin/5aPZzNpWkXSTF5CJOwTnDZT
	 YSBfVdsDFoMO9LyEfMZuDPoOkji/Z7Xp3l8iA0S8FmOdotZpDmv7u5qAp0Ot74kjIq
	 tvor6fNkceqc/wNP+rm7P53lhBK3Gb81l/5Dj0MzMTXbYNUoZUGLcrx1uWLrK4DeJz
	 s26kO8GRVcsC5PjfkXXBzt5aOymtwvzrTeacVSwIqsfBHTQNuiPq/5gnCPgRjY7jQD
	 3n1PQPKWXQfHqM0DUBlYwk6T7arc+VHuF5xvEB1alob4U0E8jwxqp/YmFd46Q9xpVK
	 ReiN9xct/0OQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 240A46060E;
	Sun, 25 Oct 2026 16:27:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D64FD380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 16:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8BAB40098
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 16:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmTkR4Yxrj4B for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 16:27:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2B7D44009C
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792945630;
 b=J24GrCMDdsEQfyBIUs4Fl/KbaO9qBbaPe1ZnT1SwYkI2qcgZB58pHxSxhlVvAJOZ986i
 aQm82E3S1qPVuf0cc2yXwil/9O9lYZif9E8ZrC9hYH2aik7+bzviWvxKj+1UJtXQMp0sG
 LV7/X6nxFcfunzGHKZIOQyym6xucco7/O4JlnSsUqiGQ9kssUwHlrJclPy0ARb6LN6gUU
 CbLD9imgrwz68ty8x9NPISmgDNWKBie2Xil65OKIDXgfK8kI4tSUUyR2AE38LvkDndHw0
 MxG9iiTh/+xcQIudYWGkyb6kb0UYqCqAl1G95oTRNycRtcwKtvTuslXhrbpKo4uR2xA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792945630;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=BHct3zconHEQw0Mlmvmp+rYad13IL0f0FJd/ku67hzA=;
 b=mQf9Ssv+d2YDn1nq1mJAHYq+LJiH3vqyx9se3KlAtfUKoCSTwGZihQYJpdGXZ6umh0zO
 DZTREQKK0ldgyOsEWpQD6qpvKpftnb2rR1AQiO+S2WChcohOj8MP4xWX1ShOj/eXzqIHZ
 gGFBKTeBriN7AxUq0nzg9Tdt4PDWgYQNGdlbXW5MjOjfW+OhC0t5iGDXS1OWU/MBUEoXy
 5PKWjMJsyG97PqzDf8oZUvJMdLG93E8NgxeVBi4yrBb/x6SRsLiksKMVoBJcUAm7UpO94
 u34W3JOOxtg6FMzYDugq06wBvBawbGSMz6WD0GP+4OdQ5wVq+vUAQA1gVvNXC/wgBiQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ry5ruf8z; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ry5ruf8z
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B7D44009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792945628;
 bh=BHct3zconHEQw0Mlmvmp+rYad13IL0f0FJd/ku67hzA=;
 h=From:To:Subject:Date:From;
 b=Ry5ruf8ztbLzHf7D5vf/QVSD0VajakITpuJ/IdCAsVvqgKtsizvBgAihp2pQYra4Z
 Ia5wOPfuUJ19+72K1TtoWT0bf/l6hbbiYtv/VEjTch+WUktKLXhqFAn7p5gfrqF2BI
 /RsCl7NJRZ3ZmXYGlPfGZrLnFpO21s6jU9TUIy9MSIiQP1/cbp7r3CbY+/GlVy10wz
 59gtx6YV4T0CYpbnQ9BFRE5dUEAfUaSCY5Gdza+siCThAy1EhpSKmJfFlbmAkbIWFw
 RMDNaY8+tiUImTtDBMTybhYY7HvBbY7VTr2wdGA46O5vW/zhJPHVgOQHVC112iX9Xo
 sFNT71xKEYFNQ==
X-KAS-Sym: v3:f51bdf72230551df:SXEBPGvQUI7wUHH6SmaQnf9tMxa+JRCifVqrxVKeOzDZ6
 44RhnsRDLFvOkwc/X6UQW5nIsOnYFDqQdX0bQlWPg95wD3VOSUK7+c6L8MmgluA67ImIxDTQbxU
 VbeiHhMtToH+5zEKCi2YnzuuG2FVu3Fq4oxPa3J6L9AMgycO0QVPsmsRHFOcZEs7w3vp+vY4e68
 HCd5Ukd9CBZPVAuyxPhND+GP04oRzDZdIOT2umP6ybVG025pHFI2CNXpUhKLM0oGJtzT6drtikk
 pX1ebMHHK1dWLMG3dd3JnQdJRyz4npYbveNRHqs0SoUicAKTyCxOeCxz/zvcZFUruHmzE5pQ==:
 Fl8+NHZW0D4NCueJq9yzeITnt8djVnK/8Wy8Pf6Y/00CuBlCV3sPKJUPj4xlZjOkuGjVdq2byUm
 QKzpSkt4we+frnaQUpznNgSyipNSoNkV5XTdoJqcO/tOeNURYVIyfjqZ28mXluEMMS283PIKmol
 zteEl76dUVjBqoZQU9pemlD3zjbyiSNtRNuz7o0WMWlJCetHZSGUNCW//9yEklA/1RTJHu9ucAm
 kX8u+sRMJboz8eQCV56QBdVk/3YshfjoD95EksYALM6AtvycWm+oTBwfRmVDSgZ7VbMknGuLPEt
 UDOd4CPAC5W1bSpr5OPHtwxDidcFKkU0F0gLdpF+m1k606dn1al88XZ5I2Mj6rlcjhvCYcA6YWF
 Y8atJ5cDQ+pzB5SK1XNW1h2p68TspITzUi+34Z8xeRE8Gk8CQcg9r8cbZI+QVTaX6TzJEooInbN
 UTBohNNnNESQwPlsiVJaOMAUfZIt7ny6IUiKCZXjV4S9yQswSPLnnLuLHSAXIP3QEeKzCwum87z
 hkC3g0j6ntGEw9VjqYm7lz8mEseeF7uXr2LxntBYa1x4dLiO52fScHVMAC5XwQzoCfCPiq98jaQ
 qvPxug==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C2030A4C6B05
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:27:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47886)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL13r-000000000hr-2wUj
 for buildroot@buildroot.org; Sun, 25 Oct 2026 16:27:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 17:27:07 +0100
Message-ID: <20261025162707.1770889-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump version to 1.53.0
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

https://github.com/libuv/libuv/blob/v1.53.0/ChangeLog
https://github.com/libuv/libuv/releases/tag/v1.53.0

There's no newer release of uvw, and the current version of uvw
continues to build with libuv 1.53.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ea25b724ed6d293fc19259e96f82d747c56b78b0

 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 366296fcdd..73b08e9111 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c5f14915e2fa7b83b6111c3bc477920559499e10d95f852707420c8725b82d6a  libuv-v1.52.1-dist.tar.gz
+sha256  21425fa398be98b51181a1885df31428092d5435c4373a396351e427322e5f1b  libuv-v1.53.0-dist.tar.gz
 sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
 sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index b0a538c625..6bfe0779df 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.52.1
+LIBUV_VERSION = 1.53.0
 LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
 LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
 LIBUV_DEPENDENCIES = host-pkgconf
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
