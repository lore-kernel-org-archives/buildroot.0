Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74A8D0D16D
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6708060BAE;
	Wed,  7 Jan 2026 20:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38FuC-__JeH0; Wed,  7 Jan 2026 20:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 344A760B4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816031;
	bh=hi/eeDfg2QUwQD2gORBvlz84M97uecAMaHJNNspAr5g=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=GrHlzab4pnwZ4AkbEfOCZttmWVdN8jsATy+shsvY3wSCDMi8ERHsPwazrBABFfVYA
	 pP/gCGiGyPf1/k/nrJxB2AuAn21PngEcWZo6Z0H8xfnhgip63hHIzLe13IWStuuQPk
	 HQdk3YVqr/IwW84SvAnx9DrjLdF7JD0tzuWIIJ4VPKNGt29wiBffJQN4DYlL4Taxgl
	 AVKB/VVMgaJK1oNoXQEFP56GXrkA3Iz5vpz0mU/w9KjkrWhvyZP3H+sD5gckIk/v9Q
	 /q6TquKzZscX7rpsIBYAJKh8lrk+JQM1+JnMyIEzWVfsU4LTSu9XJ0dm8MfUqUHlfB
	 Y/C+uKahHxhKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 344A760B4A;
	Wed,  7 Jan 2026 20:00:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 034FD25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A54AD822FE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntXeFkCvQYR0 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88C4582219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88C4582219
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88C4582219
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:25 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso12368745e9.0
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816023; x=1768420823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QQ/2/jox8Gob3+a2v07XBCIkg5E/TdlRE5HTO0hz8s8=;
 b=neJBxnXmLKHmcFDowMOLN8Ri6FU7v1u5WQOa6n5QB7yoE0/csOOXR2JtrgWC1CbFzs
 0G2p6qMg/Bfe+I1I8wgQ9OjhGO9p520lA9/Kdw8p41Y9JDnoq72biLuWxI2zoomnfnSU
 XxmSzM04IbE90i8ApEDlA0vNJlvQU5RnBTR+t88L91U8sgZAhGDMGPpdYKzOJwO3Vnn4
 H038asQTHFHBPAS0+Ux9kahQtsV3JhGif1stxdb6H0Igr0ADUzKmPTjoZ/EDJVLN7B8C
 DjPuMF7x6Cd20hAdU/mcwHCAB0243edrTKPgEjzXbeHrG8hRdpYlbsvQD/fKPy4huibA
 tJTQ==
X-Gm-Message-State: AOJu0YyKrzqpdVKp+wHsyyuCagMxXMlhKaw2v0tz3Q+f4iJPC6/IYs38
 XDtpjUmILCNXkAbdelgv1jV4427YaWcLGCUrRWuzGJ4R37pRwgwG22ucyp6OufGvyTGp8Xsh+0U
 bZNAQtA==
X-Gm-Gg: AY/fxX4KQZov6BOkj0DuB/DU7AjnveTUFyc03NHQKhId5H1mkVxoI/105TDuo3Xq9vQ
 B+/MJ6LvVTw8m66au+4ID4Ju3//OgevgxdlRhjpqNu0PXsVJr0zRE1lDVEU5u2qc58+mWR2UCGD
 Z3JFPU00P++4T0gO+iEQg3BlUwhzKhKHkfncgDbQAOWzYXcJ+Au1iG2nPDFG0J0+nWy0l8I4tG/
 nsnm7hKZxWkZEnIuHnNSB3hIm8+J0TqopbhjtumhgsEcmZo9jZ7SpEPxmYwQYscu5vpfdyb4LCq
 KQ1Uqg93dG48QkXH921UET+xqd1axRFYXBAsJvq1jbNTaC+6+rRvnxszIkfcPJYNRDMNpxTPTtg
 TC8cxbx1kczATu3wmaZh0s2RFy/wbmaxZnfSYPC27iP0s20lTWVaXfCWJbpIjyJiJz5XO+D3PSR
 dgQS1TmvpCYMuR3IinSWD7xAiQrLVVOD3T0sE=
X-Google-Smtp-Source: AGHT+IFYxi05w58VuYVcHt6Xo5JjJ09GtK5cMVOUJWMOa5vMC1PuBhTxX/EEDK98h33zXrJl+3gVQQ==
X-Received: by 2002:a05:600c:4fd2:b0:47b:deb9:f8a with SMTP id
 5b1f17b1804b1-47d84b40a99mr49832655e9.30.1767816023199; 
 Wed, 07 Jan 2026 12:00:23 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:22 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:54 +0100
Message-ID: <20260107200004.665611-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816023; x=1768420823; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQ/2/jox8Gob3+a2v07XBCIkg5E/TdlRE5HTO0hz8s8=;
 b=SNf56GpVB0VkuJDqjukk1g4v6a7JQmxxC4ypLiopAxhG9e2pfM+rxrEUPwpN2mLW0n
 FJSf3ibYYCVMJBG8UHByofBr5Dpmh0maCKGZpVy6ekNBLV3R0DjjWQFrjs2mBrajNohG
 5ntM2uGxGG8fyZEycAE6tbB/+aY49Uelsm4jsitNCqF4DJYGNr+5zhCc0rqOdMVrm4kL
 HnSaFaSyYUJIujuS1ghWKItm/o+Z+UkDm6rui7LSLB1tfdR+qMGCTtUk81NiEcwXBRzz
 mPaJA4SKfw8Qc36OH5cdm/pt80uPkOhlpI1OMu8LKlDMsEnhOi3kZQ4WJqRUl9az+FlE
 /bKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=SNf56GpV
Subject: [Buildroot] [PATCH 07/16] package/perl-path-tiny: bump to version
 0.150
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-path-tiny/perl-path-tiny.hash | 4 ++--
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index c0f1952c0..8a99f8777 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  656d3556bb7f30c77d0881d564e200b2  Path-Tiny-0.146.tar.gz
-sha256  861ef09bca68254e9ab24337bb6ec9d58593a792e9d68a27ee6bec2150f06741  Path-Tiny-0.146.tar.gz
+md5  7126ad3d5c14a32a5f4bde0054f57449  Path-Tiny-0.150.tar.gz
+sha256  ff20713d1a14d257af9c78209001f40dc177e4b9d1496115cbd8726d577946c7  Path-Tiny-0.150.tar.gz
 
 # computed by scancpan
 sha256  c1a19c0d83f668a784640c0b41e024f37b182ad38011b170f9200123e57f6070  LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 5f1078425..5f8317698 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.146
+PERL_PATH_TINY_VERSION = 0.150
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
