Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AA0C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C1440319;
	Mon,  4 Apr 2022 20:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5TqaAtv8skD; Mon,  4 Apr 2022 20:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F41884026E;
	Mon,  4 Apr 2022 20:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5EEB1BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E0F060FF4
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53DbZQqfpe8M for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:33:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A93FA60FF0
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:33:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c7so16412499wrd.0
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BVykYodPAVgbXNla0Nny73e9EbW1kXnZeBNvRaIZmNI=;
 b=mZDgLPf5hnuSx4HUZRgW0ENEoQrO2ocpvSxSSlcNrze4ulw6ZnTzbe/O2yfxtJ1AxA
 gamXGx+s94Dlr4ww1qrmw827Auewn/0cXa4GgWJu71HDRK0plK/fvopEaTO3msMcUn2a
 fzqswcJn56DuNrb8huHE1JAO/V5yy988Hwoo5FfMdDtuTfS2WkdOBJzO19fmnlHQSfb1
 zC11vH0psCz5hwOXFYl09iJCpuOM/6bHdFE0FsnkttECdf3MuWaLDWrRMmv7LShvLQIT
 z6cROWQoMQPcS+3ivcXKO2Jm0UclAH7YMg5PgiVTuAaHyZfideMSKa7VOxxYi5KyZ2t/
 v+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BVykYodPAVgbXNla0Nny73e9EbW1kXnZeBNvRaIZmNI=;
 b=Pq+xL0l0e/mqYk8SyoMoZ2Sdat/yqXxwI3xc0rQD0cTqa3dVFyhQL0SROQoYooTRVr
 GlMtzYGWot79EMnTJ/8dGcIYEIXdHqH6+pikaAarnssIJRzoMinedKqUoXc/v3ugbwpg
 RnWnKI2ow4g349xF2pnTo8hLR3qsi6dXl7CUtfVH3Y9u5MCjpDzN0glCOMdRVnCPTSBS
 znPJMsJuX9CNLFCLwjpxZo54i0Ed2i2iHzzVS8Nlwo9i3sR93YFBzXc1p4QetxYc2D4d
 jygFJ7qNhjsnjnmim17TCjyrcrG4sC89r6DvGETHO3uTNEHTLkhOsSyNP1yHK7vbjncM
 ib1w==
X-Gm-Message-State: AOAM532ykxQTqLGAfwT9uP1roQ01EskkKLIcB98f2S0fkIg4WYdn/Chi
 v0gZCTAkrhTIPOcsXL69xjLWmkRyJwQ=
X-Google-Smtp-Source: ABdhPJyA+YVj6DUokssEnS9VXHqK7IKcsCv64W8+VJCG5roXbwDoU2OwwMTduSKqxrjPOy/yL0UTVA==
X-Received: by 2002:a5d:64e7:0:b0:204:b62:94c3 with SMTP id
 g7-20020a5d64e7000000b002040b6294c3mr4869wri.243.1649104393588; 
 Mon, 04 Apr 2022 13:33:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a5d53c2000000b0020604b2667asm10326389wrw.81.2022.04.04.13.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 13:33:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 22:31:35 +0200
Message-Id: <20220404203135.340172-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ujson: needs C++
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-ujson needs C++ since bump to version 4.1.0 in commit
a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:

powerpc-buildroot-linux-gnu-gcc.br_real: error: ./deps/double-conversion/double-conversion/bignum-dtoa.cc: C++ compiler not installed on this system

Fixes:
 - http://autobuild.buildroot.org/results/b11600bdba42be9b211163e92afa3173276c3f8f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-ujson/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
index 81d1bc457c..7af03e6497 100644
--- a/package/python-ujson/Config.in
+++ b/package/python-ujson/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PYTHON_UJSON
 	bool "python-ujson"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  UltraJSON is an ultra fast JSON encoder and decoder written
 	  in pure C with bindings for Python 3.
 
 	  https://pypi.python.org/pypi/ujson
+
+comment "python-ujson needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
