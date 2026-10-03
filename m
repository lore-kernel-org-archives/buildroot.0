Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C72ACA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C841B81296;
	Sat,  3 Oct 2026 08:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Z-Uqmo3uz4H; Sat,  3 Oct 2026 08:45:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A913D81310
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017142;
	b=ru3t5KSz2jPbGQTXe0WGzlGQC2itRp3gREpYd6KJcxpnAh7Z40IrLGb8iqZjDEGhmoZB
	 85HnuS3eO0g+LX6BoqXexr1TiNg+ZjurgIQz2Sdgfmv/Tll/mb/e422Hl5s80Vp8acJiZ
	 YWpnZM2o+/iBdIK+FGt4cLX5jR6n6iY3Hlf/32XsX67H52BQBGBYnLuDpeWvM8AeCFQPi
	 W3FA5qIHN91WJu0KqxH9y/uFnXK9evfiqxVQ2JUBttq1vRSfzCL3Q0ed8IfAwEFl6C61Y
	 497saiiodfk2wbhKr4egmqyBJu1e0By4a6O8j8f5ALUObGpakeO5JOEuP8wZk8JHiLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YciaKpJWJenvUDDCNp5dbuk3zhCk2oFzpvXa1vZ0kbk=;
	b=AFkORwMg8lwyo3NeFc4YgxoIkntTFowii5cpjYtmjoDwdpLE9JzKjeJuJKJwhCOOpzhK
	 WzG/4HZ9ILzohvJqUIYWrVOVd1q0Ql4H8PTQyxe3I5M6VNNsNuWwueD1+F55PkjkQG+OI
	 XGQ5LaxGEH9U9iRNhb0Gt040geZKnH5mv0lXqs5+RxePgc9UefH+irFaJhFFXK8k/ahdK
	 dUDT/DBXKiSTF6P0pjv45kXvIT42MOWDs1w3IJNDuoZL12OeLfhlIlQf3brydANvD/bpS
	 4q3injmGnfu7T619kuxCwo80In/z87tptubEJfyo7iRuPMGn/Ev903LghYVlP1FQ22g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017142;
	bh=YciaKpJWJenvUDDCNp5dbuk3zhCk2oFzpvXa1vZ0kbk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=U94yM8GM5t1R85wnS4MZUB/tOs9K4IpeP9Z2l4YqQaTVH08yF4ykI00JlOMajdJUu
	 JfHodyjzh0a5g1GVog7rE9jOzQHgKmBuswT+l49LJ8wmwOawaNClehh0X+Xv+W3T0e
	 ELe7tFjJ/cnOq/7nPFawtgMlUscwXriXqcWN1MXn5WacK3qg6rh814VH9koDsxFazR
	 LnwjPXTnU0evjKyslahKdhSWt+CMs69FHK7e4Jr9ddvtneb3/O1JDzARbLLppv2vth
	 Led9hl+uWgkjeXK2yyHOtLqEY5IuduukciLs2Cs6a0N1NzuO/LZyMUrvp23TQJMqm+
	 g/ftnQ7E3UhiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A913D81310;
	Sat,  3 Oct 2026 08:45:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3305B32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18FF041021
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UafrSBO8DiJF for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 25DD541000
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017138;
 b=ciLLEcG+ltxmVRfAt8ngVvIZ1dcrFcNI1L4mL6baKjwqo6Q5j7lW+ObH+flVNdyamFVs
 K+a2uT4Hp0fqbY6fVjexDm3nAUEx3Wo/cbRxtoIJmNiC1PbSpHlPqCskVAX/+4+fa7hHZ
 b7+/79HvbzWT+GYbAl353EIvRKioqmwk/TxXYUopbDmZ/nd7Aeee8UcgXVb1By45S5W72
 F04dLBuddDcItNwOEU1EHCKjOG4BN3EkPLSsWaWgRDVKAQG3w5si1BPHULH/DC0Vvl1E2
 tjZt+gv/4h5SaVwLQbrVlpRFuhzLlTltYCtCdRNQ7u0nXKdB8gFUSaEncwKs4s6QtvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017138;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2yWNwX0dwytBV4K/id6Jv7OsPdIi5I2QR7bEBdr5KJI=;
 b=GLDJoUMQKhTkaJ6/GN6aox+qgM76lG1fN+eZlRo7BbWOpYUOQ645+IzAXcH5w8DGmhr0
 MIcxkSDx1OS7YB/4abTnhgUwW95qOdrSxKVrYYDQEywXvmN3uPoPtzrcStkZWVZ5JQYdO
 r6UWuLGFB1rpyqrOg11MKJBudKV2F/D984eSAtqQMazdQmFdhkw0LOEXqXfck1a7m8wL9
 3dIhgOm6nGa6yUkH6VE4WFs95IIqNNiIMgi/m4BTiZM1Lha9UQBKdKIjgmvBZ5pRlvS9H
 n9Pacq7YFxH8fVpIMMKoNhqgaLQ/6FvVbcJ3RTWST+3QC6MvCFvDCPpYZqK8Prywj0w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rGnkAp2p; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rGnkAp2p
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25DD541000
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:37 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-82478760557so150493a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017136; x=1791621936; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2yWNwX0dwytBV4K/id6Jv7OsPdIi5I2QR7bEBdr5KJI=;
 b=rGnkAp2pkyt6pZ+KrRS/0Q+F7EZ07GJ0GTW120vjojV6C35yTK6Zzl2NUmXFNko4wi
 Z6+DwwLGg3ykwGRj4tmnWkudRZWsYHmrFEKudzd1IhFN2aE8iMpakNErODpp/fjvkzN1
 mXAC3s1FwkUOKR/C+xI+wP+9Xh4v3v+RxIgb1/N/VTnyUcKwGTTZ5i0mZ1PsbFjBDLbc
 hdE8Z4DCAGPprQYQBjICUyow//oJ5+C9/iSZepALL3Tba9zyGVn/F8+i8G7L0WB7zNVW
 Pl1Ewy7k7xvSho7GwBq+oQlRpOVGkcVNfVFSBqvpZruP2K3Ldydwz4q0U4Qd5cR0a0zf
 7lRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017136; x=1791621936;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2yWNwX0dwytBV4K/id6Jv7OsPdIi5I2QR7bEBdr5KJI=;
 b=H4IVNn8TPQ9snGnFXZYrBAzeRcYXEGMwWBC5dM99I7ii3+SSqulwO4k6pi2RUjnqG1
 1hoTf0CiJtJaE10pwCIhZl1gdUeUb77g2M8Ar1SKW4q6pviMXq6i/c06iTFHhOoO0vE8
 YEwxaWs4U//pcO4F2N2D2bHw20fFX1XAaOchQD8OWZm2Xk9UXZtAszxDRoqcdBcjV/gE
 PriqpZWze1cVcR/ep2ATRk9MHc35TuPSDPPezoLNSF7U6fTxtk5tkSNK+NxnlGhdsgdC
 L0X+rFLs3kGORjyW5o9uVBLdA+kr8Zw9h6pg0gU8sqrXAWfMIqEi3n8+M5IazQYs+sJm
 YG9w==
X-Gm-Message-State: AFuF++mTc9Txmy0/deWXYkYJBKlDixTSpPX/UFLfkfU4Y+WtWEs0lT/+
 P13VMiQT6oQrG4LFNrPZMAT/0WcZKyxnmOF24k+EyR8MgcN1/RrSkAwjAsZJQg==
X-Gm-Gg: AYBFou2bigpz/VF9LaI8c0m2oUbGu5a7pjRVonvcX7ljKTVvRU2YrUVMMaOLBXKtUvt
 SjD35ukaQkDhTyaV1ZwJ20XgEzAwzH1DBvZhpdbo6oAOR3a94X4ARMmLj66kTSKwGQ8Xp6m5zcY
 g/N/Bj6fADVXxsq9gD4W1kXQaszwdQEf1VViNAZlNkInBDDaR1on55KdJPSlswtm/g239OXgCKa
 zgoLhlnLBpHyGa7sRL0AVcvNEXv0P8N8A+gTwe5kE+3nb7jjDtsyfwGorzHojOjw9a2ZnHYvyOr
 OmguwKqxbEueVizoXIG35X++kwSUjl8quITa1KCrPhPIESp4O46LnmwXEbZDh9cQhHdBOKBjSLt
 YfUkMBc7jkUVo+ORJecZTI0nO1ETyH1LQQUSn8P7ZIuKYNpqzw25QXWr7eRcIH/vHHRMwS3C9aX
 lRxHJB9QDWxdp/L4BE1ojBOshojRZwCqa3003Z2uv1iKcMjXesxaC6KvTv5rab6Jju72SK3kfk0
 tp5/gmadL4hWeE3m7tb3b/pU9yJSVa6Gaz4uqzrOEyFpeEfxpbj+sPFjVyjxot0hfg0PzgQsp7g
 +iEuwFmYgQMQBaZi5k4Kegp8mZ4Lvgvhw4xCXpVWRSDXcsnETn75lvMlP9yb4y1ZsCuXQAULX34
 znA7LDbFm5c4S04EBx2nw7YpZEydAsHyhLXCGyCOAyA==
X-Received: by 2002:a05:6830:651b:b0:81f:81d:395 with SMTP id
 46e09a7af769-823fe512cb3mr1794417a34.30.1791017135911; 
 Sat, 03 Oct 2026 01:45:35 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:06 -0600
Message-ID: <20261003084453.545653-21-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-oauthlib: bump to version
 4.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-oauthlib/python-oauthlib.hash | 4 ++--
 package/python-oauthlib/python-oauthlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-oauthlib/python-oauthlib.hash b/package/python-oauthlib/python-oauthlib.hash
index 5ee9a0ce05..5540760118 100644
--- a/package/python-oauthlib/python-oauthlib.hash
+++ b/package/python-oauthlib/python-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/oauthlib/json
-md5  856bc51662afb26ac58b1d7742606b2e  oauthlib-3.3.1.tar.gz
-sha256  0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9  oauthlib-3.3.1.tar.gz
+md5  f1eb96f8a4257d715ec8af21a217a0c8  oauthlib-4.0.0.tar.gz
+sha256  efb274799819440f95b4ab3b818869f1ce9ae26c5beacba0201d1a1b76b54f86  oauthlib-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0028aa4763a8a0b09ca4c68d585263474cf9aaa6ec69ffbef3a31a9eccdd3b91  LICENSE
diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index bbf59acedb..d001fcd071 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OAUTHLIB_VERSION = 3.3.1
+PYTHON_OAUTHLIB_VERSION = 4.0.0
 PYTHON_OAUTHLIB_SOURCE = oauthlib-$(PYTHON_OAUTHLIB_VERSION).tar.gz
-PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/0b/5f/19930f824ffeb0ad4372da4812c50edbd1434f678c90c2733e1188edfc63
+PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/7a/d8/a1bcc8ba112a627f8ffbdc212a78ce18d3ac07e91a5ca65d27918eee25a1
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
