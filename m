Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E062C43217
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 12:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C56C6405BD;
	Mon, 20 Dec 2021 12:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KbCCcrXflrsQ; Mon, 20 Dec 2021 12:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0586405A4;
	Mon, 20 Dec 2021 12:59:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1AC61BF20D
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 12:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE87E83DF7
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 12:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMPADw83k_Ux for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 12:59:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 063E283DF6
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 12:59:22 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v7so12623216wrv.12
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 04:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zz7cFv6bvL0O5sKZXzl0tI6k3G8M77/MphgyiL481n8=;
 b=lJctxWRCxWEi4pUtgmtx4GVxZxn+XM87gxFgzdU68XhZKnsOnW38ZUn5UIPzU/XfUa
 075DTiyzH6rF9PFp8h32rhEa7huIW/u0d1PSd8/a1Qz6MyK/u1eEcs0a7QzCPhOCgGbm
 ozuAYA/bIfNI95RHFg4DhEJros/IZQhncJbrNhuGIrhq2EdmVDkkWI1/jlWKTpu5r9rX
 CElPn4pGdw1FRJKtz7/nSNxPox4vYUpL62jClK0+3bAODsElUsJLou/s2CJXS+EE1+Of
 V8A5D5AywyoxvG+yUhb2AIBodyxcghc076OioUJQkiy5Eqsppem5yjhQLNiN56De1OOK
 CpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zz7cFv6bvL0O5sKZXzl0tI6k3G8M77/MphgyiL481n8=;
 b=RIC2hwsduLRCqmK2k0IXMDWl8RKBrXuxd2UaIAeeniLyLRJwIcxlRUXFBTuPnyERwf
 T89AvbE9ZIgz+mDcTAcvlpM3OQRApdPYmvGEm91FAql2MmETba31GH8tJH+jcern+Myl
 3DxVT876R3pr4P00d7yEGdKRE12fMMuF88XocSFnA6FcLKXCQoY4TZSDZ/QoWCA9abQY
 a9Jz9p8VIGzuJ3OWfYai/ylO9OpMWvnjazr37V/rW3NXIvP9yltI1eBU+LyvghvpvBgb
 y7vS91kdrSa6Irhy3S9khFiZ9FUetgtSRscWjqoD2DJRq7nJUaLlHYwOULGCDRI6fsds
 WlYg==
X-Gm-Message-State: AOAM5302JjcBVz+iIdhu/j+8/WJMgZ/xjkoIEe52lYAoBmwPI4S9qvUm
 7EulopAO9ga2JHtYCYFNCDQnZNdZN4/5vg==
X-Google-Smtp-Source: ABdhPJzQKy8lQqZg6NctgaJPwVnKYlltHjDFR0vylgaXiu9Cxxt1rJZNm4bAZh4tnBYL+52wVEXR1A==
X-Received: by 2002:a05:6000:2cc:: with SMTP id
 o12mr4115671wry.206.1640005160714; 
 Mon, 20 Dec 2021 04:59:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id bg34sm19909499wmb.47.2021.12.20.04.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 04:59:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 13:58:43 +0100
Message-Id: <20211220125844.2187408-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/mpd-mpc: disable documentation
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
Cc: Thierry Bultel <tbultel@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable documentation which is available (and enabled by default) since
bump to version 0.31 in commit 0186da2923c07656005264dbb3001ca706a2ef10
and
https://github.com/MusicPlayerDaemon/mpc/commit/60e173c0198743fd6af906682eadec1cc67a4975

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd-mpc/mpd-mpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
index 6eebc63cca..d5a981d70e 100644
--- a/package/mpd-mpc/mpd-mpc.mk
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -11,5 +11,6 @@ MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
 MPD_MPC_LICENSE = GPL-2.0+
 MPD_MPC_LICENSE_FILES = COPYING
 MPD_MPC_DEPENDENCIES = host-pkgconf libmpdclient
+MPD_MPC_CONF_OPTS = -Ddocumentation=disabled
 
 $(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
