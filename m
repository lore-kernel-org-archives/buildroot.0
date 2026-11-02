Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C91A606A906
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bDZkUZYI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2912407C4;
	Mon,  2 Nov 2026 17:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z350VYe7rl_O; Mon,  2 Nov 2026 17:48:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C206D40752
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793641718;
	b=KJ1yc3emqBgsasXR1V5X+RjTwFube0uRyOLS7+OuvjFAioK9Z+RU0wartOX6ndKsl/Gd
	 0GxTcVVp9XH/3uVKh8wghiLhZlnU3QI4ArX46awAVg4RSfwmaxsmNyz1q03pU3s3f8RdB
	 ndXyzEfrJYgMiWet8V3GbqIzblam4nQVdud28sFzL0+aSGl2x9X01H1p0cKSJSpEcSi0c
	 FijRgrbIf8HxaD5deo2iMp65MIsKvS2vsa6cS4ZaetNtfIInOQ9QI0rxo5x+0Ihnc9usx
	 yiyh4lbst6RVwb1GOhgE0DyT1Q5VRkfbfGU+rKWTQGaoNYBqmcyX/xWXG94E0n3IwGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793641718;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=loqvMTXR2O4/aeXC4owAfL3Kui5nojf9nDrrp/dWKRI=;
	b=moZAL0uS3/clX/vXfZefWc8k9G6yksbBoluxAwcry19R81zL6I3Q2T8YDkSYSNftW3kF
	 9DG7duptf3coANetn6r6PvVOgqagy2HU8RfRHTnHTKN6U5lPS/uwyInRWTnH/IC4qfPFa
	 5VXm8/0q7A3iJG2cIQ6EPojivFEKuDNhqxQh1h/w6BrePJs/BbYOLy8MRhxd2pBslhK2a
	 WrVu5k8lw/vhcN+CSBDfuuM4NQd7lL+RrUxOto/Y5lClCbytIvwGn1a0CS3OCXWI5LI+1
	 lAyRXS8XLHBm5lzbu1DaBxs/wGOcPoFWEplv6g7j9pVGzv5+AgHobAmSZRFJ9LOrc1g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793641718;
	bh=loqvMTXR2O4/aeXC4owAfL3Kui5nojf9nDrrp/dWKRI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=bDZkUZYIx3OcTRs4WGxSaQreuc52X/V1S++c3MbsvkGClEFNozmjnRXlJSWGn6/Q7
	 7XwMy/VplHHv0klvV1ScK4PKVslgT2VhrBjCYRHEWkIdETN/ejT7L0EMtnLL859Wne
	 uTN10VS+k+S77amz6vP15ytiU7WLpIk9/ddBqmWWAxxbMhNTHKSidXWxXn+WLW903O
	 m9jZ5sWstzspiLwo/igfuHv0mkHkpE1o3FzyzLK/qdqA9EJakA3dR3DBhUVgP2cKbl
	 6M+3ExMzfL3IabxmLX+jUTNa1v6rEEH3qd1wWmkMUL5ISqPOWcVtnEcbSOf0EY/rhH
	 VWlGHzsD6360Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C206D40752;
	Mon,  2 Nov 2026 17:48:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D6DD120
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 17:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83A1F6065F
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 17:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kn5lt0uyEOeQ for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 17:48:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A627605FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793641716;
 b=sJVJtIvsFZ3EoEDQR5QJVMkqvNT1TL9u1S6TQS6BNa4RCOLZW2SSlGVxlAbxcy7JYFp/
 o416VHMxvJcDRxOeHUmkMoaLu/IR7nWfNVA5zpN7GMq5TT5LnsYhvum9Wb4njI6ue+mAy
 6T2afT2oo90Ivc2DHvUCZtNI/P3mTFEJenYbUkh6E7xWVGYGp4EsZz2f64xDalwej3Xub
 7KjQzPK6wYO+h1rpnJJQgfYiXiNh0YlC8PhZGszWYLPQ1atC+zW/tDLL9BVbTv16BxaId
 Ti7a9sNO0D+0UH/Uhuw2ZISOUuuAyhqLO7NF9dbDLoyI7G4bsymIvGNPu2XvT51cUeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793641716;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ddfRzNdlSSjrm/wpqIAo/e1O45CLdqY89HAw+kLcap0=;
 b=R4CGdsnb9BiMAnkXUHUoPxMsEr85Sy2EjVjuJYkswxxQv9IxssHJrYwMpMytIphehclS
 NKvFy7ixEQavh8xGt91vwHqz6+Q/6Yq9KbRZ0neb8rHzoSIKsuFRdGx0eOGlD0wxrgryJ
 qTOxBnxw3lw9oMU+u1bgTqi68Ol3kbU0DUrh+1TlKCaQhRbSwNuZ00071qi+etACcAaR2
 1IItzvELi0kjNayfW56P8oIWwP4uGpJwTgJa5GFq+wkqx1pOIB0uvy4V3e7JYei+sL471
 QVfYZ2YLHgNWhd7kmBI3BayeA+RHD/OexHZn5CF3XbgPM2EkspJig/iqvnoqBZQDicw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZV6of56g; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A627605FF
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 17:48:35 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so25342465e9.0
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 09:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793641713; x=1794246513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ddfRzNdlSSjrm/wpqIAo/e1O45CLdqY89HAw+kLcap0=;
 b=X111pLxvaoIgHgJbdRQm+d7T2q4JqYymN1/4SLJUH/S5UKVyfJwQWve33sBuTI3sxS
 qDbRT/sL18DVNX1yZs65bgXBzsZjSKzOu3flzmhrbdUKIGVistRko0tCy88717HwIWLd
 0yRNpySl5RnLAQqLDORnWnlaHOptBKrURinUCLMddat3sW4UayIk00iroDjpyCsf2snF
 bjY3X0aqdFUSwf9Xwi6fhRTTNSnBINucdg9DUTmwghVsn0HXqo3nugFsIKiHXf99dpcf
 yQRWu6XwhWu+kYrHdYd4sdkZth4gifGHr9LH2v2jyyNL2q8kYhqE7/S22zmkhPjve4M8
 DMww==
X-Gm-Message-State: AFq9FYLB2BVMHFv7ul8z0IltOzu0kc6WjlSp8oyknoTYQRko0irM6H7W
 7dDBtpN+oIb+IP4BCp4R3PKhhkK5duk3eOEdzZ0LLowrcp+EDYuiQTTQ36eIEViiGpyWuVaPRPg
 Lv4Bz
X-Gm-Gg: AYBFou2Qlib4oXjbQxMC5yBsnmv23HHf32/ubhxEqtLoBuRYLuXnikamq0BWN8cJw84
 kq+wP0XLIxH8v38x7GnvX+nSaEST1Y3eKmUDKwGCpcv44DVV4ZAl4H30ikKgjPAgI5Aypori85m
 ulI+kcMZLCAKx4HaHqteZoLbVXgIVuQuBdbIHBJZ4rfy1Ol9GW9Sr4JIGMt3DiUblZL6F6hhobu
 ZmEO3Rtf7qrJd7KjzsjMbHmTRVats1tufp0zC1FrKwyyYtuxr87UeFPR1ERo1mgJZAH8lzCLqwW
 gbkzPFUajmHDW/7BfcOkHpySw9W2oHXyaR5wSYA4aBc097aSshk3WLgXOcQEilL637RkUd1Pxeh
 392SdzZp0GMhdj2VQW+LMJ4LIGG83EFICW9nqKBbNCnp5FRXGQ3B8ndPRjf8kZxpK0FSzYgwsVW
 DHitTUmNHjdnwdZUWG6C359xm2JJQ/J+1rQiX8dU/d9h3WRu642EY9AwjE/mSCv2K4Eu6SwIjsF
 lDBfLK7M1LUBzbvCczcPKL7+l7vL5VgF/xrGRFfugcGcloyrmg6/QjBZ42ntaqvsCBUSC1Pn9y6
 fEugv740Oxdq4zclI5g5zHQePmFIhB+CV3ypl5HLUA==
X-Received: by 2002:a05:600c:e552:b0:4b1:4da2:ca99 with SMTP id
 5b1f17b1804b1-4b14da2cb6fmr54495315e9.10.1793641713335; 
 Mon, 02 Nov 2026 09:48:33 -0800 (PST)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8011csm23646117f8f.31.2026.11.02.09.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 09:48:32 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 18:48:15 +0100
Message-ID: <20261102174815.17205-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2026.08.x] package/python-django: security
 bump to v6.0.9
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

See the release notes:
https://docs.djangoproject.com/en/6.0/releases/6.0.7/
https://docs.djangoproject.com/en/6.0/releases/6.0.8/
https://docs.djangoproject.com/en/6.0/releases/6.0.9/

This fixes the following vulnerabilities:

6.0.7:
- CVE-2026-48588: Potential exposure of private data via cached
                  Set-Cookie response
- CVE-2026-53877: Heap buffer over-read in GDALRaster
- CVE-2026-53878: Header injection possibility since DomainNameValidator
                  accepted newlines in input

6.0.8:
- CVE-2026-15307: Server-side file-write and request forgery via spatial
                  lookups
- CVE-2026-15337: Potential denial-of-service vulnerability in
                  check_for_language()
- CVE-2026-15830: Potential denial-of-service vulnerability via nested
                  geometry collections
- CVE-2026-15920: Potential cross-site scripting via URLField values in
                  the admin

6.0.9:
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
index 993b7b0d68..509c8b3acd 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  b45e074d29f85e1417fb2d2ea97c2df3  django-6.0.6.tar.gz
-sha256  ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713  django-6.0.6.tar.gz
+md5  9ad29872db08c9fcedd1a7d4cb2b11da  django-6.0.9.tar.gz
+sha256  8ce037c971f421cfb47d38c097ca233a8f6dd42d9e9501a37e02dd7d08c5cb3f  django-6.0.9.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 764e72084c..ce4552a356 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0.6
+PYTHON_DJANGO_VERSION = 6.0.9
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
