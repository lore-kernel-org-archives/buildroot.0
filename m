Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD079C433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9155084408;
	Thu, 19 May 2022 14:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0wcSJKpdVrPR; Thu, 19 May 2022 14:10:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84967843E3;
	Thu, 19 May 2022 14:10:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7A761BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6EB34162C
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-HWrFWxn8lL for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE715415FA
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t6so7350305wra.4
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6wB/0v8rU8RjHypnW1qOXl6fZkO1iPfMhwvDHKJOwsQ=;
 b=BN/lrtkC7m7TLtUia7Sa/3Dh9OZMk2FqG1F4+ApQgfdccA5ZnhxUPGh8+GHHS5AZJm
 TJVqTQiSjcNK03xeP7B2uauAkSwIKHKoyoDC5tTnASgVhboh3SSPa5L+knAtYtUovIR7
 TzpMVebSXXREWtEGjrWcu0JCf2/899YEyNYkj8r4AZzUVI2Ewn1QGJ0nHQt+HmpeEm7J
 6J+mXYTz5BcPDq4CrypAqphUlTagXD6jmvEAF+TPieCmc35bTNPlIS879lypK7MPsxJx
 E6vM2x0k/9jsxf6GkKQoD3EYz+LkaJ9mqiYJFCcGh8tAJK6NPi1t/HmIQ/snggNIPVYm
 KWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6wB/0v8rU8RjHypnW1qOXl6fZkO1iPfMhwvDHKJOwsQ=;
 b=J2xWTLHRz7UTAphKK0O4ZZyENvRTpuVxd2cYDXiUrKcvH/mx7rSynfQ/JIiqdSKRNA
 c9m96myz+I5OwsxRK34GQ4o8G9IbTKEIR8nMTmxhigWFHAObPm5jvWRsx1MBl9x17i3S
 yy/nGMALs3cBi6Scp31XBNf8T2kSst46v+f5jZV49v7Gam5Y/oZzQY2AnIlwnfYoqRsQ
 aoQLJqoKWJD/RBoSHuVQMOIywEbKuZxDdKbaYxsoL5JQ9SFA9KIHmiZ+5hes3zLAbSQq
 wBPWs8f67YYEr0LJjp5/gJ/2NMULhD0J3V3VhD5n4bCbN1E7KuD/o9KVMzxQlATkZ29+
 l68w==
X-Gm-Message-State: AOAM531txAUcEHW4bU0UVzalWaahO3JnLEPHVbHrryZNSpcZq0G7t7Db
 mr49v824MbKlR2CQbidJOEwpadWJ1C4=
X-Google-Smtp-Source: ABdhPJz6PcvoPSFJqzFNeyyYEu/V6gmlBVfXfwDzYK1lbGZQEKKmuotmr1pc5UoSB1dT/KYgrPaRUA==
X-Received: by 2002:adf:ffd2:0:b0:20e:60ec:c37b with SMTP id
 x18-20020adfffd2000000b0020e60ecc37bmr4293777wrs.348.1652969323087; 
 Thu, 19 May 2022 07:08:43 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:42 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:08:03 +0200
Message-Id: <20220519140810.1953601-14-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 13/20] package/erlang-eimp: bump version to
 1.0.21
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-eimp/erlang-eimp.hash | 2 +-
 package/erlang-eimp/erlang-eimp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-eimp/erlang-eimp.hash b/package/erlang-eimp/erlang-eimp.hash
index 28d22be16d..5845815c60 100644
--- a/package/erlang-eimp/erlang-eimp.hash
+++ b/package/erlang-eimp/erlang-eimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1a529fa6e8264d3cad43861db417a1e841b28c0601aa847857fa0d6a81935922  erlang-eimp-1.0.17.tar.gz
+sha256  25e4e1178280d6fb98ee5e582ade393f7c5404c546638bcde86a6ebcb6757d90  erlang-eimp-1.0.21.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-eimp/erlang-eimp.mk b/package/erlang-eimp/erlang-eimp.mk
index d066961cd3..27bb2203c2 100644
--- a/package/erlang-eimp/erlang-eimp.mk
+++ b/package/erlang-eimp/erlang-eimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_EIMP_VERSION = 1.0.17
+ERLANG_EIMP_VERSION = 1.0.21
 ERLANG_EIMP_SITE = $(call github,processone,eimp,$(ERLANG_EIMP_VERSION))
 ERLANG_EIMP_LICENSE = Apache-2.0
 ERLANG_EIMP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
