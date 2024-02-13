Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDDEC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ED6182271;
	Tue, 13 Feb 2024 21:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPfA_lXwUEUp; Tue, 13 Feb 2024 21:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3714982244
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3714982244;
	Tue, 13 Feb 2024 21:16:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 556DB1BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FFCE407A8
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbyhqSoADtab for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65BE2400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65BE2400DC
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65BE2400DC
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:53 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7bee8858a8aso224427539f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858952; x=1708463752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+LPAHWhrLQaKaP7YHCPv6geOS8iZt9ojpppCT07+Wdg=;
 b=WcxKrp0lHqlXeyShTHIw0Z7WPqF1/fBzU6OGnDbJ43bzOE0Jv9k29aaJOp5p9uYpy7
 hbuo+oW6Wyzt56o++CO1KOP5ZfjJBm9mXbU7M/fOGfVG9IcMXn1JWPLrxvPgm9CWHoWF
 IOcnXNrU2UAU5C+F/2kb2Su69peruJ0iN71sjajlfVgOjlpkRx5NjTXhl8Xw6RV0Gkzz
 XOSTA/G5i9B+KWTKPWtx9Vk9iIU8XtWaO6jIzV+HqCC+acQJq6DUee4VduFYYvi9crND
 I49/osva+Xk8dwygpoBO5EqKx3TBYE3EjuqDtdq7OF9V9J4kF9byVv2dGfAcf9FwuPYD
 oLGw==
X-Gm-Message-State: AOJu0Yywh3RPihs2WqbfeScOV55ubnsypHOue2GI3q4wsuIiOmgeU+l0
 lp0wB/seuziRIWeJ8EZy40f/RSeA8zOh8HOyuhC6P3q7mZgztQ1PFe8YMAPe+z3GiA==
X-Google-Smtp-Source: AGHT+IH6+pBDNo3ZtGm7yTpNR0Q4neKVNEaP6gBFLbfWSBn27Qqh/kVNf4gxOlkSb6I9gr3mHdWfCg==
X-Received: by 2002:a05:6602:14c:b0:7c3:f2a3:88a6 with SMTP id
 v12-20020a056602014c00b007c3f2a388a6mr958999iot.19.1707858952107; 
 Tue, 13 Feb 2024 13:15:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXG0JVyD8PMbU6hCFyHjz+QJuj5NzWxkSmyYffNEmxWVidmlVEqIROtXFDaItTHFuaKMzYqCXrO+hr6ag0sqpBrsFpK0xGE2D9mYXWKki+6kZFmsztK6LZlFFVHNm/vwjAgigqzoN+v3i0DoB4xxMx0oLqmWa/piY8HpLWjyPPpXCAqLyoqVa2loNVWSZo/s3TuvVl40pEsLHiwL1YnoGCyz84ymSS7DaB1+VDsu34X3vbnnD8pFff3UWl718fkgIiLN/BESA3sn5Y2WWek1UEklsfaKuJea+oryYmZYvUzMan70eIEN71BvkWR/nKIJqHREjkuxdcWEJm0aN1e9ca79Sb9ynghr/rMm8icWy000MadpQirNGK3zWqOh4pwz6yuwViievsvN6iG9KYPEoKOGbwwk1f06ha3QgdrEYbMweZty6iu9L3+WgYYA1jV04a6xUTy25/Elr+CPE+t7S7vvZJ04ZJPEXwb+Dg0yOSM92dJQ6Q8tH8Zm7/bsfpXdv6TyDk0zMCkk+LqVGd0T04JnSt9j0ZI+StEGbw4qkIkVRmaTLfJrdJ5k/a+BJ6z+JrKmGLW93Wm/qepmXbC4vXeGB+G+Jvt0kqbxtCuwMrTjA5brLZ0bjPHsFzCmhfKs5sbZgdapjVNBYtL30IQ1jSj40PEuufSkAR/dqEIxiv78fYI7Pa/YZZt816ghauGYFTMu3bbix64OEBbbd5CwEVdn2ga69g2fiperQqPnjaX/N7CJXtD0A==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:02 -0700
Message-Id: <20240213211512.3918044-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858952; x=1708463752; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+LPAHWhrLQaKaP7YHCPv6geOS8iZt9ojpppCT07+Wdg=;
 b=kmRVcVZY7Ns0+kj4GS6R+3r95lIuX9DNRs9rbq1ptcFLsbsIJRTvgzcKVjwGrzBDoC
 VBVkSeqrGi4ARaQvz8Bdm7vo3EIOi25Ib9An0vDUC+YZENjShlCVqOAe+/WmEe/L77oI
 o6zM3St6EYaD6/B/uYGHSRrk/PNoEwug4v1UkG3rhWGe2DZdyBxYad4MsK/QmAX2JVrI
 vyUsi5af46Lu628gYndpnFBGe0nXgvCNXAt+UmMjg0YbWV9OV/89oGkwxha2/do/tg8A
 IhKCYJ1XDkjl06g6lYWtHd4mBdoD9UaDZg3RcU1V0KK307uNB1LRqKDNhka6/zGpZ/Dx
 v3AQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kmRVcVZY
Subject: [Buildroot] [PATCH v8 16/26] package/python-humanize: add
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

The host-python-setuptools-scm will be enforced once we migrate
setuptools to use a pep517 build frontend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-humanize/python-humanize.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index 04cb0713fc..6155954b82 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -10,5 +10,6 @@ PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/51/19/3e1adf0e7a8
 PYTHON_HUMANIZE_SETUP_TYPE = setuptools
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
+PYTHON_HUMANIZE_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
