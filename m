Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A28BC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B5D405D9;
	Mon, 18 Dec 2023 08:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1B5D405D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ER5ureydpDsK; Mon, 18 Dec 2023 08:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE3FB409C8;
	Mon, 18 Dec 2023 08:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE3FB409C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 133C91BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4CB1405CB
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4CB1405CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ae2tjWCGClX8 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:21 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D01FD40948
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D01FD40948
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a2366012348so7787266b.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 00:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702887619; x=1703492419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cbwu42yiqMeDNPw6FYHD992LyCl7Kq3Mj5cQVhlTkxc=;
 b=UrfxLhWf9YSjkZLA8d8ZQDEaz5v8b6Tdwih6aHMkmv3AUpnUe0h56qM7eeRzhgleQk
 Sg9Z9PcZoclf77MARGyT/UlmNgzi04ccH2RoCEbay4nCD05T1BESFifrrJTZ6aIgZB3h
 rN91OR8DLvfbJ8F2B5l4VT7bg0NtxHwiIW6x53URANLKZYsZtw0BhcFUj5PuZ6dd7npn
 j0WWfE8eWY6MOuTMYpkTEg3PyuYvOg3fGdZGeWx8VgBnnA9qbVCbdNjs12ngfIBAGaFP
 9kaKJMvXC6yOF9c9YrvXzvC+R0cIR5ZW0bGOKfOBc4IC1YwG9it/HxoLY8xMGLnEiayB
 KTxw==
X-Gm-Message-State: AOJu0Yyl+MRO7GIUPng3w6DBvdxv2qRa0wsdraCuXmn/T5efHQC/YOlk
 FGpg6g3iNViDgp/VtIdH1YUKN8RmRrqUItREeehE3Q==
X-Google-Smtp-Source: AGHT+IErHov8i/U27PXylVIAyCRq039Wy+x2r7Epn069d+ZR8LqzvzpJn6n3xZh+Mh2oc/yqXAIZng==
X-Received: by 2002:a17:906:3c1:b0:a01:c31f:c90e with SMTP id
 c1-20020a17090603c100b00a01c31fc90emr8235443eja.58.1702887618618; 
 Mon, 18 Dec 2023 00:20:18 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm13807835ejc.162.2023.12.18.00.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:20:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:19:52 +0100
Message-ID: <20231218081958.506691-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702887619; x=1703492419;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbwu42yiqMeDNPw6FYHD992LyCl7Kq3Mj5cQVhlTkxc=;
 b=ixQFIFHlIiDzEb/IHGbJjHVQG/y8sG7YRpvG7qcHrBVRnPP7Jv1AU4kilEG1+yezRI
 W3KlkYlHd/G5e9Sdr4Sv+WE51ZsC5HaYwkYSkc1GCyP43JiLXhYA5bFACLyBduj6BIfN
 7Kn6obl0F6qfOc5uRmGsMiM6v1zqbqelChd3M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ixQFIFHl
Subject: [Buildroot] [PATCH v3 05/11] package/python-referencing: add host
 variant
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Drop Config.in.host

 package/python-referencing/python-referencing.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index 4d11c99deb3b..9d8fc5a2f541 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -11,7 +11,14 @@ PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
 PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-attrs \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+HOST_PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-attrs \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
