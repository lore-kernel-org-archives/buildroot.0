Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F150D0BB46
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 00:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A5FF80564;
	Thu, 24 Oct 2024 00:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvdXCcz-fZU3; Thu, 24 Oct 2024 00:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 608F780569
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 608F780569;
	Thu, 24 Oct 2024 00:02:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6641D972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47CB780569
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rWo2PbyUmEW for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 00:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6008E80564
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6008E80564
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6008E80564
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:02:53 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-8323b555a6aso13944939f.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729728172; x=1730332972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fMNnOsxAu9QLKJXuKD83ZDJExKSs1OHXdlsaOe6cTiE=;
 b=WdOL1eUYZBYKVKS4KoNzA+Ufku2Obi7fyfTQJLGsghfG+uL3sVpUlvwn66SddOd3S3
 Un+LBd+0/Qrils5O4+/NjLicb1BGVANbd0V64J2gMXEwAYpwJ2WM5DB/A3ZXJW1/Py/J
 4ailEHpbigIVPngf5C+ahHwAgkcCoB7NtadzZRiycDh3eUrV1RDqeZGqYWr4S+NeetVo
 5wU3heQHpeBgzPYOW0ghaZndf0osDgD0xL99ooorunnehH3sienbJFL9Ryun4IQe8yFH
 20MzzwmLhdv8hhlBMOifYirh4tBlGxqjFt8Go4q43bW9IbYn2Q16g6QphO2f4uFDdQNs
 y/EQ==
X-Gm-Message-State: AOJu0YynynqPvu0OIrlg2TUhRtLqq651W/zvpLRyXX+AHrIsZAp+x1aK
 Re4CNM7KKKScq0m7ciyimEvKWeEpDqzulEFMfAmqO9s+lrlBxDzoXZm09w==
X-Google-Smtp-Source: AGHT+IEn9kHHZmhyFE8BTr1/V+v89VDONR7m3VcOkZjjLrvuypRYFJmMFvCasLbczH/GAl7XHKCF0A==
X-Received: by 2002:a05:6e02:170f:b0:3a3:b143:98 with SMTP id
 e9e14a558f8ab-3a4d597c876mr41989965ab.15.1729728171776; 
 Wed, 23 Oct 2024 17:02:51 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a400a7b2efsm27858495ab.17.2024.10.23.17.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 17:02:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 18:02:49 -0600
Message-Id: <20241024000249.3353760-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729728172; x=1730332972; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fMNnOsxAu9QLKJXuKD83ZDJExKSs1OHXdlsaOe6cTiE=;
 b=XR6oaBz6f5ukuXfkjSnhqwyeuiYvHiRxXcO/DhanmJ9UiEJoi/y689mcrAWPtx7L53
 wZrtTK7Il7hLDt67EAWrN7YGvfr35/vcZRXd/aRnwt0ckikM61RIPsAtnr6lNCtqJ1Nx
 2JTOcg8thSbs0VNRlVOQ++joIduw7b2MuNk7DY/ZKYHbC57czWFyZmWzVT9NUPw4j1Q3
 vGrwZYUp+nn6M/GRJmvRP4/M5Y2C5MGYSXzGDUIDNwIh4zrUmvwffvmJfHlmnPBYLL+r
 0kIKTEy2U5/oUERZMIr7h6601rD0i5/5T35ID8ClECbiJzkjRPCMIGLilkaKk2GXcf3y
 etKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XR6oaBz6
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: use hatch setup type
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
 package/python-attrs/python-attrs.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index aec96793c6..c0725cf847 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -7,16 +7,14 @@
 PYTHON_ATTRS_VERSION = 24.2.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
 PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/fc/0f/aafca9af9315aee06a89ffde799a10a582fe8de76c563ee80bbcdc08b3fb
-PYTHON_ATTRS_SETUP_TYPE = pep517
+PYTHON_ATTRS_SETUP_TYPE = hatch
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
 PYTHON_ATTRS_DEPENDENCIES = \
-	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
 HOST_PYTHON_ATTRS_DEPENDENCIES = \
-	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
