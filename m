Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54917606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PnMEAGQZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=StYVqW9h
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E601E4077F;
	Mon, 23 Nov 2026 17:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBqoI3tVa3am; Mon, 23 Nov 2026 17:46:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 053F74077C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795455996;
	b=J82JiLYgIgpnDtHAO764PHjd4fUKr9V0hnDjV/HY/kizJ6RBZ9uQ49FzmDH0JSrtnAau
	 QvIJvrMmn9tp4mBKM4+opwgOaasXrBc1bWcpuBbqmu0J+iEZYGQyVqMZvAHZ3lmiMLoqj
	 LwRKRBS4U1Q4H4t5Zkb+/PWqQGmMNhK5kRi1SbNitFqFqZZ7hCxJ4KRGnVzzHmhtIDHMb
	 o4CeDcsRFY2kdAc9wm8n+Easmhv7dcx0fD4lwSYK33AHzrG/zGxJTdWGyIVPkHyo/fsKz
	 4dvVwfIGd22zaE1Dmf1NDSYEhXCfepVY1u3cXg4hPN1xC3SHjlYZOqLZOMIyCVjdXxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795455996;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=EwfATmfvwFu+dK9TfJ6lp0aNe+iyhArUFv9ATWavmb8=;
	b=lNYRb3WxF7n9t0N/VS5JsS6CU9IMcvsLM+dpCxmsADaMd5fKs7DLrmiz0uE3SB99cE2+
	 mgSeYqcBJdbuTMs+PTGkYdZCjnQI5q/bABQDzl2RZ/SF4jPZMYFrKsWG6mkbmFqkav/Je
	 dkseg3Me9U259zT4pLp9beb4p8SN2caEDEXb58ujwrMdQCtXMkn/V2IKIczwkKMpINpHF
	 /9Hqtopu2ShrwrT7wE8XBOcI1S7yzyZQqvJ645uydJdx6iGndX/Yfqo2rTl/IkbxZgOkM
	 3IhIfDtCVUc5jVUigAjTGPGWb9Lm3EY+4cW4KZNQLeTIZs634eIaVfFrHhznYFr8NCw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795455996;
	bh=EwfATmfvwFu+dK9TfJ6lp0aNe+iyhArUFv9ATWavmb8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PnMEAGQZhYqLlW4tZeeXe/LupUMMZCWvrZIPi7Eze0eIV43x/znPXqzOVCHdTepfO
	 VM6e1DP9Ux1v3b6X/ug8Yq64oOcyrpszU2rV81wfib2aSiW9xEAFVIcmyvtPn44RCK
	 ReeCCUZfyUtuVcm+cNybBKWibOGazZPB7eJG2bOq9hZOi4Qf8ElH1hfiW6YBopGfRY
	 paWXnLU9Rt1MzBNYZ281GoojONCjjIOY6nRl9d17Udyl8ms4M9RXkuTCd+/XyIEZfj
	 gJrznRDimQ6T+qhBYz/1I89qJSEi7hIAGqyJ9WwUvD4fA+J420ckK+pNb6em/M70q0
	 PLHXnx0+RYxEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 053F74077C;
	Mon, 23 Nov 2026 17:46:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 039F63A8
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE58780C80
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTclSfTgEprN for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:46:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9409480DE2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=62.149.156.87
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=StYVqW9h
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9409480DE2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:26 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VY7UxKIX66q8sVY7Ux5MtH; Mon, 23 Nov 2026 18:46:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795455985; bh=p/2tLR+cs+8bHhKNCULz54GtI8gufjN+qkzCfISAfI0=;
 h=From:To:Subject:Date:MIME-Version;
 b=StYVqW9h8+apt1BMCqtPIx0MQUzR6Y3zgUJPU7Lgs3vahg5jANaQTCX7sfcounQ8O
 lRP4u7pY1Afi3mTxT4H9DgLteJiv+HRhwWQ5QQQua83nc5/6DdfLdK/vbA8PeiKp1n
 grndyO0c+t+CTybbvNY3m+mcIsOwNJKLgVOmTW7bqLJXuoyuwFYUZ/v5Du8HuXXvkE
 rnyRE6uQRCN+rD5OqluEb/u9TrTn5qWWAHoPr2nzWUW/gOYU++kXXlwRQZyJDdntNV
 j/bwj717s/SIuLdDbjUGrzGrsPLNXIVGYiWBXX4yEu5rD5Dg9sE5QUGGWJ7c7kJpj3
 iSj8aVFhcFdqA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 23 Nov 2026 18:46:22 +0100
Message-ID: <20261123174624.1851887-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPGkvjs98efHdsV59T0pvsQnK/yvTvxkb0sDf6Te7QKu/YJ/TI42/86aga0+jeNOZ1m+8nydVdO5TSKHxRp1md32mVDzWNaWArFNd4kDD1TKkzFsQp3B
 k/NmJEd821i7M/8JWA/lIcakve7WD/jAuxY9z9BJR0j/KxghOr7keCDGjULL3mTs2NCCsH1tM0mdQg0SSZLQNbixoFc4s0X+8QvJPrfGTIHa5AGWp4aAQdvs
 Sz8Llp++ClknsPSBkMFllYwhqLncXmYbuFXBLIbjyI0sTHQ6YgeiUM5P2Go26cbm
Subject: [Buildroot] [PATCH 1/2] package/swupdate: security bump to version
 2026.05.2
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

Fixes the following security issues:

- GHSA-68fx-rv4m-vh4r: CMS / PKCS#7 signer name check
  (forced-signer-name): a crafted signature could cause a double free
  before the signature was verified
  https://github.com/sbabic/swupdate/security/advisories/GHSA-68fx-rv4m-vh4r

- GHSA-9r86-v62q-p96r: CMS / PKCS#7 signer name check
  (forced-signer-name): the check could be bypassed by a signer whose
  certificate chains to the device keyring, adding a certificate or a
  second signer with the expected name
  https://github.com/sbabic/swupdate/security/advisories/GHSA-9r86-v62q-p96r

- GHSA-p837-xh6v-hmff: GPG backend with gpgme-protocol = "cms": a
  signature from any certificate, also a self-signed one, was accepted.
  The root CA must now be listed in trustlist.txt
  https://github.com/sbabic/swupdate/security/advisories/GHSA-p837-xh6v-hmff

For release note, see:
https://github.com/sbabic/swupdate/releases/tag/2026.05.2

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 6a32b38c95..d10cb43409 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  26236a354e8cf21806d20a76728b3805ae49c23cfb2eb794fe91d1f0b280298e  swupdate-2026.05.1.tar.gz
+sha256  48ee7b4c8a8258c4b4c4c9284c40d3e79c49ef52a4553a69b1a1f6f41207e392  swupdate-2026.05.2.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 2384dea33a..9d68c3b72c 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2026.05.1
+SWUPDATE_VERSION = 2026.05.2
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
