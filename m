Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BFCC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81EA240155;
	Tue, 22 Feb 2022 10:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KjyOoDOGCnSQ; Tue, 22 Feb 2022 10:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97227405B1;
	Tue, 22 Feb 2022 10:22:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D52B1BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3725E405A0
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwLZZe6n3lpz for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:22:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6ACF340155
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:22:25 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id bq11so14403349edb.2
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 02:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UuwkYd69sE9+LzXFQJEReT9ff3lKGNac/MBdgT3kjS8=;
 b=VI7rYN5vhBKdQFqZDgnCayA16F1yazDTulCUaJbP33RjrfyGtNvBZGGWVED9rFFhGi
 +FXn9M39tGpuMuvhchyeyN5yvVTsECAlX+xmt58w4aiOslIqK/Pwup5bYmCkMHx5P4Z9
 nZ0OEeYexrIuJrQG5TCqs87RZRkS0NW0FaVHVsyFveQzV7b20wgcuMA+gixLr6UwXn7h
 e0EdYGhHqepZ7t2R7JT+4eCE8LYe+fvQfZPwVtujirE/rAeaDrHpEWanPVP4RV50TGFO
 wo0JtmcxlrDYL86B+pz5h26/+E8fLfWtNuHuLTFNk5E6cPlcmbnNgcejP4ORPVcMZXm6
 jcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UuwkYd69sE9+LzXFQJEReT9ff3lKGNac/MBdgT3kjS8=;
 b=YRu/b8FfEwdVXMtJTiQ/kTEtomduy0BIzdElH25DRgreGttgp3B8w3y4M5p9K3m77g
 sSgdYkTh9dI3vy8vY5sMT8ivv6vqQxqLpk5YSFBLSYNPx+PpjW/jnCl1eJ3n9pED3OWn
 g5FfMXbM/hsEOqA8Gpouv6opRh6T2eitnljYM/4huIxdwsYtkKNm9KYk9swIYk0QsnHp
 mfY/htm0ack8wobC+Zxi8D8vVHOclMNBJ8XkRHrzxI9+ALZOJn9F6PZVzg+1K5h3wsC3
 bEoyONPvUqLe28ZHiqjgBs9tCXYL2T9wmNU1zf0gn9dF/2CfrcK29xchv6oC/fLxWE2i
 bNfw==
X-Gm-Message-State: AOAM5317+4Msb2UNeDuGmPQfy+M5Cdlnfg5GBPorEjmwu4PSJ3Pr8tnS
 FWrvp78H5g/QpTDkNt1rHUUbVIShPg3qlQ==
X-Google-Smtp-Source: ABdhPJykOMJqiM5dU9h+sH8tzZAtRdwdYKIrlpmaVKhSRbnWM4Cqdnx8vkNg3s4AtS8WmfiJrc8y4g==
X-Received: by 2002:a50:9d47:0:b0:40f:9d3d:97b6 with SMTP id
 j7-20020a509d47000000b0040f9d3d97b6mr26486974edk.392.1645525343507; 
 Tue, 22 Feb 2022 02:22:23 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id c24sm6097032ejj.60.2022.02.22.02.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 02:22:23 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 11:22:05 +0100
Message-Id: <20220222102211.74573-3-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222102211.74573-1-nolange79@gmail.com>
References: <20220222102211.74573-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/7] pkg-autotools: optimistically set
 runstatedir
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

since Autotools 2.70 there is an option to set the
runstatedir. To support configure scripts using older version,
the variable is set directly instead of using the --runstatedir
argument.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/pkg-autotools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 717ff81593..b6224b349d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -187,6 +187,7 @@ define $(2)_CONFIGURE_CMDS
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
+		runstatedir=/run \
 		--program-prefix="" \
 		--disable-gtk-doc \
 		--disable-gtk-doc-html \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
