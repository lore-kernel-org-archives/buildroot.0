Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003EFC48297
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 02:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05C99414BE;
	Wed,  7 Feb 2024 02:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUcYQRYHVuci; Wed,  7 Feb 2024 02:22:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB77740B5D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB77740B5D;
	Wed,  7 Feb 2024 02:22:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1F81BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0988E812C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:22:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHJhP4PGugma for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 02:22:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FC76834E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC76834E1
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FC76834E1
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 02:22:02 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d71cb97937so1851135ad.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 18:22:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707272521; x=1707877321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4VMf4RvjF+rBlRqBSVBmRct9LSGJqvX8aiF4jQJwo8=;
 b=dTxHP5vo127Hoa3NTpS0/X0oDRApop4JG+ieDFiRRbfrI9/3FTOcAmDFP1DPGu2Q+X
 0LCe2J+adzOgQUrEKBHZ+Iu9cGScS8QGz2oDISMqS6wzr1AKns+NXvwgJMtYcPTwxrzl
 ylHL02MB06E1ZaActOmJ2fwKi06CDTpbwXKy1KAIioxfffY7d0OZjHFl+a1PwZe+GRTT
 X9Tg5NuJJIfnPDel+NhImGwD1hD72IUoA/uUvrjXRvObPcX2kDWbLhq4nVZE6T/WnVil
 hlyB5W2yVFCaVw9gEWZQBfuN4oCPWz8hMc/4jQ/XJzIwkO3q8yRg+BYc40jI8zJbffbJ
 qGYw==
X-Gm-Message-State: AOJu0YxnR1IDwZpg5pZ+mmfOSqD769T56HgjXUjcXXlIT4Ei8RKDUurb
 BFecV9QQxeyYRPQuqtepkyPX59iSGzFfHMQdfLftYEh6Ia+RCrm4haAQ9KMdOnv0cFfLu18gxzE
 f
X-Google-Smtp-Source: AGHT+IEqkF3wXDObpz4VPzTP+YGInDdNQjRxb0D3V/K8iJAMWLeZ9gRQn1KVD0Ky8XOUXEQcIVE9zA==
X-Received: by 2002:a17:902:d2c5:b0:1d9:9e4f:c0ca with SMTP id
 n5-20020a170902d2c500b001d99e4fc0camr3118184plc.27.1707272521331; 
 Tue, 06 Feb 2024 18:22:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXM5/NIGkU0Hqw94XzO9TVXHxOUs0vhrCs+IUg8kCWcV0/aykML+W2SWgKquQnafPvFrbR1/zp6DUdSdL4ak99TXo81j0KenM+x97ym5JVEveHmWOEhobUAuXV6aiRCKSfl2T2EnPBjlNHm5XmUuoEQp4o+blSBT50H+SGZnDYSjCJsAOnNbfD8FY2IZCmWMUtsGw==
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 e6-20020a170902744600b001d92a58330csm214324plt.145.2024.02.06.18.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:22:00 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 18:21:57 -0800
Message-ID: <20240207022157.2560531-2-christian@aperture.us>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207022157.2560531-1-christian@aperture.us>
References: <20240207022157.2560531-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1707272521; x=1707877321; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4VMf4RvjF+rBlRqBSVBmRct9LSGJqvX8aiF4jQJwo8=;
 b=H48yIZGLJWNtbFsEkvZRjw9eyCytDonjwGEXeVngIw3BCqCVup7LS2wxcvcgaP73MH
 O3bS0f0bi+VSZs4kpOUUO36NnOBMTCwQhSs0CIHAZfLCVKyCWblyWvooQprbZmb8XwCt
 cxD846cLLfIChtGgphaDn1zc4sXLaDkZQ9XKBn4ZMtXR14JurUQlViyIhSTLpYtzGBcf
 5SLLeyBhtOUxX5oer95GMZsz+DkZVFG64L0qz7tqDnypwa5zR2BIr8KJeMJQNEPKMI5a
 6T7NZ0efBIjYR/PpLG3ypuanWNeZN9sMU26ZJ4UpK2aOSzI/yrIMfIwU8KQN6jK1NugW
 4jjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=H48yIZGL
Subject: [Buildroot] [PATCH v1 2/2] package/docker-cli: bump version to
 v25.0.3
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v25.0.3

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 9c8d08bba5..17b179852a 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  72a54d131c28938221c81bd08364459fed9c71c093d4d615d324aaf31de6db1d  docker-cli-24.0.7.tar.gz
+sha256  04ad0cea992a65db20cb1b0dbf6d1ce32c705ce879de51b22095fe8d28030815  docker-cli-25.0.3.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 95fce27ffb..9d307e991c 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 24.0.7
+DOCKER_CLI_VERSION = 25.0.3
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
