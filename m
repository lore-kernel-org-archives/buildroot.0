Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D3CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 19:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AB1460ABD;
	Fri, 18 Mar 2022 19:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_gCJ5708Nhi; Fri, 18 Mar 2022 19:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A68AA60864;
	Fri, 18 Mar 2022 19:34:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 941031BF377
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 19:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8239D824E2
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 19:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w76uSu7cTQVZ for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 19:34:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83ABE82496
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 19:34:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t11so13010403wrm.5
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 12:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1toEeKo0MReTXZWMNI6Nvpm4753rXg00X6gJlF//0so=;
 b=k7cApI1jUa7BAonop/c5Eq17fkTa3VLWHjjvUwZNYOh+lUz1JMePsGcvWlejlpsoyI
 cU/2SS9dZiE9lW+wtGyn6JMf6fEF6yNQN3JT3XrZ3pN8ziHFBV5EBSYGoCSbvDw5wsoa
 wlODz7XMruCj/D1ZINF1iN7MPcanqQb/54BLrN0umsSLinphgnXOiie4wAgRnpRrMAa1
 a/5eaZ/toAi4Y4t9EhLw3iMk+3qdVIkCbCMtkzIeiBBHK4wYeC2Jxrpg6OTygAzHQSvp
 ulqD3lkwNqwMJC1uwLPV/uN/ubxN8/YjjfWt4NYH7FqicDpxRpPDW/UHthQXyIJYNj0n
 wtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1toEeKo0MReTXZWMNI6Nvpm4753rXg00X6gJlF//0so=;
 b=s+WbmiODdJbISHIQVgQLMhWw34G/KvUcguJdkMieOfzyeHVCvtRvn7L9IcRcN2UVUb
 C5bRE3zARKqm25K1ujzFZhtgQ1gCo73vLyVCCWLR92cTQX93+kQ284WCMRan8Q9jV7QK
 F6L26AMN9+bJLwbIyADkcRw2BUqyaYmWesGFmr7K3YLeWxnWyz4lmfrUUxWKbubWIPPo
 Ipvh31SwdmXxNlyCs+WrBWOGDo3nESFSwtx1HI+CbzxL5dF52Nm4tHM42YrnFTBaUuM9
 fQxxD9gqg3zTS6gdoTk4RL0cExzjvIJUvtZzAgDxSnPMHykftyV+n5U1CSxeuDGuGQqj
 2dFQ==
X-Gm-Message-State: AOAM533b+6OZyAMz+zYSchEdeOQ/aipSfP2ZNHTa4tNIVoB74SNKvtgN
 jB4mJNb9E8OoBah1yEi+PpVrg+StegI=
X-Google-Smtp-Source: ABdhPJyJOqwQ6UMtAEnN+y1YZF6ycPVp6YDyjzwkV+qJwsOKosFto0OOpfvtpCi758EpAwAxMU1ccQ==
X-Received: by 2002:a5d:6da9:0:b0:202:293e:85ff with SMTP id
 u9-20020a5d6da9000000b00202293e85ffmr9385341wrs.159.1647632061492; 
 Fri, 18 Mar 2022 12:34:21 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a1c2b04000000b0038a0e15ee13sm10791711wmr.8.2022.03.18.12.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 12:34:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 20:33:10 +0100
Message-Id: <20220318193310.752282-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireplumber: fix introspection build
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

introspection needs host-doxygen and host-python-lxml since the addition
of the package in commit c9a3c10417aadce9ee4922e30235776409ce8eb3 and
https://gitlab.freedesktop.org/pipewire/wireplumber/-/commit/2e5b13f970fe3dd28a4ce75868d46403034c6822

../output-1/build/wireplumber-0.4.8/docs/meson.build:14:0: ERROR: python3 is missing modules: lxml

Fixes:
 - http://autobuild.buildroot.org/results/24c524d86a3e2e67305f698644be9b15d4562488

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireplumber/wireplumber.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index 3bf7cece45..327138391d 100644
--- a/package/wireplumber/wireplumber.mk
+++ b/package/wireplumber/wireplumber.mk
@@ -17,7 +17,7 @@ WIREPLUMBER_CONF_OPTS = \
 	-Dsystem-lua-version=
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-WIREPLUMBER_DEPENDENCIES += gobject-introspection
+WIREPLUMBER_DEPENDENCIES += host-doxygen host-python-lxml gobject-introspection
 WIREPLUMBER_CONF_OPTS += -Dintrospection=enabled
 else
 WIREPLUMBER_CONF_OPTS += -Dintrospection=disabled
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
