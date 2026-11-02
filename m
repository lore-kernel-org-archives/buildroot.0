Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1648606A324
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h2eTZfeF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de header.a=rsa-sha256 header.s=MBO0001 header.b=QTrJ23a5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE70B60758;
	Mon,  2 Nov 2026 09:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pziPyqOODO89; Mon,  2 Nov 2026 09:34:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6DE286075A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793612075;
	b=JQWmFOlUeHYa7dVZ6SL2w56Zsz/3dLW/CiRYYyYXiSMCPbO4HetTQd83uwQIqoIvC7VJ
	 SdRTwhmDf1dAALWx5veglsnQq8ScQiOLDf9aA6p+rpWSDpw3DPAWnHFRy0Xe6bSVXXJRD
	 /nQjIGSchkFpVWoBGC4aqlKnw++4W3fRr4zRxvtLzL8CVvIc7/VV1gAwr+HymIZYlvEov
	 2frijDMG69YYAOlcLE2KAZzdcDsf3MCk+52L/I7Pwumfe+vWLgAd54KbKWciMhZU5RoxX
	 LXzCkG12+trtZ8sb423s7bkRtU4rK1u4OFBEn2Yp0W58n+J/EOYepclo1Jj0Asq/HHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793612075;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Rspamd-Queue-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Eb5IGNPMBb4moGaEw4ir0bO9uyOnpJlPfiId9Nv2dbI=;
	b=UPnMxGhNGc2SpEGZgFzhnKag8n28BgTsGpCp3wk0ehfeeRv5yYN0eUEccEecMvHx3EKr
	 e/EDrvm1Ep8u6/nUaJsfiHJ7RexeG73WymTlhQ75RRC83/uJXHYf04YP2sJlLhsueyhGt
	 nn8ivJHkj45skvNwOmj9RuhBBnUExwFoe2G9RVNG5MGTJsv8nx3FW3/BViTrO2beBI1kA
	 2vgceJ2Ca5mDshRyXja83FDuGlcD48fMaBarhMb6+x5o+pWJVOyZnJqWZewbIClppfF+R
	 Te4Fn7e5gHiY+U6qQv4mwSTHiBP6vdEMNTy790+RTCBnY6xA8zWdYQz+5Rty6mf4hWg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793612075;
	bh=Eb5IGNPMBb4moGaEw4ir0bO9uyOnpJlPfiId9Nv2dbI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h2eTZfeF0traePvJjIFnn+ow5GnvN4/TGt9xx6goiVoRcaG5Tnkh9kUpI7JnfcTyj
	 eamflJHg7n9o/EltnftWupMF/kz6yLKSoNG30X7AJgKgEkjHJ2gCR1Hsvj1U4MgWCL
	 Vfmub97zPE79cDqnwJEssYhb6UD1JJd78D5fXNFBfO3ycFbJdwMSptGZ1ETY7VCxPX
	 HJfKzhu9cQyG7tGw19kfDNO1jTSNkDNFhQJtL+NKlAHXWXrX6AS0i68nBLnhcdFFt4
	 MrQxKSOZ61CtmziZSbftqvX/hrCq8QRdX0a6D6dLusOtlxwxqGCuHy4ialO+qqE+T3
	 YanY7+j68O6MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE286075A;
	Mon,  2 Nov 2026 09:34:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC29ED3A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 09:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58715405BB
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 09:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p34MAqsNXTsr for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 09:34:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E07CA405B1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=195.10.208.52
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793612072;
 b=PZ8SvUmzpOjH+BjVA1PGaMtvn5itNwC0Ipa6yCmR9zSiYY1Z/Yr1jUuXBWpEsDcywjkQ
 y9IV7h/BRc40AWjFud6CODys8lMpJ2UZ1tAUv96IIBBHQc2pL76Ygwi0er8R6uWK1HBvh
 Dmap8ulEwlA8z1usMeW1e5aFc1xB6SxELomo0VqjjYKWfXu0HA1qfFogaLMqT/xc+KnFD
 G++1+9SsZbAhlMGPc8uNTxu4rT7PVLAKtRGiF9ZpNZj1O3LYLPpZasWbwJ9PDE4okJV2o
 klFnrOviEwMoy2VKrAlC9P44t+XhkGUe0EF+caSmbTNpMYVtx7Z+ae16khq5RnTiT/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793612072;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Rspamd-Queue-Id;
 bh=56+tZ0i2qYQ6aojodn85vXdMXagsdFQWVcl+btn7QQk=;
 b=BPAC3k8R+x1pHLAzxq6TBFdvOqMhz0dQsHFJsvSly/LOV6/pwNtZvype+MKyYG8X929Q
 vhxkORBSYYrbcLysDFp5Ta2u3hilrtTK/MaXGWAKweLASmllplSt8L+oiRE6/5J9ADbjw
 z0tpKacLsfqOxPwIYfdz1ow1VKFsJjXYD+eP3IwYIOc9U3nNw0+w+tzSwxzhIsai89pjV
 JnvR1cAwi8q2r5m+oiuNgDUbnPOOeMPvjBatjFuJqBHFvcmrB1kSeDEEEk/0oR/QEXvlx
 0X0rBPHcjLdAZTobLWKZxuOrga1lbv0QbAWAYnFSGbl0M/KfbUq9+0medviAYGURbgA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=oss.othermo.de;
 dkim=pass header.d=oss.othermo.de header.i=@oss.othermo.de header.a=rsa-sha256
 header.s=MBO0001 header.b=QTrJ23a5; 
 arc=none smtp.remote-ip=195.10.208.52
X-Greylist: delayed 469 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 02 Nov 2026 09:34:31 UTC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=QTrJ23a5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.52;
 helo=mout-b-203.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E07CA405B1
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 09:34:31 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA512) (No client certificate requested)
 by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4jJ5tk2mdwzLlxW;
 Mon, 02 Nov 2026 10:26:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1793611598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=56+tZ0i2qYQ6aojodn85vXdMXagsdFQWVcl+btn7QQk=;
 b=QTrJ23a5gOBkh8XnvJJJ1xISnIFmToxXG0CH85mwZBn4upxTg0R+PTntSCCqut/ulUrDXx
 kHYxnKO9dDVmA+bLX/n15lXu1vwO3rxkVA+SykTZJhMbS58J/ZlJWGffQZjEIVrXKvaUFY
 Qy9H1dqI64xbGAB+O5ojwLCBa2PJQW3oFdMjsMPXcbmcimY2kuwEyLRSEHSn+zqZUsPWm8
 vZJe5+Nkijx++Ks9hCNO6czsFnBtQ8Kr4rZeFzMVckBgSyq61Ag6DGpFpcemXQczxpoKRt
 6vmpPQTkU0gKMruttvSLTf2M4jXQEfEUF820ixrhiGScHuRUR7mqnS2lr1Gdfw==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Date: Mon,  2 Nov 2026 10:25:57 +0100
Message-ID: <20261102092557.439840-1-manuel.diener@oss.othermo.de>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4jJ5tk2mdwzLlxW
Subject: [Buildroot] [PATCH] package/pico{tool,-sdk}: bump to 2.3.1
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

See the release notes here:
pico-sdk: https://github.com/raspberrypi/pico-sdk/releases/tag/2.3.1
picotool: https://github.com/raspberrypi/picotool/releases/tag/2.3.1

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/pico-sdk/pico-sdk.hash | 2 +-
 package/pico-sdk/pico-sdk.mk   | 2 +-
 package/picotool/picotool.hash | 2 +-
 package/picotool/picotool.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.hash b/package/pico-sdk/pico-sdk.hash
index 2cad5b4b6e..17bdfbea0d 100644
--- a/package/pico-sdk/pico-sdk.hash
+++ b/package/pico-sdk/pico-sdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bbb60e768c1feeb1a4b7155da7361a135cba3ce197cef7cb93a300c559302897  pico-sdk-2.3.0-git4.tar.gz
+sha256  85165f85152e00b4003d19a3e9052a7505bbcb3ce971e267e5db95364d86cc42  pico-sdk-2.3.1-git4.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 08760325f3..bfa8a5cae3 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICO_SDK_VERSION = 2.3.0
+PICO_SDK_VERSION = 2.3.1
 PICO_SDK_SITE = https://github.com/raspberrypi/pico-sdk.git
 PICO_SDK_SITE_METHOD = git
 PICO_SDK_GIT_SUBMODULES = YES
diff --git a/package/picotool/picotool.hash b/package/picotool/picotool.hash
index f8589e3592..89c75397bd 100644
--- a/package/picotool/picotool.hash
+++ b/package/picotool/picotool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  97aaf36800d2317683528cba5762e3d4e7a5de0cba729d28011a6ee94b3b7538  picotool-2.3.0.tar.gz
+sha256  07946d294ab5c474b610660c53c5d94216e4ab13555de075ed521f98afc4f44c  picotool-2.3.1.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index cf70cfc7f0..caf1186e77 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICOTOOL_VERSION = 2.3.0
+PICOTOOL_VERSION = 2.3.1
 PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
 PICOTOOL_LICENSE = BSD-3-Clause
 PICOTOOL_LICENSE_FILES = LICENSE.TXT
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
