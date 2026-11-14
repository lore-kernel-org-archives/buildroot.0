Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7291606A327
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 20:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o74LQaBo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=J9pikvA3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 984BE407E3;
	Sat, 14 Nov 2026 20:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oNxbU5b6Hi6; Sat, 14 Nov 2026 20:40:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0EEA640645
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794688824;
	b=NQVs9D+SynbLL2b78t1G+LZgtX/foKiIqqT1ZVhgO8fq3PFPecWEC8WOjkoUtlWCahLb
	 oNf3wujlVs+oSP4xycRLegLmZosqkVZyG6ImScherxmxBHJUiAM1+tiTE2SzFAfKS5dv2
	 RRJOwTeUPt++cfprztPQgIEgEqAbyq01bp1NdXnd9Pcq7nHgbFsDFDhsAgqJufEGw+3cE
	 xmsNn2cwYXNBX8mHo49mY4lMYJWeVkLgb4sTBzieAxaXQlM/ibM1ryVIDPbb8aOcxx4HB
	 tGgB2eyJTnKa6LdHFzMLFq3lhjzC2im86MvQtNmxyt5MGuOUfr7C9j5TaDLJ/nz+mOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794688824;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=7PcH9YGEHhqRaAE9wAKkzEd2E8tkXfCDwPiAChY+XEA=;
	b=sOdDF4PSp0jkKhcZhG9C/BdznUjLcYrV8v/K9IZXYcMepB6Gp9f1aa51TEOlTANbzSfm
	 2bmcAr39tJ/YxsbkpR1yW9XCG8I5i5g5QxaUvfzj3KaDm4PMMoEihK8SjaF5wWgSloecT
	 sdTRlxEZoNgEs8wmRzURwgcB7m8Nf9/+pdlA/2JC3y6svig9qgK90qyMIQLdOSRpHSE8p
	 WZgQqIX+Wy/LCAxlhIKqTo6drERjni01HvohUqzrfNi4qHzGI6hfHTe5F0FjV5WCy/gEq
	 9TtzU9qb4NBX+Enx2RoPzCzbCN3D01lItwUeaN7Q7OjV3H2WVOKPEFG0RE9Bme6qDUw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794688824;
	bh=7PcH9YGEHhqRaAE9wAKkzEd2E8tkXfCDwPiAChY+XEA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o74LQaBoUhXwxgTCqf4W44xocxT09wTOzhfQWItoBTMVnZURLznXxaJqcymbCm+S7
	 hhhhzHbk8StIFUAbXcdrh1i0DZbvvJih70oWGhmijze+rLhr2gCBnldz8v/WgAOngn
	 PK7sFLObLURqXn31aPmVvxJDwkBdxKARqoo2mKJBuYsRQ0fzTjnsJaOf3XQTB8owQT
	 1WyHBv5fq+brjSOBqkiF2ZnySOm78sUeWGB+AFbqbMTuRuiviLMOEw+aJWhEWOPjw4
	 TuuX0mw+Xe729N46NzzQhKJZ4UIypypCOLGo0qRs6RYBDtzh5MRCuM7luPh+WUKQ4X
	 L9Fyv59rfa39g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EEA640645;
	Sat, 14 Nov 2026 20:40:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52238169
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 20:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4442E811D5
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 20:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NUYC_egDv8T for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 20:40:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 87B47811D8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=J9pikvA3
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87B47811D8
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 20:40:18 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id SKXnxXUGUtleFSKXnxL1dq; Sat, 14 Nov 2026 21:40:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794688816; bh=vfBMMv+qs1fe5nROszTQ70k0ODrJzYTK6D56enUplDA=;
 h=From:To:Subject:Date:MIME-Version;
 b=J9pikvA3F9F/IrrpQmzMJvwhVKDNDm+Cn0cfRXv3TpCbz/u0eaanJb5AddyXHlzaV
 OV4/2KpqsVnF+GYkRUv8IvnWHeQJvVDR9NJAEUhkYY+LN7E4anxcLcXBF5UyF0QU+0
 537D2U2eDVtGcy5JTjWcekqXACzBInJJhkT2fU7mVrwAFDQyr6oB3LM5cjTIJsc3Gn
 hMRTjMSUQ8zxO0Ufovyg3eQrOXK9cWXE5+8xp0R23IvhMioSZ5IAGbo3b95US2ttle
 bZNxIpOgFPI4FeaWvz7yniaNqevpSVgxpyPxE7hJFFoShA5xS0yXST3Y6epwHnzCBl
 bkrikBrLI/ZJg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 14 Nov 2026 21:40:16 +0100
Message-ID: <20261114204016.752902-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLMmmHKVCYUtRW94+GDkgtpCQVGJrXyBRtxNWuTEoVM5u6tkzxowJZHawQz1xi/Jj5qduZZ+I7ydZ/XbYoUF/euPJg0wl0ch3+AuA+3AkFnML4fACTs2
 1lPzVR1od2cUN1UjLHVOXIf5MO3mDYQtkGCxx5A07RUwNslusgykj0H25HwE6bfGYdPeLidf9ugyXG2o9tvCU2roRYSizwkv4pj9vx/MFPPjk6QvVSdsjrd+
 VW2F2siki0CmkSUFnXl9J8g9f5/GJZWceQQkE2i55+E=
Subject: [Buildroot] [PATCH] package/dash: bump to version 0.5.13.6
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=0a896bfccbefdd5e79ae8ef6061f7e17e20c03f4

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/dash/dash.hash | 6 +++---
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 8884b55079..e6ffcc7c6f 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,5 +1,5 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.5.tar.gz.sha512sum
-sha512  ae326c110713a9da6b7afb977ca6fd931793b03011f0a7aa2c42e873f116ed09448deea9ef5ca4515fe3afe24e210e0aaa580f7de89934edda9cf31ee44c94dd  dash-0.5.13.5.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.6.tar.gz.sha512sum
+sha512  706ed535eadb37885b59edea10dfc5fa393c377684d9747ec91c9efea3228a14298f50b6bdccb3f1746ba7f3ff646f0d632c17c090e9311dc566be5039fdc431  dash-0.5.13.6.tar.gz
 # Locally calculated
-sha256  40090101a2a491f13e901d3d48e90414f26634628b9bfff35ff540363c227a7d  dash-0.5.13.5.tar.gz
+sha256  26aac476f476cef391c600cb064417d82a5465d8fc7c4fd56158c276e86538c1  dash-0.5.13.6.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index c2e168c44d..cf24c218ef 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13.5
+DASH_VERSION = 0.5.13.6
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
