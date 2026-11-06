Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801A9606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OjcHKqee;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K+psHwAI
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59023608BB;
	Fri,  6 Nov 2026 19:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXGmUakwpKiM; Fri,  6 Nov 2026 19:15:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8034360744
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992553;
	b=hZcKh9dGpSQYfHR9Q6joc4tlTJa+QWVnHsr0jgFaY8r1S4bdG1XJBsoPpMXmq2+frpW/
	 AgJTm6V4IjCM84VNy30bKOYjAsKkOVZQJYCXmMpvRj4DbihFedH2dORwu74npYtVM5189
	 0bSmrlS7uD9SP/qi/+Tl9qTs2xKC7w+vDMdmyhk0CgSagWnOP3xf16FOW+VG7TXA8TC0t
	 2eC4RRoerIAzMNfQU060ErbtRgj4WDENP2eJmvDysmuD+S2BnfUaApU0+oB2QjgeJXjMY
	 FZWEVJKu6q8NyNYhEioQCxU+bTzV9P920fMtszSEc4bckaE43GzfZU+D/2zyRfX/9Mw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992553;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CLhise9ZnEjGtfVWuBBgWHkEqFav8NBS/Q9GPrpLvKE=;
	b=W6thu8qN8F/LqJbyxfrV5EE/jmseGQX5gygpK5naLFn8x4Y/HlotfPSZG2ELcBvfAlVN
	 d9eGKHrHWwRKobatYy8zHQytdJP/dRvuo/pSoctVBklVYK0Df709d7/8Xj8VG6aj/TBKx
	 7m8kbEQdoZWo3d2xCf2emls8KA+gRxTUMUktXDJoR1AInPCOHULYwBCxSuaNdTjX2sqpZ
	 Dn7urrzCrKUHaQrJkE+10z4VeKpk3GTaKr3WdOHWE+0eFBHoxaIzpNq8KDRJXMuEFppYI
	 rnHO+sP+vsaRoiSNFCut/+G5nxHwcC8ijIL04Xz47rf6GdEdF4BoTqoMULNTrn4l3dw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992553;
	bh=CLhise9ZnEjGtfVWuBBgWHkEqFav8NBS/Q9GPrpLvKE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OjcHKqee2QtsLgKPuoEyw1Y7mg5fbdYgjW97xEGKHP/z9LZPLbVV2wO0aFI/MZaf9
	 lJ+dtryhZ8E4LUXhjAKpukVUIxAjwFVOHIGGdKwTPH4Ab95dLEYmHGTkmFgFcb9O+L
	 fveDgFiThDr8AazWWUkh1gDmHDLiLPG984P1vj4vj5SL6PGqCSigZ+QVo5UpFRSGOe
	 TIhZDd4Wu6wUWjxTh8ZsDfYB8ShV7J8n8bu5HjrvjZM6fIJdKCptwx9w3/FiNcOhxf
	 DelWaJj+IvpFCy8X0ZeYmOQJ3Y4mFBDMHQ69EFPLEEHK+fU94BN3vghx6g4By5628C
	 7wFYcog2MN1Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8034360744;
	Fri,  6 Nov 2026 19:15:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9E084B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97C87812D9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-imhdk3CxhU for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:15:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B562A80BB6
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=K+psHwAI
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B562A80BB6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:15:50 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-8451a619da7so662737a34.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992549; x=1794597349; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ymFA5LpQVWWcYSd8Y2MHzSAp98ApiqWuPoy3ITRAv04=;
 b=K+psHwAIqJnrEx+A07ZPgHZ6HCVqTIZ+V1XFy//m/cm5B/ihQ1z50VbuMuGv07G45t
 NXCV8Muz1eNqBVurZZ8NphSpJOGluDTstC0VAaXP+B8uh+SKDRl5+m2ZvrcYvfHxFaeq
 PucGOkfOeZ86ojgoaI36m7fcBAXFCiJFmwDyKSFKqG8FbvXSMPlP3/RP+l4RSiINp2Y2
 C1Y55BbnisubZSv7aWGb4uN1iy2rXg9h8LuXHORuJq0vlRIQw6LVyMkymz5S449oK59E
 OWM8PQSKYHz2TvUz8MSbrqcpoUUTnWkAZz/QSOVoJn1wPQOFONabmddI/d6xieoZ7DfZ
 668g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992549; x=1794597349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ymFA5LpQVWWcYSd8Y2MHzSAp98ApiqWuPoy3ITRAv04=;
 b=YESoPZvWQuwZxor7tyj7AwLnZCuTqXRzWERodiUoGWdCd8fZpUFzbDZH1EklVEG29r
 h3JBXi8oGfPHrtONnrYj2ej/X6fPtzbb5MQeEOG2Er2xM3Xoe8KYciQJvumpLWDhz1PY
 HOT8zG80HgLTWt1dbcY0RDtvAnvURf1U/FL1Uo1ckYtGGYM4dOifcriz2c6cc7c86T10
 jJaEWYFM5i/NYteCOQrgdcFn3q9iJwCAkH8r7miN5+megnMr4qpEkUE8hA4Ly+g3110C
 r4xfDAEXlRAmToDkKADPJ9R7eyFPwAhF7k2aDLWJTxBQ57QXQAz8ARVvuGJzxZ9N+gHu
 zQhw==
X-Gm-Message-State: APuU4Z/cHyXR6W5ho6VcmeJNTXqAIp4Ijq9tfCf4K+0nKwr4JaAHQ/Fi
 qQBnDeaQl2xLLdMW7ai0sK4KsqW9nPwbREnsOAXyyq7vuChvfddzoH4E4zQFOA==
X-Gm-Gg: AYBFou0e0guL7Att6/q+Avu0T7GT6lKZkquQZZIARDJanhZZdQiA2DNCHOEtJj1FCRw
 2wrcglcFf/BYC3uXIo6DeIaqZQsn5aGlklhBg2uhB0Frozye6rRb8WCNUuqgDIBOkw4iPWHn1VA
 7aGEVBGhmbm6TDBVAvX/bfU4ZRpJ0TBDKTmgBSHpe6IajTllgMU/cKvkymrVM6bIEZhg7/bI9Mm
 VlSI3kNYoRGK8Sgu/bc3sIO7pdTLNc8wdZKm8psiEGeRT1OrZMoWGeC7hBfHZjMg8ZQRxuGAgMm
 Ffs0jCLYes6urKH+dnPhAqvWA/hhM1xbsPo5b8r7lS2J7qlGgbwInktwelWAVf5r4iok6jv2ydA
 rOBfyd8830Jmm0qSBpRkPrljgIPWmvdoXuop3nD6fkFOlEynZyKxr4iSXj5uGhyF50Z0WOtnXw5
 2gQaCObN4WnBxZ0597/tEVZOrNeRVpIU4zpdW9+GfB2fPPdHmoPV2P+eLqLTdzi/MWiqQ+Iv7xF
 A/ZPxzTH4gcu3aGJGVSJl+XG8st90+Om+o9xGeG0A+CAUsTjILx+KwTbnuO8RKskiI/IWAQLhS+
 eKnuFGz7boqKAvy+LypWig/6wmbchcQDsKBhKzVixS78J/58f6Unb+049NJPxqxSzv6gmNvgcQ9
 Or1Skw96v/GBVjKP+ILai8kVNBm10WjvyXlw6LtBBxIH5uigfY4XkiSa3QXYS6/axNbwvQkyzEX
 05x9BD9y7JDPYd0S/wRFcxvTNwKSi+IFiwnaQWQBgt+Mx3XjucQY59LWbeoagj7agDYBk+wKTIJ
 w==
X-Received: by 2002:a05:6830:6815:b0:843:cc20:9d03 with SMTP id
 46e09a7af769-85f1cf43d24mr3209554a34.6.1793992549475; 
 Fri, 06 Nov 2026 11:15:49 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:15:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:28 -0700
Message-ID: <20261106191536.2120153-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-autobahn: security bump to
 version 26.11.1
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix GHSA-2gqc-mwv3-66rp: the WebSocket handshake parser accepted
non-CRLF header separators, allowing forged proxy-injected identity
headers.

https://github.com/crossbario/autobahn-python/security/advisories/GHSA-2gqc-mwv3-66rp

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 50cac991bf..0687a6bb80 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  cca33159d2dca5f56c7210a3f7a98200  autobahn-26.10.2.tar.gz
-sha256  6c69fca89106567060941c5568e67a5369738813d883db4e3d62b76f0a2c497e  autobahn-26.10.2.tar.gz
+md5  f920b0a74a14a9e048178cb5958db98c  autobahn-26.11.1.tar.gz
+sha256  1a081ca27ad5a0a04d3c7ca07b2caa6d324b8004383e36ae6eede1d5053e23b0  autobahn-26.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ff61657bfe1984c96d932fc0423268097b4b588bc57d47c26e8d680250d6c76d  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 4ef83e33bd..4ea2cd5a98 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 26.10.2
+PYTHON_AUTOBAHN_VERSION = 26.11.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/e5/84/8ea0607facb3c97a3beae3c767213fc716f9ab2f157570dc5aeba1174730
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/08/15/694ed91f8f28d8c74b424a8a80208d4f221c12ae5d2fbee4d5041cdf1d0d
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
