Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A528C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 08:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C04083131;
	Sat,  2 Apr 2022 08:28:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TevdvI5lpBBC; Sat,  2 Apr 2022 08:28:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51B9682977;
	Sat,  2 Apr 2022 08:28:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 835F91BF42C
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 08:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 778F44167F
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 08:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s5yROHqBUct4 for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 08:28:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 801214167E
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 08:28:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d7so7192065wrb.7
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 01:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/CayOjfvaaBBA1Xk5xDUYTtYWtOY1LqkjKHDNLGw+rk=;
 b=PMO4kExWYw9kmMfhPOAhNxkoH21DQqTISQF7sI8WBNOV7t9rIWz66CuswGOkKyrI0Q
 en4Ow+2hOXYzxQnY7006b2a/OzqU7gWEfNCwTS5f9Hb+go4wCXRpsJ6pjlXKM3sB/xj1
 Fd5LJO2w2ZNjr3capi4aq97YcY6qUN74imEN53o9Rb4ptuXvHQBxbdiF65s4kupiW2Bu
 fZX0wPVcQmqdsxQVMk0ja3FXXfdRAS9AUPYpepZ2dbXloZtPvc58UArbB6aaCTuEBa0+
 2q5wq/2J4xGgJOgRIszxkQd/Va+GE6LeQ5Lm6vkw+XCT2jCVw8h/w3cCV/RYljdDiU+t
 gzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/CayOjfvaaBBA1Xk5xDUYTtYWtOY1LqkjKHDNLGw+rk=;
 b=TKcAAn7vNU3nw0BvXmBQ/aVYCLxUZth8nEfrzQxXdTF8tQq0VH+xNvbe6zFb5fHRzH
 WyNmUP5w03TIzljGbKo13LQ6DZ/RmtmV6iePP9kiE1z+b79HFZ/zUAucvjZ3MDeY9K78
 7mQIInrRMTDRqLVyp+G/oUlipVbElow2jAGZe72qsg1iEtUxHOCqQE91pPJclFsHit7y
 QPVFM9rIjsafBYQT6194M906103+tm1SJss1qFTi3CcGLaD3t/qrY4MceTOCXUWFnZ6m
 k/Wc9L4rhoyanvubf83dd6zPx9jyi819w2E3g3FuHUQHXIGNCWmxfJhzCWt683n3aJlg
 hcJg==
X-Gm-Message-State: AOAM532oLug7dxQWr/X0Oo9bljiHGsLuZpw899+04b7iRtrKYtdhLZzq
 qzcBW3NbxaeqSLF2Y0n//iG+Hes3F4g=
X-Google-Smtp-Source: ABdhPJziPqnVX0VkoggUblxnemBl42Z4cXY0wNsRUNAAwvK0J0XUE8idMdS27nDqPlDOygmgjnxbDQ==
X-Received: by 2002:a5d:64e5:0:b0:205:9d96:6cf9 with SMTP id
 g5-20020a5d64e5000000b002059d966cf9mr10076589wri.117.1648888128414; 
 Sat, 02 Apr 2022 01:28:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0038ca453a887sm12362123wmq.19.2022.04.02.01.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 01:28:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 10:27:14 +0200
Message-Id: <20220402082715.1497098-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/2] package/ipmiutil: drop dead code
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ipmiutil depends on dynamic library since commit
670095b4739c898a8f270b003ee19294206d91f6 so test on BR2_STATIC_LIBS
added by commit 9f31cd14d01e306e6475b750c30554043c57491a is not needed
anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Keep disabling lanplus if openssl is unavailable

 package/ipmiutil/ipmiutil.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 4c9de26583..97a644e314 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -17,8 +17,7 @@ define IPMIUTIL_TOUCH_CONFIG_H_IN
 endef
 IPMIUTIL_PRE_CONFIGURE_HOOKS += IPMIUTIL_TOUCH_CONFIG_H_IN
 
-# forgets to link against libcrypto dependencies breaking static link
-ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # tests against distro libcrypto so it might get a false positive when
 # the openssl version is old, so force it off
 # SKIP_MD2 can be used only if ALLOW_GNU is defined.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
