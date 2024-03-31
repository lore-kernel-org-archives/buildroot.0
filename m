Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56405CD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 224828224D;
	Sun, 31 Mar 2024 00:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4kRvkNcHGog; Sun, 31 Mar 2024 00:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE1AE82254
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE1AE82254;
	Sun, 31 Mar 2024 00:42:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 362881BF954
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2205E40658
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2-CPKFqJdo8 for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:42:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 19D4840643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19D4840643
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19D4840643
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:42:07 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7cc864215caso125620139f.3
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845727; x=1712450527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j8Mb4XX+60xDT6FnCIIuqVAkuW+CIQKQTlAVj+IWPZw=;
 b=XjQBUKVLc6Deif/fez79O9lUpBMmllJBouerltY7EAZjHSClB+DzwL1KJmzby7gdz8
 bR4mMJmRUUIo0Xjr5PVUQIRfluWmhPXqPfc//bZ00wXbG3pnqehzashHMT9Z0Ii9C/DM
 w8fNnBr+QIICl9mHIEIuLysaf4cg9I06o2zohGkWGoHnAwx4TxObChwvNbeFgiO22aMO
 iLTdqzuxcwMBVY7hFFhy2Rwem41KeZsFd/VjTTHyY0tJmWsBFVfGkXcsMi34vt6FVz4T
 lC4YEDze7W3fK9bA2tcROciIm6Gw7L5PqqnkVDoz55O6SRBxqvz07uRHt8KXZvbB63xj
 muNA==
X-Gm-Message-State: AOJu0YwaqF0RC+DLCq3jBfsUGfPJm33kci4tw3vM8fylF5fgoNnszarU
 mWauK/Tf0XJP5rCuwR7lsxh2Cb88wHbMMa/zHjcRK11HtNgBFCAQaMCh0occ75TgWw==
X-Google-Smtp-Source: AGHT+IE3zPzKbBBo5TSPgdVn8Gfx4s7fc5DuI8kXl4qqD7AJWquMAOQkqzZBa18438InS4GwQ5osMA==
X-Received: by 2002:a05:6602:1d4e:b0:7d0:8880:e49b with SMTP id
 hi14-20020a0566021d4e00b007d08880e49bmr6712383iob.15.1711845726813; 
 Sat, 30 Mar 2024 17:42:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:42:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:28 -0600
Message-Id: <20240331004133.636618-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331004133.636618-1-james.hilliard1@gmail.com>
References: <20240331004133.636618-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845727; x=1712450527; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8Mb4XX+60xDT6FnCIIuqVAkuW+CIQKQTlAVj+IWPZw=;
 b=jcz3krakgsaYMPA3jgkERqh5p7d1xanRYy1vk08WkNlJgR+ljP0SExw41DbHlVFapl
 Y+SuFD0KZK8W0+XWZzw8PLCPuccdvQhnExDfXUZ6ZjLEiW4xz/mH1re0b2yKYBzWfXjd
 7zBmpoTDrI62ViX6emOJ+1iQZB/z51aBzG4k430Pw/WEDTZ7DJ8bBMTyBkDsTqw3cvYU
 s7uHFjB08r/Kly2mvdV6FqTTOQZutBx4Qn6AK2h6whm98JU/c3b7l7XZtoCD2lZ7IMF0
 JsK/EfpvIvW2TGhPaLmKR+yCV5iTRLAj7TurpGQcJu7dKGADyp6KhIB96a6z8nleegIT
 QpZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jcz3krak
Subject: [Buildroot] [PATCH v9 13/18] package/python-rsa: migrate to poetry
 core pep517 build backend
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

We need to migrate python-rsa to the pep517 poetry-core
backend as setuptools is not supported when building with a pep517
frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-rsa/python-rsa.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index d84ba8b431..69a6309b19 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -7,9 +7,10 @@
 PYTHON_RSA_VERSION = 4.9
 PYTHON_RSA_SOURCE = rsa-$(PYTHON_RSA_VERSION).tar.gz
 PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/aa/65/7d973b89c4d2351d7fb232c2e452547ddfa243e93131e7cfa766da627b52
-PYTHON_RSA_SETUP_TYPE = setuptools
+PYTHON_RSA_SETUP_TYPE = pep517
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE
 PYTHON_RSA_CPE_ID_VALID = YES
+PYTHON_RSA_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
