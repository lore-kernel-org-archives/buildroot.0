Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9FC606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=quHx1v1g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NAOTbTel
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB25E60905;
	Fri, 23 Oct 2026 18:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVe5TpzLpeKZ; Fri, 23 Oct 2026 18:19:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E135C608FC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779556;
	b=jFJ/3meMoAG7YJy0sOUSlZkNp3Xu5a661GqegwQHE8fTYce7Y112n71H3bNYH2s9XT+g
	 btzOzfy8obJfvXRx9iiFB0kKqsi+Yfr0gnjO5aUkVRhHxmbPWhQ0BgbZYN3dr8tKxH7UQ
	 q5pLM+t9FBBYgBRoRfqn8rFJy9UpKCYfPytJgCA+g4MjVP+q0sPLv7mvclCqOOvigt5e7
	 OIC9XPXfMfQ0rj0rysmNz7jR3qVk4jt+cZrq6zZAbA/eHOaKol9y2FBtLYvUnyBMw7y2E
	 NVZ88ugSTOQRVzFn0qzK8WM6Ts4Va3t2bPzhPaN7ge5kXyjSAltt7R7b/Yz+BAhNZHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779556;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8IJUjyiWpXjp4mmAEZjm9PpNCrMpWw9d2j+hmntl5Nc=;
	b=OyudHELDR9uzT7knCfBuGuPaiMBdBSTt8Wak2ueIZ17LnPgEJv+bDs7iPsT6t/wz3dAm
	 AxpjdmhHK9jtBWEP+w7itpo6OITD8XEJNyok9lt9oxa0gPyU/kLVtpARUN37+m52eMBKo
	 +AtwPHp6EHVvprgQ7IovuFqKiUkPuoYYSSTyC+jUuBhcYLrzUDsD8UmjPQvCx7wEZHFcW
	 jTd5EwCm6lKIINIT2G8xQ4oQTfeiz6rbfznWgZI1rVVHyMUDyKEzFSndIBx8cwwH1M/MY
	 crAuh4r7I/15HqdDmfaR3u2I/LYtZnNTRoElTKyDoxU/m0ef4coGPySGNhouNN0U5Yg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779556;
	bh=8IJUjyiWpXjp4mmAEZjm9PpNCrMpWw9d2j+hmntl5Nc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=quHx1v1gE+MBZjOyV4riqQVE/gKAOFW9ZLzP0K9eetYQpNbjG3FgI1+FomD/5zMxC
	 V/mBgiL588ZJ2h5D4Q8+spH6Q6ZgntY2pr/bWN05hXMxglaN6zYUX8xMM5Kne1KgJC
	 xOnm1xtPM6SB6A7LsY/1Sn+KuVba2Z4ZUIf4GtzPOMofaaKDfdJogpzG3USAmmGKHx
	 ZRGmMKADHjFioVc07OTQSwPxR2/zVLWaP07/9MIBDtYeMOM+bwYLrM3XhdAHi4FpbW
	 VBF4ZkD+Cf/2blFMBXyuGqA6GjVyOUpsxIbTJFOazaqz5PR9Yp4sbBBbCHacwwvfK2
	 inQv1DGhSrIow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E135C608FC;
	Fri, 23 Oct 2026 18:19:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A429235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAA6081686
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZI38GClq1Xt for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:19:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C90B98165A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779544;
 b=tD1l6pfLrGds0sKEqbq9n/zhHdNmoLBd+EWiD6M2P8vf1X4P3835lzVb1/3efDYaHkOy
 dBS5GnERHDyjpTcZ4G6F3A43mmLO4rRGcG1hGFJdq7W2p7ZlaRW8+1YrM7Zwgx8bLpsUa
 kGWFwoXpxB4pt8NwNPPWmR9jvUuy5W9xkZdW8wP7Ta+9Dceydajamemi1rlHh6/9U9vci
 iNBwtvhrODcz6Gj3wAl6e0KHKeegSq9xUAPzFm5Oizi8MPVEJRxgLSqewAY+NOSmEWOb7
 1iZwkFkEi3r0yFxnLV5R9unAQkqCtqYxZOFCb7MZJK9cmMqeuoaWr9zkZsG8SzAhU4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779544;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=J+S0XDB5LWhZPx3pISwxL6w21n+FX5AdvMBJb/0HJlo=;
 b=lQ5TC+Q4RhWVjqBOLFvAGqO613JMmfTJ7lUNpmKn4XMyqnzgWU3a/cpM1/K92CWs2xAc
 tpZkgr8ByIHRutiHCDicH+MeP16kdNNtFvz3yJbqUxv7NYuxpUMYnKZY7Bb85pxjp8t4T
 qHWc2puH8HFYB6/WbIen/oSLPfXmXhmc+n0yot3UjAjX3CTpNBMMnwIkLBMUCecLE5E6O
 4FBU6S397T3iwxfhv79WCST6aOuxx1qLmyl9w+Vh4KcAQuiKaDl6XedIw0isMVSPI0zIj
 bdAIRDJRqomRrmHnS5SHDY8s2poJKeLVth92lyh/srRxjuMu/W+fUdl99ZjugvulrAQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NAOTbTel; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NAOTbTel
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C90B98165A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:19:03 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-6de2f213b7aso523779eaf.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779542; x=1793384342; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=J+S0XDB5LWhZPx3pISwxL6w21n+FX5AdvMBJb/0HJlo=;
 b=NAOTbTelYof2lZ8YashDlr+8oLxDS/tLagRYiAyNQrR8kd5gVCT8Uj6eY22veh59Z+
 hY1+2647vuPv/zCM6rv3ZHCmjhqbONIMVJd9i7iT+Hm63wT3YGunTy7grD123LXwO373
 i6Xmgm54dPRXVNJpdhxoXrDJkB/xI4XgPSHuvjll0lM/yYmBt3dqNotjor4DdUjMimpA
 fUzUNGMJM0huIwOkrMVHpLQugWN7eLzPDRvW7mbCrs3zZFqYg12/80HG/OZqZ1WkaVRL
 aKhWz/jLpe599YIbcz1fW/d/rQvDhhrgjLoEDSWMEhHBZ4wgK8QyY7JKR4/6iBUnEx3C
 F+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779542; x=1793384342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J+S0XDB5LWhZPx3pISwxL6w21n+FX5AdvMBJb/0HJlo=;
 b=oYKEHAkssPs4DiQEA+CQi5KYtVLQomN+1LCQfRPHOl0Wn7my+/ww8gvgF0UYt3q0P6
 TduSlp0iEUw5krkm1OdaVNgY5DkHySvCg//IE+ORFKqHzA8xC4bPMDW5e/a8h0iKC7+z
 ODLXA1pJNwWoihhVV28BPkpjuPulM6FYD2btAQW3kjxSd+fNi4Lwi/J0+GHcrNtgU/CD
 UOZ60wbMPVifnaMPYqljMxxtGNYMb+NK0zwD08QlncgeAtgAwzfV4cKBh9VDLeUTh9Pm
 CxkCYuFQyfnL+UEKbY69hPXjqoZxWHZ5aFlf1PmBcAHQLiDRG1dT0pgeSpSwBdxG3kUq
 YOWQ==
X-Gm-Message-State: AFq9FYJXGw7P2O9kEn250xBZw7zpO5YDknS41H08dIEAOYxajvvRkmrW
 Llqxv6iT3+wx8RrUgottWlOh9M3L7ibDqZoJhcnH7e+MwQ1Ts3c/Ti99onTEew9Z
X-Gm-Gg: AYBFou0mIo4yFKMazzsmLWLPfhVIfUSKwF3bUEj0l20OI8k3T7wjmoR4LEeNI6E0PBL
 1yrZqrWgCThz9TL6j0Oqje14HPP562h2n5qbg51/TVR045DUr4GD0OQWe5ymWfZYG17ljrnbdfH
 rWzILtNoMsj/3tnOIrBelkIGFWCjAczRj+otPNp+TabtgGSJoV3WQkPv29XE6BORviWN+Um1j+b
 LU8EVJ1KZo+j+TbCFCyoVe1W3YAj4mjfS2uQ9Uf6zYJ3Hu+GJa0hon/i08qiH6T3McXfOj3ad7L
 bf7XJz1l9/nglq5F6O58U3rQt4yfDVIeb+qSF1ILb32GS7pKNkeI7YBIhO57KJLR+3rNZz3XEyk
 iMtV+Dj1PMbDBIrGYcn/390+M7WF9qp67jU2meVFtAw2zjjRT7uM0/k09am4osM3Iappr7uviDr
 YefwAKok5inAGd+6iZueBNfbsPOrL3Nz6NbZdrZtaOzjR89+O7Pq0y/fpndZ/yCnK0/2TdO7tKB
 09RLSaNNXad/4VR19d6TMQ7JW0u7fOCUOpwEeYU+mAs6YwLV8+a3bNir7eonRK3DUSBMMQzkXUr
 yjjaWjH3YLhc1rsEKYF5lp7dee/tnRPb19e6jnTZCvpdboc9FssXe9xHjzoObiPl+O1Xftd/1Yo
 BJQB4StogvUnTbWM/2TVRou51gfEwffUQQwd7aTuAuU5rBc3oa9q4yseS6PusUqxCCmyEyE7NRl
 1Eb5c/t6t66Bbt6FIkKOM6GRI=
X-Received: by 2002:a05:6820:1396:b0:6f9:91c9:4e5e with SMTP id
 006d021491bc7-70b88a1df57mr1979322eaf.47.1792779542270; 
 Fri, 23 Oct 2026 11:19:02 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:19:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:44 -0600
Message-ID: <20261023181818.920329-27-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-typer: bump to version 0.27.3
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-typer/python-typer.hash | 6 +++---
 package/python-typer/python-typer.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-typer/python-typer.hash b/package/python-typer/python-typer.hash
index aac74ce2bb..463df2bf86 100644
--- a/package/python-typer/python-typer.hash
+++ b/package/python-typer/python-typer.hash
@@ -1,6 +1,6 @@
-# md5, sha256 from https://pypi.org/pypi/typer/0.27.2/json
-md5  2d81e72fd4c60a94c9d1b6ade7142f65  typer-0.27.2.tar.gz
-sha256  269b7eb9d3c202ca84b4bc9618cb04ebb43d3d4d1e567e4c768607232c05f945  typer-0.27.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/typer/0.27.3/json
+md5  d1883b55e7e3f5f7b5891513352483f2  typer-0.27.3.tar.gz
+sha256  d0396f770a560ab1b0a8504e13b5f254b728cedb05c61cf0359e944e50ce8901  typer-0.27.3.tar.gz
 # Locally computed sha256 checksums
 sha256  58992cebcf8dfb6e40c4e2112ed12126c243666dca3912a3d78b7ecac4859d49  LICENSE
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  typer/_click/LICENSE.txt
diff --git a/package/python-typer/python-typer.mk b/package/python-typer/python-typer.mk
index ca0d1c6ee7..14d4be771d 100644
--- a/package/python-typer/python-typer.mk
+++ b/package/python-typer/python-typer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPER_VERSION = 0.27.2
+PYTHON_TYPER_VERSION = 0.27.3
 PYTHON_TYPER_SOURCE = typer-$(PYTHON_TYPER_VERSION).tar.gz
-PYTHON_TYPER_SITE = https://files.pythonhosted.org/packages/16/f7/57713ba479fd405eb76de31404b2c744c289e336b2d999511ebf51e496f7
+PYTHON_TYPER_SITE = https://files.pythonhosted.org/packages/03/51/d33db42cc72ffd8c30777547b42d01f0cbf9d95a770457698d0174b3ed71
 PYTHON_TYPER_SETUP_TYPE = pep517
 PYTHON_TYPER_LICENSE = MIT, BSD-3-Clause (vendored click)
 PYTHON_TYPER_LICENSE_FILES = LICENSE typer/_click/LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
