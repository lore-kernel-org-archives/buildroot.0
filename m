Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D60C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 00:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A94A83F0C;
	Thu,  7 Apr 2022 00:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1BaUbKxfyX_T; Thu,  7 Apr 2022 00:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67B783EDB;
	Thu,  7 Apr 2022 00:56:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1861C1135
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59F7283EDB
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHRNPnSIsue1 for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 00:56:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E162683E86
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 00:56:26 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 nt14-20020a17090b248e00b001ca601046a4so7489395pjb.0
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 17:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PqlwKGT14+jq0DWB8xFUYd2YMUImtBCsDpABjpUdel4=;
 b=FtNxrEMjh32oy9XUCM17NehbX4BaD22kvaFGPniWzyXmQLfg2OyDRlk0cz9uGv5voD
 tzTjTv5xSTuUrplF8zmIemycdpXf+yuHUfgsH3S6FXv4RI0F5qvRtGmxICyll1SmJcKB
 0WtsRQQ3/q4MLN8IbGgb2+fTyE0XUhJ3JM/zM8YRRPSpsUcEHacwpp7/kUl3jvVSAdej
 gCNkDCC3ubVNNQ95AEX+0uKQ/YgQxfnEt4TPHjZKq39RbLjUKWZzQQoPg0qkdMY/Xlaw
 JfqMDkJVDH85LkxLZ7DaWmr/xq91Ewn9bbuU+a8FU9W/FmBkQqfgYeFv9eVJxSW9TSGs
 So2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PqlwKGT14+jq0DWB8xFUYd2YMUImtBCsDpABjpUdel4=;
 b=zz/TOFvK/WWIQN8eGDqqv2Sz8Ri6PlzW+r6BtKR9rEs/Raodf2lVHtkifLKnc66c92
 S/EOxxvAEn2zuEWrkaLLOFkUjVl0iVunXPLILQ5qfd4OBMiym5NZ1WM5Xurym0HOUu20
 JbJzbvTZ9YP8/zvbeVvH8yuWeAM3purJW6GxSUao5hyFvprgbAjg/BD8KEr/c4Q0EUmi
 3Kv3JEfYLvhhH3ULi8ruUgWOMGDiu5WsV4QCxaFUiQVeqWvGHygHG3zhcs53eMTTKqFr
 q5AUTzbm0De31RA2Pzgp8jdry/S+VghvsadoLzInLTQxul9Zo8bJGqp/0GySepQ/BUTr
 Eveg==
X-Gm-Message-State: AOAM530M2GAaOKoAYtkc4Mqcoj2Y8fgKqtjvXqsYwENRo3N5YPNiMVS/
 6bPnBPUk+c7XFyrIurmG77CI5oX/xmk=
X-Google-Smtp-Source: ABdhPJxVZe+Ggahxbe0EHuLAqNBVmZnx+g6nLBtNK49uRur4/WdVylWBFoHlQmgeax8EhEac42ypXw==
X-Received: by 2002:a17:902:cec5:b0:154:6b18:6157 with SMTP id
 d5-20020a170902cec500b001546b186157mr11220210plg.145.1649292985828; 
 Wed, 06 Apr 2022 17:56:25 -0700 (PDT)
Received: from voyager.ibm.com (cpe-172-197-129-163.sa.foxtel.net.au.
 [172.197.129.163]) by smtp.gmail.com with ESMTPSA id
 x12-20020aa7956c000000b004fdf7a4d49dsm13067804pfq.158.2022.04.06.17.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 17:56:24 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	fontaine.fabrice@gmail.com
Date: Thu,  7 Apr 2022 10:26:06 +0930
Message-Id: <20220407005608.203359-2-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407005608.203359-1-joel@jms.id.au>
References: <20220407005608.203359-1-joel@jms.id.au>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] arch/Config.in.powerpc: Add
 BR2_POWERPC_CPU_HAS_VSX
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Cyril Bur <cyrilbur@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduced to allow VSX to be selectively enabled for packages that
support it. Initially used by libnss.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/Config.in.powerpc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 4a39cfee70d4..272f66f4e7ea 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -1,6 +1,9 @@
 config BR2_POWERPC_CPU_HAS_ALTIVEC
 	bool
 
+config BR2_POWERPC_CPU_HAS_VSX
+	bool
+
 config BR2_POWERPC_CPU_HAS_SPE
 	bool
 
@@ -123,9 +126,11 @@ config BR2_powerpc_power6
 config BR2_powerpc_power7
 	bool "power7"
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	select BR2_POWERPC_CPU_HAS_VSX
 config BR2_powerpc_power8
 	bool "power8"
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	select BR2_POWERPC_CPU_HAS_VSX
 endchoice
 
 choice
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
