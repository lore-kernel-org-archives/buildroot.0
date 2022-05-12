Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09853C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 21:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C865416E9;
	Thu, 12 May 2022 21:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3TPJNWpakzfx; Thu, 12 May 2022 21:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29B81416D6;
	Thu, 12 May 2022 21:19:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05B811BF295
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF78840462
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-V0AnVqp6B9 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 21:19:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 122B040153
 for <buildroot@buildroot.org>; Thu, 12 May 2022 21:19:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n6-20020a05600c3b8600b0039492b44ce7so3720572wms.5
 for <buildroot@buildroot.org>; Thu, 12 May 2022 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ozbSzzBAQRs0bfYXNV606m16dNf6OOxL0+6pNPEeE/4=;
 b=l+26hNQP6DmnwvVwX+wW2WfRncfJJmGFi1VEvnnprno3F1MY2vQjJac5irW+IKdVNn
 jQFkhTxLOYuLlJmTNCPoiVRslDCFyKwmGNFy5LMfaepzUn3UTtD5+U85x9bb+ym0HVAT
 b1s05k1VDEYa/uqL813zfVkyUCbsVVr2xXthld309HLi8jC3qFdifdQE7DWqpLBpyVg+
 9DhqWGV2LqxoUcmDLm0aHJG3RGpXJ4ECFvExdW1Cci+2anbblN/XLPYGUQWCfG+lsirH
 0snDwFzIC+mp8lpJXpGcxcC3EochUFi3hvnRVfCu3HtpoohZe2yt6KVpBgZGplHIZ70g
 kafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ozbSzzBAQRs0bfYXNV606m16dNf6OOxL0+6pNPEeE/4=;
 b=E69/31O/hOhLcUJ2eE0JaQMRvH4EAJBKspyJLFJLoU4Pl4prAtqTZUJPr/9aDcWAxx
 LEoDCk0ZMAowxvRxB0RH5jIS77Fvr3XOzZop/7akZyp+JuKjI83oomm4wdhW2Kyxie4S
 y2J/7WVXLm6IpVpMuy72l8dpY92pMocNxHEnRpIF7waBI2XX4kOhebFEhoGY5OX/P2qU
 Jvnag8MfzLg5Cv2+AADV5MvJ4PpUXEjJ/iZkhTNdai8SpWLaoFWk/ylAAGYRXHJH8snO
 40RDRFZio3GFURUWKnjlBmGd2BvkdoUg4A036dLfThHlu6GC8ubQ5Vpv3xezL2YJpKPV
 OwnQ==
X-Gm-Message-State: AOAM531wnTCZWLut7/IiBv17cTqQcjxaMV5JGVKI+rel7S4YAj/OUEuw
 hvot0XkOPwbzf9jtNxMRqcucscnsxcQ=
X-Google-Smtp-Source: ABdhPJxeXl7zD1oXM7pdllW9yFVSww9D299EQSaPcG1M9PxlY8R42AMx1AfqqfZVbdFNUbamy4AYRw==
X-Received: by 2002:a7b:cb8f:0:b0:394:30b5:edab with SMTP id
 m15-20020a7bcb8f000000b0039430b5edabmr1563757wmi.148.1652390369021; 
 Thu, 12 May 2022 14:19:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a05600c4e0c00b003948f4e750fsm3722818wmq.23.2022.05.12.14.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 14:19:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 23:17:13 +0200
Message-Id: <20220512211713.2653126-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: link with -latomic if
 needed
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

Link with -latomic if needed to avoid the following build failure since
bump to version 1.9.6 in commit b02f13cd54912f3dffd0e0863378050104430d77
and
https://github.com/LudovicRousseau/PCSC/commit/d56ed18dbebc4423506ce7f61d3e3bcf4bdc4cb0:

/nvmedata/autobuild/instance-11/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: pcscd-readerfactory.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'

Fixes:
 - http://autobuild.buildroot.org/results/80b2197a37073976a7dcec7b0f92dba1b26fb3f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcsc-lite/pcsc-lite.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index a5ff074b2c..5bf9ce7f30 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -45,4 +45,8 @@ ifeq ($(PACKAGE_PCSC_LITE_EMBEDDED),y)
 PCSC_LITE_CONF_OPTS += --enable-embedded
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+PCSC_LITE_CONF_ENV += LIBS=-latomic
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
