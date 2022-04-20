Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B7AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 18:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B7C4410F5;
	Wed, 20 Apr 2022 18:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMVuPxlvG3Og; Wed, 20 Apr 2022 18:32:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B314410FA;
	Wed, 20 Apr 2022 18:32:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C6E11BF3B0
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27CB361128
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJSfX5M4lxKm for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 18:32:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A21561114
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 18:32:44 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id 79so2796818iou.7
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 11:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWJGjiDKQMzLIaciHhp+enl72vtrtDHcIv7QdgB/OjA=;
 b=m7S1ctdxpYQsThHmfA7rWgjlFsV0jcaN7cXtvGlrj7uLATsJiVKEcA8RhD9jHqiB3e
 6xmTSh10SYFlbC4BMz24VAlJn9U1QW9jYxzCUZqmfM0xx8TszqlRq2aIj1+wDp8Hclja
 tqkzC5dUgzKH61vzqpjgQGyyyZQ/ddEjoUiqtlNWVtxoKS60RVnUCr7WKXS08LcYcpfb
 eCdYyKfbTcHNXWP94DFUWDY5bjZiJJEKpN2BSt+z+NAT1BTZwBlAItp2cavO362rFn1+
 H6LW46MQ2f52Zvih1xBVRjjje0QGHSPaIc6qnwOL7YPQjLYJ4hFweXdS+uR+VvN4TrrQ
 MlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TWJGjiDKQMzLIaciHhp+enl72vtrtDHcIv7QdgB/OjA=;
 b=UAwdcR7CiMptocd0N86TFzZBtEd6WjSTKC8mCdbrPrcPKx32MOKzb3m1kqQoZiEbny
 nd8fuVd408c9hp6QoK6KcGsEBnwcTCDTkM7SYay9AwxFvMx1GJxv0k2t8emx5vjmw4zJ
 MLWvYcA0CP1SwtDn0amFkAwM4leeaGe57yLpoICYGS7F4HFd4g3ZqD/pCqQVV+qje4YD
 p8936R+H7aF/SNR5QOoOjMUNJL9QcrwVHyDngN+yUrfi7dvCwZ6oFwWmZ8kRowNW8t6f
 7X458pEWT9U0/5+fzfgLlNZsxbaYiyoZs0eZ2NXdY+sIJ1u68BMomSqwtO1Dpi/gaqQv
 Mo6g==
X-Gm-Message-State: AOAM531liHNP2CyowXzOYW7EPH2q/N5nbxvLAujcoFED8cs/wEIAdzf7
 ARxdt5PDLc0CUjlbatZ3hoARPLt4yzi6Bg==
X-Google-Smtp-Source: ABdhPJxLjFHipE+mPNDulB5/RaOBNI/XYcECupsjgiatRPWByz8C4kz8t0z2X4bNueED75wYSWFKAg==
X-Received: by 2002:a02:6a12:0:b0:329:7d89:c9a5 with SMTP id
 l18-20020a026a12000000b003297d89c9a5mr5976807jac.250.1650479563073; 
 Wed, 20 Apr 2022 11:32:43 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 a2-20020a056e02120200b002cac7c342a2sm10548927ilq.46.2022.04.20.11.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:32:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 12:32:41 -0600
Message-Id: <20220420183241.772415-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-logstash: bump to version
 0.4.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-logstash/python-logstash.hash | 6 +++---
 package/python-logstash/python-logstash.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-logstash/python-logstash.hash b/package/python-logstash/python-logstash.hash
index ba11c7ffaa..297bb16bf2 100644
--- a/package/python-logstash/python-logstash.hash
+++ b/package/python-logstash/python-logstash.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-logstash/json
-md5	26fafa0ea306025fb7644d70cb38982a  python-logstash-0.4.6.tar.gz
-sha256	10943e5df83f592b4d61b63ad1afff855ccc8c9467f78718f0a59809ba1fe68c  python-logstash-0.4.6.tar.gz
+md5  e2cbc75dd5417cb55acaa3a12bf3afac  python-logstash-0.4.8.tar.gz
+sha256  d04e1ce11ecc107e4a4f3b807fc57d96811e964a554081b3bbb44732f74ef5f9  python-logstash-0.4.8.tar.gz
 # Locally computed sha256 checksums
-sha256	fea6a5c634ac9d9e047151675adc197c16f45bfba3c26ab113f48fb9fa717fff  LICENSE
+sha256  fea6a5c634ac9d9e047151675adc197c16f45bfba3c26ab113f48fb9fa717fff  LICENSE
diff --git a/package/python-logstash/python-logstash.mk b/package/python-logstash/python-logstash.mk
index 68930bb1f9..a78b6e6590 100644
--- a/package/python-logstash/python-logstash.mk
+++ b/package/python-logstash/python-logstash.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LOGSTASH_VERSION = 0.4.6
-PYTHON_LOGSTASH_SITE = https://files.pythonhosted.org/packages/4e/8d/7ff2e8e8e2613e7bb7654790480bb4cf51a55721371adbb631b16cb16dce
+PYTHON_LOGSTASH_VERSION = 0.4.8
+PYTHON_LOGSTASH_SITE = https://files.pythonhosted.org/packages/f7/3b/c3a957bbdd23859f07905fc3d1adfe89957217a347478c58409f0315cf1d
 PYTHON_LOGSTASH_SETUP_TYPE = distutils
 PYTHON_LOGSTASH_LICENSE = MIT
 PYTHON_LOGSTASH_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
