Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC4ECD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFE5C8212B;
	Sun, 31 Mar 2024 00:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpDa8H-r7Yjv; Sun, 31 Mar 2024 00:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48E7382169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48E7382169;
	Sun, 31 Mar 2024 00:42:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53FFC1BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B650820D7
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TvhTy9TY_wl for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:41:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53F49820FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F49820FC
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53F49820FC
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:41:56 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7c8b777ff8bso97951339f.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845715; x=1712450515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m9Uvf3YCdQZMR0m8rqQTcdsOE8MnxR3ZR2K3rmL+rdw=;
 b=Dn995RbF3jHdxO5Fo6SlBTHYG8W0jwD/P5QFtTqkP0h007EswGWN1q7NnpBaBDgM0Z
 G8BSUW48Nhr0Alig4P1yc1zsm4ITe+2a7HQz7kuKYZ/Gt74LZlpfkACkXIjkaM63FEDS
 JK90uW7RWk/sgDFM1Zeyi9QQObIwf31hNiLAceX2wWODhgoAzDDJJTpY9vAbksb0/zZE
 baJxV2+TV/L0A0yNbAqoarYFfXKQasb+8yZaLyvpapRm8tNEUyrolbCAn3CxpbUUo7by
 boWHxbXjd29VRnUEMdEv5CdyHJY6C3c4DuEVnT3IOkfaeWyOKafRwhUZ3o0LWV1tCO6z
 Oppw==
X-Gm-Message-State: AOJu0YxUvuIfvA2DFBRbTsgu3IDIcE71zV+GmO6wFPMzMvq0AtysoaQs
 R+3XqsVaGcdLYgioAmj9wwUX2nSInNJUTlvoJ9gmbuf9v/55Ew4RMz0joMkeNsUdkA==
X-Google-Smtp-Source: AGHT+IHj4uQcg6xcv63qBOmzYAGLJDYSs6h+PfOw3pA0ruaYo9ZXgrjqUB/TINI8zx4n30/34DDxuw==
X-Received: by 2002:a6b:c897:0:b0:7d0:8760:a4e3 with SMTP id
 y145-20020a6bc897000000b007d08760a4e3mr6493836iof.2.1711845715415; 
 Sat, 30 Mar 2024 17:41:55 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:41:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:20 -0600
Message-Id: <20240331004133.636618-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845715; x=1712450515; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m9Uvf3YCdQZMR0m8rqQTcdsOE8MnxR3ZR2K3rmL+rdw=;
 b=UX4G3BA2G/h/NhVwgLI94m8qaFnk45KCsUjoz7GkC9sr0n/IhKDgAkwnEcmkRTw7fX
 xMMQreeKClsxYhBWZkelSXvekUrinjMjF3OLYw7803tb7xdPHiQKk2LlM2VFcPnCepBu
 UXp/3qQia8juu0NumrhfzaskNVTmL4Qqa/GMKZcZb1g7QBRelO3GwFhsh5DYDBCe4fAq
 ctCb07XPX+AMZXAtqOAazu//45SezMbkccz3QSOX2o2lSZVm1mq7sLjLc1urs4HA9+dY
 evPfg3vY37W3Qeh/Xw7VlfNhoJk9Q2bBnDMkfs8GXixHGGiYiHT987v0dgtIpv3wcw50
 54YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UX4G3BA2
Subject: [Buildroot] [PATCH v9 05/18] package/python-flask-wtf: migrate to
 hatching pep517 build backend
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building with a pep517 frontend we need to use the specified
build backend as opposed to the fallback setuptools build which
only works when not building with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
hatchling and not setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-wtf/python-flask-wtf.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index 8274585ad3..bb32d55e25 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -9,6 +9,7 @@ PYTHON_FLASK_WTF_SOURCE = flask_wtf-$(PYTHON_FLASK_WTF_VERSION).tar.gz
 PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/9b/ef/b6ec35e02f479f6e76e02ede14594c9cfa5e6dcbab6ea0e82fa413993a2a
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
 PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
-PYTHON_FLASK_WTF_SETUP_TYPE = setuptools
+PYTHON_FLASK_WTF_SETUP_TYPE = pep517
+PYTHON_FLASK_WTF_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
