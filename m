Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44880C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 22:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB9760681;
	Thu,  3 Feb 2022 22:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXsLz_ntJtBU; Thu,  3 Feb 2022 22:38:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20EBD60AFD;
	Thu,  3 Feb 2022 22:38:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3632E1BF33B
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 135CA4048D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 22:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PbwQ9EcC8ocg for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 22:38:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0D94400F6
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 22:38:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n12-20020a05600c3b8c00b0034eb13edb8eso4608666wms.0
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 14:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K5DPBAL8Pv/VC1f4r9AfsQY5v2bh7QFj2uenItjH3w8=;
 b=FXykd7noI/Sr2zF8PEcKeava8yAnOGibrfqSyGEkj8WeajjDzgR8ZzhFTXA5+2c0D4
 AtRvbLjOYDux1pO4SkB6IPcE8i+25dbvTgcPbCQYvLEvpXu3QYadaSTm8GhB+e4ghUJy
 QzgMxiTeWLc6iAaBI7yUFPybkkUituua9kBAL5iikmywhLz6LN/4GUiYGZicHI6LggOu
 FZDTcknSt73g7MAP+WbEOkVvmiX83Gil9BZ+cl6VOfoWS6eUm3rMEKdY58gjAupFGIiJ
 EGLm6J2xIZhSoNJBoPgw8ylISDEumBaLB9Mt/Sp6HiWC7EoJVzyq4H9iNQ7Kf+NmMJKE
 mc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K5DPBAL8Pv/VC1f4r9AfsQY5v2bh7QFj2uenItjH3w8=;
 b=DqCHxjpX1JSRwd3spghTlCkeVQruXYkvU9ZFN1ckB/+v/1fnXWWKAGf7vtCZHSH+Z0
 Hq98ZPZ21p4FbZXY1c2TK7fQCOs8fErrZ7h27jV8gOHcYi4CLQcWnDt9viY3L1akstA9
 ykZWvk64z/Ir7sLM/jmcNi891iWyjDDxQ8e25BCwI0KMSZvUEhPO1XsWYwKdbwMfXQKv
 6FwmX9Fxd34Ne9Sf2ZBBKKLIBAcmrmPiwt3w/9Ee8mtuZzVyo6YeiEnHMqBpSGmcLrcX
 K6XNmySio3q/iBUIioMrFZcCqPLoWtJXOloHnda8phpQZfbsEj0KxrF5waM8yWC7U2aA
 HIEA==
X-Gm-Message-State: AOAM5312wgyMxgqLId4xbdaFPR31jTKktoSLVaolu2u3faNPPt1IY3qH
 Ek0WeelpYLaEpgPicgiZsSCoSWMrAi8=
X-Google-Smtp-Source: ABdhPJznGROV8OFlz9YRqQ4nnWRw42voy+I5+nyALXxxtuqW1LnUQjYphVTPAnCi+kYkqvKKCtJwIg==
X-Received: by 2002:a7b:c458:: with SMTP id l24mr12288943wmi.108.1643927897734; 
 Thu, 03 Feb 2022 14:38:17 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n15sm119405wrf.37.2022.02.03.14.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 14:38:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 23:36:15 +0100
Message-Id: <20220203223615.729285-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/trace-cmd: use snapshot tarball
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use snapshot tarball so TRACE_CMD_VERSION will match what is returned by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 1f34a0da60..00cecc7828 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9401a43bda4837dfde5e64e0dbe5d3918bf50eb86b4d23fa89713b0f2defcbc1  trace-cmd-trace-cmd-v2.9.6-br1.tar.gz
+sha256  45924a763376a700221f64b4034f87263e4038ec88b120a0abfb5743d051d068  trace-cmd-v2.9.6.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index a592b1f027..d9ed417f20 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = trace-cmd-v2.9.6
-TRACE_CMD_SITE = https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git
-TRACE_CMD_SITE_METHOD = git
+TRACE_CMD_VERSION = 2.9.6
+TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
+TRACE_CMD_SITE = \
+	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
 TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
