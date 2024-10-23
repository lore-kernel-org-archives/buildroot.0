Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D38D0BB46
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFAD440644;
	Wed, 23 Oct 2024 22:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3C3Hok3qFYYV; Wed, 23 Oct 2024 22:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D26140737
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D26140737;
	Wed, 23 Oct 2024 22:42:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBEAD2073
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA74640B13
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q25HdbR5WWyK for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:42:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91D2240B12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91D2240B12
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91D2240B12
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:42:16 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a3b2499c65so1590065ab.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729723335; x=1730328135;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aFRDUdiHI9svUBgCFu9+Q++YAZ84w2bGsUU73oTPQOM=;
 b=ViI6TDhDjO6CPU/k9cjpxqhkiOSe5UNoUnjb1b9sWKcPQtNNVKrcMpxxvGbHP2rj3F
 1SpVFFR4pZWrS1Foeq7hroguqNHYKDfFKKMpeSjmZkB4+SrtG/uP6Pe6k10T3pe7Rycx
 Hw4SDQX2DQNWuuE2siWBwATZ8oq3/7uxuMCse0BES7jHlUrn4K5bMV8jvwkCmD1NJ7Yh
 PTkYj8GxtcTrx4rMh0mvCxrJbXJDMLqg4evPBAug+GrshhCItBtEmKRpYFC3OrK5HNRR
 YHG9T0Ms+A7mzw57bpPlPq5aOLchD1Dx/5hI/3X1kMcJsth8EoV7ZmeTu9bqbfxW9bj5
 0QDg==
X-Gm-Message-State: AOJu0Yx/KBlS1KEAR5x/CTL3K8GsQavlraH7qK7pSL128oEqE8ckUziY
 +ElYfqnJ//UNwZ1hD0wiM7cKH9D8YF2rODQoQPTDq7iLWEJKUuScOuJ/Ww==
X-Google-Smtp-Source: AGHT+IHrUJ7HMJfI7J4iKnVQXJtB1C/y69V8O+n0aPCkkpFeSodLIA1RjfKfUtEI0BeITWZwo5kMVw==
X-Received: by 2002:a92:c267:0:b0:3a0:52f9:9170 with SMTP id
 e9e14a558f8ab-3a4de779187mr279785ab.1.1729723335185; 
 Wed, 23 Oct 2024 15:42:15 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a5572casm2396972173.66.2024.10.23.15.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 15:42:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 16:42:13 -0600
Message-Id: <20241023224213.3350936-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729723335; x=1730328135; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aFRDUdiHI9svUBgCFu9+Q++YAZ84w2bGsUU73oTPQOM=;
 b=OpMA7E2Ri43B94s0XYGwhTwP50Ld4c+7NIOphmNmQPmFcfUFzdL2sS3QLeFbO59G77
 mbcLGfAaaleUHAyycGUnRo/1iPT5RUuqnKEVfXtAkfEgiclXioVe9SwItsVEoQC8npEg
 X+CYGI8mZSW0N7a505vwzX7SjG9JDMjMZDb2rG14dTygo7P7mkdLm6WQQd3xVTZCndED
 JQvvRZkxZ7KykQTHBZUzDXNgybq43fZb0NWMaXEl2tlvtmZvU8umUxY92kt/VX6nKaUc
 n6/v08JtDK38kQaY+FauqFFb+ww++W0o6QDurMtk5YPKsvoyYAd7eJMWlvbObsqrO0B/
 rE7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OpMA7E2R
Subject: [Buildroot] [PATCH 1/1] package/python-httpx: use hatch setup type
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-httpx/python-httpx.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
index c6a298f192..21bbd48a58 100644
--- a/package/python-httpx/python-httpx.mk
+++ b/package/python-httpx/python-httpx.mk
@@ -7,13 +7,11 @@
 PYTHON_HTTPX_VERSION = 0.27.2
 PYTHON_HTTPX_SOURCE = httpx-$(PYTHON_HTTPX_VERSION).tar.gz
 PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/78/82/08f8c936781f67d9e6b9eeb8a0c8b4e406136ea4c3d1f89a5db71d42e0e6
-PYTHON_HTTPX_SETUP_TYPE = pep517
+PYTHON_HTTPX_SETUP_TYPE = hatch
 PYTHON_HTTPX_LICENSE = BSD-3-Clause
 PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
 PYTHON_HTTPX_CPE_ID_VENDOR = encode
 PYTHON_HTTPX_CPE_ID_PRODUCT = httpx
-PYTHON_HTTPX_DEPENDENCIES = \
-	host-python-hatchling \
-	host-python-hatch-fancy-pypi-readme
+PYTHON_HTTPX_DEPENDENCIES = host-python-hatch-fancy-pypi-readme
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
