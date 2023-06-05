Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C8AC77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC8924149F;
	Mon,  5 Jun 2023 07:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC8924149F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nM32gcBfkW3C; Mon,  5 Jun 2023 07:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 863FC416FC;
	Mon,  5 Jun 2023 07:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 863FC416FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3E81BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 108C14149F
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 108C14149F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfBKS1IjSmvN for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:37:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D32EB413A3
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D32EB413A3
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:37:37 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-777b0dd72d8so28682039f.1
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685950656; x=1688542656;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kXIr6WFsm1vk4Krp40Rf9EVwN/dbw6gbmleRktfOnKU=;
 b=kXdPPg4rav2MINjKa+R4XwHKa2clLcFmppWOKr9r0oakU7f6Qbs1Q4XOwTHigfmSZZ
 NflX5w3G2gkMou2BdWhaR49UgM7hpPtpnv3R/LNS39Yp6c2jKHDtN+5X1mcrJyBxBaWw
 n3NXehXwEvOqY7HtxF2Z/hl4NG6lnSLur/nz1uYwNYMJrTB1+a6jsJj7yQuLjhrpmgvt
 gtWGMj6MebhLiMyOROkGVIEWJavUzZ4m5HOtWZMwboetcRX29UcHTR9HChjeQxt0yUJz
 y8o9F2i1gaVUBt1K+IRd3Y+zxxqT9Bb95CeGBrV7EtBnV/watfmdvDDiKIJLJthnePMc
 dVOw==
X-Gm-Message-State: AC+VfDzZr9nxcFHHOp5FEIW7sFEyBWnUjOL3K/ukh/L/0oPLvhPIfJHZ
 0IlzRyZGsqZ0MFcW6lUvpFNKqzgeY5DpZA==
X-Google-Smtp-Source: ACHHUZ6S8Rm6Doyl+C5uDHRRSz+SvAS1V3nE+IQSctQZ2T7bZrsYuxJlaAKcyE96AGhmKlWb6ZuKEw==
X-Received: by 2002:a5e:941a:0:b0:777:ab8e:7039 with SMTP id
 q26-20020a5e941a000000b00777ab8e7039mr1569961ioj.15.1685950656551; 
 Mon, 05 Jun 2023 00:37:36 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 t2-20020a5d8842000000b0076373f90e46sm2469945ios.33.2023.06.05.00.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:37:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:37:34 -0600
Message-Id: <20230605073734.1891816-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685950656; x=1688542656;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kXIr6WFsm1vk4Krp40Rf9EVwN/dbw6gbmleRktfOnKU=;
 b=VxPHZchCcvt5uF0kqbABkwfz6uwA7amnsesdfs/na7OBoN6igswWPzgcVlt2XdLWue
 3qUuVNVuzPqP1t3WASNtNErHuH0QFDvSHjD/O/RhNIdhg2TwmrNskDI+1CzSmXq/3fst
 bR5+rpjW1JKF5AVy6yTjrWyg9cyTHbElkYWrurubowwM8bXR1MwsqBy+Tv0beHQNSRo3
 fbB7D33iErayHdAvp93g0iO1NoTA6tz1ht/92oaTICogNjsMrV5C8cVr0WE8eqGBJMKE
 cInzaGqTu16cWuHJmJWlbS4gFRVHCAu/ZyFXqlqMHhGrnwVA9r/T7NgLuuY2gea1B6Su
 iC9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VxPHZchC
Subject: [Buildroot] [PATCH 1/1] package/python-pyphen: bump to version
 0.14.0
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
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 39af62e085..47b9009ea1 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/Pyphen/json
-md5  a5039d1a4d8d4bad784cb864927f83f8  pyphen-0.13.2.tar.gz
-sha256  847f57a043a58408f24670ae0184ff6edfb5fd5731743208228c028ddc514438  pyphen-0.13.2.tar.gz
+md5  19e799bbf459ac675698c37c5fae34a8  pyphen-0.14.0.tar.gz
+sha256  596c8b3be1c1a70411ba5f6517d9ccfe3083c758ae2b94a45f2707346d8e66fa  pyphen-0.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index 9ca064c293..9baa2e7b98 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.13.2
+PYTHON_PYPHEN_VERSION = 0.14.0
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/46/12/aeb28a1e1a3f3cede967cea98ef3a1da844418ab8296a4bb9513f232736c
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/4b/52/46b119f94b3f68e4193ada36941606d8e26852b67bb6e099b0e310540b41
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
