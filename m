Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69067C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21756408AE;
	Tue, 22 Feb 2022 10:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0n2wA9VzE-EU; Tue, 22 Feb 2022 10:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC5240287;
	Tue, 22 Feb 2022 10:23:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4879A1BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37CD34089A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9aXTaUX-CZu for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:22:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8444C40892
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:22:32 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id i11so34019441eda.9
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 02:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+BR7jIZYPVNEt5s6iIiVfvZMLXHE5YlrgpA0mKIVmyk=;
 b=kD/Qq/b7fdD2xfKY7Nu1Pay3XCPhcf24Q+OWss/t8IQrhgW1f7CQn9KQOpoeShDQ0n
 LidsBv0v3BSekMYsIebscIHKZPFkmARdtxUN0LQiHtHrMROtYg/hXeyl/wXRzBJ69dKt
 YIwARHycq+8WwUtUV1R/gR2GnAUXFO6UjRSXD0Orl3PcCPIcHPdpDODoot2OnQA+rlei
 LHAXSBJWnrFZpYhXeDvWGXwPC1p2rpqE3Czhs4OCWMFItKYn9kU/vM9Suc4Q9q6LQlkz
 xo7Ft8VywPjryZUVEwvd02QrZpWNnuq9XHxoS5YyXP3yoJv+L4wyBRdPpRYNhvuKzv+8
 jgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+BR7jIZYPVNEt5s6iIiVfvZMLXHE5YlrgpA0mKIVmyk=;
 b=DPUU1h1C7yNFTGxhu2oNCuN4yiBzfDiaFd1FapoqyhYG6qdKHJpHeocOYMBjmJ06a5
 NWh7rd7isCtmesXPqwNiEAaskBv56abHA+/HEiol8zwNYkEE0q6ctklbDA4D0FcVfg/M
 KdQIvl9ScbVQNyhVPt7lG4zVMi8mlj3XUMfhR0B7EWYfee1bXLA3LwQx23pKpimPnDLp
 WIUhE8qoC/Jv+vw3LzQ2+Qq9nPAydrVeSKOntFDQJyGRMkmHPMoIfU3JRb7K6v6AbRPz
 MaicVzOIbuiL0E4PsyHsqGS/kMwtNCUcnQK1K+JE1PL9CkDOFl/Y04QW0uJbCBwTS4sV
 MbxA==
X-Gm-Message-State: AOAM531dV+Cu/yVuytMPhHYm8r8lw3Bnq83xm9PH+o84I6fV9iWILnl5
 H9Klo7xM72GmVuqcG8rhLi/0ykO9A+5Ykg==
X-Google-Smtp-Source: ABdhPJyIDM33EEye6eXtfV6cKa5f2IerQxH3JaukHpGdrDe4kpK4g0bUtez5qQVA4k5T82VDrzTnRw==
X-Received: by 2002:a05:6402:11cc:b0:40f:b100:492a with SMTP id
 j12-20020a05640211cc00b0040fb100492amr26183302edw.282.1645525350756; 
 Tue, 22 Feb 2022 02:22:30 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id c24sm6097032ejj.60.2022.02.22.02.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 02:22:30 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 11:22:10 +0100
Message-Id: <20220222102211.74573-8-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222102211.74573-1-nolange79@gmail.com>
References: <20220222102211.74573-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 7/7] package/zsh: enable static regex module
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Phil Eichinger <phil.eichinger@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

the builtin string =~ regexp operator needs to load the regex
module. This operator is readily used in zsh scripts,
so always enable it.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/zsh/zsh.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index c26a00c430..85c214372a 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -44,6 +44,12 @@ ZSH_CONF_OPTS += zsh_cv_shared_environ=yes zsh_cv_shared_tgetent=yes \
 	zsh_cv_sys_dynamic_strip_exe=yes zsh_cv_sys_dynamic_strip_lib=yes
 endif
 
+# regex is commonly used by completion scripts, link it statically
+define ZSH_USE_STATIC_REGEX_MODULE
+	$(SED) 's,echo dynamic,echo static,' $(@D)/Src/Modules/regex.mdd
+endef
+ZSH_POST_PATCH_HOOKS += ZSH_USE_STATIC_REGEX_MODULE
+
 # Add /bin/zsh to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define ZSH_ADD_ZSH_TO_SHELLS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
