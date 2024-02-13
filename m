Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37171C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0027C822A7;
	Tue, 13 Feb 2024 21:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPm7thONX0BB; Tue, 13 Feb 2024 21:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A72958232B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A72958232B;
	Tue, 13 Feb 2024 21:16:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1091BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9E89402A8
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7HSC3XOiNPe for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:16:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7539C415AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7539C415AA
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7539C415AA
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:16:03 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7bed8faf6ebso255666339f.2
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858962; x=1708463762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d0JY1tuDy+qUGJ8M6k85sDVJLP9m22vfaI4+s+KDCbA=;
 b=s1f9GAgKeXQVz1qY51ijGLugTJZo0DtC2HymmchoW2eoqwpevkCgANIH0AX+FNu/gs
 9AG7Mm5Y/1W6ynj45vLTEryW11nLRMgDW1ebLl6gT3Yi61bGWHdsl1RIVlLnNF95Ytzt
 8Faw8GJd/n4AWv8OjnFOeD4rdmedmL8l7EmAyZWOjN/tar9CHK0PPX+maoQB1OoCg0pJ
 SPZlu9TSp5GQRcKiz1YRUEwVVYAnnbYtR2yubm6FTOdH9lY15VkrLIyAo2IZPXkU7LtR
 2NXOgbyACA7EORffS/6EzOIhH1pUfzXhSj2ca8hMrgo6QBSn7MYwX/Pr9laTvfSC0Ddh
 Kksw==
X-Gm-Message-State: AOJu0YyG6jnqKuz+aPWM2kknKNO899r1T80v4TGYwBT0tFrd/ug2P5GB
 aT4Nd+SmDX0DGJVZPI6caBi+RUnmObZx3acL5+HBuOMkfb3R5e8Wt0pbZlNO5yfxGg==
X-Google-Smtp-Source: AGHT+IGiFlPLGdp8p8jP3ePaIIvclMpgvkrg760f0WiRNk+tg0n/x6dgbzAcWK2EMoWcHArJQ/cE8g==
X-Received: by 2002:a6b:5a0a:0:b0:7c4:7b07:7996 with SMTP id
 o10-20020a6b5a0a000000b007c47b077996mr1085623iob.19.1707858962062; 
 Tue, 13 Feb 2024 13:16:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX4FW44aBAVhS4WdPI22TsNeKQkWy/PhpNsCHDeOYB33G+skAo7ns3/iOUE6SuGKi2PeLt2Y9LYH9ytvMc9GTthmCf7hPI9+F1C6/8sUFT050se4xhyVFsxDzY49uHbQGqQcz8GTf1F5FR8yNFFF29jBle0gKdni44zl58t5DpkYw5H7QDmFzSJ2nITFHk/xSNwXdI5k7UtpO0rJWvWdzunCYnXpwVV+gJ8FytJE1pBqVlndqlRsdguPEWJRxWMX0kFjMOUxYDljoxWXeJwP4sIJMtqk/qs7EW8k0gcZpwXsfwbe98aPLDp1fNxeuyjB90UJlmTXWumonJVifA+n3trd6T5Nb29comygwrX0cYyem8/NjpQM8wI7PknMRJxWq7TCXB/Lg9z7rcHRXhT4Gfm6HE9KvjTXZyLqxKBd9l3Y2sAU6pa/s1bInOInvscZ36ERs+HUMszRJ9MhT9XGhldmnHRe+Yc4MA81SqMEI/KTDiwa8RFCHqkrCcw0NjTn1vhF7JnmMbqaaNvHQGFlbpuhpg4Bu1NIPCjHnC6620HfeL3tNhXU6MCCfSn/C1Dkloae7LkRdngChxWubdrYXIrhca/OcF4yAPN7vgMkXzSr/8Wi+fSUDiERWcVqmWVbQClN7JFyV06kHljI7j2UwMJ5pEkJ93obKgcVXOUgGBHyC2N11JhCdoXaHLz7zCVteXZJUTLnqAwUpiVatclEgNeB38iIIyS1aczQlTTSWFZQyNZbuM8gw==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:16:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:09 -0700
Message-Id: <20240213211512.3918044-23-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858962; x=1708463762; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0JY1tuDy+qUGJ8M6k85sDVJLP9m22vfaI4+s+KDCbA=;
 b=aWlTJY45anUFo3ZvH2Hwgm8lXJEqCjh6A52/ALEqggTZ05r8zcvvsAvRYbVa4y/Xlj
 jiVexIfaFj60gGghV/pPoRw0t8OBVL5Qsvufz8jFYXHFQ0TQpMBh9/IYO6Iuajv28y2Q
 1S5OQcXma3a8u19uH17S2KMtdrziudeQACbDDHVkIHQos6RUCn8bJ1XimQy/wkaQbGg0
 cMLSQQ9VpcdAM28eCnz8iWnvFuhkiML2TyvaMA6fHKkc8b+KJ8qb/g0JCsEsoXzm65eV
 DDj5lOQnj4Ykb56WJakZdyKGI05e1MZaXc+GciI4Y2YcJoB5sZnZr1NaPlhNylOXL5JE
 rurg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aWlTJY45
Subject: [Buildroot] [PATCH v8 23/26] package/python-simplelogging: migrate
 to poetry core pep517 build backend
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

We need to migrate package/python-simplelogging to the pep517
poetry-core backend as setuptools is not supported when building
with a pep517 frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

We also need to add a patch which switches from poetry to poetry
core as we do not support the full poetry package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-Switch-build-backend-to-poetry-core.patch | 31 +++++++++++++++++++
 .../python-simplelogging.mk                   |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch

diff --git a/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch b/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch
new file mode 100644
index 0000000000..2c345fe268
--- /dev/null
+++ b/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch
@@ -0,0 +1,31 @@
+From 76c1c545bad28f592405ca1e5bcf6081051c946a Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 13 Feb 2024 13:37:00 -0700
+Subject: [PATCH] Switch build-backend to poetry-core
+
+poetry-core is the lightweight counterpart of poetry that is intended
+to be used as a build-backend. Unlike poetry, it does not require
+installing all the dependencies of the package manager, making
+the builds much faster. The generated artifacts are the same.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/vpoulailleau/simplelogging/pull/230
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index a89ab64..79403cb 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -55,5 +55,5 @@ commands =
+ """
+ 
+ [build-system]
+-requires = ["poetry>=0.12"]
+-build-backend = "poetry.masonry.api"
++requires = ["poetry-core>=1.0.0"]
++build-backend = "poetry.core.masonry.api"
+-- 
+2.34.1
+
diff --git a/package/python-simplelogging/python-simplelogging.mk b/package/python-simplelogging/python-simplelogging.mk
index 556628613b..dbd9ce3ae3 100644
--- a/package/python-simplelogging/python-simplelogging.mk
+++ b/package/python-simplelogging/python-simplelogging.mk
@@ -7,8 +7,9 @@
 PYTHON_SIMPLELOGGING_VERSION = 0.11.0
 PYTHON_SIMPLELOGGING_SOURCE = simplelogging-$(PYTHON_SIMPLELOGGING_VERSION).tar.gz
 PYTHON_SIMPLELOGGING_SITE = https://files.pythonhosted.org/packages/73/d6/4c06aa7f2c3b9fc09429a1196fd357357cc555de5e16c09b2d12e9db1ebb
-PYTHON_SIMPLELOGGING_SETUP_TYPE = setuptools
+PYTHON_SIMPLELOGGING_SETUP_TYPE = pep517
 PYTHON_SIMPLELOGGING_LICENSE = BSD-3-Clause
 PYTHON_SIMPLELOGGING_LICENSE_FILES = LICENSE
+PYTHON_SIMPLELOGGING_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
