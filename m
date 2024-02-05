Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EF2C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 18:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7090940B29;
	Mon,  5 Feb 2024 18:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7090940B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hWFoM97nF_RN; Mon,  5 Feb 2024 18:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6354440B16;
	Mon,  5 Feb 2024 18:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6354440B16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B49A1BF282
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60AD781FC4
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60AD781FC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Os-hcLZQoTe6 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 18:33:25 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD41F81FB9
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD41F81FB9
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-363c9e3f814so4057695ab.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 10:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707158004; x=1707762804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w6KZ8SzZPbRlaNOebK6j4IVQt85wCvr54IKSoPdzVsI=;
 b=V2BdNmpf7TsVHAwc/J+gBPNsoiVUc193uDZ240OUaruGkE6fHt+us6wvj2NcUcB1XE
 Qg2wGYp4o+QyQxqk8UyaminzJvau1JRZwzapHiaBgH9xhHg7sR7Eftmx1nHj4nwLlFhp
 lbprYTxwSore5NXBf9Jm5Is735gu90XMof35dlSD2YFUFf1USkZSzU3fuaLM0Ofnm0yF
 2/vVVZ8CzKrCbw37xSpi3xiltj/oEfnFqwUEkakuWvftjluxHXDXYny/2wmqIVcN1vMd
 mjPbQZR39oTXsKYr6wLTt+zqX/rtZ9vXzNwlhyK2KoQoNMq18hV0ZYgplQfLchzhUuy4
 Ntmg==
X-Gm-Message-State: AOJu0YxQ+nhtP04PH9RKoqlbUzxPWw7sVwnwcVQFlH8f5NOmP5hGb0eP
 UDGWMtVq+o0YxbAuX7m2e3sKDeTIcz39bBaMLT7gz32P9Md8jtvX8Bh2x2XUl1k=
X-Google-Smtp-Source: AGHT+IFR1u/Q8hSTrYHW0a3U2NVAKdKGakujLQm9+7XNSwELM9cDThSivYNOE0elifadPywoMt7ilw==
X-Received: by 2002:a05:6e02:164e:b0:363:ccb2:3588 with SMTP id
 v14-20020a056e02164e00b00363ccb23588mr663479ilu.6.1707158004057; 
 Mon, 05 Feb 2024 10:33:24 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVvXlXe0GfbWzcJnfxeHrcQVwXmjhBB/RtGOobiBg6VgjZbDrx9HXdL20TvTmX8AcHvJvhv4NZalVh/BuU/Q6Lx0UbPOtrkYHB3
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 t18-20020a92d152000000b0036275404ab3sm57511ilg.85.2024.02.05.10.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 10:33:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 11:33:08 -0700
Message-Id: <20240205183308.2120022-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707158004; x=1707762804; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w6KZ8SzZPbRlaNOebK6j4IVQt85wCvr54IKSoPdzVsI=;
 b=cuD3tTPUkL4zVDexKIKZjlJPmv5TxFhscBLOj5LZinAG3twuW4z0ZWQC9iwcnDe26t
 j/DiiF1FBG4mOWLEWxKC6HN5oqJCrbUlJ8gKnuS992V0SMOT1ZVzNHu3Yvozd9+lHudp
 FyJ52pffhognXwmGWS6RGg6LPGfFiAFQY/PJ6QwTMOu0Kpt5YZIAeTTGsPPaT/v7r47k
 fGrl5f69pvYgqdWAIOseqJ8mk7pO69eDJOaMKj2d4kEq0a1F/ahYh0HagytRwl77eefX
 8HVVGof+S/iLOZJWKbcolZDj6KZ43I3hNs+75lqgU6CLB9plJMNsCTmAX0jOQ0lzFV6C
 IU4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cuD3tTPU
Subject: [Buildroot] [PATCH 1/1] package/ruby: disable unsupported yjit
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The yjit feature requires rust toolchain support, since we don't
currently handle setting up the rust toolchain for ruby lets disable
this feature for now.

This broke when ruby was bumped to version 3.3.0 in buildroot commit
a01c278df7892c8a6736334aa008b2d7c09e9258.

Fixes:
linking static-library libruby-static.a
LLVM ERROR: Invalid encoding
make[2]: *** [Makefile:318: libruby-static.a] Aborted

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ruby/ruby.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index b2396010c5..4b9ce80e67 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -22,9 +22,14 @@ RUBY_CPE_ID_VENDOR = ruby-lang
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
-RUBY_CONF_OPTS = --disable-install-doc --disable-rpath --disable-rubygems
+RUBY_CONF_OPTS = \
+	--disable-install-doc \
+	--disable-rpath \
+	--disable-rubygems \
+	--disable-yjit
 HOST_RUBY_CONF_OPTS = \
 	--disable-install-doc \
+	--disable-yjit \
 	--with-out-ext=curses,readline \
 	--without-gmp
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
