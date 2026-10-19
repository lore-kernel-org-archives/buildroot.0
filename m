Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59E9606A31B
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YgxZztC0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hztmuYR3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 984CA60788;
	Mon, 19 Oct 2026 21:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDtIEO7HFL5a; Mon, 19 Oct 2026 21:28:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B72BA60774
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792445317;
	b=lzKPIPu6RdwfwOZeEivjAGBjO+9gca7IjLE/+1ltackVXkgyuL/VjKimNJLxqC1yK8H4
	 PZOz+qsqTqIi6zBIzP/Spb17x/zwQG/16wdVYiDRG9XUx3q375GJUYPYaC/opw7txdIDC
	 GG3DzPlnCI/SEB2X0AHSMDaUwnDoK9E3jsv9c6fZeON+D2b28LN6FchVX6oN4pC6tsiJR
	 Kc5TKs+aO1/qmRt6HRy2xaUr52w9uNBG810hYAmaneafjVW3nPCNFf0X1TMTbpuzw/Zlu
	 AHcTpGyE+VBrrBsRh8Ov8beqkqPqRRklJj4BETC0r6zgW8nxqU5ASGpZXrfZs5ux6IQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792445317;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=U86N4mO5U9UIVLucOZapQxYp3YNTn+ldZxzs0Ktjd0g=;
	b=LQLwJ+MFHJSAz7eq+oHuKl0IBksLKXKtvD/5EUOaK2jarePMw/tpS3FIjH3GgKhI2UbP
	 Y5xdUEjChiMJaKDkloHkl/zDufwqW1/H4Of81npXhCZxnsJrL/2ptZnaiIru0KISWk51M
	 h5xw7ZYT+q/wONwq2G/blCC/DJMV0vkWSeHZq/a/0oegigIetYAKODsiae4ezLIHS49aG
	 by6v30521B9bfpQGqbb96j5rvHykCeZuGISwF83724P1WUl0CFzFp5Uxm59FFtnJz7awm
	 ZvyPtWic2vhBrQsX1rNI87uiU1XxETAfOO69h3ZInJQnQ6280+Y3yZK5PH4VDHWI/FA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hztmuYR3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792445317;
	bh=U86N4mO5U9UIVLucOZapQxYp3YNTn+ldZxzs0Ktjd0g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YgxZztC0OOl3E3Nt2OIDsFTsSLUdAWFhz6qZPsASTzXoA/qmTJ85nZPQKBFxGFbi0
	 6fIJ0HBzt4YgC/oKNhTLxOkhKAuqW/yt02sahhIa/yX6xF7YoyMtZKpcNK1RXKBlbY
	 OO4aCaCf8dKXj0q8nSDCmD5BfZceoHjWJGjs8v+fqnyeUz5H4mZpn6ksai20tj7wqh
	 iqde24mcahWoj3aYvsUBejAeGSO++LafkXkI5VtcS/tdTuxVbJqutSV6imPUcO+0M2
	 MmOSYZnYkvnMJdqXlIZUpT1bSUBn/DiobmELMKmk8NjzY6pF3onaqPiYFRBTrP1BfX
	 k2t+gVZF48+vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B72BA60774;
	Mon, 19 Oct 2026 21:28:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5D8B1DE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B784360774
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZU4ZDjsUQtu for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:28:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 515386076C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792445316;
 b=dlXZcXmJLxpPCZEIC/TpZ0M9BODXY86BcgWN8WvRu4E4Rehf4M9vYWWnAkN2nQu4eLPY
 8moWqoh/F8dAMK+fuUWrUCRobrnH8huwYmA3vhsP3ens35Ijbpqm0GiVHrTpHVaHg67CW
 oOYu4oehJKGnmko84r6+g8sa6ja2RLaXsBeIdoEexDQtmLBoqO/AiRgRypC7kfMGQty9k
 JmpvaTiyVDbLYVIpeFGZavBzPpRklNBLkYHw3TtTvCacu/1CbI7pJaKCaRRvr4sxBulSb
 GjpoeMHtRIdISnUet5by+UMIbPxkE8U3aOVNp6DEfsnOSZt8DMmKzTOO+ftqv3y9n6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792445316;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=gMeWqPUj+IKeeTcazZulltpxBEfpG/MXABj/cx9Zj2U=;
 b=GcEPgMwjcXh5Oa2EqGYGaVf9Ws8qc+RJ7itH356za0QSs37BTvi+eXLKbk4mVDphr2Ki
 IyBnkB1TKLSixl+aVUFGAycgKr8A3plB7ysSoKXSLvBX8paY+k36LnNypERxdX4l9QJxQ
 oFTHHIhTf1t0A5mHkvcm96kc3ltCgwleGSatjKGzECAYsPzVzAD5XcaPnjuKVA5mpN88R
 B458bCtTEAfvqX2ROWMJONYDWn61GxxWfrFldNCeFIIKR+nKQqrVo22q1VTBxJBAcbz1c
 5xo9JWse4gCxjM6/G2I3qXp2/1rbrX1iOm+/jkEfNnEH2XEBkBow4aJ9l8SGuEDgrpQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hztmuYR3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hztmuYR3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 515386076C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792445312;
 bh=gMeWqPUj+IKeeTcazZulltpxBEfpG/MXABj/cx9Zj2U=;
 h=From:To:Subject:Date:From;
 b=hztmuYR3kLV+x6meJUxwoxl+E0Gv3wY2S/DeQavqiuoUdVz1v5i3IcV0zvr72L5y7
 VoW6zZJ0kE547t8lLKS0GD0TCSkUhAz7Ywf/8M4Qj8gEtbSDiNSl9E4nX+a7WeTtSH
 l7/clDJ7hlV3AIzQf+GpoUh1rxZZko8YiTnF9idHCzN6ZezMISLU3eChxAu8A0sYHa
 zaNnKUlxOOWc5Nzixlq6NZFnwe8BJou2dni16lUhG+UDcR241lEzhOLgssgyeOkhi3
 cwe3ST2RjuvtNnGxrzoFxDT6jq7CKoNBZi1BKEYsb3rNkvL/lAKlWBfeGOz2cIR7uW
 6gkdiKIXl2ZHg==
X-KAS-Sym: v3:f51bdf72230551df:kU4hKTW7Zh7n+Ea1AqUH4AfIY/CwzOedDmz2nvjGlKzXc
 j7ZMZbq+Vd8TyOxdD3EepEMKH26nzveVK+BIdisQXaVim4ZAH8Lvr91OtmveQT8jZVuFBg5xOjr
 4xwEItUuVRA/+SarmrSNxS1cRMLdv2tlUOxDuyHWhFsONUV1ahtsG/4bO0Z5jhtZeMfsCe/URQA
 leDldnaG884tpr9YnKgcE/N6WaTiKkKNTX5abX87y7Iuncr1n232RTNuh6iZMZwsIDkH+E4vrkr
 emxw5wPFunc20TpWBO2m07gi5WZb6DzfPU7YRP5dYJfmaynOdiMByen5efMkijz1oZni7TmA==:
 OyjIRNPDuhhnac7fxnNB7lWcxS/zvbvIw6CfPYD1HUusP51M31o/99u7cnX3ptQ94fuf4YuRSdg
 Pc3x31tqg5XVevUEvox/bIWftHuJaqSIQ4Kvp9PERyClIQsTDdc8bEPrXSH8qwqQ3XQ8JZovGgT
 V676WXTXCFmEkxPoT04cw/bQ351TbE6Y59l0eBZFlQW9spbPKaQvrE1F+CSYhu5K91K7AE77yq9
 KsHPnDBlBgOOzwO7nsNXCuCkZ3JVHOswOu/vXb7kXPNgSA0unrVcabtXSTCVxtWVpTeQ/bLVFLy
 8QYpgX/8U0C7pecseU0HK+bHsbYbfFMioFjuLDDBsOD0am8YyXRz79u6ovIycCf06/BrMdgk9bw
 6Sey5Vp/YD27w35TxqvL8pezUfnGb0gycwZ8xTDfkbr/sa6VNAG1cZTeeTfW3zPJXV5NDtzhloL
 oItKS4wRwMJogVJX0Oz8tVvBJrrx9ZLS0clwczr+ox3DVUz4lcFU1U1Kpg2JVGcAfCC5jcRYdBA
 tzmWuM7FnzC7mda8v7JS/xEqemDM2yacFOVoEC9LgjJlmpGJ/pNIkjp5QbxNp4O7US3b7CHgcHe
 PfgDk78JoJImgH7eZDAcdWEbX2k+8Tc37aU+JfHnu/GX
Received: from fli4l.lan.fli4l (p54a1bacd.dip0.t-ipconnect.de [84.161.186.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B62D8A4C0CCE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 23:28:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42902)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xIuuG-000000003ix-1naY
 for buildroot@buildroot.org; Mon, 19 Oct 2026 21:28:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:28:32 +0200
Message-ID: <20261019212832.97456-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump version to
 1.23.6
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

https://github.com/strukturag/libheif/releases/tag/v1.23.6

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-h4h8-qgvc-m7r2)
CVE-2026-XXXXX (GHSA-fcmw-5764-7rq8)
CVE-2026-XXXXX (GHSA-6fqc-p7r8-2g36)
CVE-2026-XXXXX (GHSA-q7mw-2fmm-5q94)
CVE-2026-XXXXX (GHSA-vv35-6hxg-95x8)
CVE-2026-XXXXX (GHSA-8p2c-9wv4-rx4p)
CVE-2026-XXXXX (GHSA-86ch-j429-fpr2)
CVE-2026-XXXXX (GHSA-3gwx-cjv4-jr74)
GHSA-hqpw-h8p6-22q9
GHSA-hvwh-xpj6-ph5x
GHSA-v5rj-g4wv-j5w3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/4bfdf5e1cd6169d20971e8bd1f9731b85e65e9f5

 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 30265f4aab..44e9c54781 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.5
-sha256  fd9036064c4432f0550d15072ddf34956a248279ee9aeaff0fba3fa0f77d8f1a  libheif-1.23.5.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.6
+sha256  4484346dc5995319dbc11e3a1c35d0a2ec46511ce370900869337fd2c7033125  libheif-1.23.6.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index cd171b9637..179c952566 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.5
+LIBHEIF_VERSION = 1.23.6
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
