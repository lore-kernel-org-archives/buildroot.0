Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C47606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ahk3ykQR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E8F540EBA;
	Wed, 21 Oct 2026 19:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U21qJYSEkwQs; Wed, 21 Oct 2026 19:15:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8BBB840EFF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610154;
	b=Bl55tifDCiU0NPVn6UI4/2FTnPG31w7m/I+kownel/iDQbJtLfKGsRtpHnUSR5zgimeS
	 NQR2irgz4Vex12RfHaN26FDigeAJPvtZWQJ9GcNAb7RK1NC3DbY7kB0H5edM+2/X7x9Fq
	 bD0/rkYJXYa6G3aIRqiEHnmpXgNWVAsFIQe7+zqZv9G3fFcsni0DArRSVHVI3+7SB/DA5
	 rwXyVQYzecZN1fArCg2LPZ2WmNAjFIz9mvCPXV2VWuiaS4HOOk0LdVfaNERIP876T2m6H
	 rGy9tj+eP0PSbNrjMZOxZZBQUziskVZU0VT8mSZqEnPKftvj4QCdCAgqSuz73xiEFLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ioIT/dxivMsdNdmx/SM9COlV957kPeJkbbj5WGej0go=;
	b=W6EoyX1VhBQtWAi/DkXaKMB2sY8VjQuHKshsYVn3EDvrNVHhF7oAtE99fsdxAPxYQ1fj
	 nu0ayMES6rizWwFOlIDsDCiOP6vUT5y85BWT19R3sRwb/m+UP7zLto+ZuyPLsiCtf//n2
	 Dx2h0+/ColvJc6wp2DoZQxV3GbMnTNJ4m3ayfIyKRdNbFdgTvNHDXkJcLiqfOhNLMfyVZ
	 3t2FMbHRBe+WHoQsAGYaFPVrVsSz7lvfrhWDRVUZg0SCsLjoOQsip8BNE5devGGlEZ7oF
	 9IuRKmDHJlM0xXvyiFjkMLNYvrmuy3i/d57vPLSeI1e6gfwJZGIR2J1BZArhpH+HRWg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610154;
	bh=ioIT/dxivMsdNdmx/SM9COlV957kPeJkbbj5WGej0go=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ahk3ykQRa3T0cK68ZLY7H6+4F6qjvf+Y6e1o5l+yPdIu9qTB9L/cawkPsT9bmcUzG
	 qIh7s9ypWnpRPS/ejZqXeYpLY4bDimdWAQP5XtI3B4FNKIOO/aypeWrq5lgoy1rula
	 c0WXRIF1fWsUHE6hxuhl0nZewHf5TQKKHO2PA5DAvqYFnBPhL1JcSs2keXCT63UF7r
	 uZCnBVQrGfLgC9Y7hSbLN2k6zbRm/IL6g969JmS2FyuAM3tgCgD0gbbhFqh4arDMN+
	 qihXltsrXCLbsc1UTOq4Fhe1boInwGepaAi6EkfMz1cSaHCO67mqD2wkzGzkRzrhhC
	 q89UVhtOt91Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BBB840EFF;
	Wed, 21 Oct 2026 19:15:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A330195C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8952640EFF
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_-90_RxJhwJ for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:15:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B596040EBA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610151;
 b=IDp1YO182gwzCRrXju001q8PovLDgiXBULpS5hFSbXBULNYX78SlnkdIDyx5/QJPU4JA
 bCt46r37T7B5KR82t8B7IYiiEPIb1f9ZaqSeg2eiH/+cF50ewwpexGXHBwFPoa62YhTKE
 5sIQYI3SbnLnG8VJkjrrGUpFk3V/S64lvz2fiew7JPR/boXIO131hibHV8cg5uMnaHp2H
 eeNs3U/0i+h7loRXvTbK+z2iY/gfRGLPDAfGvuKtO99Wv06H6QuengitzpcZu2pphbFw8
 ZWHJh7dVRtsdYb2QipZHg2Ffa5yEyjMqHVIA6Fuyr7gFRQMdBJNfYkMIGAjlnqO2kCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610151;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=20MrJb0v6vkfhAzieBQkKUhNJ2qiHGGKvkk/bviMKVk=;
 b=HqCfRaHRrUL5e3GS/vSHQ90jMiPW+6aJ73CpVxn7csRX1fcnHUEP/KjLViOQBRm9WlXH
 ifORh1A51XUiMWfrds+MhRLsuNIddNR9tILKDUSLS4c9GpO2OcXRiBHL3vCU4VSOUlYAD
 cmnxbr57Lk5xqnR+vOGM+kH5ctPcpDqDwoo86tFjMxQkeHfg0QVfiibU6Pu8UlEsDxwEX
 ocUZgfv0h3xQgrls7qxoXwd+QgCy5dEJ+8FnaywKat6Zk5smV97rCNhjeWi/lojixOP3f
 f7CD6uwlJwpnrVIYVk3792tRPAUj5a/YMipIB+9gJOuSXiwoRTDVRhxNS8Xu8z3QhaQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B596040EBA
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:15:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFE6299A9C; Wed, 21 Oct 2026 19:14:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:12:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f58537fde0c6ffca56f1585fadf4f629d075d6d3
X-Git-Newrev: 6890b01e33036d5dabb8df06f5c5a37184d2b140
X-Patchwork-Hint: ignore
Message-Id: <20261021191427.DFE6299A9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cloudflared: bump to version
 2026.10.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6890b01e33036d5dabb8df06f5c5a37184d2b140
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index 89110ffe3f..b963d57aec 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c3619a29cc529a5bc43ba99e1b298483ac0b8d8c412f69575c089a6bd4a7867d  cloudflared-2026.6.1-go2.tar.gz
+sha256  8e1f95a4e4b11cf545dccafbc49c1b251b3b4625b1986ab8384203d6738c9cc5  cloudflared-2026.10.2-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 44ddc82226..5003515ab4 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2026.6.1
+CLOUDFLARED_VERSION = 2026.10.2
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
