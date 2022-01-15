Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D088DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 20:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D9076072A;
	Sat, 15 Jan 2022 20:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sKfo4lzfEaTZ; Sat, 15 Jan 2022 20:04:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD9D360BC6;
	Sat, 15 Jan 2022 20:04:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C15E1BF3E9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 186EE40249
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGDoTgg-Cegp for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 20:03:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52A9940185
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 20:03:36 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g22so1115959edu.1
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 12:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=itn0CaPJtiLEKwymoTjMZuT6eySCD4u4syVh4e53T38=;
 b=n/NASavXH2LaXimnOQm6TEXauWqMVRprTo+GeDD5l+0Um1eUlefzXhokBm9ROFRu5/
 X9nprZ8y9rxD0uweYthVJfXt/JHZ0Niuwjs3bU9FCIj7cvNXXIJqzVOARLZP6YhtVbN6
 Q0VjCKgKn11SHjqVHy2TDygY6V4FKLsbfqSJS7yNVDq2s6gBYjCrw3xots0W+o2aDmX4
 4bnXmRn/sazMsvuepyDK/qHScovTymRM2xl3dgUJqepDpyWeoKSJTrEdVPCIUAcAQgqS
 lLkZzL0Oez1UwHJ/WMXVfIRkXbS21GHkpgrA4Nthrimu+T3+KeZE+n30slo57QjMAGxw
 gJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itn0CaPJtiLEKwymoTjMZuT6eySCD4u4syVh4e53T38=;
 b=4AJ9I0af/IvzEFXvj6TAJEV3mMycOOxlnlEPJJCwLhn1JaljgRhH8ojguycCJx+P6k
 PikJIuSdKHLfKrgCCQte+t82aX/NL6zGaTRaVcJUJv78nomv/F5BoNF3WLlnvX/lxEo2
 tCDFOlQDVQrrRwF+roK5KVLU8YrjfLRkdQ3AbtLW7OeJ3KfAGA0YpPIqwmN6id6RJt9o
 feQkV53EZrZm4aZMjvt9ZVzqAbIn01pRi+RVo56V9vC1EahGfwIl0oiWDLIDWdJ5JzOQ
 OS5hbfG+lCxOv0rwZwAZL6+Ju5CJuBiM9llPEzWO6Y2hVJiWtWu8+C09OHxQnkFSjW27
 MMcw==
X-Gm-Message-State: AOAM532BJcBfsoabj5jnFHE/rTLQVrLPX3YQAkknWXGvP0bF/R2d2VQU
 04qZPA0vwNxq6G9Oiy6A9O16rgRWNSbDVQ==
X-Google-Smtp-Source: ABdhPJxcQjYEO4E9SmztGQ1ZN7WsurVJ6acbagu7FZHkkaEAfXiwVduZ619mflqx0zg9m4i1WTyo+A==
X-Received: by 2002:a17:907:6290:: with SMTP id
 nd16mr11231934ejc.244.1642277014533; 
 Sat, 15 Jan 2022 12:03:34 -0800 (PST)
Received: from localhost (ptr-5gw9tzn82s1glqex1i.18120a2.ip6.access.telenet.be.
 [2a02:1810:510:3800:ad4b:62a2:fdc7:acc6])
 by smtp.gmail.com with ESMTPSA id hq35sm2872728ejc.100.2022.01.15.12.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 12:03:34 -0800 (PST)
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 21:03:02 +0100
Message-Id: <20220115200306.14037-5-patrickdepinguin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115200306.14037-1-patrickdepinguin@gmail.com>
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 4/7] perf: fix compilation in case of i386
 userspace with x86_64 kernel
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
Cc: romain.naour@gmail.com, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

If a 64-bit kernel is combined with 32-bit userspace, and this is achieved
via a multilib toolchain that defaults to 64-bit with '-m32' in
BR2_TARGET_OPTIMIZATION, the '<cross>-ld' command will still default to
64-bit output.

In this case, packages that use 'ld' directly need to be instructed to use
the correct ABI via the '-m' parameter. 'perf' is one such package.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 4e28129f50..b84b5fd415 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -45,6 +45,9 @@ PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32ltsmipn32"
 else
 PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf64ltsmip"
 endif
+# case for x86 toolchain that defaults to 64-bit output
+else ifeq ($(BR2_i386):$(call qstrip,$(BR2_KERNEL_ARCH_OVERRIDE)),y:x86_64)
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf_i386"
 endif
 
 # The call to backtrace() function fails for ARC, because for some
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
