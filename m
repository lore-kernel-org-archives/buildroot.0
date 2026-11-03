Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5B5606BF92
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Hp+Fiu1G;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=jopCb+EQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94F1A80DC7;
	Tue,  3 Nov 2026 10:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXuSX6M25jbL; Tue,  3 Nov 2026 10:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 002D780DC8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793700358;
	b=lVEjYTN2QFNY0Fe01Nb3S8WfjnHL44ngeZypwVK4RnUgfk67hExV+soLRTelyH3yR6gb
	 ili3eaK5U/21fah19OZmHx1CuM1/wR16aTXQszffrvZFk6Ld0bqBYuEbF4/LVtCxfyTUG
	 CaxRZX8FmQJXU43vmyBtcL4eE3zuBiOt1qKitD6JMRw6H8NySOIo2lnX1b6oY1EVXOSWc
	 zHRqQ1hCN0YWWH0AcAhbTS0qfy/IsZhqxxgxIyKyYQzpIpFowKEmj9KSuPw9tvDZkpyAg
	 XMasq683RNvjGyWKxMHGsO7BBH9toAHdQmX6K7A17Nq+fO6cIK6Te0grGLKyRIh95Vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793700358;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9kL/VMthQ8d8J0y+zTd0fWDv3okbk2HVhBXnwGaoJb0=;
	b=HpVumiD6uWNX5Jztq15lDEYHPFyMCE0Qp1SWL1+TTkBGmwxR8FskrcVkR5MrFgay4d1O
	 0jjzjgVJ6+9oMy++rspl4TpNcnB5muAZNMPQeeJdTBNuquIN0PazJzFucQi08HL1WmeeH
	 c0al2PSGRDztAd0WrrviONRUkl5fqCuO6b/Bhy8ZX6wKqHReUUdMDwhLPx2FHuYchJo5E
	 wnIpNaFXS3djjudwWTrD2Hcz9UryRuxRUZWiDKzmZMC4QIM89CyOuONJkAE3n8AANI9JV
	 0UwliY+h6tQ/1nrXjYMZWfVjQv38tLLuJHpMnAso7JuLBxMq/kat4h9PYM7WFDrQF/Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793700358;
	bh=9kL/VMthQ8d8J0y+zTd0fWDv3okbk2HVhBXnwGaoJb0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hp+Fiu1Gudd7LlTJ5Tjrn3CzQbFEl/KvQycIEutj4UOB3Ox/3/QGM/Ds4qcZr9LIG
	 gzjTZkv4sJ4hjjitLAqIYotbdjVAmAuyogEqzYn2KAwpQHpoW8jre8bBbYYDDI4GaO
	 uwGSZS0E6gRGyUz46e/W1bDvj5l/m+j2FEmWA2ttiHZizgjiRVGfBc1kq6VS2U1X4/
	 97BCelpnJNwLNEpO/gxX853EdN3g7muCGopld/dWUM2faYCZIngyWOjkNUX6V/l+13
	 rygKvSHWuFWGk4JH+32GZ40rgWA0GLrAOYBAIxB600m15rmbdCuyulx2d6UVSX/NEp
	 9Kwk1JA694u+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 002D780DC8;
	Tue,  3 Nov 2026 10:05:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1CCB356
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEDE0606A2
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FORIv6ilZ6r for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 10:05:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 50BD060642
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793700355;
 b=YtSyoLBpG5WVRSPMU9WEmyKOeO3z03EunX6sA6EM91G0zSY1Vfj+vlfee2egMCJcc2OL
 hvk7CMqQ5n1BXy9bQ+TOhCGm89HUKPqYQGmHUi759x+5o1UHLOcrmTy24R929WpxRmTNw
 zo2AdpKvyoKuOqHkhUTaNS54eHbbm/S5BLc4NcmQJJ9aUx38U68ZxdvGl36Y0vD+TioKm
 2s6FmCSt+S7KJvZGvjMKB2iyM3h41rkC3MZr3GJRbGjwwku4OKxE1ZX1wvjOLnHDSp4BE
 IFOmwbXn8uUOzuxiWuF5Ovzx1T3edMqRMgncTmn0YLGqEvuSEhoFX5PduIAKNDYUr8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793700355;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=BolWKDTcpoKm7tfLRhWYcK2OqZgPFMaHlSkM+22TOdk=;
 b=SNjzTc4fP4gSOTlQ9zUkKMFR7SEw3LaBYbFGQzhwjf9Z2dwPCaKKTlwRprwCqx9O98jK
 fpOsoyd54l0I1Xxlzo0BeXVb2bAQqfETQyA/URGivEXsayyDPt9fuhYlEEq7Jk1DgmD0W
 hcLRlTuFgwXubA7AZFWA4KaftvRffl52LFi2ndCd+F5JLZSyAu3eWg/zjtWu3A4vWKXv/
 4Bwa7eQm+xof3DlOVn9X12rI+t1SPjp96D13VZqNjk7FQHzl6IvOjdoxpv4V+tYl/ZXiO
 vki62sVAoIm+TkPv8Socbf+5Dx7Aw5hIOFEZJ465ubfsmI32Qt4Xem5xiRYCOdyCD/w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=jopCb+EQ; 
 arc=none smtp.remote-ip=62.149.156.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jopCb+EQ
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50BD060642
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:05:53 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id OBOoxqXpDW41bOBOoxpv00; Tue, 03 Nov 2026 11:05:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793700350; bh=f2RwG4J0AyGUAK+gY8ylg05JvkPLn8YLXYP716Sbhtw=;
 h=From:To:Subject:Date:MIME-Version;
 b=jopCb+EQy9p5fg0KYEig3zG9/cFkqmtJEbYfJZsdubxD+UVJgf9OiL7MQf6p0HPSC
 4d/xd8ZCK7wNGI92u3e3H8HwK/XD1600ZRsWsGxAUbVbrhvW5NQ3VnmTilb+PYbR71
 8aQlR+AoKi/DhNgqXpBp6wOkuRoC07qmkdg+vh9RVhiIagq6KRzDTf0jzowZu795D8
 11uixUI/Z83euKU7b1hFQo9vGQJ/dMyv9jRR++28VUrwQ3iXV1VHcYEchOzOLkS5ed
 p8vdqjB1AOfUUKFbVKKTrUMqYCvVWaZ47oOUbsGDqRJ81dDH73Quj/wkydewpeMIoU
 FoDd4yO/SDB3A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  3 Nov 2026 11:05:49 +0100
Message-ID: <20261103100549.4129021-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCrIMruYrNhr2IORnI3awISmoOwIdPtJNmopRzIHC67rXLqQ/UUtMfilxq9VT7TfM8lnIHMxzkQ9pvbu0Ia61gDZCuXMVw4KEhDPJgMjFo/eysFzsv6J
 1Gj1/B8z4OMS8wJxdePLf09D5YlWqAF0cyfvb8T280g5VFQD7hJ5IIG70yC90+tPOM4riFLJ2qYCbwWJnvGSs7xGajRxFKlaLvtitGTOJGugGuFglxss67Qt
 0XjT4ETCij/N5WDgtRCNlAr/t1R16It8gAz/XElWe58/NQQYqnCQtUF6kDpL9i84m48iw9YFqU8XLq0uZCHkZw==
Subject: [Buildroot] [PATCH] package/rtl8723ds: fix build failure up to
 Linux 7.3.0
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop local patch already upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723ds/rtl8723ds.hash | 2 +-
 package/rtl8723ds/rtl8723ds.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index 580f5d09f6..8557414e0e 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a04bc28cbaead30aca2894633ffa93d4bf0bf407a8c5b7120dd9832ceaf0310e  rtl8723ds-122a574f780da32bb0de760bf089a3a9ec1e8f87.tar.gz
+sha256  e0cd998331f37d4ec5b18df695638ff9f3c2c564bcea936b55ef4b40d9c4613d  rtl8723ds-83191afe47af29d622701bab24020e2dc8b0fc48.tar.gz
 sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index d8072f14bc..8dfda059f3 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 122a574f780da32bb0de760bf089a3a9ec1e8f87
+RTL8723DS_VERSION = 83191afe47af29d622701bab24020e2dc8b0fc48
 RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
