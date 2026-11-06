Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794C9606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PW64r1G4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQPPUh2u
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53D7B81488;
	Fri,  6 Nov 2026 19:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkFqv-9fpPcx; Fri,  6 Nov 2026 19:16:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5359081314
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992601;
	b=BFUKeLKPqvhsLSt/Vg9/CZXfteSuLDSPxv0tt5bBQKf/EbpryVDeIUW8ouHEj7dZ9RcH
	 iCZ0nWEAGc3XtdxuyPs01iFMsV71PuyQceFebJoaAqklHJZPK7+IWPiZDkRu1Y0PummsV
	 4Dni7AJILhUsqz/AqC4O59QONCdDsropQLw8+v40miQdpRqbsZ7EMMdkZ+9HRtxMVwj8D
	 cfi+5/9KXJTt5zXYcuQjZVw6UbkHQrYTBDMA/x3wmTEhGZ1gEAB1twXYORESpJQAZhs/R
	 W1XprMSU0uwOSDPBQpLEYY9brsJKJ6wQeOXiUZMtnyKvi6hxGrZBXqFZSS+/xW+dlQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992601;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Qh82yOGcQwAO/kAXGSODJY/VABfDpIk4uK90aZY0Uu4=;
	b=g90MXd42Q8bCcwROBb6p9wfNN0I9WPcZgLi5t+GCpJg+h3NXyFGRc+bSygHosnbwIXRx
	 tR2MBVoQ08UOtHQ4jv96VBpCF2aRfydhUonMYZ/LEuFlIJQl1UmkB8LQfX57DWEXQfDh6
	 XHJck9Y+L3rFmE9kVo/f8NYtOzo6oF//pk1lsnEvShY1dU+UaaBwUm1VF2yZffe8PLyiO
	 YGxaX/63ATKaZ4jPL0Fl6L4u/ahMf627ShWr2cTdWPn+E+vWD2vILfJj3A1tEMY0a4bHs
	 z4HXhJM3zNtNb4pFV1+B4i9dT1/fgzr6cB5n+7SAie8MAnFoIEhPhRWNLjHQVVpkZxA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQPPUh2u;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992601;
	bh=Qh82yOGcQwAO/kAXGSODJY/VABfDpIk4uK90aZY0Uu4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PW64r1G4oKJyis+U9YFTP5RyqKzsuyrQryes0ALpuNHR5/bOJWyLLy9w7YIid4CFt
	 SxPFdXkp+fY/QvQ/VD6KVybhWFMlctV7N/CFNnp9IeHUTeULmBrTrAFl/TvS+mErfz
	 W9GssqW7ZeIxNwH+txgouH56BWHHToAjyQCQFTd1eTTqLKVI4txBiTX359HQXThzT8
	 YTN1wrQXYrt8m/Lc2g0vcCbUjgEU+ehcZonuTZY4UiCS5s2n85FjFT88thHAmHGhv4
	 E4AgL9u+1SfILsfOisn0ILYPLqfXafVlw+3aYcwCZ68tosZPE/bzC31Ox5pT8d9Fwk
	 pGhlSKT8ov0AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5359081314;
	Fri,  6 Nov 2026 19:16:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 178CC362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1F9B8130A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABKSIuinZ7ep for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B6338140A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=SQPPUh2u
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B6338140A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:33 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-84d5e56f876so728024a34.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992593; x=1794597393; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WMVAgvCs64EXCvH3Gk0fJ9PuwAK9rOKbRq2Ld5SvN+c=;
 b=SQPPUh2upiSFxCFsBNH18gtdg6n9MOy/HYquZ4EXKx4IWo5A1sxl4lkqNYZG6MT7RF
 n3joe5gPdOLrwD8ldOLI+HAcE6IAXMzFOepaWGRx5NoS3WA68QiDpim96ktppo2YXE6K
 71xoRmVjlUVCd6LxJUoGdAuzCxa/Z1Cuyhrp5JL6kr2XT6NPjRqfdT86EyJCocNZPPoE
 LCFbmHVOCm4EfB0UVEFpEQYt+nxb42LLpRdqcZAlRX1F4F3LYq8GdFHcWP0JEvXEdjc+
 jCX+Hj6hYCIDb5xZrVR0mkTJwpo0WnnCRqRCOoWP33HHRVTzVni+akxo/bUm/50+gt7C
 U6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992593; x=1794597393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WMVAgvCs64EXCvH3Gk0fJ9PuwAK9rOKbRq2Ld5SvN+c=;
 b=S7IWF9oTH0ouBbp98lZ4jISJjK6CUvU3jkc43KzdBHsiX0Jot+I5kz7aBx3wJIMsRh
 /dfoG3RQcnE53tR5ZFq+nfvxii8HE2tco0Fj006UCw2zSjgbBzivFq9eOlCUKJF4kt/x
 WtvNPVhdBHTmJi6MZfaqQseaTGSvWVHFIRvkqYQnRTsO2HFKRw1cQo91k6aMRFlgA+AP
 IVYcUoqT36nisfaMYfVKFmIvY97GawDDaf5U0M07zbJTYIiHKtt8jQ3yBgO3ATRDodDl
 GNVGY3rErw/H3WbXqqkcff+pBvXDLk08Rvl8ERXRMy0GxtzjWhPodLXgMd+EjAQJvz6d
 1J2Q==
X-Gm-Message-State: APuU4Z8bImvti0Ls9oprsrAA/OBDKZzXhkJTzLSx6zKeC0gPlVWoA+bB
 4ObW8T1g6tzfo7OllyID6CBTAT70i/0p/9eFkuJ8UNbEs+VC7rpQ9jsJGSUPXw==
X-Gm-Gg: AYBFou1NFEh0yXeTNUqlA1zy180/L7sXoKocNThPKo4Nw4qENSHizpLP8BK2BkOvYPi
 Oslt4Lag+Xi9MirIsK0dUTJkD+UGnvlbNHCfitUv3GDKkuFfy2TBASpfHKFvT2v31mLHDfac5/f
 89eH7CSnNLkdwoxoagZ4CKjbpL39T+Nay6C8lNJZvEyCCZlbIl5eg4jsiz3aYU+s21Hqpvz5Mfj
 oVoAcV6LIBjLZODwtqj+EViMSb0wU9geRkk88uT3Jp4nDihSIZEAf7I95fFJfyRFA0nfIYZajSj
 4bi9lJzHhZX7mVwTrP8RgcxHtxzWmykZ/JPE3ADNqlhamk6vlW/uWGYsVNeCIED+XT+X+wCr12X
 ZnBTI0H7dh/4o5CrTc7NR1maGuNCXuQt3ys67pqNBBm3eyGTJVenpa3kzkt+ZOd4gcuyDbRf3oj
 N12GFPwKIEQjMMv09nUMg5lmn/POB0st+6wY16CJTrb8lkZWG1EtX6BNOkJiMs/e9ogFecQTri1
 TBz/JiuJbGk/pyJWeUrjWUG+6rOtc2mH2oLX7/UmUlGg5Cu9Kg2kGL7AIUuotHSl8Pa89BcIV6d
 L4wtw2EC+J37fnzJ2TUkyolbrBFnmH6ucYCpD7R8zDUiybcDYXWCtqmJFqAvOypR2PUey8Ib7sr
 pXoJgFEolI3c3mJ4x1aZ7O3q3RyMmU5cB1B4XXiNLe7lQrLFeuNe+FsnIP2gs86i/TPshGKN1iY
 dV/xQdP27NuohTykhcd65wXTl8A2A2jVEDj30cWo8UPITPKeiA6GzM3Dh9gQbmud2+puNglN9F5
 g==
X-Received: by 2002:a05:6830:3114:b0:7fa:ac4f:79a with SMTP id
 46e09a7af769-85f1d0ac516mr4089004a34.22.1793992592876; 
 Fri, 06 Nov 2026 11:16:32 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:55 -0700
Message-ID: <20261106191536.2120153-29-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-typer: bump to version 0.28.0
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
 package/python-typer/python-typer.hash | 4 ++--
 package/python-typer/python-typer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typer/python-typer.hash b/package/python-typer/python-typer.hash
index 463df2bf86..b13709f74b 100644
--- a/package/python-typer/python-typer.hash
+++ b/package/python-typer/python-typer.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/typer/0.27.3/json
-md5  d1883b55e7e3f5f7b5891513352483f2  typer-0.27.3.tar.gz
-sha256  d0396f770a560ab1b0a8504e13b5f254b728cedb05c61cf0359e944e50ce8901  typer-0.27.3.tar.gz
+md5  75ca761a4d63d04fb0ae9b20c1c49be3  typer-0.28.0.tar.gz
+sha256  69ab84ef79fd601cff071bbd2566d855ecadfd93adbc4b3360b9924359bdd857  typer-0.28.0.tar.gz
 # Locally computed sha256 checksums
 sha256  58992cebcf8dfb6e40c4e2112ed12126c243666dca3912a3d78b7ecac4859d49  LICENSE
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  typer/_click/LICENSE.txt
diff --git a/package/python-typer/python-typer.mk b/package/python-typer/python-typer.mk
index 44555488e6..b03d3254fe 100644
--- a/package/python-typer/python-typer.mk
+++ b/package/python-typer/python-typer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPER_VERSION = 0.27.3
+PYTHON_TYPER_VERSION = 0.28.0
 PYTHON_TYPER_SOURCE = typer-$(PYTHON_TYPER_VERSION).tar.gz
-PYTHON_TYPER_SITE = https://files.pythonhosted.org/packages/03/51/d33db42cc72ffd8c30777547b42d01f0cbf9d95a770457698d0174b3ed71
+PYTHON_TYPER_SITE = https://files.pythonhosted.org/packages/ad/8f/21021859316f44289101638dc74d82e13d722d8533e4b8708a3ab7c8461a
 PYTHON_TYPER_SETUP_TYPE = pep517
 PYTHON_TYPER_LICENSE = MIT, BSD-3-Clause (vendored click)
 PYTHON_TYPER_LICENSE_FILES = LICENSE typer/_click/LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
