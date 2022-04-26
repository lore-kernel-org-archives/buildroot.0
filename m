Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5A3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 19:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 666F3418D0;
	Tue, 26 Apr 2022 19:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqjMMjqvzhvY; Tue, 26 Apr 2022 19:21:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE0794185B;
	Tue, 26 Apr 2022 19:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37CA51BF425
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 19:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 265B783E60
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 19:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zueL607jVpEs for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 19:21:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4837083E5F
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 19:21:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v12so20009583wrv.10
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 12:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XfgDEuEAdADCLH6BOe1qDgTarcP5j4U2HNUFA+eP4VY=;
 b=qyo+DKK9LObhGz+ZmRpWBr3krCHwvV1O2eCR7BDiUduZfeiTvO68bHQQ1YrJd126Qj
 qATPdrRcwM6NNWcOlToEVPNhAxb2lw3Ko7KJpJ2Pf6TeQzQUEXJbRwhMsvXod4Vlf/G9
 VdRAy4q0LVroV23wOuu4pSV12LF29z0n+JzKKCsPH8FW63hXW7yi9lgaa2yZIT+vHl4d
 2Xse6Db3CRsht9CCmouaP/9HoReiTQVuVfCZnqLSeuPm3hV+vlVx3Kl6h97M4B0IVNRi
 572mSzfjovmCM9Sx08fA+PEL0hzXC81jxgPqsqR+/1s3geM64847yjH0gIFLVsnQfGJB
 0/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XfgDEuEAdADCLH6BOe1qDgTarcP5j4U2HNUFA+eP4VY=;
 b=t3hG+uYa8hsjCgro8AsZpraK2n/TG53dWvoJg+Gu18F5X9pJFrs/Ekgu/o3YZX93yP
 zFLJuwzYK1JtK6NWpxMdwAf3pLv/MRMvZpzMAKhnnb6dThBcsq2OWdpAakmOYedHVjwO
 O52gqwGGyxyXLL3P18f2BaHqoqCIXPJ2ic23HJLWRxUrXkCzwjWv99FPdJaS/ZCSvr5Q
 zTSwmuw21OB+OzipIoLE+2SqncWSV0eahikzv5BTZjS8QcCYHzqlifFmugvX6PnCPFOb
 5UznRbaVhHePwEuk+flWUKg+haJn+YjG5lKolL7WB8ewBaPDGQYF1sb80SutJizNNG+S
 cThQ==
X-Gm-Message-State: AOAM533hg1vBpV39ycv8mpFw7R4HIRQd8x2jqfwY/lw4G2nOEJwAqk0u
 qP3+ijvwaGw3rPVGlX2rangMevEH5+4=
X-Google-Smtp-Source: ABdhPJzX1NhvaR53TbYMh8bHXk9LkAhpb+blsZXmdFnPvBrhutnf1aGD11QxOuA5Vsog7dgKEXG7MQ==
X-Received: by 2002:adf:fa42:0:b0:20a:e8d6:58b8 with SMTP id
 y2-20020adffa42000000b0020ae8d658b8mr2557038wrr.64.1651000895206; 
 Tue, 26 Apr 2022 12:21:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b00393ed334220sm5781618wmq.42.2022.04.26.12.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 12:21:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 21:19:34 +0200
Message-Id: <20220426191934.2738310-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linknx: fix build with
 argp-standalone and NLS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with argp-standalone and NLS raised
since commit 5430c8fedd0392e79e0c011825b056fea129980a:

configure:7799: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/xtensa-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp   >&5
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
/home/giuliobenetti/autobuild/run/instance-2/output-1/build/argp-standalone-1.4.1/argp-parse.c:179: undefined reference to `libintl_dgettext'

[...]

checking for library containing argp_parse... no
configure: error: argp_parse not found

Fixes:
 - http://autobuild.buildroot.org/results/ce5753193ec4518c75ee0ab9270b577397ca1c02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linknx/linknx.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index dbee0742fe..dcfcd5e3f5 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -23,7 +23,10 @@ LINKNX_DEPENDENCIES = \
 	host-pkgconf \
 	libpthsem \
 	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone) \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+	$(TARGET_NLS_DEPENDENCIES)
+
+LINKNX_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LINKNX_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
