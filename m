Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1871AC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 03:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6C641645;
	Wed,  2 Feb 2022 03:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kqnmjgx2RQ2s; Wed,  2 Feb 2022 03:11:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C074C41643;
	Wed,  2 Feb 2022 03:11:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08A5C1BF95D
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7FB840153
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 03:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLQtR1WzRawr for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 03:11:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE8BD4011C
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 03:11:33 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id w5so15964443ilo.2
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 19:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tACJFTHnfFjj3rWOjR8b25rP+yJUdWMhtxNNazRb5ns=;
 b=GY7CiFkSxc2kC5diZ1AGHMoW6Zb5eCN5zw17mDuQ5vWH8NitjAzpz7hJaCQ8XJ5tUd
 auvD20crj7XqsnulRrP+8Ig0OCT83mLDHz4LutIKI4JtPJWVVWLgicxvQ94jUSrOGZGp
 n5UnbAAst9iBEX95nb/Fq5OnzbK/2AKmdNqi1idEhL6GgGTZ0+yurFjVEvCJ3cYDkjuw
 jpVWgBWW9eli6Pq3j2KHODaAGDTLlL4VS9OdoH5hqUqLPuRiqe6gHPNGkzVD/wLXw/Gw
 yTzwAqsbZZCp6+VBRhsD5EeCG3xiW21kxhkH5o7cdDUOoJgyIrjQu7JiG6hEjbifK+lb
 wuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tACJFTHnfFjj3rWOjR8b25rP+yJUdWMhtxNNazRb5ns=;
 b=QCnMNd5VdoanfuA8Zc2zjo1szRtWX6gH8uybNWdngf3QOh8Dp3sQ6Pl4Ncosibm4WA
 YjMhV5zFkmwT3epF8Dq9RaNn8FxHFvwgYRGuRcJuZ+DBu8MCafG2zvkVhnmyvePjkMbL
 T3tf4/EfYWkyq3BKCDT9FhDp4n1fsY56N01/jXLiWcyCEGXkL2S6LLrED+uMd9jD0YB+
 Rzi/6JnGK+UR0MvWwnSKODmSDe4xmpXX1wwM2rZ02v95j9V57xh5m1PeuIPWh5uwnnf8
 jWmIC+iqDAi8pf0UL58uLCBLS+Q/OHpEFEIGpXxLXhoVzid2yrWXLewytK0hWn0Xio4B
 NUHA==
X-Gm-Message-State: AOAM530UwPbRcN9AarptGqs1D2W3QkgVZrCKarxlbgqiHdabCl4fEXof
 is1m9BYSe2CwdMDkt1shL2dOfYyrwk8=
X-Google-Smtp-Source: ABdhPJxJO4qLqv1dMa44yzcmXaiellCg5sBm4O9iP3G0+CjvBbSOi53Uf9kez500iGf4Tv7MmtnIEA==
X-Received: by 2002:a05:6e02:1986:: with SMTP id
 g6mr17197383ilf.61.1643771492717; 
 Tue, 01 Feb 2022 19:11:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id g1sm9922873iob.34.2022.02.01.19.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 19:11:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 20:11:30 -0700
Message-Id: <20220202031130.2178288-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 22.1.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 0bbb9112d0..7b963df635 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  1ccd46d938d8b9fed435e9781e54e887  autobahn-21.11.1.tar.gz
-sha256  bd6f46315419ca0a5be4109f737410208ad5f19718f67ca6a4a674cc66ca9b18  autobahn-21.11.1.tar.gz
+md5  9b0ae4ff164232c952ba01ab3516188e  autobahn-22.1.1.tar.gz
+sha256  17e1b58b6ae1a63ca7d926b1d71bb9e4fd6b9ac9a1a2277d8ee40e0b61f54746  autobahn-22.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index db9e5083d1..df43e9cdf2 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 21.11.1
+PYTHON_AUTOBAHN_VERSION = 22.1.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/f1/d3/23fdf1ab0104b1b65d2f7884e923f0526750a59f96334d752afc79cf44ed
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/0e/2a/0b627ad4adf70437b5753462958b3ba5c6802d7664eb4a680e46423659ba
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
