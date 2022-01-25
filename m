Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EC2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 02:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C8A60FA4;
	Tue, 25 Jan 2022 02:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0WazEV8H0Gx; Tue, 25 Jan 2022 02:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 586A760B42;
	Tue, 25 Jan 2022 02:06:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD8B41BF34F
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 02:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D86D540182
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 02:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mM0RFlM5_c5l for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 02:05:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B83AB4011D
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 02:05:56 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id 9so6328270iou.2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 18:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qcqsCpkgSwb5V5SmuoSqoGcm6rBs8uN/4C9MyYSDdlI=;
 b=GaJkcq3HDbwETDCyxtepmwFL8P9k7CUrJMjdv//xDJxbc+kilOx5qLuSYDuWV5j1Oa
 Xqlba7OV8xw7ZSzlc8hCU7SWK3MSeiq7qQrD0fjd1uUy1U++PpSwCl5aGJCpgBbFPg3K
 l7dx+D5nl4LkVAyKnz2HOsOoevm6xc1Lw37bgkYw6FBKrj+f4LnB0cr3oooYkBWESew7
 PdexXpnMOmsbM17ni1bYc5w56jy24dkxKREdFinh6x+cqptbSefTedYdtYUGI7QoBGqD
 hNjemvOTgFVdQxWLIPW7CSEfnclPOW0/UqTjtQOFw6aE7j8oRvPWNY+BQssG5wQzZBUY
 GvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qcqsCpkgSwb5V5SmuoSqoGcm6rBs8uN/4C9MyYSDdlI=;
 b=vsyMpb23289PCwecIFZGSm0ONaBy1NejwEnXmeBtskeuOq01XhPSvLQIewngKnGZs+
 8uSpF/EqLqjp7qsswQkdYYpzh4AdRDcU/KxoUxmZXWydgViCTtfom34aqkxJjVFNl5/2
 xEuET6w71o0wWOzDhYCYBOznqV7SaFh39H5pqIoAipqivxy0OtJ/vep7kOR0J6s5xmpA
 JUYqa3RH6ttK/FEx25cPKrHlX0+EskOkPgkefsfLrj5oNXbtIirUle/e+j8HgeVPnA/o
 fAXjzhvz2T0ZP1FxPtsaXbPSdoJBeJFD+DOYWaOIc2wtEYlrRSSXGIOVKbEjIhLtBrHZ
 QqQg==
X-Gm-Message-State: AOAM532eU4Npo2Cj7sHYPGAYcMYKaeBqxXty7tBpdIaf+dyUf5tUgR0+
 fdoSNdCTwEaJiW913iEtqKic3Ub6tak=
X-Google-Smtp-Source: ABdhPJzK3O89O+sJALNOflWhn6XsUfdoZ1LJRvt8jQleXPrJl25FPRFTfh3DYb057dq4OVEIzNk3ZA==
X-Received: by 2002:a05:6602:2b89:: with SMTP id
 r9mr9846241iov.167.1643076355569; 
 Mon, 24 Jan 2022 18:05:55 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id 8sm8649090ilq.14.2022.01.24.18.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 18:05:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 19:05:53 -0700
Message-Id: <20220125020553.626832-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 6.0.2
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
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 2d9943fc0d..999c8867d0 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  e28b9592289597b232f09e5cc3857f32  multidict-5.2.0.tar.gz
-sha256  0dd1c93edb444b33ba2274b66f63def8a327d607c6c790772f448a53b6ea59ce  multidict-5.2.0.tar.gz
+md5  f8230905ad1f50c87e8d9cc6b0bb7ca2  multidict-6.0.2.tar.gz
+sha256  5ff3bd75f38e4c43f1f470f2df7a4d430b821c4ce22be384e1459cb57d6bb013  multidict-6.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  06a240ea10ba868fda2de58df859886961df873aa74bbab1e0f13eaf99f92b7b  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 2619cad2ee..1a9aec7ba7 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 5.2.0
+PYTHON_MULTIDICT_VERSION = 6.0.2
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/8e/7c/e12a69795b7b7d5071614af2c691c97fbf16a2a513c66ec52dd7d0a115bb
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/fa/a7/71c253cdb8a1528802bac7503bf82fe674367e4055b09c28846fdfa4ab90
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
