Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E3606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V8iWRdKn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLap6pMj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7654D60721;
	Sat, 31 Oct 2026 17:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnOqNJGHPU9W; Sat, 31 Oct 2026 17:21:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3A4CF607B0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467275;
	b=f6wK6HdVSLRJI73Q1nhEcGnumNmsRspGBlmaw5NqESk7fEouVHfTUtpvEIS6f5KmgdpO
	 8U5WFAOXOuxTUEWsbComzQqcBGfsr5ZDdT292F/1addm18os0V0Axg7oO0wxoz8FCEZdK
	 zEWQU1idBDAUxoeLVuhp5rnVmSCoTmHnj2Dl4WTJStTyQYnDXThtvj0Y6O7kNT82Z1H7L
	 D4uvNdf3Tu3I42E/GzIKaLhkmo5FYAzQCTm3EJ9/NtDYKfbFpIaLo+vHxk+BLsqPG6E2O
	 BIno/hsW0Z3v6yJwvI0aHoK83Ig4nceUO6lMjnbyNV5rTOolU2AYjiZZTBVNEjGaAzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467275;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MNM/P9k9DnoQXgbvq8blhAMA9zKcaUf+R8t1cS9ZHrY=;
	b=ZTflieE44fXIDQAVZvJDjYhGg2pqVum5RgDjToaXPoKq0gXi3zbdMJJvi52Z6BkaHH5D
	 ewH7kDfsgAWnWOWGF2XG6lN+oam1ieU0q1enMG0uoj+h7FtYm+24bg+edX3fwGMbrxsTS
	 QCZeMslr6nQQtehnC9rTIo4F8NurDa6F2klNjVOp5mtVs/l4H5K0RAtkKWwFOhV3NNSEm
	 MtQKTiYTskzRRCsddaJ2oX0NHnjuGuvOcoUvU861fKwR6wyRm9g5x5GeIlJDaysZ2FDdM
	 fwYG8CO/cprO3NBXWEojOgZreNSBgT8EaM1uo0kT/LR3Fg5kSG7rFna8h7t35pWZhQA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467275;
	bh=MNM/P9k9DnoQXgbvq8blhAMA9zKcaUf+R8t1cS9ZHrY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=V8iWRdKn5K6fa0FWtF8MLBTMTPe0snLoHcACNTvAEyRY2EHanCeHCw+cGB9CsCijk
	 9EIpTqIie6+39jYIeippvSRpnOuFWgARbi0Pqzqs2T7fGp8fXjoU3bc2xu1zYmXQZO
	 BxQr6S4YPy4f0ajvBs1eoOGFTYJMIWg4OZgAE04B6/gfTCIP/hHgT75o+HwNK3c7Ii
	 fnkkTxoDfpAuvOqX+UyllYOhGrZZzcVrW9fgOYi1zgUtF/aI7KKsSPdefSPNvIRU6F
	 y0sh/Owl+vveAsa/MY7hNdRcq1cPAt9ztX1faIN8imDuoTOeg8TRluZHEMPQitFP+d
	 IBSb63T+LsTEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A4CF607B0;
	Sat, 31 Oct 2026 17:21:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D4AA523
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41B8D401EC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Um21WzCjKEGa for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6386740012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467259;
 b=YB9vjvZQ+s60wUwO6O+0UtptVRikEXOt3F15WuIprL6AT3gcGtiP0ZS0B8ErKz763xhF
 NwpRvVNIFv5ETwUTtYy/iV5/Ymio5ZelvQPUYEGdbUt2rsHjxeDAjQ46tysAHnI7XIsTT
 92/YYfHXFTw3JK5Tu2pmHtGKEE//JJrjKCWPO12zDKb8rE5UoKNAUMbn/bo3FcoqN7VQS
 dtF3NKowCh0vvB2wioUEZTgmrkLeihO5J1xOxzq1OSyG+AzpwoGRI/qGwP16da1keS6oy
 Eim1t15Uavi0WyhjUwMfF46SbHYvay7A0H6YvAMDEfkiQR2AMTr7WpX0ZDVLFSzmsQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467259;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=QEbpSs2rRjFBZgPCdO9g3BHzKbYoA2Gq85h8KbphnYU=;
 b=IeCy09n+XbkpB400QrhAoFhA7+tcbEgezUwDAaYggIwB+LXlWQWXHArOFv3q9qX+PrE5
 MdITTVmRBdsTKoc8HQfkswnGf+7AZdxp1TkKdWXd30jwz5MfIBEnuSSigO56VSbOuxcs2
 pBicQiEEBFPp/4WabQ52sPWRBvA+XvSAh3nkeFk/H6iQ2fIUBPjb5+kc0KVql0ozp880T
 EdU2D8xqGxS7Qb5BZwnfvpT/saeWAkTU8TM6+IG+frASWzlHAobdsLQGzAwO+VOfQz79g
 QcMh8sUd4gM9PPn67UtHH2+YOxGpT89/R1RSJw0wFuKPtRBpGHulBSmGOeGLqgMliyQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=XLap6pMj; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=XLap6pMj
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6386740012
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:59 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-82380b0f55dso770547a34.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467258; x=1794072058; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QEbpSs2rRjFBZgPCdO9g3BHzKbYoA2Gq85h8KbphnYU=;
 b=XLap6pMjjcClvlx1pb5ZLO/EULv4Lj2Wtubc3BdO4sEcoyTvmNrKRHaxKRD89UxJL/
 0e35kq7uB3FvOBCmGzJ1XrwbZ4ZRRXC6owjDm78PYX7Xotu4Z//T6TArPaLJMuz3ksYX
 jEhew3EbeKHgIVsQm57wiBmiDk3hGZ96+l/c5DWktvtv5+BY/wLCSERF3XQLWziglFcj
 Z2DgxpNi7/IEEAL0Paqc6X3wjW5sggexx3fg8w8Tm6AqD3FmnijKBIEHgIVqx2KNvVO5
 Z2D7gjHR5ne2eOmj0Rl/mCH6qmw7kvbUI3acYNmES9ESQV9fT6nOC7/n5BG+cJx2njX7
 vI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467258; x=1794072058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QEbpSs2rRjFBZgPCdO9g3BHzKbYoA2Gq85h8KbphnYU=;
 b=dYSF9yFomj8RS92Kjvx8OTb0Xwzxs67KkkktFaPtS52ttcL1XgIn0Bi1LQBGYQ2N1W
 9ADEy16TGwkwRNaffvIAcHGv3xs1u5Gj8n/HRJQpVW/PqMdcT7EcOyQq+mp4jLlHiFlJ
 xESpQ+hveWCamifpaxRmJKCrBWhPaALXjKXzC/kxd3ZVViOruFNwMq6TtpE3iWJrxipF
 ytr1IaMUHKqoikyY1y5YQX2SKGKQtkW9zy0flQcfkTTiblA5TgCCAFxXD+54zUSFr5/P
 KXBHjyicUxqFdHjUta+R8n21C5fhSHEUOOVSNEy8wvL5c5gjIQ43UNDtuFmIqnpkSl79
 NAqA==
X-Gm-Message-State: AFq9FYLRVvZoehe7Y+JhpjRoyeN2VIqxkbt+XzXhGrAVe0Yqzm0oGaAE
 vfkHlw3EU9urlMfOu8p7ZTW9B+8vJ0aqgvZql2N6IpHEHd1n9i72/RITgwgC+A==
X-Gm-Gg: AYBFou3DLYaT3Y/HDKJfCgCW6bQY4TvAt+dI7ugyFAl+S2dPDbLA6Qn+PmOhshbYPyo
 Kb4DM/YPqVn58euNkZN7QULYMOmo1rF8hizPsoNadJrWflyPDBc6XNqprRbTch8KbEFtgYuCphF
 6GvDRbPdPlfGopUXuvnCmKmUf6za/Q0f/OA/iSfHXYSNEyn3OLfMJOiw5xH9VGfIG6V68IS8pC2
 lmOUyzcNA2Pjt4UOSG5hPvkvQWh6t298FZn3SNANCuHMBWTNNDvoEkiQxnuBJGKW6RrP6Q8YB8+
 EIj0RIA8yDDUkhvDsukUWTIQsqJDe1g14hwzdksoTm6Xg+7JHSnCP7RE2ISIOYW9E6GvCpH/K4D
 mwMn4Ulx1NQZipvjtIzXuEnrJkofWLXoi5doQkXmlaM0gBLdzUwm4sq5435qgTr0r2yuDFBpEu9
 d6aEZu++lesYngQ1FvuGnPstqNNi63077Nc6nKAAI8WnTDQihHiYcwEJzCPv8dMPleXPnuwp+4J
 QaHXH0fn3xcNS1GoLa6SlDj92Vxn9i/ZyP26VTp1fdjkT9UjI37tbIZyYW3dOTJh9S3fFGxPdhL
 GQhgwLoqdWxIWtXWxTJEx+9j9pFcVzsUciX/nakawbdy6rObTRayBLelE26TNfPyQsICFwSUKDc
 +x5MY12noTDF4xMumvzERLiIh5g78h/kk/H6bTTblr88b/tpGCbg+8puSP846B7E2sPJNSalbbR
 gK/LtKxyVkreC94YXQa9uQrTsouQvfHM0IwbfIaBD+yTkBlG8k2n1MLVADrom08jO6o9Vx224TR
 A==
X-Received: by 2002:a05:6830:2545:b0:7fa:ab72:9e04 with SMTP id
 46e09a7af769-85d3661cd2emr3907683a34.28.1793467258248; 
 Sat, 31 Oct 2026 10:20:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:50 -0600
Message-ID: <20261031172019.2683287-21-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-serialx: bump to version 1.15.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-serialx/python-serialx.hash | 4 ++--
 package/python-serialx/python-serialx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
index 1726bb480f..7a740ade13 100644
--- a/package/python-serialx/python-serialx.hash
+++ b/package/python-serialx/python-serialx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/serialx/json
-md5  a1fe8ade48ff969ed3a16f2f3f6272a6  serialx-1.15.0.tar.gz
-sha256  89ffdae6511492157eb1e957f7f6cb0cacace088692f7477b27c4a6b6dbd4d6d  serialx-1.15.0.tar.gz
+md5  9966645418ca948d84b4802e7478a2be  serialx-1.15.1.tar.gz
+sha256  689dfbaf55f5f87ea0b6bcdcab135577ce1e70f98d490650b02a8b86eb0b0281  serialx-1.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
index a745694573..ccf6980daf 100644
--- a/package/python-serialx/python-serialx.mk
+++ b/package/python-serialx/python-serialx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIALX_VERSION = 1.15.0
+PYTHON_SERIALX_VERSION = 1.15.1
 PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
-PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/1d/5f/d1496ad01c310ae573921ca24c62bfaad9ff34cf16c583f4ae85f39b77e9
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/93/80/20ddfe87f1f62f604112def5bfc65673bd6013496201a6dfd8cc56f40366
 PYTHON_SERIALX_SETUP_TYPE = setuptools
 PYTHON_SERIALX_LICENSE = Apache-2.0
 PYTHON_SERIALX_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
