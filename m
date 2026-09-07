Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0638BC79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 17:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 913A380A06;
	Mon,  7 Sep 2026 17:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZdkFfoyRu9y; Mon,  7 Sep 2026 17:08:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 24864809BB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788800916;
	b=CaiqNgNx6lRSp33XT8LzFxjDvm31Ex90HT3357ZpcoadQtpwMyZ8PEoge7F7Mz69qyNg
	 kabquCsHwTSQESoVUy27/mcyImyKeO2bvrAMwUlToXeAUpWxc3yDZx21cuxia+BUIuB4P
	 M/vOsnZlSqGIqnE2m8+DjiP+a/pe5TyRAv/o2XrOl9akqIXuE3QxLm+oS3QU0hLiRZ0Lc
	 Kk/IXngJvAE2eNmWpVu+CKRXZRJGTJMr1SSiINdu4e85vACbQPpOmI24AlmidJFORgybe
	 +ux8y/8GZwxN9GRUfnPwQDqloVLvfi5oxv2hl45qHpV6KvpLr5YNXuZhxkrP73lgdAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788800916;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=evJbB9iv1G4UYB0iyUQkvURVrCIxv5aZRhvFfA1rU98=;
	b=aACZ3cW+0bDUz+hX4rnaOrY8Adh8ohQzFpkjRrLrLUDymGXTXI6fZtMuZxJDu08UTbuT
	 j3ewd+6Si1CMhSAZLOuPruu9lWAK26Ei07Q744T0y79CYRxtHpns8wj3TzWst/La+zaPe
	 c2zPcWYpCy1DCjLxVWo/CCG0S66aOY7V+zaiG+llTIP5mnS9C2ThmS9UVMF0tQgRLsdnO
	 QjiKGNVHKxnYUjGNpKpJ92fCrc1QG+n/bdnamC98TrJHmRaMiUgDQeomFOP3D0LYH3dg1
	 0jADYD4IqVURmJBWy7AL1bTraPM0ghCV5MPdZusgc+CzYhOcZJZMBqQ0/9dc7MO1yKQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788800916;
	bh=evJbB9iv1G4UYB0iyUQkvURVrCIxv5aZRhvFfA1rU98=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hDDjHXkn3As0URqYSQSnjI5lcQBUNHQbHthLvDw7DRM4iuNyHVWif5ao3yVVkxo+P
	 +L/L5lL5tQ09vMdf+v/XQa75y6uJSA5gnASwcmk5bQufh1X41O8xgDWC4Rd48fTDyN
	 MtFRgxP7GoUtRpzpL21UaGno6xFgkBiV57l3R7dBWlluk90ylWIwTAT3q83mzu5Zz0
	 XcEKVoFTBjks4uIwWs41YVs4MniEq2pQ5NlZIQW53e/6fXFvppNLZatOGSX0U5xmmA
	 U64TNWsiC+8Ph5Bf0qZAqg+b0MVHefqVQ4yGs5zZhEN/9I7n4ncM8DVvs6//dzQshE
	 PMV/Cok96+tSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24864809BB;
	Mon,  7 Sep 2026 17:08:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB4FD388
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A14A880A06
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuWOP2cYfT-U for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 17:08:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B9852809BB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788800913;
 b=LyH57Z19v/7C3q4xogzlvX2kLbW3GCC1NOWd1F0CMDbDydC2znleczCIwZuMwW/6l8bL
 o+ummiq57IiphrfzeGeLmVLMXBovJlct0hBBxMdrJ/sPX11//5Y1pANgI6Fuuf+Y5n4Pj
 s/3MPAMvKpXrYl5iyN8xK7WNGOCOmH4JAVZyYSrNulGntSwDVdMq/FgLnGYA3KsWhYXPZ
 mQAMPVz1L00Cvp+cNd4Ol9H9/6hcsS/wZYKsAw9VS0FgGBDudzzuPWXbrIbZL1dXkxb+i
 n+E3LtJt22ovcCRwUnEdX0ZV16J9c2+JwKMsRQHNAvk4YmR5eSUmOQGlFRV4jvcW0EA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788800913;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=LDjoudpgBF0fslv6Ww5UopPwC917PlXw7nhFodGr3I0=;
 b=O/iWUWjo/2mJ21rKE03pEtJipu5XkDCVUC1G6yfTJ6VxEcvdHaGmlIbSZERnoU51Thw+
 T2dGBBKqAFSH4JpRJ1YQ5XLS5O+EBlaTdKKI0ZrhoCHopgGXGQ7o0v0WBevb5BJSO3H2O
 PDzw02UK936d39wU2LUM6KVAbCzHKh2G2aX3tz2RsjPmDIJRaW3ACtolcF+x9UJBXPT8h
 wxZvHH7FaXhl7qLL8nWYfvDgzChZ4T1kBJ+midUIWp/qt37V7BaVMrHDDM4x9SbVUOjTl
 1kOZCC7NemwgjnApyoK6Ec6+jm1juTLspVXCBl5CPqaDZgI11EagvCa7KTawCD7elKQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GeKO129W; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9852809BB
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 17:08:31 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6a38098734bso6144717a12.1
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 10:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788800910; x=1789405710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LDjoudpgBF0fslv6Ww5UopPwC917PlXw7nhFodGr3I0=;
 b=DE6E0R7OcUxvLASE42I9m/QGiPkTr7H8E5aUXN9QqGCRsau6+29YaotwU+x6irn0ct
 kCwWnieO3MK13Kd2G0kzLLB0AK0pJm9e5GbIFaplayYZsd5X8cRV/+tA9pyp8pYEKbxN
 fNuCpmnb16MYUChTKDNRWA4m94vIDedAjudQdV9rSmQLQHLdOe2LVrsr0WPyNKnWlahZ
 hPU2SHiDLnJhKm7Bi4dY4nQdi7DuRY6Y5Q/pMfVVT7QNNt8Nk4J0uqRTB4t0LQZFzopx
 zWR+jt+VhXWYZof1OB9otEAl/qfBOG54KFV3Fid7MmpoNHkIX5UWilq+OwS4cZFpW/Zc
 WUfA==
X-Gm-Message-State: AFuF++lWks3EhnSzrcv0KAr/IKxYbTpDK4t7/W9B08X+nj5aYmWeDTJD
 IoZw7gXe/S2VjhMr02b4L4a59OZ9HJ/M+SoMk0JvwhW4jxp8fgJbS9OhbK02L2iIIE1umXPeXBr
 rcpMLAyA=
X-Gm-Gg: AYBFou1NeH0ebYsDhkF4Lgd5AxA1S8nDqosqK/JjcUvS+M0fFnva6wXqj+zQ5WrYJdz
 7x10jlAEWHGCB5uZN1PehwnL0YA3pH+2SOLWL3ANiioMAjdT0S8ydQ3sTBzbHc47CYEuhHpXKXC
 n6erYux+fwXtDdAIT/YD1GH9t9/8ZADBiDd7jCEI3VXDqywasPSB4L895eSEL0UoN5qlOeFKFEG
 vZqu6JCI9JI4o4qyjCem2sW4y9Ws46pUfXVL2UzA4DKgtZ54ycDW5bYlk9qV04dsCBk6EHLFp3N
 MpKjDUNUncgtBtYD+Jr8UPg4tiQC24d1wOC82Twlrb/k6saWCobYngooz8gBsRdi9rcxEXzQcCf
 5nmOHT0L+sSDQUFkOmYrs9NM0H8CfDzfbVPgSC+X5MKW9N1aHJh3rg9J/6AoYjO9QNem0riLMI5
 2tAjPtARlP0RXGGx3OVwTqcoHzPnPuCSyOAMr00NhdtbT7EH4vTdr/fhiDbceYLjtgR7o9rfXRY
 iJJ
X-Received: by 2002:a05:6402:4343:b0:6a7:ea53:f624 with SMTP id
 4fb4d7f45d1cf-6a7ea540b3dmr7377914a12.35.1788800909635; 
 Mon, 07 Sep 2026 10:08:29 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a7e66eb84dsm4699441a12.2.2026.09.07.10.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 10:08:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Mon,  7 Sep 2026 19:08:15 +0200
Message-ID: <20260907170815.322928-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/{glibc,
 localedef}: security bump to 2.41-161
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This includes upstream fix for CVE-2026-18374, see
https://gitlab.com/gnutools/glibc/-/commit/f806c45178dbca3be08a25cc5dd6d5542ce84a59

(alternative to commit 0838e968cb9e78d7ca5d1641f39655bc03a2be00)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 87dd8b67ac..0243dac049 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  e3550f6d074325ad8ee75fff96f16a967055e88f69e1455333ace515b8ac2067  glibc-2.41-159-g3d141c23899d90559741b5fe74db97ccf0ef5c29-git4.tar.gz
+sha256  987c4f5951a25dbdcc0b76deddf4fcb97a122cc4f505d351fd44863936e7d903  glibc-2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e1e8757e88..dfe599b912 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-159-g3d141c23899d90559741b5fe74db97ccf0ef5c29
+GLIBC_VERSION = 2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 9a19ebc4aa..e812ce36a7 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-159-g3d141c23899d90559741b5fe74db97ccf0ef5c29
+LOCALEDEF_VERSION = 2.41-161-g5dd252cf1d113644b3679f5a158e9ef20217865e
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
