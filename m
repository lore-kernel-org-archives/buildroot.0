Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77A8C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 00:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF3D342C3B;
	Fri, 12 May 2023 00:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3D342C3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ky8i-z2eCKZ6; Fri, 12 May 2023 00:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B27A242C38;
	Fri, 12 May 2023 00:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B27A242C38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35BC41BF25F
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 00:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F94E40895
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 00:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F94E40895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZyQsR6lZucqh for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 00:21:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDDE540327
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDDE540327
 for <buildroot@buildroot.org>; Fri, 12 May 2023 00:21:38 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-52160f75920so6341858a12.2
 for <buildroot@buildroot.org>; Thu, 11 May 2023 17:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683850897; x=1686442897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UsrmZ5S9l4Vn0bY8tKk+jKzyJuzoOwe+ta6hWhJYums=;
 b=F7t2Q62OQv5a1LKJaZIvVpyM9rOZ+arXAJuhozqDA0vjlnY2TdTtt2WbHzcjszk14p
 xbu04i7Olo/FMfWwtqnQfQGre4v7Q9mpxqU51SFGxmKf3Z92uWkfCr6Wyo1QYLOPYnDQ
 SdAoYq5Wk4yCxp38/GcX/LAQjj9YcO4VOIqSnFWWQ7cosvJG+Ni/SyiJnkryEbM5vd6j
 KeeYmokPcnB81nUmlw/Y53BXaU6IJWRk4IwcdcVTT8UTrmOduVWKEId4L5LAjv/fOWIe
 g9I87qteYMev9/M0OGOWZKh6C8LheE1kBzFZSfLVX8d6cXuVqhEr66stZNEjR08lyJ2G
 PBRw==
X-Gm-Message-State: AC+VfDx42zw1rJ/0LcVwrrlXDl558wvqeG7epQQYEke29s7IR3uAvLy/
 FX+b7rfFlxB7KQR+MhsnvMnAKpdQvc8TrXzKxGjz5VjO
X-Google-Smtp-Source: ACHHUZ4nwu7xGEWQwQQ1z2uPMngMNc3+shxgTW19mcqIPI65uA0VO6Q8Md01dYyLPaR9brUocR3jFA==
X-Received: by 2002:a17:903:48c:b0:19d:1bc1:ce22 with SMTP id
 jj12-20020a170903048c00b0019d1bc1ce22mr21401463plb.5.1683850897722; 
 Thu, 11 May 2023 17:21:37 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 f12-20020a170902684c00b001ac69bdc9d1sm6587758pln.156.2023.05.11.17.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 17:21:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 17:21:33 -0700
Message-Id: <20230512002133.1353641-2-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512002133.1353641-1-christian@aperture.us>
References: <20230512002133.1353641-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683850897; x=1686442897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UsrmZ5S9l4Vn0bY8tKk+jKzyJuzoOwe+ta6hWhJYums=;
 b=0zJqigEu/GK9oHAw2dxhgbwGikjdZVzUoaCqFeAILn8gln562efhRG6DxfKie5r2gd
 /Z3mXnkzBXEwtmqIRoigHVAy3YkA8BtvVR9Hsk5+3+WGKDz2xauFz579MbU8xtkprIYB
 gQm7P9wfRZ8NDWaj4d2PNt738lECoSYRvKYYyGlSsPQa3kmO/A+jRFSyeNviccnlv0rE
 BDdMow96/XQUwVaZPDSqxa8qldHtUiAn5j1AbwIz/yr1kS6x1Ekt/N4NN/rK00KbpK0i
 IxdxaUwfIQg6njmWien2gaTAwlBC8BlbMTptgwIAlzFuuCmnday/evxppo3nnSq1I7i1
 QC3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=0zJqigEu
Subject: [Buildroot] [PATCH v1 2/2] package/cni-plugins: enable some missing
 plugins
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable ipam/host-local, ipam/static, and main/tap.

Note: main/tap is new as of cni-plugins 1.3.0.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/cni-plugins/cni-plugins.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cni-plugins/cni-plugins.mk b/package/cni-plugins/cni-plugins.mk
index 27a31b445a..bccc1674aa 100644
--- a/package/cni-plugins/cni-plugins.mk
+++ b/package/cni-plugins/cni-plugins.mk
@@ -11,6 +11,8 @@ CNI_PLUGINS_LICENSE_FILES = LICENSE
 
 CNI_PLUGINS_BUILD_TARGETS = \
 	plugins/ipam/dhcp \
+	plugins/ipam/host-local \
+	plugins/ipam/static \
 	plugins/main/bridge \
 	plugins/main/dummy \
 	plugins/main/host-device \
@@ -18,6 +20,7 @@ CNI_PLUGINS_BUILD_TARGETS = \
 	plugins/main/loopback \
 	plugins/main/macvlan \
 	plugins/main/ptp \
+	plugins/main/tap \
 	plugins/main/vlan \
 	plugins/meta/bandwidth \
 	plugins/meta/firewall \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
