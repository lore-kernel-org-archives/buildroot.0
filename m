Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24336C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 10:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71CC0404E9;
	Sun, 10 Apr 2022 10:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ePmnbNO_D1So; Sun, 10 Apr 2022 10:33:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81664404CF;
	Sun, 10 Apr 2022 10:33:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F36031BF681
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 10:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E20D8404CF
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 10:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6rpOI_UQYEQt for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 10:33:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7A46404C3
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 10:33:41 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k22so403392wrd.2
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6AyHICcc90Nsft2PWmapP+4uTO1x+igISwNl2nQ/BIY=;
 b=BqlPCCRJiQEPgAtzltjPbCxy/LbGyN5AJ5oRF1irtfu0ipjFDC8M6S11fWmhfQMwPY
 SB1vD9VFCS/oYXr8WdXDOhMnBZ8QXwcow9KFukOIRSaVKhPp6kPR0XM1c5MAmb2SvGoC
 ErjdpDF1L+1qPrNAPA7tFaRe4mwekOsnXI5aXgPlLK3tFl5vRSurY1vXkBx4NaUDMVaU
 dQRJCtcr5orI+LdUYSEtprExt4RiffiJb5zDgYAuW9it3G5QfZauqt+wWmB0EN+bNo/P
 kUiqpfkCxn1KmkmRRwyUMRzhUSgjyce5vLO21i+VUEP+UtMTVzdtvi3gw2Ih3z1+t/9j
 OGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6AyHICcc90Nsft2PWmapP+4uTO1x+igISwNl2nQ/BIY=;
 b=gC5idiGEHv7cFAcRl0jXMRrJpE4xKIkFEIuvWaHDRFWLnmndDC4ZMHk1cSU8T4Z51x
 OeBUUMofYznmR7WIKpDnYAEOkV1MMR2aTntyVK3/ktUgFBTc1B+FEjSEKJSr43I1r92I
 Pa7k3BjQK8h0FoGXEqFqTny5z0z94DMnKWFwmX4B9ADbpmXnmIYe+OCwrRiBge4QbmSZ
 rv29X4aKRMZD92qHOASTY8D/da/VEIgP5huI7TGqiKCCl5ib4SKizrGWt99gCMQ6LE7h
 uqiouZms9PtIoVjqMrQV8U8tjyuTQjfuSDNjFGXK96C/HaSMRlHFWIOEbgtieEEuPB9s
 5o/w==
X-Gm-Message-State: AOAM532UK7pU9mLqN93Pgsl1QU9O3juHVBCQ5Inrk8V2aGK6AUEQVP/+
 h8IhwHoiwUhrGrDXCaS90NIVVeMvZgY=
X-Google-Smtp-Source: ABdhPJwPir7Ma3fII4Hp3D9zbg2wSSLW/p/3sORt7Rczoycam7J3rJ0cuy/LAGJz0id7Mmb2lWAiRQ==
X-Received: by 2002:a05:6000:188b:b0:204:109a:fbed with SMTP id
 a11-20020a056000188b00b00204109afbedmr21589588wri.569.1649586819754; 
 Sun, 10 Apr 2022 03:33:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056000010f00b00207a217a500sm2420464wrx.88.2022.04.10.03.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 03:33:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 12:30:14 +0200
Message-Id: <20220410103014.115744-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/libkcapi: fix build with BR2_OPTIMIZE_0
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

Override CPPFLAGS to fix the following build failure with BR2_OPTIMIZE_0
raised since bump to version 0.14.0 in commit
cd707a9112e38b4ce98326b96c0ed12054ca1cca and
https://github.com/smuellerDD/libkcapi/commit/0e7b2b0300782aca19c324f3352f109777b4c51a:

/home/autobuild/autobuild/instance-15/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/include/features.h:412:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]

It should be noted that upstream already rejected a PR to remove
-Werror: https://github.com/smuellerDD/libkcapi/pull/132

Fixes:
 - http://autobuild.buildroot.org/results/35141ea3046f5a4593e0b27ef92e4ace6bc0be66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Override CPPFLAGS instead of COMMON_CPPFLAGS as -D_FORTIFY_SOURCE=2
   is added to CPPFLAGS by ax_add_fortify_source.m4

 package/libkcapi/libkcapi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 71dfbd9eff..30d500696b 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -15,6 +15,7 @@ LIBKCAPI_CONF_ENV = \
 	ac_cv_path_DB2PDF="" \
 	ac_cv_path_DB2PS="" \
 	ac_cv_path_XMLTO=""
+LIBKCAPI_MAKE_OPTS = CPPFLAGS="$(TARGET_CPPFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBKCAPI_ENCAPP),y)
 LIBKCAPI_CONF_OPTS += --enable-kcapi-encapp
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
