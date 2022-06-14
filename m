Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59C1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 21:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 716FD40B1E;
	Tue, 14 Jun 2022 21:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Di2l5hi3kliG; Tue, 14 Jun 2022 21:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1C67409C1;
	Tue, 14 Jun 2022 21:27:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA8351BF2C4
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 21:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D66FA409C1
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 21:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Rw95Z9DOpPx for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 21:27:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3280140191
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 21:27:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so92808wma.4
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 14:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=REyROPtl9UiunrtNnIN4NK9LciZIb6h5oddKMNAVXDU=;
 b=bVyfRvpbU8tqIhWlpwN38FJm8vIUHD2ej5p3nb27WUNfBysHGduR2qgcohfHJMzsmA
 X4azd4M9uY1QCKu62zn+A7MeWJi0hSbz/E61ZEeUWmX/Nhod36tATF3pl6qUp8y7agK2
 Wmx8rtgNrrpEP0ZpLtWGxe+G8Y6xoM041W9txSg1S4LVks4DaB1eAtpMYOJaGiulWtOU
 1Fh1bIYv+7rvJqy3j26Ro/dXhT4HzpqNMvbzce3JRU0HH71UKVq8zZ1QomS103oNNT7c
 oh0tDUxVS+2lJMvoz/X6OIjpoboppO/TrYDSFvDaVn5KtxoZJmNOeWIOx2k/aTrGJu0t
 nwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=REyROPtl9UiunrtNnIN4NK9LciZIb6h5oddKMNAVXDU=;
 b=5+eeECZ8LFjl3rd9Hq0s5CAP74qOEVsxeHKKppPNfi1QlHWyOhzioL99DlE9CQ3C6t
 dam5IjPIX7+JmLpuSA5c7psHzW457kYw0TFywQEZxHCyOIYZsf1QBOtBnc6r7bFrQtqi
 JMLLChPPnVcUKU7SWRVE8zHV1Wa8jUndtuTtI6B5MjkglBK9UxAIRHbwesFOfl17C6m1
 HfUv4hTb17b/f8b9dwLFt0wZB5OS+T4TKWxK4DEmOxmENfz2RbPFrctOeW3oFfioa+xe
 X4wjDJYupQ5YMbC17Os4BZ3mt+t7dle5zIqhR6ZU008TzkwBZPOqClUWdOQnxFVWDDvn
 o93Q==
X-Gm-Message-State: AOAM532hE75nwXlVzZZ5aEgWg7MPKKQpLp0d6gS4w02eUEJ+ipA/UfUn
 J+/Dka8HVWOgzc6zOBDNIC+hTSPNuBg=
X-Google-Smtp-Source: ABdhPJwNSTa+sx0oJbLNMbJFrk8M79ON+tM0CblvOj10o6Q35RsThCQM8iXlgK/aJeXxogppgDCt3w==
X-Received: by 2002:a05:600c:19cf:b0:39c:88a0:c66e with SMTP id
 u15-20020a05600c19cf00b0039c88a0c66emr6214953wmq.37.1655242054686; 
 Tue, 14 Jun 2022 14:27:34 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b0020c5253d8f7sm12956033wrw.67.2022.06.14.14.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 14:27:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 23:24:45 +0200
Message-Id: <20220614212446.3491084-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614212446.3491084-1-fontaine.fabrice@gmail.com>
References: <20220614212446.3491084-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/netsniff-ng: disable geoip and zlib
 if neeeded
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netsniff-ng/netsniff-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 3bc11b55b9..2b5b19b27f 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -27,6 +27,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_GEOIP),y)
 NETSNIFF_NG_DEPENDENCIES += geoip
+else
+NETSNIFF_NG_CONF_OPTS += --disable-geoip
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
@@ -41,6 +43,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 NETSNIFF_NG_DEPENDENCIES += zlib
+else
+NETSNIFF_NG_CONF_OPTS += --disable-zlib
 endif
 
 # hand-written configure script and makefile
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
