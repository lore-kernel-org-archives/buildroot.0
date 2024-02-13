Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01983C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A7082260;
	Tue, 13 Feb 2024 21:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_fIxvH5dNBd; Tue, 13 Feb 2024 21:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E1182275
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90E1182275;
	Tue, 13 Feb 2024 21:15:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B33E41BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE199407A8
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZWAZmA3SYef1 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05119400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05119400DC
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05119400DC
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:34 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7bc32b0fdadso218138539f.2
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858933; x=1708463733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFafOL1UIuF7UpmERYtDun/o18ay7IzrCTtfPfbCkHU=;
 b=gBPzC/M8TXLOCkiooBmq/7knyNSLIWLQh/yRnXxb7tSQfxVlppYAyjwyGq25HDkg3o
 GVylNKcUajrk5LK9shDpFxr7xJsAJDs9hQuOjjrhoSvKQnQWrvEuCIj9mZxIr1JsA03u
 jBGgAF/A89y1IQ0kjBkZg1rikRrbfOMZAZ8Bnwh8vdpRDcva2kU+yh08Yayh0kWKwyCn
 /CrnUJ+DX7YhNzOto7TfIQPrmhllawTU5sppPv2GGVUN27yZPgP8TcXx2eEKPLQgjNgK
 tExR9KHwTbSsA8z5xZmUYnacjnXr64mNTd+SikSbkwi8ASshI1t6dqpO1jhjvB2BIADl
 bVaA==
X-Gm-Message-State: AOJu0YzUbVNVZhd+Z/Y9/z6Y3RKSwmCc0vqGbWUEkOIqPJkkBARXfwum
 e2dxT5p1fh0rPbibEibceKUKlq87IqwgG+uWicvCA5cYifJZFFNRog1NFxP1231GGQ==
X-Google-Smtp-Source: AGHT+IHSNIlrUFV71lUb81l1OlkPZwUU5wztZ0zf6LaLX8ulJXQ+agNqIqGzHbqR77u9Evdo5XaMTQ==
X-Received: by 2002:a6b:7b0a:0:b0:7c4:60ad:4bbe with SMTP id
 l10-20020a6b7b0a000000b007c460ad4bbemr1065151iop.14.1707858933357; 
 Tue, 13 Feb 2024 13:15:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWmVe2T7Oj89k6QXnWoTB4+4LvcNV/WQriFs+sOd3e/JFmlxy9l/cUUv2aFDNugHY+nZcA6MLZ+3qEMScr4ctrSXHk259ppR9y8fAynn/CKBFAtcI97B4bPp+nVhcnss9W557XgH0sqXunTUdGyCzOW3lAekng0MCdy49pvEH52IiP3kM8cFh40jbkwrbCj8Kmes5/8ckugpEhtMn6qd4aGY3HU6YSJwlmsDxlb0PxLaBdaLk4fX9bUMLX0JE9TlHbPJIwqFnPbguG0xRNGYzMTpeYuVO9yJli+RJDTnqvF1GTI2iyvi/oONVP9KtUy5FWEnM3xq6uEVUz018PTV0nsOpWlw4NU9SBo+m50AwPdSExbuPy9TMSpwEuaVhJk6Rt0Jx6+zFQoMbv0TncTFjorZKViHSV4BDAmUjk9+7tv7K22zM094GAK630LpZ1mialb2SZNdMVoZK/rKZ45ZOW+Z66jLhz3VrAZUpkhIyrjpKwVLHnDbQE30QQS4OOq4m/DdX4V71Uo94N9YkBdrWBRo9y1BJ5cTxghkL9oypY4+5H+w40sSoPmyQLoSAjSSXOmZkm7b8bkWVL4Zc/FzGjUoplSZypl/EliTkAKNSS4DKh308sfFpECfqP/zJhKPQpmyrvRVaC+HI7hPFUM04FvgHAxrWY0+lfPVS+1od5KexRDupO5DxG9LiMC8nKeU4+sFtG+oKMgGNI3IzncfW9jLsUy3LhcSwqvF0dV+NW86iFgxMs1jw==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:51 -0700
Message-Id: <20240213211512.3918044-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858933; x=1708463733; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFafOL1UIuF7UpmERYtDun/o18ay7IzrCTtfPfbCkHU=;
 b=aIS1ShnP6mXXJEpm2eXF9cEpbj4Z37hYDKTXZvjCpyblFsMVQ2ztq9toNUm46JQ3eU
 GgA6cnZfPslM9a5/KRR2fPp9RzqwTYFVBHZj2r501G7VD/z9/rK8NiQwNVgaeISiGrBv
 y4DldjVuLpnEBIXAZlM/ipYlt6vbZpKCCDKZci+HMZB2+xo5XpcOq614B2WLIggYHvGX
 MQK0b4zbz5jfuAvXbvIQ+CUC9yaRA4s8ufRvyyiqxapaz5uRmaICjr72VncIqrHH89us
 bzOrHsMbs/xFUW+62ZmAe1sv/QsQUvGjV1Oq/dE81c+4jlBMlSRvB835IXMULQwM7L/M
 H67w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aIS1ShnP
Subject: [Buildroot] [PATCH v8 05/26] package/python-pyyaml: add cython for
 host-python-pyyaml
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

When migrating to setuptools with pep517 support we need to add
host-python-cython which is a pep517 build dependency for pyyaml.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyyaml/python-pyyaml.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 846c57df4f..4ab91ca5f6 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -14,7 +14,8 @@ PYTHON_PYYAML_CPE_ID_VENDOR = pyyaml
 PYTHON_PYYAML_CPE_ID_PRODUCT = pyyaml
 PYTHON_PYYAML_DEPENDENCIES = host-python-cython libyaml
 PYTHON_PYYAML_ENV = PYYAML_FORCE_CYTHON=1
-HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml
+HOST_PYTHON_PYYAML_DEPENDENCIES = host-python-cython host-libyaml
+HOST_PYTHON_PYYAML_ENV = PYYAML_FORCE_CYTHON=1
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
