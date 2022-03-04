Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E48C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Mar 2022 17:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E10040529;
	Fri,  4 Mar 2022 17:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hY1xJbBsu4G2; Fri,  4 Mar 2022 17:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0321940516;
	Fri,  4 Mar 2022 17:25:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4391C1162
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 17:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7976416D0
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 17:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r38LEDnnqRyj for <buildroot@lists.busybox.net>;
 Fri,  4 Mar 2022 17:25:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35330416CE
 for <buildroot@buildroot.org>; Fri,  4 Mar 2022 17:25:23 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso5507084wmr.1
 for <buildroot@buildroot.org>; Fri, 04 Mar 2022 09:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wjDhsC0uVYP/0sBGfze8tW0+M6XEEQKwjLOK4PIBMCQ=;
 b=ThFkMqPC/fa1DJC0Qxluh8TmLH6NkxU6ncDDaAQL11tfG7CwroVOx8gzeoZiO0D2On
 miMzynvh/R8NAsEBlguZOBrhlBkhhAs8547K6yo8NbOQKT6kvcaweFPRHcOOd/aQLYYP
 qYA5MSxY+/Th3W2WgMwTn9tydYzK3VAnQGMEUiwFFYR7Zr+8dJc7Hk8dH6sbaQwDG6aZ
 jUzs0eNAFPzWgDGvbJDDsf2gPQxclorG2OLLwEoXTDAF7hbnlr4z4qXlEmLQ6qVEZRnu
 vLU4MOvZzH1LMjaO7AFynk7d52w04EwLs9bYlXyHDs08MtnHkphF/uENDaWFOvCNsmdz
 nRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wjDhsC0uVYP/0sBGfze8tW0+M6XEEQKwjLOK4PIBMCQ=;
 b=LOTkQyWeF1Fioa4J7MRDds8aP4ODigqN6CeO5wrt7o0sQQTMYKB6M1TimM39Ts2Qob
 BqDnK+HPaIEtf380v9uGje6FAxwcVJZvWJz2kh7D6e3HyNckbfgSto1MhUyKC3VC6xen
 pAQCWlCcS5q1hFPaldE+AOlUnox3ZjxQTLZY0Q0A0Zm/5yHjp/mjdt3NuyjNdixnHDXR
 bitnjBrkUKRltn6rEteyvIZ7VFfsAdFcNr8ccDqy33XcLado18E1zovirTmjMHFBxl9E
 Y/ENUVNCnIdm/MWqE2hGv4k5dDAkCiumRdpCeT89VpvC30nS7I6E2SYQIMneYabEqwYq
 2ihA==
X-Gm-Message-State: AOAM533SdGtB1Ypdmm8FaDCI0ZH9oAv40Yaut0E0xmBbH0o4IGwy2Xza
 RiDy26HzXV/7ze+Ycs7kru2NmFWD90Q=
X-Google-Smtp-Source: ABdhPJxP+HdmqovsnH+1lixjFTiTLM9pmd5oy9UqRqmJ6i6FdSFRRA2QVfuWlVAS5K2OZ5D3FOS8Lg==
X-Received: by 2002:a05:600c:5103:b0:37b:c134:cad with SMTP id
 o3-20020a05600c510300b0037bc1340cadmr8658760wms.32.1646414720967; 
 Fri, 04 Mar 2022 09:25:20 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a1cf317000000b003815206a638sm12283971wmq.15.2022.03.04.09.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 09:25:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Mar 2022 18:24:39 +0100
Message-Id: <20220304172440.3365435-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] docs/manual: remove override in conditional
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove override of FOO_{CONF_OPTS,DEPENDENCIES} in conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 docs/manual/adding-packages-kernel-module.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-kernel-module.txt b/docs/manual/adding-packages-kernel-module.txt
index b609ecc90a..1d4251333d 100644
--- a/docs/manual/adding-packages-kernel-module.txt
+++ b/docs/manual/adding-packages-kernel-module.txt
@@ -70,11 +70,11 @@ Let's look at a more complex example:
 14: FOO_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
 15: 
 16: ifeq ($(BR2_PACKAGE_LIBBAR),y)
-17: FOO_DEPENDENCIES = libbar
-18: FOO_CONF_OPTS = --enable-bar
+17: FOO_DEPENDENCIES += libbar
+18: FOO_CONF_OPTS += --enable-bar
 19: FOO_MODULE_SUBDIRS += driver/bar
 20: else
-21: FOO_CONF_OPTS = --disable-bar
+21: FOO_CONF_OPTS += --disable-bar
 22: endif
 23: 
 24: $(eval $(kernel-module))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
