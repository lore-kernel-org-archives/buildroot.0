Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23E5D0D16E
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8953B408EC;
	Wed,  7 Jan 2026 20:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5DB004BTA1p; Wed,  7 Jan 2026 20:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4E61409BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816025;
	bh=pZSw8hC3ieIrTdBHq5AZ4lS2lOvNs2cAGwOHEafmB1w=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=nL9Z/2znVDuI0zmuOZPT9rpQ25BW69lRcI8dq0hQqtOYNXw9zOEqwUfD9b5dQZXQ/
	 kCeWq7VezWL2U1Ul6BjQ9XrqAWU1wcJmQxQdklvDbvb4Qa7SF0o24m41gucY6SH6KZ
	 wk27VSZP5wcOTmkVvpRGmWeR3W6hd3LXPs/hiJjPB2fwvNTidjC7V3u2aKm94+3TXU
	 FYnK8vZjDUjbIMLGshq5EIlT+V+V48ewvGwVr9xMf3k4iLM/swMQ3vH1Nvk4Hu43GY
	 5vK0DNpQCfiMkW0hBfCyFRqDphPQt+LYdONSTcOfHpZeuGszL0QzLdobWcGeyQEUfZ
	 63UWQkEDEVxpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E61409BE;
	Wed,  7 Jan 2026 20:00:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73B6625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F2FC8226E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtWWakFOwKmO for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F6BB82219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F6BB82219
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F6BB82219
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47d3ba3a4deso14190255e9.2
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816019; x=1768420819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P4YT19fvnxXkHycqh0rn+c1t8EdKvCSOI+G6AUfszTk=;
 b=d51StbmD3KY0CeR3emUcOTMJpCEIWfsmejwizuR0aumplFW7O5+hYynjJ65ywvPMNp
 9I4GMxt+W+pEPI9caTOmMJ0YUgqpMqplJB6QtQXOCzH8jdP54LdcHj20W47wgg2dzyyK
 Xbq0nXFWOcvmym0krQ9OEfT9FbfgoLTY8TAuMBUI2Ww6kT0tbTW0QMFbH1tKp7AXhTRz
 voFXwNCsd3DtAZCCxUjHEFDOi01gtFFEc+b1UmgZQd3yWGQd8EAoBJHfUpikbNkUJEIL
 sS9y3Rj6FzOWnyDijcYXe9Qfw8Pi9OqJaKe/D9GcORVFWtBaKytBfxpsroh9yypodXo8
 qrQA==
X-Gm-Message-State: AOJu0YyXmOTreRnsTbLkUzgAWyhDy3ulwdTyiHZ6bcWfTkZo2xQub0wj
 Qi0VBwPKJrLq8UULffYN5tu8QHdJqXOieDhccQHLfdo7cej4M3D/TD2DQ/t3YGUgYXnQot1J85b
 /YTIDnw==
X-Gm-Gg: AY/fxX7yamkYEistWQGWY6ZumvpfSa0PINLiqFKP37LUr9JKUcs/GOMrRhXt16yBSxT
 +WhRGtP4lhF58vNRUHPgp27u91zULpOXCNrSdtMcc0FfzQbNK+Vxl4qCrYswQR05MdWim2q+g8I
 k/+x1G12FV2Fmxz8K9LMbWPnaBCAOHexhT9OtD6caA76ohY/XfOhByVSKu1iLCFf3mxKs+2dKID
 7fnpenGQsDZbwGHHVze5lPumjbr24cYaYsZu4Fnl/VuKlcVmwGcJyp+Tzju/LXCMgN1Ccme0PUP
 As933OgtfsNvvvqBbfSPcVc6LYr1wWTmDcX/JCsjcwnLScSm3QezolW+DF0/p93j9gb2Hv3ZsZ6
 JW/jROKAvwXzOPj0GKh7OOVAfQkZOGK9TENY0dvhXF91lXM1HT6IvZb3on25WeIzHs6WglHzdhj
 N3tKfHX3p4kEqbVoA81/IIZNQ0BXI4jpZmves=
X-Google-Smtp-Source: AGHT+IH2xDHwcwWXxydr5CohLvrjzgeUzU44HZfPSVIzyfTSrExf5y2DcbbdiamjxlV/Al2hAaITCA==
X-Received: by 2002:a05:600c:4e8a:b0:477:2f7c:314f with SMTP id
 5b1f17b1804b1-47d84b17dc7mr51609785e9.10.1767816018745; 
 Wed, 07 Jan 2026 12:00:18 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:18 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:49 +0100
Message-ID: <20260107200004.665611-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816019; x=1768420819; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P4YT19fvnxXkHycqh0rn+c1t8EdKvCSOI+G6AUfszTk=;
 b=jr5X3vYcKtpID9Oi87LRMRy0gZZkuh5//R9+jUNNn9t0K9lDIuVGwb4lEFFsimBNsQ
 Q3OSyswTuPJxJDVcXFp4YZNHyvpzVJJMF8Oo4kTIEtMmXHck3t2d8NUckzX47HkAnevc
 QvgBEYjwHkrYXeIgf0jhd740qZVGU536iRWFlk/5v1mtVJiQPQ89nWbs0utqdiQxCSOy
 1EnGc71LXOiCXrXmSHjSryJxMxW/xYAnI76crPiLiasN27tRBR4eamr5h7PpBtOc2QIZ
 7UXdI9vtaCX7JRKohizmPMjpFYqeXDyEcei5JHCUvcYfIdiyjsbvYeFZ/wFo7mMyT6Mu
 x33w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=jr5X3vYc
Subject: [Buildroot] [PATCH 02/16] package/perl-devel-size: bump to version
 0.85
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
 package/perl-devel-size/perl-devel-size.hash | 4 ++--
 package/perl-devel-size/perl-devel-size.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-devel-size/perl-devel-size.hash b/package/perl-devel-size/perl-devel-size.hash
index 6a5d88af4..8bf9d5d4d 100644
--- a/package/perl-devel-size/perl-devel-size.hash
+++ b/package/perl-devel-size/perl-devel-size.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  4978c07f54a730b16a705e074d7685e3  Devel-Size-0.84.tar.gz
-sha256  db2e4d65f688dbf59273b5e82101ac3f1a66f665afb0594dce168b8650a4d0e4  Devel-Size-0.84.tar.gz
+md5  1a7023c3c595a50443f9201a3081a0eb  Devel-Size-0.85.tar.gz
+sha256  292f98b13edd1aa4a544e3a5cf1d9f2d7019f75c7364d2e8fa8a35ea5451e73e  Devel-Size-0.85.tar.gz
 
 # computed by scancpan
 sha256  fca4ebe3a1f329aa33a4d259c0a5b136a15a40b987c60c2dd6f1007bb01a1513  README
diff --git a/package/perl-devel-size/perl-devel-size.mk b/package/perl-devel-size/perl-devel-size.mk
index 85ee2483d..7bab097c0 100644
--- a/package/perl-devel-size/perl-devel-size.mk
+++ b/package/perl-devel-size/perl-devel-size.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DEVEL_SIZE_VERSION = 0.84
+PERL_DEVEL_SIZE_VERSION = 0.85
 PERL_DEVEL_SIZE_SOURCE = Devel-Size-$(PERL_DEVEL_SIZE_VERSION).tar.gz
 PERL_DEVEL_SIZE_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NW/NWCLARK
 PERL_DEVEL_SIZE_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
