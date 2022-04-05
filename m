Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46462C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 16:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A949540ABF;
	Tue,  5 Apr 2022 16:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YvQkneKiFZDs; Tue,  5 Apr 2022 16:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3904405A1;
	Tue,  5 Apr 2022 16:38:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50C361BF3AF
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 16:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F6C460ADC
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 16:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DigYBHGYEAsE for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 16:38:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 453C360A81
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 16:38:04 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so1942768wmb.4
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 09:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b/DOCmStaE9B7h5+x/4QWQYoXayhWp4eNFJdl5bYwrE=;
 b=ZIBdfFUPyKMjfFYMoAwJmdev2DeaRwXl+T7KRglbsqL3gBypCJa71z97T+9erxp4II
 0rSFUiWqFcLc+YAVd8cpPz44+XCy/1NV+PlgIX5dp2zaimOwhm9K6JPg8EfNrw2mp0Wp
 ccLNltK+0LTO9TG/5RCD2IGjXxrIVm1nJ26D+rLn8d48jVCTf+d9QmL7O2BdSAdKmZ6s
 9u83eSOtOGbe0ay5qt05Xt17lG0cz6WFkM/V21db64H6iQ/TCuFQ6dnAl9kw8iDqZBAS
 766vmKF5ogpaZc+SyjPGZHD8fC/aBkbdsaYQHo2tg54lM/jVh3ej5yvX+9b3pPzjQqgy
 lZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b/DOCmStaE9B7h5+x/4QWQYoXayhWp4eNFJdl5bYwrE=;
 b=i1GN2AkZMHRWXB6vDR7pnrCIhQyQ8DgWeOOI9x7a8BgR9cqLFmgZPPM4+moVjiMOeU
 F0kismIZrDSk1hcoGYp1FyBAIu3S8HL0SyAm7KoIkGXEMmczXrVCqoO2vYog+gcTc0MG
 kVI5pHXDbGYm9bnQldCOMmp6qDc+7ZeUYq83KYVBj8kqPr518obLGbVFw5/i0TcvNNud
 K56e3xScP7WChtUfEgWWPmbXw5l5t3TbOPwLUkM1ZrLKpLtr/NeRRAgTIOtP7dsV3ATK
 R9uf+VJqj9a4ky/+XV2Qh078JkzKyNumGHeCJ3YsbRqg2geXcwDu/k8bLD4IEMGnBOLw
 rwRA==
X-Gm-Message-State: AOAM533sIPkMJUiU0VB2RJMlwfQk8DJh1ldUgvcUJqrkhwHYjC6mkwmR
 na6uOWy7csrsGYdhRwoV6+aU8ChS0MA=
X-Google-Smtp-Source: ABdhPJzTl0PiaS4g42JV82wBK1Fj7NFDLYUqN8glseh6yL9PT6GfieiJBh/rUEsDKWeFyBpmPqPSzA==
X-Received: by 2002:a1c:7715:0:b0:380:ed9b:debd with SMTP id
 t21-20020a1c7715000000b00380ed9bdebdmr3905190wmi.54.1649176682120; 
 Tue, 05 Apr 2022 09:38:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b0038cc9aac1a3sm2852249wmq.23.2022.04.05.09.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 09:38:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 18:35:40 +0200
Message-Id: <20220405163540.9277-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libkcapi: fix build with
 BR2_OPTIMIZE_0
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

Override COMMON_CPPFLAGS to fix the following build failure with
BR2_OPTIMIZE_0 raised since bump to version 0.14.0 in commit
cd707a9112e38b4ce98326b96c0ed12054ca1cca and
https://github.com/smuellerDD/libkcapi/commit/0e7b2b0300782aca19c324f3352f109777b4c51a:

/home/autobuild/autobuild/instance-15/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/include/features.h:412:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]

It should be noted that upstream already rejected a PR to remove
-Werror: https://github.com/smuellerDD/libkcapi/pull/132

Fixes:
 - http://autobuild.buildroot.org/results/35141ea3046f5a4593e0b27ef92e4ace6bc0be66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkcapi/libkcapi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 71dfbd9eff..353939bb31 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -15,6 +15,7 @@ LIBKCAPI_CONF_ENV = \
 	ac_cv_path_DB2PDF="" \
 	ac_cv_path_DB2PS="" \
 	ac_cv_path_XMLTO=""
+LIBKCAPI_MAKE_OPTS = COMMON_CPPFLAGS=""
 
 ifeq ($(BR2_PACKAGE_LIBKCAPI_ENCAPP),y)
 LIBKCAPI_CONF_OPTS += --enable-kcapi-encapp
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
