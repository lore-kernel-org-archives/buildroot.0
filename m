Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B941C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 19:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECEE8812D1;
	Tue,  8 Feb 2022 19:19:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyhwcki3hGDo; Tue,  8 Feb 2022 19:19:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41AB281244;
	Tue,  8 Feb 2022 19:19:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E78E1BF5AE
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 19:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BC5760F28
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 19:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tIyDC_YS3wqW for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 19:18:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F13F960F32
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 19:18:58 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso1840377wme.5
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 11:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNgYs/Ib77AuVwZZ+6CwGF5bnCSrmW2J+NHtKdZpAQ4=;
 b=MijH3g5KqE2AzvNY23RZLrhr+ojmN2VTbt65iy0lPCISgwbFSZ/4m2v8xXHZDV3G4b
 uPjtvQw2pGjMtrHblr3t7lfN6ZKI77a4RgIdZ9ik4QK9VkSrKi1nDDc2jD2NkFDgbbBR
 RTk62IKDAC5anVe+U+oVIPfTsGnMzyzEslXr2VBaDNZAEh6eTbAuoK5qWWsYgOgQ05D9
 DdrbNhPUo9t27xWFq5OfY3u1UvBeIyHZ5/ykENtCmuCET5Wv0fJyt9LpFVh75G9VZUKc
 G8k0MwNiAp89oozfJv5gRyVz+nQD/7NnqUmzFDr2foLsl1pEAB1PhM/CuLPYpUWsUifZ
 /64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNgYs/Ib77AuVwZZ+6CwGF5bnCSrmW2J+NHtKdZpAQ4=;
 b=vJm+DN6N/psIRbqOx1e0XwrTZGhTnbw8gMvaahvUgNERxUelPzRDzH5NEoJIR34P9x
 jFACoLs0xb1mtqArJ0x+hwMFyq0DPHOk/0AxzBjZguA3uN7i/xc5inxNEICiafxXs5AV
 GmswdJS63g9F5HPLSWOhy2JDfBy+Wzg3NIWzvg7LTorTP2/SJMdi7/TLSeNjtodzoQK0
 Emjfhfi21jb+XU0/Vpgcj425JGXCZTUOctSyEA5VUA1iu10yWSK9vHB6QB0D9Db3W/Wi
 U5943u4o62XVy/ugEgJgqrUG2AU6iBCk8sw/Ji9U/j5tgGm7z+i486n32X/6wiXC1gGJ
 fTng==
X-Gm-Message-State: AOAM532qrjQYbSVHIR8ngBYvf2uUmgwaiBPM+Hn5pd1r05m2/gS/rlIF
 yFZrCH/2mrCOJqDtXUFq+v4PMakm6RE=
X-Google-Smtp-Source: ABdhPJwqxD/Rb5oJt2BrRicrsB+7FH6ZVoHuu6WFP06OHGluZ+uAYbxGjbAkIx5rCAxp0sgn7noG1Q==
X-Received: by 2002:a05:600c:2751:: with SMTP id
 17mr2298871wmw.20.1644347936489; 
 Tue, 08 Feb 2022 11:18:56 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id k14sm1304260wrw.1.2022.02.08.11.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 11:18:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 20:18:37 +0100
Message-Id: <20220208191837.4057713-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208191837.4057713-1-fontaine.fabrice@gmail.com>
References: <20220208191837.4057713-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/keepalived: fix build with gcc < 4.9
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
Cc: Ilias Apalodimas <apalos@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable track-process to avoid the following build failure with
gcc < 4.9 raised since bump to version 2.2.7 in commit
79f631000fe6846e72f44810452bb764c228ad44 as suggested by upstream in
https://github.com/acassen/keepalived/issues/2094:

In file included from ../../lib/rbtree.h:24:0,
                 from ../../lib/rbtree_ka.h:26,
                 from ../../lib/scheduler.h:40,
                 from ../../lib/notify.h:31,
                 from ../../keepalived/include/vrrp.h:41,
                 from ../../keepalived/include/track_process.h:31,
                 from track_process.c:50:
../../lib/rbtree_types.h:31:25: error: initializer element is not constant
 #define RB_ROOT (struct rb_root) { NULL, }
                         ^

Fixes:
 - http://autobuild.buildroot.org/results/2132570fb0407abc0e70146d771471e13ef10237

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keepalived/keepalived.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index c7e8c3e2ec..5d6cf174e3 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -56,4 +56,8 @@ else
 KEEPALIVED_CONF_OPTS += --disable-nftables
 endif
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),)
+KEEPALIVED_CONF_OPTS += --disable-track-process
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
