Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D47C433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 16:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0DCA41C0E;
	Thu, 19 May 2022 16:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6HpOoH1H3-s; Thu, 19 May 2022 16:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEF9641B5E;
	Thu, 19 May 2022 16:02:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 365F61BF290
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 16:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2442A4018A
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 16:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=threespeedlogic-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQTPkllse18k for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 16:02:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0C874012A
 for <buildroot@buildroot.org>; Thu, 19 May 2022 16:02:31 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id bo5so5542468pfb.4
 for <buildroot@buildroot.org>; Thu, 19 May 2022 09:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZVJLavXx7fc2Q1jVA1P9nUZryf6jiJ8ZlLwtZZZH5tE=;
 b=aOWoGQdUJ9521CLbVxGyPycu8IeuNa1ItYIPNctR5Q0bDTC25o+m1yTntuDzSzvyFk
 K70Is64taQxm6m0UR8EuTBD29lgZtyIreTvuDsb71aY4Q/6jjYUZR2OUBPhduSXirxdy
 5D7eP9Kxhud4NA5e/f/eg/qGSuuZcBTUgO8n9Ww07DQQKu3eWQLk/Xh/6gREHQVRlJCW
 sgm0J+hTnCcJsL1x9ozLpPUJSg4uFbwHzF7iIoGuj44iIcw0pw5XYJOZ7xk2hfLhlKbM
 A7YDgiERUpAgInBPNSGmUau//aN+e+HVDcvsv00aKA9WLtkOxxokHSz1PtelOFwDzHWq
 Lsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZVJLavXx7fc2Q1jVA1P9nUZryf6jiJ8ZlLwtZZZH5tE=;
 b=OjkVqXeznOr2FJbzlOJZyK4Fu1hV5Lu0dPj2kwPjziNiL5ltO81mvQOl/Z1RXlXmA/
 n7PX/atE1o9W6BS/xIfFAMMAjQm1pdXspETT/Pu/wgXkbP6jR1P0+EiwNytabBaxcPWX
 7NgmMZY+ijxGj5PB/A7rE6RL5+x1EX6jcqW75+d01HZE+eKMszUiQ+A78cJNKCZHL+Te
 BrRdEv1a4wAfBIqdn9jh0mwuGdxJf52UCduq6O6eWUBmwWoGC53Ixk84bXvw3ZsyQP6C
 krrQSegbpn2GSw5sOtJXQ9JjxwR5J8eQCFfwbTczsehoUupZUblewzOlrCceLJu8kyJC
 GTpg==
X-Gm-Message-State: AOAM5338wXZaAuWuHwzcuze8sLBQPYP9jSM32GoDQ8k7uCHcP6z1+e2z
 QT7Eb2V3/UgNkdZbovx7E2+/0tV1zufRig==
X-Google-Smtp-Source: ABdhPJxNDVLkMmm4zPyL/PM/NTMvIMJedAhuXkcDBprAxtRSaCNxBofUYeR9eLZeBTrx/q6PsXuhgA==
X-Received: by 2002:aa7:8891:0:b0:518:32e3:da15 with SMTP id
 z17-20020aa78891000000b0051832e3da15mr5221235pfe.13.1652976151099; 
 Thu, 19 May 2022 09:02:31 -0700 (PDT)
Received: from localhost.localdomain ([104.246.196.44])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a17090a7f8b00b001cd4989fee6sm5744122pjl.50.2022.05.19.09.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:02:30 -0700 (PDT)
From: Graeme Smecher <gsmecher@threespeedlogic.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 09:02:14 -0700
Message-Id: <20220519160214.214701-1-gsmecher@threespeedlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509190650.1348657-2-gsmecher@threespeedlogic.com>
References: <20220509190650.1348657-2-gsmecher@threespeedlogic.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/python-orjson: disallow build when
 using musl.
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python-orjson build bails as follows when using musl libc:

	error: cannot produce cdylib for `orjson v3.6.7 (...)` as the
	target `i586-unknown-linux-musl` does not support these crate types

It's not machine-specific (it occurs on i586, s389x, and arm platforms),
and is tied to what appears to be relatively arcane details for
rust/musl:

	https://github.com/rust-lang/rust/issues/59302

At some point, it will be possible to remove this restriction - but not
yet.

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
---
 package/python-orjson/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-orjson/Config.in b/package/python-orjson/Config.in
index 420e023b0a..b2ad9062cc 100644
--- a/package/python-orjson/Config.in
+++ b/package/python-orjson/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_ORJSON
 	bool "python-orjson"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	# doesn't build with musl until rust's cdylib targets work with it
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  orjson is a fast, correct JSON library for Python. It
@@ -10,3 +12,6 @@ config BR2_PACKAGE_PYTHON_ORJSON
 	  instances natively.
 
 	  https://github.com/ijl/orjson
+
+comment "python-orjson requires rust cdylib support, which musl doesn't have yet"
+	depends on BR2_TOOLCHAIN_USES_MUSL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
