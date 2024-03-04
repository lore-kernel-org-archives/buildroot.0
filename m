Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEBAC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 17:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF94F409A2;
	Mon,  4 Mar 2024 17:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VoFQ9gSs4Dy; Mon,  4 Mar 2024 17:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80FF0409AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80FF0409AF;
	Mon,  4 Mar 2024 17:07:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB561BF395
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 17:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0829F82050
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 17:07:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ah3r3Pc_rkBA for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 17:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4BC981FFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4BC981FFB
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4BC981FFB
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 17:07:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33e2774bdc7so2434595f8f.0
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 09:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709572048; x=1710176848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bn1hzee6yV6soxRSoyUr7EkcN4URSSW+NWf8uyRv7oo=;
 b=Yoo5oCI8FyEDkjV6x8M8NhJjGEz/gxf7TEEsuU5wD11cQC/yCESaeSFfRoCVBQ4Cw8
 uAKX9KZA8FLP4l5SaABQQ/VWy6A2yq6OmuPXn4hlsbQ2lzrBfwMePLnQiQFUMEeIp4sY
 tCLKr25Jvtnytjpn6CbaCBbPjfnp5bhur5bmrL6hSxNCCYTg8slQLQWmSMDviOLqReqD
 H9OtoIY/H/QHthOjQKurAsrpouMv855niAnl5UwjrQn+6BCo3rgI2DS+SXgXXlbSl+eJ
 +J02UlKLa7Bx0nWqSQFGhugOfo5IRKbadLpu/C8Uc1cyEygb33m5hie7M13NJ8jZN+5Q
 Fd0Q==
X-Gm-Message-State: AOJu0YzuycWMs+Aw/gpxvCs0/A8y9mV/SqhpV4AAxmOTpFth6vY8YRxP
 418IZzQBDILkEVtRKkU1rHyVXyXLoZ+l28JASFqaIrRJWEuIjFVI0+ODvN+e
X-Google-Smtp-Source: AGHT+IEY8+Ip9E+43M9XyMM1U91vJ1+b4vLCdCASDwS924u1JV5roHwqer+DMjwXjtVBjy6mnn5AFA==
X-Received: by 2002:a5d:6181:0:b0:33e:19ae:3716 with SMTP id
 j1-20020a5d6181000000b0033e19ae3716mr6082756wru.11.1709572048188; 
 Mon, 04 Mar 2024 09:07:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v16-20020adfa1d0000000b0033e47512f2fsm147284wrv.3.2024.03.04.09.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 09:07:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 18:07:23 +0100
Message-ID: <20240304170723.3908730-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709572048; x=1710176848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bn1hzee6yV6soxRSoyUr7EkcN4URSSW+NWf8uyRv7oo=;
 b=aIHYbfPPlAoJrkUedO4T77EOutwGWP/1kZT4VhijjMx8cOGt67NOy4+vwA9lF/Oks4
 rMZSIkV9Ul5vwZelhvlQYabkd4EfIZAGhZo49ReNyZyDn94PaMxUhzZhxnd0Mos8BxQj
 ztr+nS2JQ0i20lkq5WyY9cLLjQUkXadVYo1XtC8RJdS/LdoR82+goQdL/bKy5asARO+C
 SzBeigCNUdBn6O5MbIAEZu5EMvS+1/ffpakOSys0fRm806tcaMbGPITXKOntWtr5Qdu+
 OKct+zES5pv7ZJbO2mx8JhLC3K2OhZ7kShOoSbM8peyfKQ98xfsKn95USOb+oOMM1RMt
 DV6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aIHYbfPP
Subject: [Buildroot] [PATCH 1/1] package/poco: fix BR2_SHARED_STATIC_LIBS
 build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

poco can't be built statically since commit
073a89196a22f995c142cd11640d3cfb7cef691d. However, commit
add7c433d250e153d9e58fe7da3bd52171ba2652 enabled static (and shared)
build with BR2_SHARED_STATIC_LIBS resulting in the following build
failure since at least version 1.11.1:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips-buildroot-linux-gnu/11.2.0/../../../../mips-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-1/output-1/build/poco-1.11.1/lib/Linux/mips/libPocoXML.a(ParserEngine.o): in function `Poco::XML::ParserEngine::handleStartElement(void*, char const*, char const**)':
ParserEngine.cpp:(.text+0x2f8): undefined reference to `XML_GetSpecifiedAttributeCount'

Fixes: add7c433d250e153d9e58fe7da3bd52171ba2652
 - http://autobuild.buildroot.org/results/afc434a13d5e7a8affa4abb4058d7bebc81aca29
 - http://autobuild.buildroot.org/results/860b70a8c9c4a6a53247ac4bdb4fd0851b28c61a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/poco/poco.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index f8c2a658de..96ab28fb01 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -57,13 +57,7 @@ ifeq ($(BR2_SOFT_FLOAT),y)
 POCO_CONF_OPTS += --no-fpenvironment
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-POCO_MAKE_TARGET = static_release
-else ifeq ($(BR2_SHARED_LIBS),y)
 POCO_MAKE_TARGET = shared_release
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-POCO_MAKE_TARGET = all_release
-endif
 
 POCO_LDFLAGS=$(TARGET_LDFLAGS)
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
