Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67217C54E58
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 20:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA1AA40463;
	Tue, 12 Mar 2024 20:14:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyxYVuRH6-HB; Tue, 12 Mar 2024 20:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBE0D409E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBE0D409E6;
	Tue, 12 Mar 2024 20:14:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9288A1BF239
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 20:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D034409E6
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 20:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g70HvyuhLU-J for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 20:14:44 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=jeremy@jeremypeper.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82A3240463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82A3240463
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82A3240463
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 20:14:44 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7c8ceb9fb0fso34092739f.2
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 13:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710274483; x=1710879283;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RPaO56gmVKsPv9we67TrBGba84oK4hpBUsk+zmknQsc=;
 b=iBVF5pdPB4a4Sz93pha/e/DF/2DBUFSMKWWPMEeSAimHddxT3XeuaqVjNRmZWdeekM
 CWk+kvgqWH8l2KJyrCbfczQsW7aVI1u5aMOEZkHhwAMZLxAyW1qMh9eDo4cnbCYCdTIT
 fgCYinp3U1kZa4yPPvdxOQFIblWbpquPiDxwT4nyJGaFE9nslosD6NOpZh26LFSonWFX
 tiym0OXFCRupzOCSRZIxt3IokVW+6/krflKonIyxM3e9v975VA09m4cYi5pRm/+V1YNY
 nJE+nkukr7CgpYjYmeW6V7yUm/yoJ5GY9zZMXqSJTxsFa05PkaL5nHqZ0dKY0wag/Rmv
 VHVQ==
X-Gm-Message-State: AOJu0Yy1fDzpJS8GwlSdh2oL2+1OgL71401XxKA8r1sLzimCHe3FFMkh
 oSsgEJjz10xlnk3NxCQLFRt6TKtL4VsZT9K/pjx3iZIOScnqa5pwudO+JxKLVu8149m2WliU65w
 0pw==
X-Google-Smtp-Source: AGHT+IHqPNzokejdHcfIOTx4Z5fLCxIxd0TDms7bP4mP9fI7mcXSTECPoWNH2snEjVdxAT6nhTB+cg==
X-Received: by 2002:a6b:5903:0:b0:7c8:c712:72c3 with SMTP id
 n3-20020a6b5903000000b007c8c71272c3mr4854895iob.18.1710274482721; 
 Tue, 12 Mar 2024 13:14:42 -0700 (PDT)
Received: from earth (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a02cd2e000000b00474d68c24e6sm2453205jaq.120.2024.03.12.13.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 13:14:42 -0700 (PDT)
Received: by earth (Postfix, from userid 1000)
 id 322A61060DED; Tue, 12 Mar 2024 15:14:41 -0500 (CDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org
Date: Tue, 12 Mar 2024 15:14:13 -0500
Message-Id: <20240312201413.781109-1-jeremy@jeremypeper.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jeremypeper-com.20230601.gappssmtp.com; s=20230601; t=1710274483;
 x=1710879283; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RPaO56gmVKsPv9we67TrBGba84oK4hpBUsk+zmknQsc=;
 b=1LrnE0SWRxXsROranQDBieCUrz3fgAvw4YOvN8/c0TCaw08V50OrfDLBwh3NNosWEE
 B5+rubXoZdMOKjK8SlWX2Q+/bEPbz6z6FbOLxLXrvkLAzgWuL0ZLUesXhx/R1IRfvPOn
 iIQ75Jt2aRuIloh3pYWSPILIo27gJCzVcanhLcZAJQnwFFb/3lx9jd56eVMIMrkdmXhA
 puHRkQlKWE4JAEEVs7OLaFKhqCZyNvOIZpDbtzlMV/36sNOeZ2FAxkGVleVbss+u7Ud+
 Pf0hZbm4FR8Qm5b2TYtt1oBhTnt3pVhDrF3U0fxkCjyi0co+aHipIz7MKBOwFlHHnhCM
 jpQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jeremypeper-com.20230601.gappssmtp.com
 header.i=@jeremypeper-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=1LrnE0SW
Subject: [Buildroot] [PATCH v3] package/targetcli-fb: needs python-gobject
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
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

add python-gobject to resolve "ModuleNotFoundError: No module named 'gi'" error encountered if built without it.
add python-gobject's dependencies as well
and comments to that effect

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
---
 package/targetcli-fb/Config.in       | 13 ++++++++++++-
 package/targetcli-fb/targetcli-fb.mk |  2 +-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index 04c6a1ac..57b1a7cd 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -1,12 +1,23 @@
-comment "targetcli-fb depends on Python"
+comment "targetcli-fb depends on Python, needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on !BR2_PACKAGE_PYTHON3
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_TARGETCLI_FB
 	bool "targetcli-fb"
 	depends on BR2_PACKAGE_PYTHON3 # python-configshell-fb
+	depends on BR2_USE_MMU # python-gobject
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject
+	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject
+	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
 	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON_GOBJECT
 	help
 	  targetcli-fb is a command-line interface for configuring the
 	  LIO generic SCSI target, present in 3.x Linux kernel
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index d2cbf79e..dbe36e59 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -12,7 +12,7 @@ TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_CPE_ID_VALID = YES
 TARGETCLI_FB_SETUP_TYPE = setuptools
-TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
+TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six python-gobject
 
 define TARGETCLI_FB_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
