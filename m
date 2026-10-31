Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE264606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FPCRXr1G;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDMHkuCW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DEA560766;
	Sat, 31 Oct 2026 17:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73RvoUke0eRs; Sat, 31 Oct 2026 17:20:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7B1CB60771
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467227;
	b=sIca+LLqeEi2QYYwjdbiPDvNUfF443dAdsEaVz+7dPlNK28yWjlgbBDE/2+eMl/DBvgE
	 uYkzL39xwiN8T2UjpaLdz+GOUl7oZo/AiUNJ8C+dsZ/xe+OZzyNP9+zrtH28n0Cya99ly
	 X3+r+UtioefM6zqIij5yofYiCmtMpTuFFnWDyGxQsyzIYg50j85t7Ydn8JS8dE3GbL+yc
	 /hzr8OpLS2QqBHOkEoNxeJoMuipSz0CBVgVpWRLaeuaNiLKQQDqBn53j7P/YHaJmZ6Fko
	 J+IWHQVd1tK0jMltkW+aTBykjSXYkxC3LGViO6SVyfK+ipkN//0NdlGVHdAjZuoK2bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467227;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9qsH2cgTBzde5eCqAHz97pCHHMFPhPX+WAPqDS+E3AY=;
	b=lI0RYkzFeU0HN1nO1FmqH132f7rAwMBrsTYv80gFcVSJKqqz1n9GBWJ79cqZsaZ8D2c2
	 28cIWFAlniErvUXhWffRZlMhlUcLtyFnAPuoJL2eCO8OIy8CNxaICe3MUZ+xiuR9c+Shu
	 s7BuFfj13hn11ekim8GQXkHaFD1XomKV/51Ftf9f2uUChVxQggmt6C4QOo5SI5dCI05pQ
	 g93MF1neKUgFKiCuMkE6X0r1dqZglgyEXVXllHdL0OcPMyDGY1dVYe/YEkbe67wtzQY22
	 ESpu2pYQEDzKeat33AcqfsElgMEZKLtKktOTvYBfITAXU6GMWiQa2CCECvQEnd8M7/Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467227;
	bh=9qsH2cgTBzde5eCqAHz97pCHHMFPhPX+WAPqDS+E3AY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FPCRXr1GGkWeE1HdiDCEW0moxhLft1GyQcWqYTz/oa9Alya6q2J6Ng3/cK/lS91wZ
	 5CC2Pjycdd6sDcNHt4jIpf64H7/VYqM1j8Cw/VFTY13JF2eflxFr8rNpkLtdquaqk6
	 qpg+pu5npW+3qUeB6MwNfLVqxgKoyGTmnorGW4+xzGd/0jbP9t9VzKBotwTuVd8r19
	 IjzbZzVaKPKYNuQ4ORD44piplvUg60ImzUQ/3vvESC64GlyiHBV/bvTKIXlUJHCG60
	 +M5v2vcA3Kpiy+eqge4GWswMEzFUx3lv8RY366udls60XVZ8PRRjho30ogQtfgJEVd
	 aQ5xTrpSfnyqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B1CB60771;
	Sat, 31 Oct 2026 17:20:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E82DC4E0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9A6A80B89
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gh4G0cbalkCD for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:20:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0EFA980AFB
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467224;
 b=P4j6Ag5MJxoPSML6mG54bDxNkUaimRVR3RM6w8W+V6QZ7t3gR0YDquNoBJ6iiuoboeCp
 Q+uCVJZfXHDlOndCSd0xTT8u5g8ImFwHQauJfSNB4RGTxHHDXcoFIjtIZwr4xDt5cNVpY
 LKmrwI0e1l40VutvF/J8gM5xyYohaAII2Qt2MfptUQTcCX/3fVdRUO5Klzr84bDCwxSx3
 rusAlehjVQgwMj4UrKpFGhEpcmnTHAk7kdDpgibUy7f5qbitulqkBW/+l0b+qKLIyl1NK
 EkxMi0liZR52Di9h1U5LOMuwo0O9YGre5ZnzxkJdGrxb4BR2yG9FMLLWSRnpiyOtRtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467224;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=kQ5IENJ7AkujHNiymHMHqMCgl1Ra8nhiR05U7WZZtY8=;
 b=q4dshnX6TuZgrWkvkmRn3EAtbpfvbSEdZQnkQmXgUCx3SmCp1KKD2g7i0s6rkZiGOJT/
 Pv1aoSLZTtMOhQtnG6hmEI9WIoCC8bOv0Yb5SyoiSzPQM4TOc3QZ5uv0UuxMIB4HuU787
 u5RPuWPRTEXDDhdF8AvUans/0UusSYZmYIPQsVXOcNpOJzmEpXThqx+bOFjkvIE8mbFYj
 zpDqDECLhpetg/ycOFUXHeKB74hJi9PLY4Ncotog08o8EifPhxWmXNtFlMDwyc4tC/Plq
 pfIU2IOxawmKh1aMV/HEaIb58huTuPZdBAe7VSxMqPS2SJjx2J8HTO2pYSZtZ5rn3wQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=qDMHkuCW; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=qDMHkuCW
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EFA980AFB
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:20:23 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-713e6ecf595so1676469eaf.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467222; x=1794072022; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kQ5IENJ7AkujHNiymHMHqMCgl1Ra8nhiR05U7WZZtY8=;
 b=qDMHkuCW2zCeQujQOZ6jwZ7O409z6qo8oT5P8kSel5B6Xc4PVQY1Q+tEJ8Q4VEvAkK
 yUm/Kx7BhJwjxaxfNe6MJxbHxEfx9yRjbAT2bd7MC/gtcGpPgFjavw2BvD1jwjoyI3Nz
 gN+ujdnUNyyS3zVCwMq4+hfqunlmeITb/I52AqHGTml5WXBqZVlR/qkuuJC/ShGtJiu0
 ACff25445aN2coi5FAMto1/G8fOdicFguHHJFG0nHdUpZaTDtzVxZ6a/PZBExI24gtSc
 vbZqyfi3xLtpnKNzAbJCeY9Msn3cI6mM+pvKf0/87TaMeNKs5bHldpplJSZtEKRB1+a3
 ewZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467222; x=1794072022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kQ5IENJ7AkujHNiymHMHqMCgl1Ra8nhiR05U7WZZtY8=;
 b=th8KvWYc4E93mQqYEctPSOxz+6jYlhMY8jZeutDBudRTxRy1fbtBO2H90Q07YtIpsb
 abJaUtp2FWQB4ijkMODUCM569BD3cLzj0HKlRYRqazOXEgFMkbAAR6lCHIHSNgw2OWDg
 LxXjbyrNeRZwmSgjdTj72LADK59scLVOHUY29m7gOZPnMl5OWNYd1xMquuK7EbfoUeft
 55g6aLFpLL5evZuCD90z0PCmfCdRrXL3XKKofatxdawUiCBE0ZYf/vl4iEW5fUAYmgyg
 E/snfepYkulpJ3KwXSsNMgLvac/p8rDrF4HFJ3bptWR/O01xtlVDiP3ktrnB1Mu4ceUE
 MvMQ==
X-Gm-Message-State: AFq9FYJxitpBI4NwmGrgvpzDYiyPBYyKJ/UbxsYGYKjocG7jwKn4Ihz+
 FEj0rY2wc7t17FLJN6bCV7akxlzutBKSLabvi4x+tCboeSowPiBpBwBFBAHbCQ==
X-Gm-Gg: AYBFou1BBJwU+A+pLQLHMT0vCu0v5Ahw1T7hdq1d1+Fk1gQDPE7uMY2OLYqG1GG4g1i
 2wz52nypo+XvvKwL2q7gFa21NyLyGwAdAgjevIHwvDCTNGWE8ksBZWm3sZUWE3XW3gRa6KP0nEv
 5NbDufog3wNuGSPsRq9t2p/brmpZUEXDc6Ut6VNNL3TKTVjlZeXA2GbEGnHKB5tNbcIJn2ptr43
 kTNPVRFgPmO888Dh2A6Q/QmKN7WYOJ1g9yCZWftO1/jh9qhHsyvY919w/eQSsHYT0vtMpRm+4qw
 MtPT1WPaXtkjT9Nao8cADMv344agFLmpkqbWLHp39KrjJ56pTqX0385YBayKShVyjOG/LIhNae3
 Mz73THfug82y04UAfQMGiOPy9twpeNMjeQ1b2tVhEoClyTNxZ2r9YgFYC0RgsttUEyYMZ0VJs7u
 RpVpIYPIlHVmKdEHhwTLgWNq2YEZuYNiC9B7yRrplN/OtdwhJXhvku2J8ql/5Ix5J+gxXXwXN0K
 n9cB6DjCXIcWPFRIGIuy9aVZYak+zpI115CgM6itVMHoAU7w4cLuOJUXkJo5jC11VqPSLWzvfMc
 ewhBt1jrcKKhvnch4UkQihGeRZaS3rHNqxMSfY43La3zHYrsFO679xkz145R3MCDjIwbT0cDSa/
 r7XMrFMUF65cQRbtOp8J2SZU5mCXiG+bWYu5W7G2SDvjyyymGOLe4sFUBM2/P/7rhyGgJvyDTdC
 ap27eKO3uEwT/+HLBrNxKDWiuC5cckcJWjyt4BbTUZcIALnzfKO6MuRG6wjnzWafufeuQxMwMKo
 TR4M8eRmXQ0+WeqGr7dm48=
X-Received: by 2002:a05:6820:628:b0:6e1:f7c5:9539 with SMTP id
 006d021491bc7-714ddecbd72mr4650082eaf.21.1793467222541; 
 Sat, 31 Oct 2026 10:20:22 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:20:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:31 -0600
Message-ID: <20261031172019.2683287-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-django: security bump to version
 6.1.2
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes CVE-2026-77050, CVE-2026-84429, CVE-2026-87890 and
CVE-2026-87975, and an incomplete mitigation for CVE-2026-15830.

https://docs.djangoproject.com/en/6.1/releases/6.1.2/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 6ec3078744..0cab9700bb 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  130e6e23a095440bbf3e720b932792e9  django-6.1.1.tar.gz
-sha256  7ab93536d8e677aa14554c56426290c69480bf2ee68d7513d4a22f57d6bfeb84  django-6.1.1.tar.gz
+md5  7c2461ccfcea3d11464ef207fa0bcbed  django-6.1.2.tar.gz
+sha256  a1e92451ccb8b514e91bbb3b6d186d20b4030558f116b5d9de6535455ff210b7  django-6.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 26fdad76eb..b5b4a322f7 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.1.1
+PYTHON_DJANGO_VERSION = 6.1.2
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f8/d4/8314b5bdef20832f0ac6ae3b3e4d4924e4759fa3b4af27609dd747e7a6be
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/89/24/20d187a22ac821288b53c53b8f696019dcb0c7b4f973f052ade19392c74d
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
