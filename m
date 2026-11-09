Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A6E606A325
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 16:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=POpOtFcv
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DDE98100F;
	Mon,  9 Nov 2026 16:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6O8XrBPg8n0; Mon,  9 Nov 2026 16:19:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 87B1080FFF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794241199;
	b=c6r3MYyFztG4ji5I+NhGkFxJKnipbrwDnkQtUAvIs/IGwnx1p6h1niWWWWBcqPl7qms8
	 VSa4fckPbu2287adoZyVMh4eQN/k5/BZ7P5x/YBAEKUil9m7xcA5vnuZQd3ziPxGPiMWP
	 1ffxbgKBnhRgn37v9IRwJiWz9bGIumbaNw3+3YlRaA0iVU8+rDlrjBLZIwnKsNft6Z0fY
	 c0KvHgYOmEkIdBMKZl+RvqT5vspeAC2M/kfQ2vxziHiOEIDyYeomu0izzHvlD0rMEPY0x
	 VITmXSIQN5tUxUf8jlOHF7vdWjZRbrInBHwB+Ji9z7/L5endkE1ow3v3RG2+N9VcyLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794241199;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yhiUuO/7prYWGFdiojs3qLvGPfQ8aUBiHXDnUFNoLC0=;
	b=kIvBMKvEpePt4ldVnVMzoya8q0ATIW4U/fucKIyYryhoROOJUlETKgJb5VakcytxNgE2
	 FHfpHmR57qZjwBG/zKLVAzXu+sYb0uWpFEMa48C64TFDruILCvH8KZLE98MxzWwE1HzTK
	 IN/1MHvjLDDJpxhHht1ac9QGgsyPdzhc1UYmkGImhnn63nsu3/9bxWwt7tTZCbUC7b5vo
	 WBsqhFZBypK6DLvZt0JFWzufypazm8FOVxDaq05QBo0uSjNT05YN943+z9dRn77a4o8Y/
	 YAJiuH58hJ/JcsXZDrG43BrQ3tRLm/Q4Luv9Epof32s3LEBYJsymLEs5WHlylJxCbNA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794241199;
	bh=yhiUuO/7prYWGFdiojs3qLvGPfQ8aUBiHXDnUFNoLC0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=POpOtFcvP610ytngvcMY0Orja2/n3W1s2Q4SsKJs0JrR17TDC+jfCfewX5bkymh27
	 UA0kBDBdmgCn+8Viqp+HyGvvUk/utB/HV8XHb/boHHhPMp2ZeRitW2uD06xu2+DzKb
	 piVzmUA4FWgPoiBSvAP/LSrVYd6S1dd5JXfL5fjggI9hP/zmiUnEF2Ytulvl73rQ1H
	 UfqeQunFMhdhuqCbGEFkUvLFZti0r2OZdxIvBwF1+4y05fLMMX71P7S/D8/rEPd7pM
	 vCQtUq5q9+alo9Gl9Y29MNdmem0oDyt2GNhQ9rj8rIW8K5yFhLTikuNi2sbzibc2Yo
	 CghRoH1hIa7sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87B1080FFF;
	Mon,  9 Nov 2026 16:19:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4C7B111
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 16:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C62E18100A
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 16:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id at5B1hzRagkB for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 16:19:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A171F80D80
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A171F80D80
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 16:19:54 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso7380275e9.1
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 08:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794241192; x=1794845992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mzWc0iSIgpvDL+sOi+GdR8sBK6PKPpQFr+DxLe7CZ8o=;
 b=E0dQJWBu4Sz+Wv+r1rWyrGKjtB7oVDk2fqslyyjQHxOGXDM/qD+MAGtNgG1Kl0XFTw
 C7IMLyEREtK+BGGFa2DVY7JnPMmjADE6Cn6ZCNIxvLBfNAmf38Ed/hh+IQpLlPTpAYvr
 oePEk8epOX22y0o8lzsCJWzf9O1RHmadSM2e8Iocisuwzi7998+hA/MXU63bMo+U253l
 ZUSL8P459BmXEvBlxMRg3mutnyrizJuKo5Z0SAwZEFu82JU+3Y3H/9J2Z+yWld1sJsRx
 Q5zpv7CVadrTxJ17Ee1LPrQOWLIOGm3wOV09UZju7FuEWKdQvC/ZcpT1Syz8PZxUsEjM
 iO1w==
X-Gm-Message-State: APuU4Z/i+krmcG+Hf/msTkdyhgH9UZf42fsVR3Cp3QLL4Ph0Vhyh0RGF
 K/P3p+2P5Rj5RCEC9keWQbK8lh0WeI0/hKbzoWyjUCOfPob0wscDiHFKBk+ePdma0hE62XCeStN
 SvaLL
X-Gm-Gg: AYBFou0UOy6gNrPJmCsAMHfIFdC2d1xfiBMBNGSILxwkJKcRetua0uHKJvI8D3nUtYf
 r7lPcNyrTd82TfHxCL0Ml6V+o09I5PbpP4Qit9ncx0+QLqtZ/rOL6G0rOugqSBzEyr3G3z8bf7G
 k5kvvdnjESKIJsVm8ApNu4N/S0FCLuUyfUyvqeZI1a5YcR4qLWZ7Q73LsQVwz4P4KfXkVxUkZC/
 qsaKIVso5uh/Z7p9WHGxoB/8KhHFgfe7l8lGsyi5tOpth0IAau5787+6lrL6SICqxOajYT9ddGK
 2TqXkZhBAvBquenOwVhE4/a82bKtwTcoruhx4BwC0lME3Gik/LQL0S2+B17zoXte5JxVBNXwoVn
 addmuUy9JZRSUxCCsqgecj1MEJSNvz1J8huuc4tXXXINir2IP/oXzUNxI72rDMZ8oD0nE+COlgG
 Dz/aBl4K5LrSMsOtCOP7FxqP+9D+elAz5zuqiR/ROz6nG2X60HBREqUVG/WtXuE1F6ZYXABThww
 Lzh5l4+H8wQIuCpD89E1f0LTeXKcKV80EIXmDgEcp2kw4XaHSXr/550sAVOTMxXKtu/SP9ysKJe
 xmjiX/9HDUjWfRz3YudAphf/N9GfNrPeXIJkzzHYjdU=
X-Received: by 2002:a05:600c:8b84:b0:4a1:6517:ccf1 with SMTP id
 5b1f17b1804b1-4b960d9c6a4mr77181145e9.9.1794241192366; 
 Mon, 09 Nov 2026 08:19:52 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7efb0b0c2sm220333135e9.8.2026.11.09.08.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 08:19:51 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 17:19:49 +0100
Message-ID: <20261109161949.714131-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109161949.714131-1-thomas.perale@mind.be>
References: <20261109161949.714131-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 2/2] package/python-django: security
 bump to version 5.2.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Manuel Diener <manuel.diener@oss.othermo.de>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
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

Fixes the following security issues:

- CVE-2026-108147: memory exhaustion via base64-encoded file uploads.
- CVE-2026-111211: log injection through geometry form values.
- CVE-2026-111362: SSRF through GeoJSON coordinate system references.
- CVE-2026-113593: private data exposure through cached Vary headers.
- CVE-2026-114582: SSRF through SpatialReference string input.

https://docs.djangoproject.com/en/5.2/releases/5.2.19/

(alternative to commit 5b5c1c9b6b4086a405a5a2a8f3aa64e018e3697c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 9bb445877f..30676ddc60 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  37d9504be21272595b91c2aa3ef4904c  django-5.2.18.tar.gz
-sha256  461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d  django-5.2.18.tar.gz
+md5  48e88356608f080fa460259205e88487  django-5.2.19.tar.gz
+sha256  ad03d8abc51dbff95ebf34b27123cf0c26a3b62db7ba0cd520783686362533d1  django-5.2.19.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  a6fa72074c31928128aaa18162204507938b7a9a8b819bd833fa82467441800d  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index a94853c518..d36c6b82ce 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.18
+PYTHON_DJANGO_VERSION = 5.2.19
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
