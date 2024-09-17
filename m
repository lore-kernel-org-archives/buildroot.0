Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150E5CAC5A3
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB516608E8;
	Tue, 17 Sep 2024 21:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFs469h8snpy; Tue, 17 Sep 2024 21:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3F666111B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F666111B;
	Tue, 17 Sep 2024 21:30:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EB5C1BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B2D481E3D
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRT0U6U9xK6U for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:30:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6EDC681E47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EDC681E47
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EDC681E47
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:30:17 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82cdb749598so346717239f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 14:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726608616; x=1727213416;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1H1yxWVQhFJX9C+UeXNGguCGAvE+MEDF4pjJpOzQEhk=;
 b=nZ8OmXfXjV+6vT7c08+z9iUsOAiZULE1/pXNfKBMG05eIaA4ZgRChy+UrYwdYvf9Wb
 WWovn1prFyRM6URGy6Ey//WHNB2yvlqyDwFOR9/LFYAltZPPfhcM2/Gd4Eh83z7RdXvY
 kLul5Y6NZqS9KXGG2n/UXEQb+jpXrc+CeRqpDgg4Um6lg0r9P0E39SmZ/YC3gCB4JrGb
 6ZxAVPUeg+lcbsH0t6ZJauEGeQE+iMYo4xQW76hykqTUVPf+2/vcfQO4mkCuL6lUMGqg
 pFKFRWKnFJE1DKCFC8pXZ0Lb6Y9QU06bFWaNLzytnQFoeGBWChzZ2qOHBHcmgkpn02Jt
 ck/g==
X-Gm-Message-State: AOJu0YzRNyvcJoTt6OJ9n3YkH0Y/zEUN6H2dMADlsIeDjSv7I3dXWncz
 7bo5HINz0V4ApU4SkN20KwQzwgpp4HgNhW12HAGF9hQpAA5+Sy2u4vOYMw==
X-Google-Smtp-Source: AGHT+IFEWljqEI8fGIOpFo3uJYnrLEl55hcZJuM+jeJhH3s9exQo7xru/FcDf/2+/0k9+bBAvHGaWQ==
X-Received: by 2002:a05:6602:6285:b0:82a:6270:7465 with SMTP id
 ca18e2360f4ac-82d1f8cb6a2mr1921074839f.4.1726608616151; 
 Tue, 17 Sep 2024 14:30:16 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d011sm2145057173.82.2024.09.17.14.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 14:30:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:30:14 -0600
Message-Id: <20240917213014.70246-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726608616; x=1727213416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1H1yxWVQhFJX9C+UeXNGguCGAvE+MEDF4pjJpOzQEhk=;
 b=Or9VVyOYYm7HTxbvAxAJCGK5Cy+F8z6gZ2ar5YIqUQJuwfn8HfA8C4varb1dpgcuyw
 u6zeYE1/CqsgHTr4lkAajCpgIvPvIg8EiPSnn7nO3MACyI+Hd2j9Foq0DkqbeeIWO/rd
 TlSEQ0GYDMBpi+FZFea2PNU7tNdMuzoK2/sLZTYeM/MI8olIGChYO1mnm51gnosnsYa+
 sB5i+oxa29bEcx4tXOLyKwt0A1+4ajr0NvKfbyTuIAniayq0h7VhbD134sMMocyAkB1j
 cUGi1r3bBf6+YuDLzivFIl0XyJtN1Nyg62LJFRXx9C9gBIWWAgndY85F7B2xu/P33P7k
 DHvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Or9VVyOY
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.23.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 39f64e760f..7c59716a58 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  4d2ad4888a80e06641bfe6a950fa2390ac59a6b0cf0f4e03574122b4b5bcc6a4  python-pydantic-core-2.23.2-cargo2.tar.gz
+sha256  eff354ef5fcf428103276a2c2825962411327811866ff52eb0c2df703858ba33  python-pydantic-core-2.23.4-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index aad7988fff..d1f3ab4655 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.23.2
+PYTHON_PYDANTIC_CORE_VERSION = 2.23.4
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/5f/03/54e4961dfaed4804fea0ad73e94d337f4ef88a635e73990d6e150b469594
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/e2/aa/6b6a9b9f8537b872f552ddd46dd3da230367754b6f707b8e1e963f515ea3
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
