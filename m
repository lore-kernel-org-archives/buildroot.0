Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF812C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E4D4177F;
	Fri,  4 Feb 2022 15:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cae3qsg5oa7k; Fri,  4 Feb 2022 15:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AECC341778;
	Fri,  4 Feb 2022 15:47:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 321341C1162
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B910405D3
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x0KoppJOOu0t for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5A12404CC
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989593;
 bh=RHBqfYY87NYHU6DxYRiCTb7+WCnBu3T5oybxNGMK9Xs=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=ayh/X62MvtL4dk0K0/Ef2/aWJHRrQ1qOJByEx3+0lEjhTjIQvWTGqD+vO7oxf5bGZ
 bXBZyYoC9sT2Hn78lQs0iXbbgbOFeRK1/phsDcgMHIlThRbkKBB2eehpMYmFUvBnkx
 2cxNG6b5L4KLnwYOQjmNALaAsXBVuRmDfQgQQLms=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mv31c-1mPHgG3CNM-00r295 for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:32 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:22 +0100
Message-Id: <20220204154631.17814-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WTsVH6FVNBUi9TLBjuDcSKpMCd8PtwSxLnTYHvCnh0C2E6X6XTS
 jXwxRIzFqaKIyLFUGcYbJMSiMVs3qPT3v7qg1w3RvEfaJ6pLjxY02Uc6HEviUwCJUmpE5gU
 0sMBb10BbM4Gg4z0CKKhIKsr8pWLD/MT3fWOoIrlciKnVssgPQghqm/gKSCo+qp6gK+inIj
 o+vCgAaOuWgkKnb4hxE6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vSbxT6+90U0=:ypyjM4pWKlwf6qRdgI7iae
 9dMXkTfKFSn0WZYwQrsNbj6p/KmHXQzsnyOEeEqs82EahUgkTkXjnA94yugDO1jku4PfQV3RL
 pkSsbgJF8sesiiCRe8iDHORKNovVzZ4eB7u5XK72U4BDI1y47DG1WYvULN4U8rCCeR15i4Pee
 KdQogcEj6fDeqlfCyFKjZ1QtiJrBvKPHI1EzMRU2Cl10IV5psdGNPWkFBoY3jo/XJ53YCc+7a
 WOXaaa9ox8FPweNvzMpRmx0+zImya8hmBVPvuScw1GXzOVo5auB2aok9TLzJlaNrw0yA91LAq
 mptSgB2QjhMPjFK8Q6WWpCkuWfy8QuJFMUgXgKzQZ2GlDXGW3ntKhEtY/hmXmsdpwqRsMmwIb
 Btr4oHJglqCM29w4t5KRagkX0nK8uNYb8+w4myiGDpDumZl6S+DhQJMl7X+RrvsJTtCNEGrSp
 DGRxXWVoMzEnwyJmVxrsvY9t4XgDt0VuXHyb7KPAMZ3vm6lMG+2XWLV8fe77lD/kz6iWG53J3
 GHKX0ZlEjaZWSk6v79E8mk9G5T7drGIPJg3rYG0+O5bNTi76T3/3UNHeLE6bpJ/Cs1WAzL79K
 WQeA4RkNrYZDD6HXZIJMCVDB2XgYrW+o2kchZzuXFeRf3U5tFQc2lrbE14k27zAKG31J45kQ1
 NID+pgT4kiNOWfFBHwFtOvjC90fAHS7E/HGDI/c0pZ/Svip+0i5yOgOdjb0isy+4IhqK+0rOa
 8Zy032m9yCaz+WGtPDWlfs0d0OS9YGCXzwR9961oyLDKklVtqwmup7zD5tzI4LZamz/BDoBuc
 EGm73HeDeqHFjU7gawRa2IgU7KaVN1g3ZJiiZe+cjrZTbiOCQ/FasTBHo8dQ6CXwP8r46yZ22
 Gn/zfNk/3OkZjnuu0+VwbqoDD4t6M0MwkY3vy0plz+u//zUJijI5DIvxB3MZYq5/BM7xqUZKc
 KJJKZl7kdW8WlDroE+QzBjq/YIVl3wjE0DtDGc7+ZYcgvHNEsZ6iMvHynu7RlLX8lI3pzZS5n
 2NPByYJOX1riPy9MfDNY6KBE9LMFXjroA2pX5zzyKbmaFEYYhoh5fs9jtXsGyXFCD0I7qVGdg
 PTropXMpe6zylg=
Subject: [Buildroot] [PATCH v1 03/12] package/gst1-plugins-good: bump
 version to 1.18.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index ea9f43bfd2..e342bd133e 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.18.5.tar.xz.sha256sum
-sha256  3aaeeea7765fbf8801acce4a503a9b05f73f04e8a35352e9d00232cfd555796b  gst-plugins-good-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.18.6.tar.xz.sha256sum
+sha256  26723ac01fcb360ade1f41d168c7c322d8af4ceb7e55c8c12ed2690d06a76eed  gst-plugins-good-1.18.6.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 44da3c3c30..e0ca29c5fd 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.18.5
+GST1_PLUGINS_GOOD_VERSION = 1.18.6
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
