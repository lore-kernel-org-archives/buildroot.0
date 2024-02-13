Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F04C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33A0282340;
	Tue, 13 Feb 2024 21:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZF4E8FQ56ftd; Tue, 13 Feb 2024 21:16:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB2BC82338
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB2BC82338;
	Tue, 13 Feb 2024 21:16:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29CAA1BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24BD060D53
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMT83fRGvBn3 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D75060C1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D75060C1A
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D75060C1A
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:56 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7c3e4290f5fso210796039f.2
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858955; x=1708463755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFqLdS2ksMucS5DUd2QwheVDdQ2OnV0IjRWjOgrRFKw=;
 b=DovVMtsisEvazqm1Q0ZugGVXFb5pJmLcpjn75qecUW3QuzjY8Ub5xylRoCxkSKiqzJ
 mWzxfSkcmI3tXvEJyWERQ91UAdEjI79jDQm3kpkWelWtjJixpx0kcXb/Ux8HubqLQDCu
 ite5T1x67Gd7/9RUe19FJFUb6ENOyjqcamV6jRHvK/Jl3oS4LVU/ylv8e53t8V5741OQ
 hRQr0uua1Kc747xsCw3g6vk2BexfC7GsE9Aka+86LkEhQBa8GTFcryxmfxNhR7Pwj98F
 D6LboF1W+TKemhla4MllA1/t6jXz5VGUY1jtHkHoriXl+832UiTYl8qVzJbtKoqffFI+
 ygGQ==
X-Gm-Message-State: AOJu0Yyg51xo2OU+IUJH622KHIfVynerNFvD20yJsjaBJqxro94615Qa
 PYxYJ5vBL6jz1/zmHKHpJL8DUirGNVvMp/78v/Prl7THilE4WDWRSpKWOymDuVoMAQ==
X-Google-Smtp-Source: AGHT+IGEjnCK/Iil0zOuhG6AFgvdaBEBKoBbS1LN5WxyDhLufDVdWHtJGoGRzqWuFVkAV/VoYydqww==
X-Received: by 2002:a05:6602:451:b0:7c4:4c5f:b4ce with SMTP id
 e17-20020a056602045100b007c44c5fb4cemr977280iov.3.1707858954943; 
 Tue, 13 Feb 2024 13:15:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUV6j+FfpKvIngFLFE0zZFcGC1qvW7gYb6QbonuEqnFS6MVWBmeKOh+h9tfATGHQJAqVIzdX+zxE4rqlAd6DN/3lSyJ0yix7dbBw81ljcw2Aq015j+FMnq371W535FVUZAaJaPTNp9eyIRn0hIsLC711rwzb5R6NQghBGHCQvORx/Nqahs8McpGiTL0s0IHeJg+oHTDSrKu8BXa87stpTPFMYRGZRdS6ltSB9s3T3gzqy3rjl3m7z1gyAPkVI0VtRAcf1WT2P12Ac1Ww7JwTdp9N97jAdwmmJk7opDDZRhhBF5d9qaSr22pRIZoj+rT0e5DLLmCUGWs3G8b+kp7/jtbIassD8dHdpDXYZdskDtztLqiA0XwjAlf+EAKEB4CYrDnK930jVNJjpFBmhHkDswuB1BxHUSVMz0eOkPLGvScTnKKIX3s+CNPSPPomMGAGh6LeOeveOsxUNnEKQjFLH7TeusvmdB+bNRZORvQwZnTM2Pkh7xEW+kXBUx6x3wB4iEumh0dHemyBv7YS9XUUDwuEyv6lqSt2hPzxz4llzGDkjsyFCzcm2zEg+uZjwHxHYDwoM7TxMlDA0sg9J3WW/HRXIRsnwOlwYBXjU15NkjVGilXr7bRIO/AoTYSCS2T8tI1DO+hv2/BItLUGt7RLTesObJj1Wl5inXI7tHpaKFRNVZ1USu66fEJl4Ess9wwUQbyouxLfPgfvpaW2h0rV6WBUJuKr5oXThSd4MRh6LBE7tk8TOItBQ==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:04 -0700
Message-Id: <20240213211512.3918044-18-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858955; x=1708463755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wFqLdS2ksMucS5DUd2QwheVDdQ2OnV0IjRWjOgrRFKw=;
 b=A/C/yztO1KNFCPNMqL66EODefDT4rxswEjKEP9p1r6fvf+lyekIJXQMxlz3aCGTVy2
 5cZcsISzuCH01DjrhZnpal8h9ZwhpGFxbhkd6ptK7natBaM1jluVQKWnNrTQStJJ9m3/
 IRlZIkmvtaII9HWOiZBzhtMZ7hcWhFt9h7VXajkPm7O2SbPiwhRPRY50nc3eHpmkrMOv
 n2olJ2CvW1cbFEKGcF5MbobcyFaM94/dCK05GPVpOMO9fJoy7INOpW49Rvd8Y9X73gDI
 Lh6uinXgulX074dJCN1u8wF8evMtwk705L1NUJpME1qZloc3e6q0SzyutIfazT5TBA9V
 nHPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A/C/yztO
Subject: [Buildroot] [PATCH v8 18/26] package/python-cppy: add
 setuptools-scm build dependency
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host-python-setuptools-scm dependency needs to be added
prior to migrating setuptools to pep517 as this dependency
is listed as a build requirement in the pyproject.toml.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cppy/python-cppy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-cppy/python-cppy.mk b/package/python-cppy/python-cppy.mk
index adadc352d3..5bfd5a0f16 100644
--- a/package/python-cppy/python-cppy.mk
+++ b/package/python-cppy/python-cppy.mk
@@ -10,5 +10,6 @@ PYTHON_CPPY_SITE = https://files.pythonhosted.org/packages/c5/7e/6cc5acd93752ee5
 PYTHON_CPPY_LICENSE = BSD-3-Clause
 PYTHON_CPPY_LICENSE_FILES = LICENSE
 PYTHON_CPPY_SETUP_TYPE = setuptools
+HOST_PYTHON_CPPY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
