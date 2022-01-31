Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82E9C433FE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 924E160F1E;
	Mon, 31 Jan 2022 21:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dPMWFSiTO8p; Mon, 31 Jan 2022 21:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C29E660F1C;
	Mon, 31 Jan 2022 21:38:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 321131BF362
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2060B400A9
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VplLUTfokDbg for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 21:38:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09381400A0
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 21:38:12 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l129-20020a1c2587000000b0035394fedf14so257093wml.5
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 13:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7/yDnrpwRWHXPVdNQ/56b/N5ZzBiZAWTutGV8fejGmY=;
 b=g8mX2FLn6uBPtFBG/dM6JqHeaZQXZsa4LAoa9ymUfWXjBd1h29X92VDQTRh3hHeW6p
 VYlks7F70UdQQRU0rMW/+/fQdcAnR6RcwyJVF44PsyPTDQOkzn6ihBTYMMa2/p+21+sm
 Uv2RanWtTqhrQpyTyMmW7+ffeinFEEQd+2E0GVHfLRiuqzr0yKBf/GLuidhCcFgF6BOk
 EdRRAacIBe2FAKJr8BCPcJbn6dhjrH4C64FccUXsxlBZGPg6La7TpbRtDF0OAWdhqzcn
 B0E3YQpKMqsHySl+eIGjhpfOpgr/ZfnSTnVO7xfpw9w6x63WwJLMOhfFBQl0di1vOSXn
 MRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7/yDnrpwRWHXPVdNQ/56b/N5ZzBiZAWTutGV8fejGmY=;
 b=zE8wuzRu6wB0dp1SK1XiNyV/AT+gmIgPEe5ItwKONSjO8+4dGUbn5Itx3O6XiwAV7p
 df1C4gLMhmfChgJrgkwEgRcoNn4tWQtxtQM+DMuEil+wuK2aemQL4y61o+qZdmjJvZud
 Wz/6r2PdOWnb46IbrrMJt+q5IdApgjPLH+Pxh8fXIJ1UM4n0nlgmd0rysPfZltWWtzE/
 sixi4WIhEhqq2kqsDGpuODimqbnm6HOj6Mkoeny4IfgJnT2kvBeKHJPFUc4Z9SDGrIkU
 qzEBmjNxHn9Zje8sWAVRC2knzyqLUEUTXVL2GDgoD5ilDqboUkM52WINLWUD/VwZ0hXR
 LCMA==
X-Gm-Message-State: AOAM5306cX1u3Lk0E/wUuzIn4FnybXlFFke3GFuKM6NsEJMLvvDqTYQz
 WJePwSh0B2xkEIb3xfqytQWU1IoUmfo=
X-Google-Smtp-Source: ABdhPJzvFL8fRhQ3P5tF2R4x09JJ9ZdYZ1MWTPurcHm7qpRBWjKM7UQB+rtYZIeFU6Ed14qYpg1qmg==
X-Received: by 2002:a05:600c:643:: with SMTP id
 p3mr20138453wmm.164.1643665091172; 
 Mon, 31 Jan 2022 13:38:11 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b1b4:bb20:1902:cd8e])
 by smtp.gmail.com with ESMTPSA id 11sm416713wmx.5.2022.01.31.13.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:38:10 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 22:38:09 +0100
Message-Id: <c9dcef5830fdb5a83a625962702dccc093bb9a6c.1643665029.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643665029.git.yann.morin.1998@free.fr>
References: <cover.1643665029.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2 v2] linux: fix build with host-gcc 10+
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some older versions of linux, or custom versions (like forks for some
boards), fail to build with host-gcc 10+, because of redefined symbols:

      HOSTLD  scripts/dtc/dtc
    /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition
    of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
    collect2: error: ld returned 1 exit status

Since this has been fixed in recent-ish versions, we can't use an
unconditionaly patch, so we must have a conditional patch. However, a
patch may not always apply to arbitrary U-Boot versions or forks.

Upstream just dropped that line altogether:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33a814e772cdc36436c8c188d8c42d019fda639

So, we use a little sed-grep combo to do the exact same change.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2:
  - don't fail if no file to fix: use 'grep -Z |xargs -0 -r' (Arnout)
---
 linux/linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index dd2eebd446..410b714360 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -268,6 +268,13 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
 
+# Older versions break on gcc 10+ because of redefined symbols
+define LINUX_DROP_YYLLOC
+	$(Q)grep -Z -l -r -E '^YYLTYPE yylloc;$$' $(@D) \
+	|xargs -0 -r $(SED) '/^YYLTYPE yylloc;$$/d'
+endef
+LINUX_POST_PATCH_HOOKS += LINUX_DROP_YYLLOC
+
 # Older linux kernels use deprecated perl constructs in timeconst.pl
 # that were removed for perl 5.22+ so it breaks on newer distributions
 # Try a dry-run patch to see if this applies, if it does go ahead
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
