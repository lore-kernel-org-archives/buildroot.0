Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF60C433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 18:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95EF560F04;
	Fri, 21 Jan 2022 18:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBX_GDu3-D5u; Fri, 21 Jan 2022 18:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5DAA60A9E;
	Fri, 21 Jan 2022 18:59:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEFD71BF2FF
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCD238134E
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yveZP0sxVzI9 for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 18:58:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F276781330
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 18:58:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso15422078wmh.4
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 10:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yj5F6LXNe2bZcuX1evLGLW3fl8iVYEXoccy7ESmLWKA=;
 b=pBrDsmEHOXOWi6dzQS7eZyeYkUeMEcrq/YZ7VyR4tG9l9ePWuwejWF2R/IfV2+sicE
 THzcJqO6ACpd0JfXs1MqjYeUR1ByK4YFM6s3kX3INMMEsN03O+vHsspCjWy6mAYeyxtw
 fvzY+MhuUeNGq6ZMmCDH8Ql5VAKo7apnyHjYOkXhC5lYOVFPbHND15Y1CJt7SNOanwOl
 4ySEgh7clg7L3SmIqC9KU3EbMrQdbg96qG7TDnfP22PuMoNI3kEcJdKrbpyTPiwfwJkX
 CeB+9tkzVVvI7eJHLP5UytgbnP8fb98kBCnDptVjUuRejXE0jxdKYJO7QTf4bP6RwwMq
 g0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yj5F6LXNe2bZcuX1evLGLW3fl8iVYEXoccy7ESmLWKA=;
 b=J1wkrqTicOjg02UERygYIwoM28cXitO1q5ZoeQfBg09VYC92kgugxdfPpCZapxjVoT
 5peOM5uLiJNYGoXcfr5k7DwPu+nl6ev1x6JcJNtbn3MBWGSTny5PH8l7VmPvHZGq3TuY
 OoCXf4hhaqsw32L82jnUgE1wHpGm6qZUzDtCwVRvAqekLpCEt6FbvwFTpPttURjvDV9P
 4E9fwM/9QpUsIRlnh2aNYSsm5544Oj7M8qz4L5OlU2iPWdpU/rrfBA7paTsKfHRr5Zyw
 BJpnq1UigvvOTXtpvaCek3/2wol3jPhRzXHOp1J+cmsQnM/c25W77vpn8ypEWNxdvnWV
 NP+w==
X-Gm-Message-State: AOAM533t+8+Yy/0lJxN7xvusd2+pi41EORqrFD00v/0nXNgW7hBwwoON
 EU7VwXxDRCZt/4WCig+SJ8YqbcZRtjo=
X-Google-Smtp-Source: ABdhPJwJi9smJWdoma9ilP2GL/a5vMO21na/P5Zhi9t9MVVwbtXrfUKfRTXQEe1xx/H2F/7stxsNNg==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr1922059wmc.35.1642791531259;
 Fri, 21 Jan 2022 10:58:51 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d2sm6165681wru.40.2022.01.21.10.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 10:58:51 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 21 Jan 2022 13:38:54 +0100
Message-Id: <20220121123859.754653-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121123859.754653-1-francois.perrad@gadz.org>
References: <20220121123859.754653-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/8] package/perl-io-socket-ssl: bump to version
 2.074
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index b5dc29973..4a1d71e34 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  4fb67fc8c4817dce8116f2eb7878fd9c  IO-Socket-SSL-2.072.tar.gz
-sha256  b5bee81db3905a9069340a450a48e1e1b32dec4ede0064f5703bafb9a707b89d  IO-Socket-SSL-2.072.tar.gz
+md5  53201b8e4dfaf25d4d661a54fdfda602  IO-Socket-SSL-2.074.tar.gz
+sha256  36486b6be49da4d029819cf7069a7b41ed48af0c87e23be0f8e6aba23d08a832  IO-Socket-SSL-2.074.tar.gz
 
 # computed by scancpan
 sha256  090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032  README
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index b32cce12c..1ab70509b 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.072
+PERL_IO_SOCKET_SSL_VERSION = 2.074
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
