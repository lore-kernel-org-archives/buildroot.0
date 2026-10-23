Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34296606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qs4WAWol;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iOfV43ZL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBFBB81583;
	Fri, 23 Oct 2026 18:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25FLZSNWJt_T; Fri, 23 Oct 2026 18:18:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 147EF81359
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779515;
	b=PIBWyUIMObOGzAPf0yj2QNghKWhtumnsUE4uIsDhS8rUA73DvzruYUUO0goy2bKElzMm
	 JEeNiGt/lRoPSP99MTNAj2wA3txhFJcaQJAnIGYmJUqzDxoeiDR9PzHKXJrymDzw/E73n
	 EnZdXK533K0Ucfg7H3YWKfIyUKsYIG9TY4nzAlWrYtk+Ri8KxVQ4VTonbRVJNPbqwxVum
	 VEXttmZWaJ/X0FaFwVzJVjSQxBTpW02RnS2R2J57fYT4dRkaW2Xp0uKnH+6b+AK+v+qB1
	 HIIas6SHpnp0RIvxNo9Qa/viV0sf0lqaBcMiuG9aHJgHAjkcEzhGKAGZSnuDUeG7LDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779515;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ENr3w9xfzfGdT3G1kP4pDmg0DcpeYKB+t+9p4faGCxs=;
	b=dsrtEdiOltFTyWCNbM1YtxzSAUS2nG0K5nK9PeSxybvZLIVlimhKsQGS3D4gWqSanIgL
	 8MDgY9c5/ZNpDN1rZH+h/73RNydsKakzm2zc+rdhX2mCahtzSHzIKZ/xoi+hvK7uxnwb8
	 OqP1agWtdQ2nZjHi8bfN7XSuACviYGaQyKT1fxchIWRp1TCO5r8HrM/FMuu9o70w1wDD2
	 zJydFXkyCp1Lbo2A5A8Dizk0KO9GjexnhGGdeeWJxFT/tICzqAaAh6Ophy8e5TMo1Ktp4
	 LWzezG3Oa81QeCYU2lLSE+RHKs8AqQlV7lNdcMvIp7Ik4Kmhd6H3k7YIEHWVpIopgbw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779515;
	bh=ENr3w9xfzfGdT3G1kP4pDmg0DcpeYKB+t+9p4faGCxs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qs4WAWolPT+/o88OQtu+JWLBUjDhsWO/AZNg7lRnjrgmD1pBctLjLBGnNdoITIUbb
	 VVwAIlCZFhxQYffxT46BRNzjliS1nsYy6PKM8MB4ZGohOUYgcCYV04MrqogNxNKSZ8
	 C7i6R/MpRFhanmdvFMtwFpsUZYyeLA8nGqQo1wg6kMOi9OPVMI4G72ClHnh5/UqlQn
	 Kv7ykXmfj5HFvV16B5evuBdvUcc+mIzA6SX7bBvP5S1FOhyOlxXRD0MeudLqGvMDjS
	 3jeRUoBdvMehPEz3/QoM11D6IEE9wcE8XNY1dDH7jqTRWyIUYY3YseBymFX3IPlttV
	 9cz865Q5GgozA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 147EF81359;
	Fri, 23 Oct 2026 18:18:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA6D3235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C58D40913
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PaLBdR3cOkXO for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ABBE74082E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779509;
 b=WX5uEUoaRKzygEGkbsDMvjRV6dfVDiC7m2dt5HZu4WJ3pvAxXQlTib8Id48uC4mVjXYO
 38eE+ngLER9AQhyjmfWMz/Uk15zCR/BOfQPiR0KcOmy5lwmvsL8/6EfAZ/XNCjUvD8OT/
 HW66g17D+s0yniQOTAqiXpuqh0Yz2wMVztkXIsk8X7G/PXGZOMoxR2IyOsvrNUz1Dn1PX
 pnJyv1DuPz7umd1D9N+gs3KzUdXheXnluATFMbhFob523II2QNAvNStXAekhMoqKcXns9
 5t9lcP4O9dvPuoydBAQK4RXZOyia7vlLiLtlT/539ll3ZYAn1ArYPasihSzurskjkJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779509;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=aADdGB3iDlotsd/nIeDb+pzfBvzwwRurK63LDLWNccQ=;
 b=FzBZL050+NeYNIFUvRLNYLj4CgqNZmsH9THmibFUhK+I0xL+70gaFHNBrZHq1G1Ru+N+
 mmLfO7T2EyjlEY91+VIyjz/yAgg0pDqd5MnjmlFBUolMyxrR+e/FsZPH1aXzhODHOQs+U
 F8/Lnwyupg7zpSvUCuE3kpC8kMeRB6/byipuGP84C4zhip8zopxlx1Almw6nSgCADY/Ks
 8EO+F/B4Tk+9k/9IjSSmPk1tlFeMgZZTRglUi8IX621Ca3xjVAYSADQx/CsmNxnQQFPek
 pOVTGKHm/yep6LZ50xPO3Sma02v3peAmsa9rTLusn1VEL1NSimZRZeuCMT0MEjPKMMQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=iOfV43ZL; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=iOfV43ZL
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABBE74082E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:29 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-6faddda49e7so1004991eaf.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779508; x=1793384308; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=aADdGB3iDlotsd/nIeDb+pzfBvzwwRurK63LDLWNccQ=;
 b=iOfV43ZLlIcjqdJ+y1I7QsQ1NW60arsi+yKIR1pHze5HpmKMMWgb8oWs+TrRF9m8nx
 DT5NQZEvuFBCYsNNn976oo69kvqI+uua3JvO8UrD49ERK60qJq5jIjvwK9YAN6R0FMOv
 dq4FfYOUhnipvmlwWr0AqTiSc5iG0IYulD0sTnqNDkVddGDCUZPaMXxnRSz4zq2N8Q7q
 X94LvVzaWC0NUyCds66xtxfBwt68LJfsTn7rAf6CJp2o9oOvEjLrzFmPFCx3ZoyDofIp
 ACTP6KUjuVcEu5JrTC/AjwldEWepfEE+ZHLbGcIuBGtINcFgdxpjtUT6AbDy6vIPz77l
 I0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779508; x=1793384308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aADdGB3iDlotsd/nIeDb+pzfBvzwwRurK63LDLWNccQ=;
 b=I/e46EVo/gevADzQu2iZX1rijBS2yTTukscLkiuRSKnkjw78RM9hMD9mSb6wtSA9Mk
 DLF28WgKAacjXRBORq7KLXgtbG2ehsbwqEB8nvRdtn++BO2fhMSlYYSl2qYwIJHFrew6
 98Yng9qLuisOSNyVxbrh+jZpMKM5ZVWtFRn6+YQljzuqZX15ssr+ZRzDB+QGq/7rThDk
 bhMzlWEbaq58Wio/S7QmRcmUJXJMWLT3LQUhBWxFLBNrti+hd3JK3a2EKqOgF/cH6qf6
 Hy+LxcIXKWbie96RPgrGUeHipfxEGIBZN4r92k2eWQB2mfcjHgAHl13k+ePC7nYqBHgU
 bHkQ==
X-Gm-Message-State: AFq9FYIE+jxTA3fJe0hiqBn9qhKnZ5mjb7RR5f9H2RqMiJVl2z4193Mj
 ZKiuc4erC3U/8ekq+aZa7KwcpfBzq5RfsaeKyinC63ZMSTiS22SNzeGpysr+zA==
X-Gm-Gg: AYBFou0GbtF1bOkMguKF8m3H19SWhhTS5UcQW5wrWF+69s9FNJbSSJ0lBbxyXOmHs8M
 E7tGF4rLKAyH6pSJfhPF+By9Hgt/5WwfgJ/mY/SHfAjd+CxM7F8JsHjT/bnp0F5a1OH+f5V2Wda
 xDdkly4eGiIUhYr91e7op31rIfU6jp66VQQFQANxo3V99dVgsSk+CjPirSwagHPec1CBTNab2YN
 Iwl1SngiSmv6IvlvBygSScO2XcXDjTNRtoeYSjVYkJBHe2S6DyEN3+2RTWlN/IAQJGdyZl+vnZ2
 p02Bqd6MO7GbRUgZK9lisFAM3M8VAP21k9X8D7jWJv9E99+Iij0SZaPI1L5spNtBRbav2oMOjtH
 Sf/giQddpwtv0/vJE9UH26h1dX1Y1Dd/h8sdG+/nigRrWvaUG3fIfpT0Vy2w18W8BhG2qaWcaP1
 mQKU4Xr/olPSE2/QylMWuEk7CPqLB01gzCWoijbFfeHdBpTwKlDGqY5hjr+G4aYtUqac2W3y81k
 5gJVivw4qcXdQ08lTTroAeHju4O1M8G/0G0wvF+wD9Cjie8KXJZIVFQdtG5KTkgwimyWn+EXoUQ
 P/mUalYjxB0F/wezcvneAF2sJM+iEbyObEZ7hsKs7rdHwnmdGZpsxPzoVj91iuMbXcomRoXK7+I
 x48Vi85piUfBYs+wBK9JOk1JGSV4GwEOudVxfiR9TDY80oBi0JTrKGK88gCrk0oMPcYQ1lw1dg8
 A/Csyg3lABgQKlCJk+bgt1Hhw=
X-Received: by 2002:a05:6820:609:b0:6f7:c0ec:1a53 with SMTP id
 006d021491bc7-70b889a0dbcmr2240688eaf.25.1792779508031; 
 Fri, 23 Oct 2026 11:18:28 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:23 -0600
Message-ID: <20261023181818.920329-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-bsdiff4: bump to version 1.3.1
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
 package/python-bsdiff4/python-bsdiff4.hash | 4 ++--
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index 2ea2e83be6..d9a7bf36cb 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  7150cf7e21905b47f169a27355dfb529  bsdiff4-1.2.6.tar.gz
-sha256  2ab57d01a78b39e29e5accc9cfead4130982ded9dccbc4261bd0e9c51d6b751d  bsdiff4-1.2.6.tar.gz
+md5  43fc56a8c7a6125a01561273a3fdfe9e  bsdiff4-1.3.1.tar.gz
+sha256  75366494bb91cd0fd39be5c297525a60cf853ce6fe601dfa67d6de461aa18d39  bsdiff4-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  44a0326b645fc642428a3978568d3a5c1061b503ce7fb7ef18fbc20be5476e2b  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index 1b10b63913..e7b258df68 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.2.6
+PYTHON_BSDIFF4_VERSION = 1.3.1
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/53/b9/4559ede9a4c8c4451688303544da84654643fdc7f28790aca85be80b4b7c
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/2b/3c/62c66de04e2ff09a3a3d56e4fc8a616177d481ae6c509363d178d2509690
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
