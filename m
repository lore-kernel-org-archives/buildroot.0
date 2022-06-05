Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEBEC43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 15:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2AD34192B;
	Sun,  5 Jun 2022 15:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8WwaPO11sBic; Sun,  5 Jun 2022 15:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76C344167D;
	Sun,  5 Jun 2022 15:22:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80B9D1BF34D
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 15:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F2E94167D
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 15:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLfVeH3AFR_Y for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 15:22:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E37D4167B
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 15:22:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id p10so16591365wrg.12
 for <buildroot@buildroot.org>; Sun, 05 Jun 2022 08:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9h5DC3AWlHX+8jC+C0vTV42MaRSROO4cfvi4N30d9q8=;
 b=cfZZhiziKej8Py+XBFkppovLdagd3irBiVU1f3OQJlvyZCOtXQ1o7ZTeM5WnRUFh8s
 xwlgNgryeHKhUAvQPqn5E0KnZreNwiksB5Er2pNnZPjUI38eOw8c+5/LknppH7jwPyy1
 H7u0GgNFwNNCMQD3wDjhau0m6Ou7HlDTozUiSyc/tpFYBjqDPwmo6RglxHMu3jglj5o5
 ouemd/mNRtAdvmvvlkIOjLPI88lf0Mfr/CIGHnjwtHjWBxHHLHCuJZU+NM6tom0JjJCg
 3tCEb4B2f5TPMHuxyFbCSDfZDb+ip416mYJSKmEO8hMW0feeulVNZM1sUyTBt85lq5xr
 ojzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9h5DC3AWlHX+8jC+C0vTV42MaRSROO4cfvi4N30d9q8=;
 b=v1T0nmLFKkS15Ja5Z/jtqC2xyIT2EqlhVzftBewYWYDyGMuWOPUb/+qau7dR1wGmgF
 UjaxM1f9wdaM/vCeCl/JYo7vwgIYq9ThJcyOI+1MkNiJaDUjghjEFOBodjr8JhPr7Si0
 Ef1ba29Aa7fbPOgUC45pMVYOE2oIF4wNbk003SEJvmEeubDXS58b8u0cGHipEmrjvbAh
 okTGR30AvF87E5QeIG5kTQzPWpIm0oWLuzBadU50O/f7vYd5kPQB+RFe51PWP2uURq/3
 Km7oXhCNqlVTh4uxkkuSVkv02VcETvqe+iD1bJRM/ffnFHwTKwDd5LnV8USPXd3PeYVJ
 FMDg==
X-Gm-Message-State: AOAM533pYk9ZJ+pFLwbFusmHHyzV8U6XEqFLHDxQ0HDjaa6ujKgBjVa+
 mkKBzpjdof3TDVRydEQEu1E+KAPLm8k=
X-Google-Smtp-Source: ABdhPJziNW9q8Q6/SIwCxeH0ZP06qlohCyvt5j/eID3SUH4BPXB23/D84OE2a1FygC66XPoh18GKZw==
X-Received: by 2002:adf:f4c3:0:b0:214:d79:dd52 with SMTP id
 h3-20020adff4c3000000b002140d79dd52mr11727079wrp.713.1654442551875; 
 Sun, 05 Jun 2022 08:22:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a1c2703000000b0039c4b518df4sm2963812wmn.5.2022.06.05.08.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 08:22:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Jun 2022 17:20:01 +0200
Message-Id: <20220605152001.1669567-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gensio: needs atomic
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Francisco Gonzalez <gzmorell@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gensio needs atomic since bump to version 2.0.1 in commit
0f8d4a6ecd874770ce677b617b2c7f459eb1505d and
https://github.com/cminyard/gensio/commit/5528267b54ac5a8ac0ecd7fd9ba481d654b0e92b:

/nvmedata/autobuild/instance-7/output-1/per-package/gensio/host/bin/../lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libgensio.a(gensio_osops.o): in function `gensio_addr_dup':
gensio_osops.c:(.text+0x1558): undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/229e4bd1ba1787953899875ab56721c9609f035a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gensio/Config.in  | 1 +
 package/ser2net/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/gensio/Config.in b/package/gensio/Config.in
index f874d1a469..fd0e476970 100644
--- a/package/gensio/Config.in
+++ b/package/gensio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GENSIO
 	bool "gensio"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	help
 	  A library to abstract stream I/O like serial port, TCP,
 	  telnet, UDP, SSL, IPMI SOL, etc.
diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 3d110b70f2..1859d42c8f 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SER2NET
 	bool "ser2net"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # gensio
 	select BR2_PACKAGE_GENSIO
 	select BR2_PACKAGE_LIBYAML
 	help
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
