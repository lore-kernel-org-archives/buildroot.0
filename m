Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3936AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 22:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A27415E0;
	Sun,  3 Apr 2022 22:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2uEuGDpH-1w3; Sun,  3 Apr 2022 22:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA95B41507;
	Sun,  3 Apr 2022 22:21:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21E251BF350
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EA0D4157C
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cXCUPwho8H7P for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 22:20:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1715841507
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 22:20:34 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id e22so6178688qvf.9
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 15:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RCMCB9uPqfMG+IQd5RZ28TJ34swHtzc5Zy2LwIT/0uw=;
 b=ClK7lvltY6ojn+w0DGRhz4VJ0FLJMWO1ZuhKxl4FveSFcGEYwN8uOKRjfBHZpMdg2k
 c/NaV5wCkElpiFSYSJUbcbWhHTIDmtpPzCDAfua0iXOc/hIfDAGnmEi+ges92TtoXu81
 Yuds/uqBpS9XhfjVkTjUK5c3e2yyVoKZMlM523YmQhaBFqsmiULVM3ctap7aPZrDAL3x
 DYeeFH7OdlJPHIzb9AhLHsaTuwppdrKr/qss/yvzOXr/Drc4+rzFk6IXrK+MzvIAa4+b
 BC0/F6vgav8rPZzKQsf9wZc6rsXLufRbmheeiT8bEkv5KVU2phMaUcFmIgfFJAAeYu5t
 JUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RCMCB9uPqfMG+IQd5RZ28TJ34swHtzc5Zy2LwIT/0uw=;
 b=OlHLioUeQCNu2Q04I8O+QwNS/DC+pvzlbC6q5FIsEx+0ENdVs/cvR1DatiY+qWMdMv
 Z0RvIG9oNLQNV4Dg/5/4bsmb+Dn8PR1aj1nHQMNoqOoqvEK7dVA2gJv2ZucnFZ08kCsm
 JYsxGMbP70SM5nGXJNqBCiWbbN3SzfWzNcaM29dlTsnEFmDnxHrVBkcSyl5z2rKXgmMA
 VA76QKY1tGJjmFQdtCQEawsh08ohGeQoLZoQkDI2nbEeiavZkTsW3O9Gr6QUT7xXljXV
 KWrSKQ3hb93bx92hUgaURS0YOzgzT6liONcS6+n5AC6twhv+SKopwxai0YhWhejvbaCb
 z++g==
X-Gm-Message-State: AOAM5339FOP1tRAy639udeB9/bao+d/MgJCI6U7oAAne4VcATZckga2i
 wSbP+qqzlGEXK22o4P5IY1sjFKGgmQo=
X-Google-Smtp-Source: ABdhPJwIjxL0NDSutdpBIxWNuGoDtDGKuAH0hl9Y0fxnW2cD1wo5jCwStOLFqNiRHGNE69VozQymfw==
X-Received: by 2002:a05:6214:1c85:b0:443:8347:d7a5 with SMTP id
 ib5-20020a0562141c8500b004438347d7a5mr20283971qvb.11.1649024432816; 
 Sun, 03 Apr 2022 15:20:32 -0700 (PDT)
Received: from localhost.localdomain
 (cpef832e4b04a98-cm589630c62f8f.cpe.net.cable.rogers.com. [174.116.183.78])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a05622a101500b002e07151139fsm7472717qte.17.2022.04.03.15.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 15:20:32 -0700 (PDT)
From: Emile Cormier <emile.cormier.jr@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 19:19:52 -0300
Message-Id: <20220403221953.1158787-5-emile.cormier.jr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/6] package/python-autobahn: add missing
 subpackages
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Emile Cormier <emile.cormier.jr@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: ecorm <ecorm@users.noreply.github.com>

Added missing python-autobahn subpackages required by python-crossbar.
Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
---
 package/python-autobahn/Config.in | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index 627bcd73e5..20b1779b95 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -10,3 +10,43 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 	  framework.
 
 	  https://pypi.python.org/pypi/autobahn
+
+if BR2_PACKAGE_PYTHON_AUTOBAHN
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_TWISTED
+	bool "Twisted support"
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_ACCELERATE
+	bool "C-based WebSocket acceleration"
+	select BR2_PACKAGE_PYTHON_WSACCEL # runtime
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS
+	bool "Non-standard WebSocket compression support"
+	select BR2_PACKAGE_PYTHON_SNAPPY # runtime
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_SERIALIZATION
+	bool "Accelerated JSON, MessagePack, CBOR, UBJSON, and FlatBuffers serialization support"
+	select BR2_PACKAGE_PYTHON_CBOR # runtime
+	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
+	select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
+	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
+	select BR2_PACKAGE_PYTHON_UBJSON # runtime
+	select BR2_PACKAGE_PYTHON_UJSON # runtime
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_ENCRYPTION
+	bool "TLS and WAMP-cryptosign encryption/authentication support"
+	select BR2_PACKAGE_PYTHON_PYNACL # runtime
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	select BR2_PACKAGE_PYTHON_PYQRCODE # runtime
+	select BR2_PACKAGE_PYTHON_PYTRIE # runtime
+	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
+
+config BR2_PACKAGE_PYTHON_AUTOBAHN_SCRAM
+	bool "WAMP-SCRAM authentication support"
+	select BR2_PACKAGE_PYTHON_ARGON2_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_PASSLIB # runtime
+
+endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
