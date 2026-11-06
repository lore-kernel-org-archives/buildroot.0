Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BE3606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K/773/fa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RMeua1mx
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A1DD608E4;
	Fri,  6 Nov 2026 19:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rwah4eJQ3LlC; Fri,  6 Nov 2026 19:16:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 88DC1608CB
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992564;
	b=sLrXznnn3uGIDaK8YBVsUPzifK3zE/O2brEdqVVUlqYV7ECn3pELSyQzYvPeQ3MnAuLm
	 FDQ6VAVAbNnnbOqq+0/gf3VYp9cvQDChsmz2dxZ1np0JrXqQPmncaW+TWZG5lk+ROg6fl
	 VDR3HrxtdlpZNcg57yscfqEzEBu3YiDvQgkQp6+A7YwQU9G8t7GDe4MQlLhWDfmdVaK/K
	 n5TPMBMAL9J7QJUlSLrEbtx6WEptF6BoKRZYDlyR6JpnbGZDhwwHUHPq/I/O+KbeWxDon
	 qTjgg/ZISYor4Y99LoHKOjGloTuTz1uTJ4YKVB/25AVUQJ5huE8+53QLJEYDArzdmeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992564;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wLaOzqCNNSD/TOnqwBZ/UuUtvc0htTWkDTkcOBF3c4k=;
	b=kww/Vv1LSyuYJPiARSXQy5CwRipe4FMiM+phPjBmrf04Gmg65yvNa8wXqJwvOW8x+JC3
	 nrxRz8C7frEc2vnXluoWtzYL3qHLuKxCp8mG2iAdVCaQL37GF0H6kNk21jl9GZOyUQamC
	 AnClbEEmRUJA850W7TzEYKKwV5u/ILLQCbVP2nzb4ihHFHzdzvqnEk4en2WvVa6EhUTc6
	 ADU4Gca/SiflTJXr9H31zT1FjIw26GH89YHOva4Vb69abR8eRjZm/YMMx/tGPBD6+gb4A
	 Fk34RCLvJwM+gJKwq6kv2t1VAdZGq/yM5IEs8n3ctlDe7WJCFYevESLsT8VzOEgRkCg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RMeua1mx;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992564;
	bh=wLaOzqCNNSD/TOnqwBZ/UuUtvc0htTWkDTkcOBF3c4k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=K/773/faOSlw+ITGzNFEtx+UwXFp1f6+rNLlXCIyxKWSZPXQK4xgc/w8WaExdNT+9
	 X6ShgE0eWv6g6E3+elhWMGvxxTqvfRRk659mkPys44chfIVa1Izo6SXbHpyf0iV1VL
	 KkzL6+61T5kcD5ahBey1z57Hgs2fi6Nqg9dVFIWkvzQtL4AdarMxL2X1bFHTnj//b9
	 DyTOVu+HITYFhxJDTu13jDqveCCgGLhEXTyO7klhmgsfLKVxrgkBWJNtXdGHiofYbr
	 i8YXxTHrOCkL7CZTGSleDfjIhU2J4QQxi0PTpvetTL/sDfXeBG7YXyfpiUsrFvbj0Z
	 HaiC4MU04hXqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88DC1608CB;
	Fri,  6 Nov 2026 19:16:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D3A3362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CF9A608D7
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJQw4mJmjh9W for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6E57E608E0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=RMeua1mx
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E57E608E0
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:00 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-85ac281604dso593316a34.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992559; x=1794597359; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=DW5cUmjpjQuR0Oh8zSac/Z5Ab5JXhFKBZSY0Vp1O/L0=;
 b=RMeua1mxWxvcrlBsy+9tjrB5OemwdxbhMGx3pVDQuquZUx6m8xMscbAB+e15QTEYID
 DsTCnb19asBdMLeDyCSHkYlRGeUHZpdSr0T3XgRTIP4W+CStz2/UffOsX0cVbYJwE42I
 oA2FqUwBPMK86GmZL2p1Wg7OMDXvUCvE04eTjqfE205xaRTyJuQI+kGRPxcP00DkSRRR
 brVePfPb0Bnw3TBjO4YDrVFRpbgRoAFYtNWCodyPev+ZNgGaA21B4ss7gR7K5vh7mlEA
 V+YAs0yBIifbH1EflzXxji/YZ8Sbm6m4AToivyNeMkHKEKGDuhFj4pmD0gQ5eATt/yaR
 cJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992559; x=1794597359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DW5cUmjpjQuR0Oh8zSac/Z5Ab5JXhFKBZSY0Vp1O/L0=;
 b=2ErzXxmAxwdDuq8rY3TIOMR7mZWQJgPbxld6BxjZSyup2Mh3qEPI4TWNqppReGVjv+
 S4Xi0qQtqtc8k4ytXw/dV8bw7eNHo1+T77jyQO67+EnU8pf54z6q8RKO3fDw6Pwt8e9a
 nHVq10oZQOPyzBi/qavyQ5hOgRxmc6mEXrKmyIRw5H7xu0nVO6ibnJCAP7+V+v1BhMU3
 JHsA/ePfDj8VxHeVM3YeKPhIl9yFdwBFGifmpXP50aarQhc7qLdw8j1ojRZrK1Pvdxi4
 PVbTTJg8nl5FV7URMC+nL6JTE6Uzs+hC2kw+STbm2gc8y5iAr5/OpyHdCUsjitmEVDhF
 se/A==
X-Gm-Message-State: APuU4Z8Izp5BSjAlfWoH0WFLhmRZ4zg8SOkFDvzbq0Ls71DVKu67xJdJ
 LFLV8eFyVxZMrR9eLCQR2JWAvtlVk2eXjn+PyhsFpsmYlaiXkCWSd0m2MkCixA==
X-Gm-Gg: AYBFou3McSeDnSN2Iwb6KDIiev/N3D1xsNIAIxm3nGum709+kIt+Xw83iTHAafZ8C06
 gdS97XLOko0R33bkxkGB/XxA4huoC+MJ6jewLhw9tEq6tPXWq0KmvH7jjT4WpfP1q/d8nu6wfZc
 FL0OtaxtXWbcoj96fGlTc3CkMXIqzdxfM01KiycAyvdlnkVUn/Z6ll/k8KuoGCD8EVTZpHZFlV4
 SQYP+Kl/I3pd94qT6VH075d3pLuVNUXp9vISLM9sfK6KwSJWk9txYiuAGG/0xjnuvSn7yegN1t0
 MxZgfN74Q2WwT1JK3yEkpKjm501diBmVtLs/1gC5BLBwYLfyN6RWL44Gzo17du5ulE4xVm5rjRe
 xMq4YRC0d9Q5+MwfNFCaoc8P7i3/WTlGCvyYXCSoJONvdnvrS466m9OJWP4dqc0Oa4Kwc620icN
 7PVhgv+0mfl2dPCunGN7ig+CfiPCXwFetG829huqmkRQr0sECL0aFqc5REnPuLd7RE7wqQ5tMy1
 lqf3g6WbRoaC83IvGZTCK2ryfcDFGOIlAvxcWun4+NXNOKoaMb2TbXf00USBhxEagRW4rmNYn+X
 nQ3/cbJdKHSNM2hr3O//l8rMAGpS2jhMIiT+GwzqMd6xODtMskNaPWETRKBTeUZqL88MiHvzebL
 3ahb4hB/K0dBkGrXYjg6B0Lr9mnFGe1F1PlweZ/rSvOAx0f2em+s0+H+/thGdlT6ESFWUa9PNSV
 be7e9baayad5WeRLvF7KBjBb2aoeH9NuYch3e87v3DrzyDvIee5VDfS7hRxufA2BylFUmdTeYyF
 1w=
X-Received: by 2002:a05:6830:4c08:b0:824:e29:e00e with SMTP id
 46e09a7af769-85f1d014d1dmr2985986a34.20.1793992559121; 
 Fri, 06 Nov 2026 11:15:59 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:15:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:34 -0700
Message-ID: <20261106191536.2120153-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-django: security bump to version
 6.1.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Manuel Diener <manuel.diener@oss.othermo.de>,
 Thomas Perale <thomas.perale@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
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

Fixes the following security issues:
- CVE-2026-108147: memory exhaustion via base64-encoded file uploads.
- CVE-2026-111211: log injection through geometry form values.
- CVE-2026-111362: SSRF through GeoJSON coordinate system references.
- CVE-2026-113593: private data exposure through cached Vary headers.
- CVE-2026-113733: password hash disclosure to view-only admin users.
- CVE-2026-114582: SSRF through SpatialReference string input.

https://docs.djangoproject.com/en/6.1/releases/6.1.3/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 0cab9700bb..4f51294adf 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  7c2461ccfcea3d11464ef207fa0bcbed  django-6.1.2.tar.gz
-sha256  a1e92451ccb8b514e91bbb3b6d186d20b4030558f116b5d9de6535455ff210b7  django-6.1.2.tar.gz
+md5  3cb5521afc0cd034743c7c258d3cb85f  django-6.1.3.tar.gz
+sha256  b5d2d9e35295065d13b1927b3f19a59bd119f737aa6299def14ccca1ae3c8c0d  django-6.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index b5b4a322f7..b3c4ae54ec 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.1.2
+PYTHON_DJANGO_VERSION = 6.1.3
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/89/24/20d187a22ac821288b53c53b8f696019dcb0c7b4f973f052ade19392c74d
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/55/79/49a609ea76ec51404b482932e33f1e6858946b920232c11b11a25bea3032
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
