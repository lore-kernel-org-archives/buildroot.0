Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB22C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 13:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF33403B2;
	Fri,  7 Jun 2024 13:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4wkHRDyKxew; Fri,  7 Jun 2024 13:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3321D403D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3321D403D0;
	Fri,  7 Jun 2024 13:44:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91F6F1BF215
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 13:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A6DD41A32
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 13:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqdbnFbi3mHF for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 13:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D37241A2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D37241A2E
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D37241A2E
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 13:44:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4210aa012e5so22443045e9.0
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 06:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717767850; x=1718372650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aCq9CYhB13Kzn9NeweEi01EhZanq4b6cziLmvSlhe4c=;
 b=sIxSMfXRO0ZiD7OeuGmrXcETighHZcOybv4bM/NJH35QjlELjBVPDXLAGhnsuN25xd
 dZu2zk1iF+IPs2UuljA+NpxT7of9TzPyT2P/A5pJzo09TjJap7j45EVEQk6QFk6grdII
 Is4lKkjgL3m/9+rfZMukGbfntvsOcE23fBgt5NBt8dRC5uLSLiYmzLxDD2KOhtK/5OEN
 BHdFTrNpOI2feMJ552S1FNMq/+5c+sorG7Zk102ZTaAJdLTizgXjcvOYXK/UWS4V1/jX
 MMLQmoblDq83PsrT2+5iIso95DdyAOtzTvO7CEsNbOWDat1TPGA7ruqAjDhYYznzkSiV
 SpCA==
X-Gm-Message-State: AOJu0YyaVRTc0kPMmOa5wiNZriHnWh/7HjcErF5osL9pnKhBYn8eObqw
 icIMjPoSTqpaHkKfegLogVfYWUZ+qeac74QP8MpCkrlFjEncxqdewS5Vpg==
X-Google-Smtp-Source: AGHT+IFw55OV+B4slZ8YQGTlxxVzsEdDyAxJZnjTA5O+BH1cFJW6Ezt01x3bPJhnq1FHevlMOfDvCg==
X-Received: by 2002:a7b:cd08:0:b0:420:f8a2:f2eb with SMTP id
 5b1f17b1804b1-42164a02fe6mr24878595e9.19.1717767849742; 
 Fri, 07 Jun 2024 06:44:09 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421581490cesm86934385e9.31.2024.06.07.06.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:44:08 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 15:44:07 +0200
Message-ID: <20240607134408.2969500-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717767850; x=1718372650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=aCq9CYhB13Kzn9NeweEi01EhZanq4b6cziLmvSlhe4c=;
 b=NDD6/aW2w9dk/cvJSAjAaykWUtPA6a7qZiRipCDAkjW1crkEsgJIFspBqGavAsyQy7
 lrwkOQeDhkyLhgaTRieU1+qtetaomzj8u2UP3am0VygOQpncHtZ7ZnsTP8rtHGX5qpL4
 j1HHPNXQVOITXNHK3ZuCOs36ViSn6lAx9XIOH6JKZU6jX9fE2nYrSgWbFdx6ZPrwvlX4
 5PZPdAhIWM8Rv+mV4v8l87yLpiS3AXgg2Gry9D4xGZKPMCgVMdK4FD7/kXQvc4o8mzoP
 qmza4f/1XYCha95x9vN4l1m4by7jzl/4bwn4uj5dW1UPQXJZpMWLe67xNNiUpRkw8Ofj
 SYNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NDD6/aW2
Subject: [Buildroot] [PATCH 1/2] utils/checkpackagelib: really check
 variable name
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, when a package defines an unscopped variable, but its value
contains a properly scopped expansion (or even just the name of a
variable, there is not error reported (e.g. with the recently fixed
composer issue):

    BASE_SITE = https://getcomposer.org/download/$(COMPOSER_VERSION)/composer.phar

The reason is that he check is done on the whole line, rather than on
the variable that is being set.

We fix that by really looking at the variable we found, instead of the
looking in the whole line.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/checkpackagelib/lib_mk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index ce2ab5157c..831a8afe61 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -312,7 +312,7 @@ class TypoInPackageVariable(_CheckFunction):
 
         if self.ALLOWED.match(variable):
             return
-        if self.REGEX.search(text) is None:
+        if self.REGEX.search(variable) is None:
             return ["{}:{}: possible typo: {} -> *{}*"
                     .format(self.filename, lineno, variable, self.package),
                     text]
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
