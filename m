Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4A3606A949
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fpMvoKfn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0063480F47;
	Mon,  2 Nov 2026 12:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7Q4UAmWU66S; Mon,  2 Nov 2026 12:02:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E308080F1C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793620933;
	b=NQDHaTS98rcBQjHrq2aBHjzsfUBSPlayzUaJlOMPpHjPu70NID2ZbakOfEOCLh4n3XSL
	 aUFTsyv6shj3MhPyPnt9KaNT8JzTBPPe3lLUEX8w+7de7Y0uFJ3sLRxnOgZtHvSi4h6rV
	 +TrAE7jZqDk11kUTSroTdYG7hao+nOHAJ9NiFZr2Z2ku16raOwpIa8Oo4yLGQrZmT7uaq
	 TjQtMVEb/HFGOtmecNF62E7WiFKJXvZu1rDID33yQAIFbwXczVy5ML+izVX8Nr/sgn7Yv
	 UlfcAhDQAYIE3Mz5EAk3orXn9eX7ZKOoSeQfbiqy4ZKtQoWBkFIGS7z4RmA7a2IZd8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793620933;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qjgUHPmKMcj5cM3bRnc9mi0JFVv5j1uxPDk85mTe4cU=;
	b=YamANNQgWGvtxnXmmU4JQQ+fiQ3hMPJ9PJLj8b3S4mfqGhM6/3NofVdgc4cjYtRmfuSX
	 JYDLha6xvg/0cPdFxsSjZzJNY4nvw6F23LCyZH1EzM/jlU9b6f+anfpagYj1fx8fOzs8j
	 ELLWe7vxHbITIjiipptE78A4LdovOZNq5KENLBHoY5aOEKy0llKUbdFzOdFm3uI5EJMVb
	 MGirhaa2TBxbYikbNEEOVJD+7pGu6eigyXmgIDUJWemuOCJxNSaYJBbZn5cERREJFI0ox
	 BailtaRvO+EMWtu5fDmiqvr6eiVabNqOtZkvKpKlaanSuvO+adBuHKPg1fMz00EZoFA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793620933;
	bh=qjgUHPmKMcj5cM3bRnc9mi0JFVv5j1uxPDk85mTe4cU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=fpMvoKfnIUuybdUnuftwp4rAD1M+U5nIfLW/Dq4xNTW8YupkRe9l2GZEUOnWsu6Q3
	 XY98kDtx53i/4Wk8LSqZwCOsCjaJWkCxMlOwG7NP3VDa/q1gSvkOG6B46lcxUKmA+s
	 hocBn1PyduRzALVICkRPWk8oqnLLIx+e5/2FOTeSWDFYs9/rIY3KrWITOYQhXjQ2bC
	 ooLsraaRsLlyrDz0NlnV5ukMMTn6h2gqh37lDywLjKSBDfYRQ5S9xypUiUWLHvKeNd
	 Nm/03nBnHzKYGRn6HOFQ8L9Rup26oXmUTEK47aX9LoBzLE3oBy/ATGH4w4xa8g76mN
	 Mta0xP+MvWTXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E308080F1C;
	Mon,  2 Nov 2026 12:02:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E403C4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 12:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D582F40116
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 12:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzF0evo4YKLg for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 12:02:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B4035400A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793620931;
 b=Gz/MZmSWuAlshEEoMrUroFg0qtv/YxPiuuPmOv0AViU1fSr6oGpTp9v0YKytLhMPjetP
 kTqN8xoBiZdD3alyOac9plWLM/B4OsFHX6NMg2FFHG0hKMTbA/7GoMHTHD0vX4g4+WznU
 xu8SNrLMrmrF4CzIPdV6oILcfO0SDGTnumaLDZnVnViGsI9IORvpAc4ZNRp3Bn34Td7xk
 Y8e1RFWmKin8QKb0iTTM8xUyPaTUyh84JkvF5PLgPmM1+SfM727rCoAI/NsP12SaGm63k
 iY3n9w49kAV/DxlV95g3lTyDsDOpB7rkHtEq9uPQcxdIrILilE2znwsZD3thO51/Oxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793620931;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=9V07UfF+sUlFcUHn1kwcoVR/zbNdkJviEXlB37K/mss=;
 b=SYH1LJ0X1bSqcibJe9+aBhlifd2J2+SgQO7bwW+bcyyN3VGWqCz74H80wRdy/clK/nk8
 JuQLLt83hNzxWSsqRgNl9pqBmstfuN60BExIcHsRHCGoGziLfr3IF6JL1zBDgnWeHuUvY
 ynF3lBkmNYE8owycjyCKeSLUO9vi7USDQPg+y+uwsLjFjqLHbkMVRBIx/4SwUcdMAN1TL
 r4qOqbMYO0WvziMxmzlztm8Zj5b8GoghmicRVStX99KiDkj3foHJ9tC+JndYgi7hWkS7Q
 5FgRzjPFLXgoLG5Y4Lq+h1KtNGs5I10T3Rv8bW8VHWLKRtE+2mTUugLLhkmm20hpjZw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OoqBSUsi; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4035400A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 12:02:09 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so27326005e9.1
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 04:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793620927; x=1794225727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9V07UfF+sUlFcUHn1kwcoVR/zbNdkJviEXlB37K/mss=;
 b=SJkVjTJEw/mXJ1ZMTgS7WzE7rkaUI0xXpSTB4xyW9kujs5ypDHlASSTvVL8uZif64w
 CkAoVujSyDm+MQnl57Q6ZOAPbaSANdOCoiOquDsJ28C7o4lKqUpVb8IsJV/rB/o5xVHa
 CwT197hOv3kEA0bZvDPfk0NpHJKuknOm3iLyhl2sUFzqQGcUyU6oZBWLrg7Ceo8emfu6
 eyILgqscdBvbaNJFFytxk8hrNEZta6FP7DnA0Ak8FA7iIdDU/vlB8yI8nozH0mF8tMIM
 V+HWlx8Hm9EOIT5FsK6u9r2STksVNHetI1Z37KCNqqjs9KMOAfA22HxtOYQI0lYIuFtm
 0WWw==
X-Gm-Message-State: AFq9FYLXomAC7BpbLWDuwupuG2KmSGsvU3GM7BnpR3vQHmlXA15rYo8b
 pfEEmdhrcQFohmHaLVbXNKZCL5iQn00yN72Btw/72ELK0ljrHPy8ohkIb+cHMoJVXTvzMRyn/LA
 t2KTq
X-Gm-Gg: AYBFou2ZsGqIxoZZYSCXRNNU1pFsGJivQtj/9yLOP9tCxuwpBSjK8Q3xuog6jf8ZQ/s
 vWficwTdVkZLIkK6jWBMQ1fippXityoyCn9cJyiUJ8wTjnxyWA53heOYq8B9x7qJE6ddjD/rZwq
 5qvf3s/32x++/Ex4JiU3YLkpvp8Y9CCBlGglaHiVUSxFWudTPetNo0uyN7CI0YZaUPIixCBIF6L
 Z73eyXt5UIK2/ze85VpnpQ3tspSFqrRxDtD6DZaIBD/f6qKjptV8M1wHAvxeHph8XQYPBek56Qi
 W2N7/IXe/BRH4VAgvCvKbGm4AGQo9J4Dk7pdELJDYb6wNRHUGG4WVLCZLv2cYf3GhD4tjH77Bj5
 nj1sKO7JAx3YN/crXBSh0SnGKQD+lHGc7XAVti15nakULFpP30yn+dxqI97OkTZx19Noo/O94sV
 zGggcXeJMi/3wRP+nl7Ev+i/6Tn6MReKJBUjauVBbIDVgJ2iKodOYaaVCZUZREf2ZIC8FNHxr+Y
 nNro5K6FqUUy8qSPgyT144WMxFk0YXpoXPi0x6SeijofyJjaA6T7taF3WHQTTQi71z7OiFCGa1S
 2IttNLsp+8roEwq589k1MX8AFRf5yuTwU+1IGGsgftZBYLbTzcknfzhbQmaIvE2lrYtVl3Q08p+
 QYKRMM54=
X-Received: by 2002:a05:600c:34cf:b0:4a1:dbdf:17a8 with SMTP id
 5b1f17b1804b1-4ac150b3d01mr235183625e9.2.1793620927051; 
 Mon, 02 Nov 2026 04:02:07 -0800 (PST)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf368bff7sm271107095e9.2.2026.11.02.04.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 04:02:06 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 13:01:52 +0100
Message-ID: <20261102120152.1902999-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-django: security
 bump to v5.2.18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Manuel Diener <manuel.diener@oss.othermo.de>, raphael.melotte@mind.be,
 Thomas Perale <thomas.perale@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

See the release notes:
- https://docs.djangoproject.com/en/5.2/releases/5.2.16/
- https://docs.djangoproject.com/en/5.2/releases/5.2.17/
- https://docs.djangoproject.com/en/5.2/releases/5.2.18/

This fixes the following vulnerabilities:
- CVE-2026-48588: Potential exposure of private data via cached Set-Cookie
                  response
- CVE-2026-53877: Heap buffer over-read in GDALRaster
- CVE-2026-53878: Header injection possibility since DomainNameValidator
                  accepted newlines in input
- CVE-2026-15307: Server-side file-write and request forgery via spatial
                  lookups
- CVE-2026-15337: Potential denial-of-service vulnerability in
                  check_for_language()
- CVE-2026-15830: Potential denial-of-service vulnerability via nested
                  geometry collections
- CVE-2026-15920: Potential cross-site scripting via URLField values in
                  the admin
- CVE-2026-77050: Potential denial-of-service vulnerability in
                  get_supported_language_variant()
- CVE-2026-84429: Potential denial-of-service vulnerability in HTTP header
                  parsing
- CVE-2026-87890: Potential request forgery via spatial lookup byte values
- CVE-2026-87975: Privilege abuse in model formsets with editable primary
                  keys

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 8121d67796..9bb445877f 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  9db6f4aaaf130e3f53a4c5255c1b1bcd  django-5.2.15.tar.gz
-sha256  5154a9bf84ac01dde011e367f355c07dbb329532e06810dcf3ef2af269e236e7  django-5.2.15.tar.gz
+md5  37d9504be21272595b91c2aa3ef4904c  django-5.2.18.tar.gz
+sha256  461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d  django-5.2.18.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  a6fa72074c31928128aaa18162204507938b7a9a8b819bd833fa82467441800d  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index cae4542099..a94853c518 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.15
+PYTHON_DJANGO_VERSION = 5.2.18
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
