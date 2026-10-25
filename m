Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E693606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k7MvDr+b;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256 header.s=mail header.b=xHU1JBAf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F5D660B18;
	Sun, 25 Oct 2026 10:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F05AYLZs2Upj; Sun, 25 Oct 2026 10:51:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E218060B12
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792925513;
	b=q3y1QEytR3uvZsP58IUcbq7OiaDn5ihgMfcxrJTsMBGPYBTVClPA9lbLOPjtQ+w76/ip
	 F+l4XQk3qgOxfjy4yzVlSKcGOopySfZ1511AAYSlvHoXvG/EqeXvu8gnOHhrv998vqUQU
	 kjIk9NGcZz9MSDm8G1ssycuA9Y0yXp4DjBy9Kfzl3u+1MTI13oUeh4KG4k5yUj7c5Mh7g
	 fkLvKHm5fxEUh5YmIEd5oKTRS98SrwZaSsLYVIUzNvV1JqNc1hmkcjYx+o1gUP8qfhApB
	 AXJIq4Po9S0OdouO9wDoULy6zVKM9Qlyz15prMY8Sw+X0oZuRyCAGfQuJNvCEOpSpzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792925513;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Virus-Scanned:X-Virus-Status:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5g8K+5Cd27qrdKgqvFaCmFPNWI7BGgzApib0+PUIahc=;
	b=CG0NYUEpryO6DF3WDavrYpwKBDeApXhAh2qt5A/+XdxL2VOyDKN/ZkOMDgApVR1HXU/c
	 NP2QbSnBTg/zwi2x1OOC7wHXpGxPGw8BLmTjIOcndNJEHI9mjgNN1tJjAT7kFe8LjpD6t
	 NyKKvk3z2RBAuKspWSzUo0nqsuSRRxBE8DvS6J4d8ceNNt2tE8oOlBRdcy2INz66Dq7yG
	 mcwPCzOiTxyhU4N6Q1kE0o1HfWBBLVU1SyLUrBcjRAqODUzukTT5pON/k3cymzUjUZQto
	 9NtyRLwEihV1yET6AKziLKd0qVrMh2QzG6CpgaTHigIRrKy2tLhhptjBB/FyBLcVHpA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792925513;
	bh=5g8K+5Cd27qrdKgqvFaCmFPNWI7BGgzApib0+PUIahc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k7MvDr+bANHIuDbkZpNzQ3tas4j4qhs6gYaOnBc8jqT3/vp2B/zEn2cd26ZKEzaJh
	 WUitYzL2stvcba+qSodcIAnGM/krCD1R92uXhYCFPjINoxnNzyrTyeQ3QMJcCLLX1z
	 6u5sf2rTS4gAmAmrSaCAGYfxORXAB+RKcidDw3LgbXjTRiHs1kVxb09CvpSO8lbi9A
	 psAXPko0EGQBVM1S9QbC/eFis4ZKqUvqmQYOndr3DDVQQhKlqk4DV88uMmRenX41Hq
	 AGH2IZrpkPr11yhMiivwuTg9SUCZY/1YotNPitK6HAsBhOEPyMem6hwXYNoWV0NXD/
	 DhoNAlKwlTYlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E218060B12;
	Sun, 25 Oct 2026 10:51:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2003B35F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11F844009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cs71jAEVUrB for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 10:51:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DC98140A0C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792925511;
 b=ZXxFTK3dluFEfg28a4IJlzcMsSimyT3wlj+H4d2fESgPbOVbq+m5SSy7g5elFeasB4sM
 lvErH1aN1/PPuIIfWkXwgKWMbEuFdoNK3/8gsAsCJJWuaAwwdD7Qc4R27WRRk2QUzS0yw
 bTidDTtrAUXjBl+1DBHG3DNk6XQf3VjTW3sMTQ71GzTfthp4bDUDXjdO65Iwwb/Y8GXVc
 UbCOYm/nKsVmiZvjXoI7mlEv8x6iZ3gTmKjnc2VG9W+DsECIlf/OwKmtHOuZaXOmROf7K
 oSOafT2waKlfAI1R7Kls6A4+KeYxeXDyLaW5VampYMV6gBO4GjwsU2ORhzv/JdfwKyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792925511;
 h=X-Greylist:Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Virus-Scanned:X-Virus-Status;
 bh=zs1Eagv8kY8+Ce8oRD4ridYwjvx5Z6aJnxFOofL/lMQ=;
 b=IJdq12X5UQu1Hf9oLYrLNWPionwkxDWue7U+CHqzFI/SDXgQwsCqF3/qt/aAU/EpPQHC
 mDug9dOitMEl1mirm1aARCcUVV7Foj0H3Dg6y71wPY60A/vVBHDz8/Vh68rG5QGn72NdW
 U+q7CtU16kjs0n2vht35tAH8nGC34JKMCeiltnPVSx0PB/SqBFhGsl+5OUrAEBK1rFwUg
 gGvstkV5m3azWyiHUGEErv9UlK7JNCK9kkn1rdLwn5Qc78r8D7kggLaYxjNcP6SHif7+1
 /F/v5eZpfbIzGjdSdbnNHYpSzXI/rMEXP/UAWBldrxaIm3reB/6H+kHP+PmlCStMvWw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=umbiko.net;
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=xHU1JBAf; 
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
X-Greylist: delayed 586 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 25 Oct 2026 10:51:49 UTC
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=xHU1JBAf
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC98140A0C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1792924917; bh=sOBTskeKLYyiDPFpQkpUnXvSpnuxtbr1TIJJ1leMnR0=;
 h=From:To:Cc:Subject:Date;
 b=xHU1JBAffB55SSL1GoIl9mYbbT8xSbCqHbwua2+py+Q3JSECsN30SwYlXmEHyouaU
 7orBXTqrU6F4sHCwMFs8dOd5ocRO1AaITiXGiECv9fkL+sfiftXznuCG1v7mFx6oHc
 jjP01tbZxy5G41Zv4A0oKle31rU0Nkid99RP8mFY=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 271FEBDE90B3;
 Sun, 25 Oct 2026 11:41:57 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Sun, 25 Oct 2026 11:41:28 +0100
Message-ID: <20261025104130.1580635-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/2] package/mpd: implement
 BR2_ENABLE_RUNTIME_DEBUG
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_NONE,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MPD started during version 0.19 (2015) to insert runtime debug
statements into the codebase. These are enclosed in preprocessor
instructions:

  #ifndef NDEBUG
  #endif

Fix the MPD build to observe the BR2_ENABLE_RUNTIME_DEBUG option. 

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
This patch can safely be distributed to all maintainance branches.
---
 package/mpd/mpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 4db0aee7cb..84a0f389e2 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -27,6 +27,10 @@ MPD_CONF_OPTS = \
 	-Dsidplay=disabled \
 	-Dsnapcast=false
 
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
+MPD_CXXFLAGS = $(TARGET_CXXFLAGS) -DNDEBUG
+endif
+
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 MPD_DEPENDENCIES += expat
 MPD_CONF_OPTS += -Dexpat=enabled
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
