Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15E6606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 19:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DGizFsvk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=lWXDIjCi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D0636068B;
	Thu, 22 Oct 2026 19:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vboboZSsWYpT; Thu, 22 Oct 2026 19:49:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 354456069A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792698580;
	b=ARGQYFJPWqUTPqY0Smxv9riJaFcamrh8Uv98rp8+/TJNGx9V5ghxIi2RhTs/xOkNZIM7
	 A2HZYAO1vJXV1/D6GTo0AJm5dxe5uDvXYVBaZnEbkgtc29P5mB35YhNtQrhLZy31RVQ84
	 KYXu6fAZ1cJrk75MkXfMGprU62uG2YA3kVNgnmDY4ZQpsHXiY8H0g0IpjWWgW1Kv7OS+M
	 KtN/jLbvRVSK1wu+PW320z2Bck1QCz1W/w8GOLYWlLLcVKb8zRo0TwB6MFRo9xPv9Ed5t
	 bnlIY5gylBMgyGSIVWvSwr+9qXSoHypps1uMffAW7wsT7ks5PB3fLrkgdNUD3m7U6UQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792698580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DXAZftwu9zD8Rxqjj3FV6gH/MVq+HdBZyvDqYVtzKRo=;
	b=LqFF0dgqw/n/ZIG8UQrtk+akcgNkczWtgcfvs9/pI1R4joPLBoKgdhb9sXw1h+ozX/u9
	 VYIP4Bkj62SZtda2QMEs+9bZJ6e71q6p4ZUlNjrEtzvs4PFeBT9pjJcIHnU+jNkiceItX
	 NY9dgNu3SUnKWsujsqHM1JDfnmiBKmL2myTycldx8i3uqkw9AorD2RfMcptnCXIzOVBT3
	 Wu3NNRkMMAs+sn4BARi5e4H0x9vURv6FmeJyF4qgoe+9SOFh1G+ES4a6KH2Z/1Av1ltJk
	 RrwRNA/oouE1Xh2mqm/DMerdkpzFjxRoSoF+hamNGCn8vQNuMf4WzDiSMcQzaEp8mNw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792698580;
	bh=DXAZftwu9zD8Rxqjj3FV6gH/MVq+HdBZyvDqYVtzKRo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DGizFsvk0vk5gxSSvVZWyCoaOq8GABvcyAEGODvi9PYGzjL424uVdixjlRNDTFoCS
	 fah5Sbc6vcR/kr+qLniQgaKVXTTXbRii7/why/fG3+8Y03UqvF0P1az4XydMIhL5IA
	 RCWarEx8DkaELX36hPlCM5qsYVeh/AhvWMyuzf1pZT0sfAMyAVBpRey6YxuFaZZjzO
	 +I7YeqNTGaWp6AUw+/HTnCLHM01IDNMjUbaDgyAihkT0qR4yUjCm2rxBhqJMf5PyQh
	 T7JonKz4BKz5tmjwpJJBQPr4KhXVfbKKpQrygWQqTvRAn47DywnnjwaciRRlte+ium
	 jUyK6JiQ8nAHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 354456069A;
	Thu, 22 Oct 2026 19:49:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A40B63A7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 19:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A4FA4099A
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 19:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtABpyrbXcQ6 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 19:49:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 701D1409A5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792698577;
 b=B7iM/WkXKqHAoKbypIzti5c5x3kGl7n/kh2EYA0XVVHGYxH/b+SjANE6f0IFqqnYqwrv
 w+xZxs87fcxat3nsspjLO9vWQQUNoE4jwYQzU2T76GI41K8QfTgxVA9+lQEs/uT2tHoDb
 5dpZsYOWBV2+N7OQsjNyi8AUJ/zC92EeotlKbm5OCFujisAuR4rTcOqSYAhVNvOnxfTUv
 r+Xv9cGYXwnEJG5SzI2NNyNjGdZCrloT70j5Rr5LoeFVBTYcSyl5vk3iesUWg5eEHPcEi
 19voBso7g00JDjQM01zVhdmAdVPbTmO6DfoXp7t7KqXKdq1+eAQ97G+LbKecNXTpRfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792698577;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=/Q/tQMDALNib+RLDFRMMUaY+3uPaYOYIa+Y10kQ2y0A=;
 b=LxwTFO/L0Va7PvkZ4Qlb3yk8DlXEXXlJfuiaXIa/GzoGwLGsmWqwKRmXxroLk+jPk8bt
 jUVShDajNezPJdTbPwL7wDBVoLBO/IDXXNmky1zA2sVsyF6JvLYc90AhNjsPvZlLslDit
 HDyBiFl2GYPjyhj7oS2gbeQCvBq3QKlSVmJ0F7D+hVa5zK7r3HeiCk9mDvLKG9e3YwP0e
 7C4mX2j2fPnPD1cNCGBZhSZjxruV1mnLV0JbTZGWWCEvLZjf9zSW4IjXTI/+JgFUnL0H/
 yzDNd11qVCsNscbkgKUCycLq/xEsfoJVNruaXb1EMxUry5xanNvyFaUvJe5wIDHqjQg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lWXDIjCi; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lWXDIjCi
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 701D1409A5
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 19:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792698572;
 bh=/Q/tQMDALNib+RLDFRMMUaY+3uPaYOYIa+Y10kQ2y0A=;
 h=From:To:Subject:Date:From;
 b=lWXDIjCiJSnN9Zi0DC0JQPTMOFmE+8E6vmb4fCLhWqcPiku0Dr4IW4nwFI5huGi28
 of6S2L8v2r68bjq9K+U2AErgiSpaKrghCqt02wJjwQScm+I9RONoqpeAX8uZTS6ZK+
 436lvG7VA0RHG5ayCt6aVrqQNBZySW+lAVciWfB9Hyjsu3ACFsi2mqaWYCHV6GGmGN
 znzKWigPHhu8ENBSq0QL3kIxcpRvw0Piz0FTbst/5miF5ZvZkoMO3LO7Ga4phKDRyi
 w42BKmm3NZYa6xaM4M/QiZELs04gNOUT47XEIb2ejmt6DdWKXuofNIyTpsq7aMpxdG
 JOimDLg9rE3rA==
X-KAS-Sym: v3:f51bdf72230551df:kVrIfMo3eO1hjO7C0zOo2fKTW1RBA676R6zT6GFXn69U7
 1/umnJqLYuQBygmpz2bsv7O1QafDWxgTVbYqCaQrn/NJk6NJ/a/+1ba7NjCcDNaDAuDOQXxmQwF
 Sl9Hwn/vKAxUAdWjF+pG7oD2maVZ54v/p+J1uGpQWlkKfqPIFl41IC9f+Q9qluRmkDkja9XevUG
 GJOtqGTMHjcakhScZ4akjIpJZzwkDBJtTftfPGQQV5yCou0g6cbxhDX9Kgx7I1gLtUS+ycGlzyp
 V4qXwNUdVFp2jwKQ8onuLwjy+WXuF/PrPKJtveUrHW84q40YyS+hmA+Bk6QkwkT1Ql8jUQXA==:
 Imjc+aVWkRxA6KfcGWPbaDqLBVMs9CPnEePZirPnSoZ0O7GdlfUCKLI1aIbZm83+kr+SAoJT4Se
 epNrmbwDJmOJQ1Pq+DZOwEYhSYLCaDSlCH1bH6R97wTVFl2kFSkliz7wycRpDKoEjhJ8380/eX6
 rzdc2/R6TYZu7kxZe5/Uke6asjO2eKIK/3MikRYEzFnVyBIXrrYw1bDrLndAHvmOe9SCRN67dQX
 1qTCOb78+q16jGcvREk947AdY8oy/djRY9QpHxD+UMw8p8PpfLZjanWhhbaHOYKqASGA1NbxAkL
 goyA2MG4mBt6nNLpYEayqgNztALW74FfriVbvT87LgcC/OUQDz1xzAOpqjtlMIVUJFqoOWIJWxd
 6n15eXjlTsd7FyyafHDuMrqFfJ7BNcqb44G9nvvBzMqRL7zXFCuKGMHTDEicMr5CuVkdANLM69M
 UQpppIvYblH9NphxBBXIiL05b6/ZDNlKns9AbzZXCam2r4LXcbiKfXmKv5aufJM4NcgaqqiJ7jX
 KH6V5VgOUrrHENfJ4vXu2zbKCxRzUCTHrtoswk3zXk0H7bjQs1l/oT2Q2O3TQvJFalhkkctwR5G
 w+IDdTuR+4cMq5j44TaWpN2O
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7DD58A4C66FD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:49:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34078)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJyn5-000000006zs-3Bal
 for buildroot@buildroot.org; Thu, 22 Oct 2026 19:49:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 21:49:32 +0200
Message-ID: <20261022194932.3750344-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libunibreak: bump version to 8.0
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/adah1972/libunibreak/blob/libunibreak_8_0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/2b49b6b9d86bae231d4e329b0339dd7a14fdb526

 package/libunibreak/libunibreak.hash | 4 ++--
 package/libunibreak/libunibreak.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunibreak/libunibreak.hash b/package/libunibreak/libunibreak.hash
index ce3cdfd8a5..75f0c6a3e1 100644
--- a/package/libunibreak/libunibreak.hash
+++ b/package/libunibreak/libunibreak.hash
@@ -1,4 +1,4 @@
-# From https://github.com/adah1972/libunibreak/releases/tag/libunibreak_7_0
-sha256  8c9a6e121736cd0d5c890ae3ae96f3f4010a19aa040f1dbded833a62a87717d3  libunibreak-7.0.tar.gz
+# From https://github.com/adah1972/libunibreak/releases/tag/libunibreak_8_0
+sha256  9c4fad6e517338a098373acc9f35579ae2c325e6446666fb9ac2666ba15ceba4  libunibreak-8.0.tar.gz
 # Locally computed
 sha256  0c57e2ec42ece17791a75d2f9b2f8e0663181be008667a507f765b3ef22522db  LICENCE
diff --git a/package/libunibreak/libunibreak.mk b/package/libunibreak/libunibreak.mk
index d508f19eec..427f3e6d89 100644
--- a/package/libunibreak/libunibreak.mk
+++ b/package/libunibreak/libunibreak.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNIBREAK_VERSION = 7.0
+LIBUNIBREAK_VERSION = 8.0
 LIBUNIBREAK_SITE = https://github.com/adah1972/libunibreak/releases/download/libunibreak_$(subst .,_,$(LIBUNIBREAK_VERSION))
 LIBUNIBREAK_INSTALL_STAGING = YES
 LIBUNIBREAK_LICENSE = Zlib
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
