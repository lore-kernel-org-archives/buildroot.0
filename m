Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB41C48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E23183E56;
	Sat, 17 Feb 2024 16:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fCR430iu6p8R; Sat, 17 Feb 2024 16:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F8D983E5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F8D983E5B;
	Sat, 17 Feb 2024 16:03:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F27EB1BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6C8483D2C
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ua7e9NXhZC-C for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18D4483CFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18D4483CFB
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18D4483CFB
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:11 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56439b7c7a9so248848a12.3
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185790; x=1708790590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWGppGv2Q+OhI6IUb2JJB8bcVAA1qXdK+KR8C2+Rv50=;
 b=RynNhKED+9BgIQiRqvE3/xPnHlHfJnkpPZV0W6bRBBpsRMakYC+B/4iu92NtZ2jJWw
 YpjVoUx1dpSFY8ua4bfebKQMGJGZwn3NO0+A9TwwCdOQc+Es0lYLF2ENnYQyfUc5uN8G
 O6nVNKafl4DcnRyKACeWqPb40N3NsSe4uOKoYlW+HAglCz9N9zGc3Ir4qh86BBzoMJCl
 OF8x05As51UsCo0+DynuPO2FDOfTUcJMmHF/zj1OO4O9JguWwJ9i72d4Zo8480JIB0No
 x6+fhm56VGOUL6I5YwBFBxH/wFyeYJFFsgn85k6aPyNt7dlmA0Ixip6G+WP+7ftI8c3O
 RmKA==
X-Gm-Message-State: AOJu0YweCGmlYIG4on44lDAi+n2bQ5F7V2EmZDeBAThx3acpjOcJZLgE
 umc8JYwaxNpwxn6XWUaakJB5B+4wn9sVcfPW54ZmVEZHT4v83T0ebLkUzCHZgFg992WU261EZv1
 lHMk=
X-Google-Smtp-Source: AGHT+IFIjFlg0aZICc9iBBoWAmD6iXi28T8cujrUF1d4AFUVq503DwahcECf5iEbvfmg/41fs1rHjQ==
X-Received: by 2002:a05:6402:6c8:b0:563:d54b:472d with SMTP id
 n8-20020a05640206c800b00563d54b472dmr4012805edy.4.1708185789844; 
 Sat, 17 Feb 2024 08:03:09 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:33 +0100
Message-ID: <20240217160244.1320482-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185790; x=1708790590;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xWGppGv2Q+OhI6IUb2JJB8bcVAA1qXdK+KR8C2+Rv50=;
 b=YVHW1HLgHZxn1Q0LTI2ETF/A1tZ7BbXBZoopkEMzMHrmzEMd34P3pV45F13G1YBf9d
 Sn8IH0czGpZZ/4bXY/9E+0Drnmyz8pMQvx6sAcWqL0TbOHZ+s+QdhOAYUFHxeByu7aNU
 Rwx46mRaLHTANIjDieE7CBYDPkL5vGffMbSZY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YVHW1HLg
Subject: [Buildroot] [PATCH v4 09/20] package/python-attrs: add host variant
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
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

no changes since v3

Changes in v3:
- Drop Config.in.host

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/python-attrs/python-attrs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 8a1236cc4402..fb1729e62fa2 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -15,4 +15,10 @@ PYTHON_ATTRS_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_ATTRS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
