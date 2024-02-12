Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39F2C4829F
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 22:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C790407B9;
	Mon, 12 Feb 2024 22:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHhQtggkovue; Mon, 12 Feb 2024 22:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28CC8407C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28CC8407C7;
	Mon, 12 Feb 2024 22:36:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27BAD1BF34E
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14FA481846
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 22:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yw-Pk64zuMiq for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 22:35:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D24481836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D24481836
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D24481836
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 22:35:57 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-363dd27c082so12175425ab.0
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 14:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707777356; x=1708382156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRrYwOzzAAudTAWSNf86mj1hCqU6OXhFci+QNOmI6MA=;
 b=HY12CbU2N31rW0cVyy/Zk7ajU8d5cYJFBdeHuRXDuCC/MVTerl51CnKH+a5JD2nWVp
 uC8xlaJTtjzWuab/2E1aN5DBRCY6uFrNQPowCZw4aT8k5HuMTr3V55LlJUxYP7WnnHsH
 mjReHgAuDJ6z2ujFcuwjIj0ucSyp5dLOpIZIL0/5vZyogIyZM/tPVBUYHkoLb6PPbINc
 5WuLWNM+K+1ypYC9fLnGzAKUnp+DeHarHe70s4T9oU4HFWA6e2JRly2mGJchBAMViKuu
 wExm0fIyfbZyIpiBD57RQqNS+6bfHyh5vs1rGxnfFJ3zr4CxdOjnmM+OqcgwIP72i7md
 c+pA==
X-Gm-Message-State: AOJu0YzLRnyjjigDVtw7jDgU9SKozYY5nS9EXMRMCldEHrVjAgaknGI3
 Gnb0QUSEhDcq+S9rBEcbBviT6pE6uvoQ4XIH1X2K/cyIKYWj9x5zHaNVfvxRUt81Ow==
X-Google-Smtp-Source: AGHT+IHHdDpgiSuU9JR3V2Uj4tAK/5kFh4at9VFaFxM4d3HcyXV66NartZY6rwwLUVZq6yHtl4pW2w==
X-Received: by 2002:a05:6e02:e13:b0:363:bb5a:3329 with SMTP id
 a19-20020a056e020e1300b00363bb5a3329mr7691232ilk.1.1707777356451; 
 Mon, 12 Feb 2024 14:35:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW7FV9t6WCL1212aWyWdoknODL74ltqS3B/d5ZEwd/dIpydrhFXOKYwHcpbauqICE7aKEADV2j2YSU38H9nPoO1/S0tv4qULYN6iASzqMfKvaTu5xqfZQOc2JQyO1EushmjQL2ysSl+y/8RU+8jBc7fPRKIJly9y+FAsCDHrVRVyYB9zdLsLpB3+AehhH4UF0jWR6GNZW1qurOv2yRQ2TdfLpBW9u6WNW2YHL0aL+Ez9YZg4D8dYpYj3ISE868sdBM/1uYZb/fXH3wNreqA1DTVRArdXAiwoVN3bje9YQjjif7LBw==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 s11-20020a056e021a0b00b00363a91effdbsm2132656ild.76.2024.02.12.14.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 14:35:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 15:35:48 -0700
Message-Id: <20240212223549.3665464-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212223549.3665464-1-james.hilliard1@gmail.com>
References: <20240212223549.3665464-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707777356; x=1708382156; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRrYwOzzAAudTAWSNf86mj1hCqU6OXhFci+QNOmI6MA=;
 b=h+tL01rvPigmglGtp/Boi0EnT+F/btPIAb6afZaLUz7AroS+3M8d8JGHmW8l47yPzo
 Lth9agxA0bbepF2vIm50qzNh7VYEpwh2x7Ceb/V+8aFHsW5QGXuWarf0MQISjQ1/xzFv
 NGoCyRycuvYzXaVrHTOUI1wk4yd7rnIGNUbZ+rXBjE8UE9kng1PiAsJZJ2bqIiPfYq9c
 /uvFf+z82jw3AkXgK7g2Lol4JqrVnHABXIoCdA60bFrl6k3Po/2KfamSQp8z94SrtQjY
 p/b2SGiyIaVBL2AKDbhpFGguLDgn7mB2X87RUMO2t3y2GxwtUnrxlTaPtRsK3ToSQNwb
 VJJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h+tL01rv
Subject: [Buildroot] [PATCH v7 3/4] package/python-setuptools-rust: add host
 setuptools-scm dependency
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host-python-setuptools-scm for python-setuptools-rust to build
correctly when using a pep517 frontend.

Fixes:
* Getting build dependencies for wheel...
running egg_info
writing setuptools_rust.egg-info/PKG-INFO
writing dependency_links to setuptools_rust.egg-info/dependency_links.txt
writing entry points to setuptools_rust.egg-info/entry_points.txt
writing requirements to setuptools_rust.egg-info/requires.txt
writing top-level names to setuptools_rust.egg-info/top_level.txt
reading manifest file 'setuptools_rust.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
adding license file 'LICENSE'
writing manifest file 'setuptools_rust.egg-info/SOURCES.txt'

ERROR Missing dependencies:
	setuptools_scm

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-rust/python-setuptools-rust.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index f07263becf..e664a5604f 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -10,6 +10,9 @@ PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/f2/40/f1e9
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = host-rustc host-python-semantic-version
+HOST_PYTHON_SETUPTOOLS_RUST_DEPENDENCIES = \
+	host-rustc \
+	host-python-semantic-version \
+	host-python-setuptools-scm
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
