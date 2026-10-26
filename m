Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480B7606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 06:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lhHfevmC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=msVmkeJY
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4024A80D58;
	Mon, 26 Oct 2026 06:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0hhSchZrLRh; Mon, 26 Oct 2026 06:11:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AC16980D3C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792995088;
	b=DPx6WAeJF2CvRpD0EWqGcg7ZscEDc/xSnYam7wT88BwlRaVukUnEPiWBz21KvywZo2Du
	 N/d5KKrfWcVL9VFbyWgEDcNSL3IYjp7CPDqN24/e337z02AfcgySlhXOeTepvMCujNhkr
	 Y7ohQQJeLf5jjsvf8P0Tk3w9kDPox7tnOsD41xnD5XCdGxkAFxEesH3aNYhPISmIRqN9V
	 JjmH7MUNqXdU96IuqfMUsdjdDN9xcjtqKh5VPLN54ihUiJL0byYXgpayelGkXmJxsdsnX
	 A1EYHo8cjuroAarN3URAO/UDQEvMAb5gDkKjCcnLe2mlYgfpK8tA+WDQ1YfchFwwCSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792995088;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iM0ZEqgQzA+oo8uBwSUHyOKC787z/ZUtPJ+r7bSXYhw=;
	b=hAnNUDnKKnbzW5FO9DCSKCPWwB0ooBTa61qHf+CpdE6xVB5XjNrLl2e+dV8Ezz6YW/SJ
	 S4g9wi6LUXq+eH2AR0fLB19ziCsMLgSI/2rpbpFai17OMSfFS2/IN8iWoQyjhGXoC0qD4
	 xxBXtFaHgJPvU1RlU70MpD0owrb0tmY769uJwDNHKf3jcJpgzjnqFAOXo45BEnl20AuwC
	 RmHizEutez5ar59WLOylfaxVZyU1KjD+2WCT+Xs7JFSTFj1Jg05smBk8t6is2IMApZabv
	 9mTe8ZRIX7+A1F4bp4NvmA+fNGZkQi6OCW727NhO50i8Q/GrlQv3Le9CscdfAN+ljKg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792995088;
	bh=iM0ZEqgQzA+oo8uBwSUHyOKC787z/ZUtPJ+r7bSXYhw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lhHfevmC3rQ8/tDFWLpvI7/4V7/x0oN5UDpOuVmR83gcW9WWP6AiQBa7sPD/U+vc4
	 mUDovLgoRLrePwvezD63CgZFYeWE0iTxGEuHZ1qV1oJPzBvR94kXPcCKVh5qoj7oN0
	 tTtvRY25eg91hLbEjGPTy6OOTnj+xS/cIbus4WIcfySQVbqaJoA/Fg5zBtR9E0CEbX
	 FOl688dig8yYb9BiAcbA/0JvHlR2Es8dpxLm5vM5NNzyb7vaw9Vb7t1tfQK54vOUBo
	 lZ69hL4+5fa6nm56Bc7YTJ4r2Y96hKL1oKhSTueAWfS6syOJ4zTk4fIjC5Ej/tQpOu
	 akdj3XLt9/y3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC16980D3C;
	Mon, 26 Oct 2026 06:11:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 588E3279
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E959405CB
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBJZlBvep88v for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 06:11:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0EBED405C5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792995086;
 b=kkqqD5veuSN5GlO7F3Bp5y9p256B2+rXT/+zVY7hkdXgLS8u9aY6kq4d+ufuNIYkDozK
 dfhD2bGYXpS5IhGRX08oCsK6MR/KT0Tdsa4fIvPXA62D1MfyFtYuzEd4WptRMOq+iaHu9
 0gZdnyAXwa5/pBr25c0TSnLT5OTCNEUnRNHV7+URP8GqNtJiZESa0gf63e+MKV50BeLwD
 jf6mPM0t5cOSY7NMJSNt0Kzat53lgBiFC5jTtptEqyzlm8T8b8BWzVcdkp4vvC85PnZb8
 sc8+127ROa+ORu0jG938BQPkknrW4vAQSXdYi8fu5gojgv0vAU1E5ejctzQKsiG3TaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792995086;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=aWqVUxTwviVCA2G3jiuXXpzZCSeEk0qPyz70yNBxwaM=;
 b=lt/RzGNfQjr+7WEfa4UrqTUaomtGRSTkWp2cAMwEgO7pCi5EH21Ujh7zE2gc0X2QljPL
 BsY7PYETe8tuCQrPFUNrbsN4kjO7Wbc7q9meVlKGlmpANN8SBFM7IM9qIb1+2ujbuARmJ
 /ZBEKWg1976XkA8nS+XWuDxABZ2+eqKyYLgICjM0oBFqF5B1Mj6yLo9a+HkxBNm9Z4rVp
 OykNnQoNDhRQbiiDUfojLvvS0/Ij4AHbGVUywomrJubhEMNuegnuzjdTATlQnaeDKokcZ
 4UGBnqESDih1Rcke/gR6AxIVD5MO5bLjjmGbyZB+qJw+ZJLA980+EKmTIIQkFLP22hg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=msVmkeJY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=msVmkeJY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EBED405C5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792995081;
 bh=aWqVUxTwviVCA2G3jiuXXpzZCSeEk0qPyz70yNBxwaM=;
 h=From:To:Cc:Subject:Date:From;
 b=msVmkeJYx8CkKuhysKP87A/yfJrn7mSIuuRRDN/k/YTfMNgZY/MS2foOVKNLsGlhl
 RZKX0pqMdDD5JWbh61t6rCF2R2WsJZYHHIVfWc5XMRFVU0rVdvKnumPj///EtHajvt
 QwWxLTy4kIMIOuu2dG5EiSHkGOG6Gwv8siiNjwVH8jtYXE6OHVtF+3fdnWYXrIBN00
 67XM3HwmobtZjx0DakZZGp1CNdZVbT2BsB8F2GHUsJSYeMWbl13dRRNTWFO49efFAZ
 VNFi88cA/aSwrpcbqXB1Su6eM38acE/KinXSsLCS2NiIXRvr/76yfOL9gk1ElVRRGS
 zgAATysBvcf7A==
X-KAS-Sym: v3:f51bdf72230551df:Kd8RsIKtWZCFfJ4qZnqq/nOyCZv5xgG3EADRMbnfkvkay
 PIllB13/XJAs+r3j2noH4vKurwvORkWj7BUgRPmUpFoMuMtDH37xa2UXFdwjVdweMvmAhmNIhU+
 iSEkCGPSwHznGBAw6ZVBWv5wIjLAbyDv2FMewUnrEYNDCJ+7pgxA3kzKACRQ+5BhsfSdEEPYr/B
 ftQnJXuqaY6PnsSV+3HI1Gt2TRUvlC5M8Ixj84BedFM9W7YsoobGhYCHxfCnRp9YXNDZF6TL7gk
 SnUGBQCEuUsA3qWsGynZjbDHJjnmRBJm2Pb0gX/KeDHtIQc5klDxIczgvSnWnsiVaLl7/5Zg==:
 pjYKiiwNzDqGfEaHJ2g6BU8IZY8qjwo27hyPZvnCjr+iYtMCKNm5ij7dHVP3B4VTLyvPwPNp7iG
 H1KtFzDJG40fECV4wFtHwlJJKvCUTQ/0FteJ6LCHF2asr//IepUVfacGVh/f6JhAcjhYWMDbRIo
 ONmPwhe6oTQZjKXwoawsG6PUP78H8crZv2o9aT58A5QZpUYy5O4I2W17VDqtOURIDPVyH6s69CA
 vW2janZRZWpTqN+W1bZcMOh4k5yXv27QHTtLPAzImj+ie3KUAfepe7+uKjRnK9wSOt30F3eXOYU
 fhfIqH+oVPsVvcgBBAHDK9SdUHaecSDtZb3QDOT/WtGgQ73tsF2lZi2qQ4E7mRMACCNW9liXOcw
 QegAxeUXiIpDddHZoA5ueSqiXAKMLBDJej1iDkqOYTDntoQMXvt7cpc/QOnTGgRu6CTHiaryhwL
 CdGrVDzdMoNTgSqg6LU+BJ/bsRkHo1BSS1M89pQ+0XUmEuqy7tt0EMtHtKVP+7ZZtLh6xaraW/U
 dJmMuj4uJBD0F39PvRMz8wleBREfoAzECBJAS7BtXA0Om+GExkM7ZHtpHPMbld6NhLVJjtNozyG
 sKHbkskcXo8sZqXLFwM+P23mVztkMXyRJtFoR87rOMFteEJi2s7tuFjUAMXqlpfl+DTPlNYz11i
 bU6fvrnye1niEuaNMtgY4cfyrfiCg1hOLwAYyhvlAAdfFIshxYlSpiWal
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DB7EFA4C6B5B;
 Mon, 26 Oct 2026 07:11:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xLDvU-000000002kO-32pq;
 Mon, 26 Oct 2026 06:11:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 07:11:20 +0100
Message-ID: <20261026061120.36587-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump version to
 3.14.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://www.python.org/downloads/release/python-31410/

Security content in this release:

CVE-2026-115557:
Distrust compromised eMudhra intermediate CA keys

CVE-2026-114583:
Reject links replacing the destination in tarfile.tar_filter

gh-160300:
Reject cookies with a negative version in http.cookiejar

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 20abfb573f..7272555258 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3149/
-sha256  e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53  Python-3.14.9.tar.xz
+# From https://www.python.org/downloads/release/python-31410/
+sha256  de414a57119abef52784d8993e341d53aed635fc2b05c2607d9f98a2c5b72032  Python-3.14.10.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1916982dfe..c24020af9b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
