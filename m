Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DCAECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7F6081126;
	Mon,  9 Sep 2024 16:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lh8JtCK-5zmV; Mon,  9 Sep 2024 16:29:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D3DB81120
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D3DB81120;
	Mon,  9 Sep 2024 16:29:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 179D31BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D1B980EBB
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfGlU3JGNDTv for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:28:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 215B080CEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 215B080CEE
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 215B080CEE
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:28:04 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so17378665e9.0
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899283; x=1726504083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4HElJQpDf4rEDzxkP8J8Hh11SPF1C9YSaRk7JH5KErk=;
 b=cK6VU2B5gCQKplx8MsRhPb7TprVutzbk8rAGPk+1Hr1wfYLuLRfV1udacZyj6u0Xco
 XkmLlz7s3KIBrc7wx68IZeYzFJdOLGt67a7EqA3NT2FaPiedJ3ZMm+gySExYqm6/FsDv
 YuIl2YkXBuwg8gTwBMQR/MZOIaBnFV5310VCUbVti6y1Zur2S7vAjG3Jz+0Dj17KHDGf
 grgk8yU2c6iTvFaLtOHtBLxDxJHAxUgnJIfsCdytmMcd5XpQC+6zMw6rq+hywptzFsFd
 X7fdHjmeQm+rFYx+o7t4DJVvFPZT9aZKBCi7hd0Xth4HqYLXouJpedTfq1PpIwZ1nkQw
 +SHg==
X-Gm-Message-State: AOJu0YyVj3tOxrp+cuKLPqMee5giZ2KOCxRBFj/SeLJhxtfsK2e7FDec
 tX+3uHC+P8VK2yrGw6p2VVpBP84vDPaVLkM8DENwF3A65k9m2OYtsJShjAf0BGDV1GIqY4F1nCW
 09g==
X-Google-Smtp-Source: AGHT+IFhZIhTCiDe+42m+59c7YzXWm1ZcxU9Z1VcXm4DFiqfzkl41bGny1eUchgj/z34ZA1izFfNHw==
X-Received: by 2002:a05:600c:4692:b0:428:10d7:a4b1 with SMTP id
 5b1f17b1804b1-42c9f9d6f06mr90315005e9.25.1725899282901; 
 Mon, 09 Sep 2024 09:28:02 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:28:02 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:27:01 +0200
Message-ID: <20240909162703.3439481-19-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899283; x=1726504083; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HElJQpDf4rEDzxkP8J8Hh11SPF1C9YSaRk7JH5KErk=;
 b=V0FolYdoBuX0b0xumJFGcfn4kej7iMvz8L6Md4yI0GjUdMaVZ6Z66w+oyCYJ5EoI+h
 jYxfAp/AOQqHtBwKbnp3aQEbshV4GJzlqa7i8KjVZRpfjnquodElC8eoHeZuaicSNJq1
 T11M36IlXw8srvNw9hFiy39TUXwnBk0p8x3NGP7qHSys2X6KS+SbhH0k3KldksCBr263
 v4PLlQklalXAtoppUZwizcyJuK35MyFKaUQdWpPVOBKV098weRgk5sBXaumY8WKBRGcB
 S9dlSIydsIUQmXa8RJ7aKkiP9fe60xhE8xTdXzVnb9jvsnyGgEXpsFCQf/Q6ehGwAzpX
 iW3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=V0FolYdo
Subject: [Buildroot] [PATCH 19/20] package/perl-gdgraph: bump to version 1.56
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff README: update AUTHOR section
    see https://metacpan.org/release/BPS/GDGraph-1.56/diff/RUZ/GDGraph-1.54#README

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-gdgraph/perl-gdgraph.hash | 8 ++++----
 package/perl-gdgraph/perl-gdgraph.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-gdgraph/perl-gdgraph.hash b/package/perl-gdgraph/perl-gdgraph.hash
index b2ad4ecc3..1f23762a6 100644
--- a/package/perl-gdgraph/perl-gdgraph.hash
+++ b/package/perl-gdgraph/perl-gdgraph.hash
@@ -1,7 +1,7 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  38c6a188519e6272e9b2b722b315c3d8  GDGraph-1.54.tar.gz
-sha256  b96f5c10b656c17d16ab65a1777c908297b028d3b6815f6d54b2337f006bfa4f  GDGraph-1.54.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  4ed2187e4f59c2bfb0392fb407a59d13  GDGraph-1.56.tar.gz
+sha256  6f49cc4e59015480db9c9b6b18afd8c50be30886687b69411513d06f38971113  GDGraph-1.56.tar.gz
 
 # Hash for license files
 sha256  710484e3a1196664bbe8a5ad5d53c528e01226eb20e2885a4e1131eb6c6565cd  Dustismo.LICENSE
-sha256  f44630ad9101e40a101d906a07908c975a9b0742273cfb0c00a51d73afb53e7d  README
+sha256  a343db34e71a251a14209957c89add8fd1bc62c34aa3c3818d1b474635c11754  README
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
index 286902a66..80e1eab35 100644
--- a/package/perl-gdgraph/perl-gdgraph.mk
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_GDGRAPH_VERSION = 1.54
+PERL_GDGRAPH_VERSION = 1.56
 PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
-PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ
+PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BP/BPS
 PERL_GDGRAPH_LICENSE = Artistic or GPL-1.0+ (perl module), GPL-2.0+ (font)
 PERL_GDGRAPH_LICENSE_FILES = Dustismo.LICENSE README
 PERL_GDGRAPH_DISTNAME = GDGraph
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
