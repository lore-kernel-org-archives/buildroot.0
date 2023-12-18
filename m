Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E013AC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97F2E40A1F;
	Mon, 18 Dec 2023 08:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97F2E40A1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CkDiWv6t6jFq; Mon, 18 Dec 2023 08:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFBD94098E;
	Mon, 18 Dec 2023 08:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFBD94098E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E99C1BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 780DA41805
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 780DA41805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8YZsXZNb7wy for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:22 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBCF4417F8
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBCF4417F8
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a1915034144so318151466b.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 00:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702887620; x=1703492420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T5Ppf3XymIfplvr8B/VcJz8V93AKG3VxI8daEOALGM0=;
 b=JNto6AOFmTZ/lrBJxEDhZ9Gw4VTlaUtLHfQ4ht0Fq9CCREzAlLn1J2ijptuVwZroRy
 HutPWEktd0V8UFPnHEKFeqVnwugNgCkeHcmW+BySdw5kSxAPrC3PgU+E1QiMOOduEM6F
 vEAChBgoq72PhUZki4PMMG8PuAXBLgtPGHqwDdawTQQV9ubtwyJu6UHaPE200KLw3emm
 p29Vxk46yei2DBPiKJrRE28Cx0nHebAUpwfMNNub+l2AR6sXjHbo5pQ+RqrV11X3EQUy
 k5JoMObCRmCU6JBvDVYTBqeZZ5CRkLkuJEKi9BBoHbF+MqGYVezxKmuC2teBcxOfzgBE
 RBng==
X-Gm-Message-State: AOJu0YwjQNqcPI7n2ecfm3/m851bpOuD07L8osiwSSbSKn1/uoRtrT4z
 IvVGAC1AEdJYTuHGl5p8dh6LYsTYlycjo20BEe/t+w==
X-Google-Smtp-Source: AGHT+IHHdwjktjyeejJR0KgXGEMW/+tsldJ40MWa9ClytKWrbWh/M/yZa2DTiLnpenNRqlAV7xTj/g==
X-Received: by 2002:a17:906:7307:b0:a23:5eb0:68d2 with SMTP id
 di7-20020a170906730700b00a235eb068d2mr412992ejc.110.1702887619803; 
 Mon, 18 Dec 2023 00:20:19 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm13807835ejc.162.2023.12.18.00.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:20:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:19:53 +0100
Message-ID: <20231218081958.506691-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702887620; x=1703492420;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5Ppf3XymIfplvr8B/VcJz8V93AKG3VxI8daEOALGM0=;
 b=Qa+1rVF3x2MwzqhritQW8ZJtlsOW3QVc652bIci7UeW7tQw4QnYCSYjZqLwd/iB7ZL
 gRMHvlv9RHAXnWROLF4pKXZXWZPFk58BxJZ5i9x/zGQRpLdwjxIgc508EMOQMBCdZSaf
 +hd3ZRgzM63/EKCBE/vV+cKgON/k5GJKM14Vo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Qa+1rVF3
Subject: [Buildroot] [PATCH v3 06/11] package/python-rpds-py: add host
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
arrangements with many parts. This package is required by binman

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Drop Config.in.host

 package/python-rpds-py/python-rpds-py.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 6f71d0204704..f426bddff3d6 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -12,3 +12,4 @@ PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
