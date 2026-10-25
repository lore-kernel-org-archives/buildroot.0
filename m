Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB02606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o8RMJW93;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=TTqom+Ue
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E6C606A0;
	Sun, 25 Oct 2026 22:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IidVoX4MCyb3; Sun, 25 Oct 2026 22:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 625E260645
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966460;
	b=YRkDe0Afi3nMAzKML4568tzBvHSOaVLP1912pCDP9Ax9BKL5wpRTMsgkG01rzcvxloSM
	 0tiQuLyo5E3XiPgrp6ih8Va/3ELSrSLIggPDlIqWnPSyQqoxL3etRzd6aq/Zs00wi3uiL
	 OP0fDn1YexBxFnYckTAyZELiiym4zhTHZSYmjc834AxQzcAjLqwb20Z2+L4KvKHSQKAID
	 BSSGls1p+tLyG5+ncYdT0vrBLwesVmfACnMT6jinjtK5XQ+VjgcubYxXwUCnar1MEG0Xh
	 X7vQiXDg1f/bGI6u23iy6qcogjFNFPiIq3hpF7D2WRAR3er05rcuo21OkP4Cjv/OqOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966460;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2SG3GaStazL3BIGHfCPQ9IHKPtDCiSjabbwFDLgEXo4=;
	b=ms0wERBbscqf/iCQoi1kwAbse5ryJ5tomGWS+xkoSK00BN8P6joHFAvpdebhR32xG5BX
	 WVXXzMOCsTlLJaUY9uw0JUub9iJTsBYKguH+TiNp1Lz4aCZ/jqMmvqFImh5oJ8J8TWF8N
	 PVFQLBFZTO+bRVS8qFOrLbOJEH+A17edIsyx8x2dgOErD9D/DcF4+wUQ1knIsa+0wJDM/
	 rKdb2pzGjW/F5HiZyXdW/hDD4w9F0r24lgnjZoEIA0qrNGkBgnWZyMJ0JGZbVOBxjxouj
	 76he1Qi6y2Ew8hZ3lFlhzY7X1SK4a247qe5/hC8bBI66+QqG9K7+Pl32ZhR4f34hL/g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966460;
	bh=2SG3GaStazL3BIGHfCPQ9IHKPtDCiSjabbwFDLgEXo4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o8RMJW93UeEfHS3e8yMVKJK9lDsO4RwOf0dHnnk3QYs6J9DhWcQwP2x13ZZX0a5Mh
	 zZ9h7gB5D1SEw6BT0paCmnE53na3vLBPLpFt4ZpNOHMYuwjZMa/2D5p//iD2cZ9S1A
	 Y9S9mLd8d6nCdis+tOfB+CiCL6BDaMGax95kXts2JmL7dSRR1vLUTPgmbQuFBKdGyK
	 mVv1YJ/ffvO+HFT2fDzNKphwD693uVVRtN++CqDnT9+SbSoDmJR32Dp2mNyM3zinaG
	 p6INGo5y6izqRKMO+FrqAfgolsjX6h/Me+knGXS4OruPQ2cNjYsWCAYbS4XhAGhiIq
	 VG9SSX5Nk4jaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 625E260645;
	Sun, 25 Oct 2026 22:14:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1433C279
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05E7740539
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oy5xXoI-clth for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:14:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 50FB240538
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966458;
 b=fnV66/9lNEJIvgKlomHHCePENHtkoPMrYz1K77/Rh/zLtNEguW+z72EkHp022bNgDpme
 +ARIpYSO4nsPgd5B7eVKN1k+M2SKxOTY0dEhpPcE9yUGVR/FZXsO++0xvnlH1kGWKgMuk
 2HV+SzDje7TTZMyTvytegt7cuevnM2oCKG11AtTXmJMNr7I0MZkPkBYdMim5l5Mc27NA5
 jebOf6gn1FSvTX3RV8ZzxqfcOdEUpfHedhkf7uTMCyJ7p+GHElDBXJx09uRfC5cb5egLy
 knffea30hLoi1fZLZbIZWh1eVkZlSKmIvG2XghNqg9lzs29R+y8HAaKlofu2KXMjYPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966458;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=THHxSCG5OTPonm9JpGapSMFw3jI5q9jTcJyNv1b9aiw=;
 b=BkaR/iKL0a0s3nKFTEjtPoMxzxj7J/JZ0kPBUgpHAOWu7c4/UM1zLSAyTNCJM2kcmA6y
 X1axZ7ePcMVHrWJ7awIMhZPY7b8E1s5nSXh9anMWKre+Tbnh+/o02Jynoe0F/IdolozZz
 WqYIK0nP+dBk4qJJOKpuK/8VlSPJ0T+rU34TQkqGykWHhOX5DtrD42+OUYefSytikltPY
 GHR0aQLvAbWDDV7o/8Jr3q+rjtCDy3yk3RI74ei1eNPvJxj1G1PKisjuGeRg6tXhlaOey
 5F/0wCYZxMLv13sTrcXzfwdKS8D9dgHv9iWCKHaPTl9utEr+CX6tzlJD/Y3B2KcUntA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TTqom+Ue; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TTqom+Ue
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50FB240538
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966087;
 bh=THHxSCG5OTPonm9JpGapSMFw3jI5q9jTcJyNv1b9aiw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TTqom+UeBVS1/g8ztHY0Aot+2uxPeRJna+rlU//ujZDBTALlYCNPLhO+ac4ocFiUk
 N0duAFDsIJOX9tMvA/+MR/xS1UZ3gF6cNvRJxpOCRckOFFeQoEOQlz43eup8o6H0L9
 7JwPqnKVyCRVZGH8JJzzUnty34V49uSmkmUDKaToRL2dtEnRVmp0+e7AQsfn0QJfS5
 2pcy9al/uNt22UNxjeOdRo+TMBhTXB9rT3MTe/F45KuZ1BVhMTwcc6iR6qbYRJtBzp
 KGI873kX0LrVFNCuCudrxExDAby/DRD3QlavwhLbYSdFy96F8lSEv8kgRFu1L5h/27
 r1FD85r1m3BvA==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 SR5bHH7pa2IpDYGFNwO45WkTvZ29muTEwlPTIKZbCWADYPG8JroNZ0+fY0IW60aQJcg1uCqm5Vs
 5oWdyHulYgVieZ+CRw164XqjjWkiQnn4A4VBfwCNOK0pyadhMLS2g1oPwwuw9zcYdkEi2gNBDDb
 jL5/X41r+MEbY3Lobz3UiqFX9xF3Dpb1EaaIf8vs4VCnaSZaJdIyj6vSrUPThVQeMzNyWgsORWX
 tx3u2zxJ8SgTR+2Ak1t40RRNr4NeetakFOVqta9Zvk2L0NQzvfdsdBDNc52ko3S4VlbzJOHQSBp
 +MNQr4wif+eJNHG/uMqAUDbL6ULwx7tyTOhuI8uRqLPVmEnQdIv7GA38XcwxAurG5KBDzJ6oLVG
 Sz+l7pYAolLmnJWSp/vV6APyMCuMf8kVwPi/BVOMk6XrDoaylXYCYNo3VAak2TufNlHbRTXtzoq
 Cj30+sfuorOALa4zm2qzUgrE6pkTvmRo+DIKF2vhLvcXne8DPbE3nTiwE+WuRU6AC+C1/YfNqGI
 a0v/sbvCiUU0al48iFA1qOWoMU+ESa63wirc8NQ04aP3q17P0K4tCuAmqR+jnX1S9T1OhRe9a5P
 wMm1Nyehq028FKJyaCGFMw==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6AD66A4C6AC0;
 Sun, 25 Oct 2026 23:08:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NF-000000001fP-13eK;
 Sun, 25 Oct 2026 22:07:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Sun, 25 Oct 2026 23:07:22 +0100
Message-ID: <20261025220723.1332924-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 33/34] package/containerd: bump version to 2.3.7
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 0ec2c60874..6a7a36b163 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  b4b407c64e11a22549b14c47857ac0e02e9f47f8cfc28924e9aa04a0adcaa883  containerd-2.3.6-go2.tar.gz
+sha256  5d973b7d239de0e4cb72f6d4bad348a1540a80f394beb03f84a868714b06706c  containerd-2.3.7-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index cc69b102b2..a4fe07c8b6 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.3.6
+CONTAINERD_VERSION = 2.3.7
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
