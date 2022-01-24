Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0750C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 07:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A6AC60AEC;
	Mon, 24 Jan 2022 07:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mQ9-bhqpx8m; Mon, 24 Jan 2022 07:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C91F760AD6;
	Mon, 24 Jan 2022 07:37:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AEC11BF356
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A41A40916
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 07:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdWlxZjPf3mD for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 07:37:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB025402E8
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 07:37:15 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id j10so2462576pgc.6
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 23:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ntV+ECJ9bsMjd6qq1uzPdqQhMPa1BrsT7I6zBvzok68=;
 b=H0sM7v1sa51utue9OOZ/RlVThTMLvrji1J7pRCjacy2dxZi1n7grOjCEKheWd/NDkx
 vE1gD9Z1RdrUjAIhHxRz9fcdqpuImBDhiWq6TiS3olwcCL67HiPjPca0viEKe/o7Pj/e
 DGcLhaP+mFWcpVKm7nARMwPzJ5YiDCExniSt3BH7PKLSAJ43L2A5YWA7MFtpJN3JUxI3
 J25MyhMAh581aJV7VCuVQC/woggiMHdNQLHT+RLg9YHLlz1TraQEsRA2LzijftN9O0QL
 DHvbbS1iofPeMzsF+L00F6bQlTGkqGh3WMnQ86rzWOiopAq9SbBmN7YifCkvzw85SyfH
 U1pQ==
X-Gm-Message-State: AOAM533gYAexG+YxhFwGISTlUIkWWxhiyZ2PmHXU/34nglmc+Ftz07iP
 EfTCDiGdoqqhRw2DHHefTH3DDq7k8f3zig==
X-Google-Smtp-Source: ABdhPJy25NI/xEGfCzZ+t86VMmc0jkWwCYol4N7i7ZXEnuxk/Mb/q6Ano1+XJ4/2n5EKclnVFZ1aFg==
X-Received: by 2002:aa7:9399:0:b0:4c9:6049:cb7e with SMTP id
 t25-20020aa79399000000b004c96049cb7emr3068806pfe.63.1643009835130; 
 Sun, 23 Jan 2022 23:37:15 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 j11sm15745239pfj.13.2022.01.23.23.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:37:14 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:37:11 -0800
Message-Id: <20220124073711.44684-2-christian@paral.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124073711.44684-1-christian@paral.in>
References: <20220124073711.44684-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/docker-cli: bump to version 20.10.12
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index fbcda5753e..f2fe316540 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  55d55fdead906cbea8608ef39d5a62d54d1118e604a5ae7e2d58b4fb54a599a7  docker-cli-20.10.11.tar.gz
+sha256  d86e3e6e10669634ee02b5e071e5ee504457a9d03941bbc5b7f2bd3683ebdb19  docker-cli-20.10.12.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 0e35a60d43..d5cca34efc 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.11
+DOCKER_CLI_VERSION = 20.10.12
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
