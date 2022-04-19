Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFD5C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 13:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FB31612E9;
	Tue, 19 Apr 2022 13:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMATWK1fsEw6; Tue, 19 Apr 2022 13:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AABC612E6;
	Tue, 19 Apr 2022 13:30:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C67A1BF42C
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 13:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7956283211
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 13:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9BgieX3lHut for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 13:30:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9113F831EF
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:30:11 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id x3so10652028wmj.5
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 06:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3WteJS5qpa1rH2Ok6+fuzh04hMNlni7MfAeU9DAox8U=;
 b=FcaWRWzRjvhD6a8CAVS50nLoKJ4kSOCdoQLU9fHT61j/QVvA5Yun5fMm4p/gtqbae4
 5+QK6Zjc9hpnrGMDr9/7BhhuvEFQIvziF/xrBxH9aiQFoszzy/T1QV37tMUdJVyY3fR5
 LqHgLW1E4mhLfN3B3HWnadpEP3iJqmleMa/QMQYhxr+hrq3PMojNMXlfQJwN8qeWrDsh
 PED/I0e7ankMGgju+21gb1QWHXEWx6Id8D0Uf5OSoQ+wvhb1sFtTxxFTtJcz239AIGSc
 6+FgvmOpBR+eApXTY+VN6d5EocWx/zLb7aExVTJG5uCJIsfy+ms2B8kvJvByvA4YlT8u
 5IgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3WteJS5qpa1rH2Ok6+fuzh04hMNlni7MfAeU9DAox8U=;
 b=3iuOlGrnTfXamY/weqVJMRc98aFFkdZu7Nmc/ZrWTB4v3rQKLMTiCfyP9RXXZIvGDk
 xXBb650CI+GSobeF1ZBayGW9XRnrn7EOptG2YLgKtMgC/f44JnJ9vz4nydIIL1He9AqG
 HvhVy1Dbzr7ZfWnq53NPTgHDme+Oc3ia3ptgmiAiwSVvk80YdiN/xR6d4auo5/bVPJt5
 3HR2+sIJv3YLdRFwrCKjJJy0L2z8/tQy9fIzhBmLwcPMqdTDvAYzCyWj6VGmUNPECMPq
 IXVm5NX5XJ3zlMmnA+A1nDaozd1lQqNJ/Wn4HL29h4lWKvbRoKR3jSRdeLjRNs/uKTO4
 EN/w==
X-Gm-Message-State: AOAM531R/siv8mJITjAkG+PDYWu4uEu8nsFaloQlO+W6XHDeCZ3LUZjE
 tXLaYFnFQhkDjvmp9+GlVYqA8onFhPQ=
X-Google-Smtp-Source: ABdhPJwjOGm1529cXPQf92BesL4gSJjf3s6DXI5Y1xZvPN+8cgKYAB4xJLW9Iwm1AXAw9dVv0q9+wA==
X-Received: by 2002:a05:600c:4e50:b0:392:8fe7:4700 with SMTP id
 e16-20020a05600c4e5000b003928fe74700mr13178108wmq.89.1650375009568; 
 Tue, 19 Apr 2022 06:30:09 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l14-20020adffe8e000000b00207af9cdd90sm12392801wrr.39.2022.04.19.06.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 06:30:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 15:28:05 +0200
Message-Id: <20220419132805.2571073-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419132805.2571073-1-fontaine.fabrice@gmail.com>
References: <20220419132805.2571073-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/netsurf: use HOSTCC_NOCCACHE
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

Use HOSTCC_NOCCACHE instead of HOSTCC to fix the following build
failure:

/home/autobuild/autobuild/instance-11/output-1/build/netsurf-3.10/tmpusr/share/netsurf-buildsystem/makefiles/Makefile.tools:413: *** Unable to detect toolchain.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/b4ba19d7dcff1b0ee2b1546598b5ae6e9257a16d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netsurf/netsurf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 574c1423df..b61372bb78 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -106,7 +106,7 @@ NETSURF_MAKE_OPTS = \
 	BISON="$(HOST_DIR)/bin/bison" \
 	FLEX="$(HOST_DIR)/bin/flex" \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-	BUILD_CC="$(HOSTCC)" \
+	BUILD_CC="$(HOSTCC_NOCCACHE)" \
 	CC="$(TARGET_CC)" \
 	AR="$(TARGET_AR)" \
 	TMP_PREFIX=$(@D)/tmpusr \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
