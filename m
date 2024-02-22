Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5240FC48BEB
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1822B41BCB;
	Thu, 22 Feb 2024 10:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FoFgX2POMxlJ; Thu, 22 Feb 2024 10:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA9CE41BC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA9CE41BC4;
	Thu, 22 Feb 2024 10:17:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A3C11BF3FF
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 872B482591
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BLUrQPfIWSTO for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:16:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBAFB8258D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBAFB8258D
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBAFB8258D
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:16:57 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d23a22233fso49898251fa.2
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 02:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597015; x=1709201815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6GAmi/O0DEAilIwmHqE7GxRSrTaugNHqHhinoRUgGlQ=;
 b=s2JtHRapy/Irr+gOKQg4Jw5KtnBWoAJ8RgV9U55ix8xnln3EgBWUqjjwKjDzk0cn4t
 kuqNrbmvTaKm1OdpXJIbdO6oIx4Px0Xe64MnAvQz9wSKmGEuqhIfIT11PfRGEJclvTY8
 w/ZEhDNdLHr8a+I+ayjeucbYHuOjb3pp/mFDCd19hFOf2IZmS0MPaSqcfd5IKxXzGZwF
 tdGsJBAmmrrT1MrboTNbNEUgN3Xfku4btBQ/LgwQ9gc2wxrXKpBVydkW8GD2KmG8RuYH
 bAqj+dZ7YL7fRxwAsqJ39HFAIzxPKbpBTqUDDf6Qg0F6XkweMneVpO1LwBhXsz7KGTtf
 k6lw==
X-Gm-Message-State: AOJu0YzrfYOJaujvxA8w8yt1GS+DKFRb7lTXya4V5wYKU2GMyz8Nq7eK
 s7VpBWYMoTwwii2NwrofXmJ99EMudK7ClHjmRA5cOGyahR5Od921mnWeCdHBTds4NTPj97JFVT/
 IHMo=
X-Google-Smtp-Source: AGHT+IHjLYDj0ofEFikLXxUUxk19fa51hX6WmvolpSmYKuRDr6O2UVlHph/NiqOMbIguJp729yRf5w==
X-Received: by 2002:a19:ac03:0:b0:512:beb3:7070 with SMTP id
 g3-20020a19ac03000000b00512beb37070mr5722900lfc.59.1708597015300; 
 Thu, 22 Feb 2024 02:16:55 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4f68:2b3f:b15d:b5a9])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b004126101915esm5619349wmq.4.2024.02.22.02.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:16:54 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 11:16:08 +0100
Message-ID: <20240222101617.18422-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708597015; x=1709201815;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6GAmi/O0DEAilIwmHqE7GxRSrTaugNHqHhinoRUgGlQ=;
 b=qYATGUt7H6ekAnhZX5YCWHkeXjjeabJjHhPe9IpimvlhbcSeEE4eAw30EBuHYvsMN6
 kzw13DO2F1gcnl/uN6aKHaq1RyZjFQ4Cql3hM03LKnWYpvqZDAT7S0wdTfo9bRIZwXEY
 DJ0JABMnmHyBjgpqXGEDYXaNk748UnHLv4hlQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qYATGUt7
Subject: [Buildroot] [PATCH v5 07/16] package/python-rpds-py: add host
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
arrangements with many parts. This package is required by binman

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v3

Changes in v3:
- Drop Config.in.host

 package/python-rpds-py/python-rpds-py.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 80670f2e4fde..cee2ff290a4e 100644
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
