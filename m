Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1C1C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 18:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE57182F11;
	Wed,  5 Jan 2022 18:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nEs7-PE-f4Ds; Wed,  5 Jan 2022 18:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A950382C8F;
	Wed,  5 Jan 2022 18:05:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 643E91BF47E
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 518FB40347
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31VpqSD4uWm4 for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 18:05:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A47F40126
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 18:05:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j18so84692208wrd.2
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 10:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bnel6IEBX+qspuA+RZsfw0+d5PWkKP6Nq02FO94zsgI=;
 b=h7wKnKEJGiXsTDehvYcZX3/oq5TTOMicpZd08wienuMhgbVJzgccTEdUTW7GOsR4oc
 04mdTpVr2faYDtEjfQb3dPGtDrOxtknxYj8IHPYG4pv5ctRFg+z78yXnvxHHwb3ibKDs
 /lHMgv5ZtiIWU/yZS8lB81bQq3AUwuCokLp0SQeeHS6RvClBrFdN8lG0wk9V21SdjU6Y
 lPUaz4HIdPG0vOEhCSUT9ybp0nbKl0TmYhRp5Q202Wry9TzgfgXxzRwaSfdu8PP6s2Zx
 zkvbJu1zDgMf+H8JEkf04adzdnd3ckGhW5DYLaIIP9/m8I2XSqIOYwz0tcwDS00MX/Dk
 NBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bnel6IEBX+qspuA+RZsfw0+d5PWkKP6Nq02FO94zsgI=;
 b=KYg31cKi87+hE6umRVjqR75heXR1w0DR4+i5B0HccNq+hHz9+ayvNxS6RgxVbUmuON
 4+8xEZfSiOT5l+rIPcOej7dr1IYUUjZQU+8NYa2dZBHv5up2jVd/Lvw6LJJBNi5AvFKl
 PJIMsvEqKGeR1QLREkOqmDHYPQ3Zwr0pVCRbkoqxSMD5WrAklH/R8kbCw9vkOhVcyeuO
 nmDOYDnA4bgj5GtHRQB3fxm31Zvf9zVHP7wWxihlCCBZsRu2l3Xg4UOIzQwf3PqHharo
 +HSm30cUkA85IIPEj9+e8Z+UA9afscorkhT489vqgrm3QzgVEf6TzeqHwFGrGrGu5rbV
 8xeQ==
X-Gm-Message-State: AOAM530UkDZzWzLGCWCbvMU3eJYwcb6NDNrM8KIlzri801vZqKPHkKFL
 hfkpQ5Hh0s85aMX3U6bgHPSvibhT2uo=
X-Google-Smtp-Source: ABdhPJzmjQ7WWhZ8ux7oLZoqzG7pq1JwozQZGV0wDnLhlD4bHWDtx4zqMDVpnLiGvg92xzro/n0vDw==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr48093291wrw.430.1641405913356; 
 Wed, 05 Jan 2022 10:05:13 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id a24sm1642283wmj.42.2022.01.05.10.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:05:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 19:04:01 +0100
Message-Id: <20220105180402.388388-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105180402.388388-1-fontaine.fabrice@gmail.com>
References: <20220105180402.388388-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/checkpolicy: add host gcc >= 5
 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add host
gcc >= 5 dependency

Fixes:
 - http://autobuild.buildroot.org/results/fc727efc0c658aaae55c83632a91af83701f0c49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/checkpolicy/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/checkpolicy/Config.in.host b/package/checkpolicy/Config.in.host
index 240a5b6dc4..38e35e2fc1 100644
--- a/package/checkpolicy/Config.in.host
+++ b/package/checkpolicy/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_CHECKPOLICY
 	bool "host checkpolicy"
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-libselinux -> host-libsepol
 	help
 	  checkpolicy is the SELinux policy compiler. It uses libsepol
 	  to generate the binary policy. checkpolicy uses the static
@@ -8,3 +9,6 @@ config BR2_PACKAGE_HOST_CHECKPOLICY
 	  shared library interface.
 
 	  http://selinuxproject.org/page/Main_Page
+
+comment "host checkpolicy needs a toolchain w/ host gcc >= 5"
+	depends on !BR2_HOST_GCC_AT_LEAST_5
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
