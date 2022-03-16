Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2343C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78D7484348;
	Wed, 16 Mar 2022 21:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Onu32ETxUXyt; Wed, 16 Mar 2022 21:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8214F83F2C;
	Wed, 16 Mar 2022 21:38:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7296B1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 599F7401DF
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBtBoOmGsH8D for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D54B40018
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466577;
 bh=TZ+kf5lk2+kGfx9NCER5CsGxr9UmrVhTtKiwgqlFtEI=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=BDo+T9xdoEUC7DU47It8wd9JihndluX3xp/oCqRKl14lF8eNq1+IlWxLkUa5KfFQK
 +IgMKEeKUzP49PE1vBAIxDWs2opiN2LNtfB8srRzXjaVGvcRK7GywxURd2+MCMsEqX
 tADyr2VNavDXVPxHJqnRvrw29ePDEg3ia81BcIcA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MvK0R-1oLk6C05dx-00rJvn for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:17 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:13 +0100
Message-Id: <20220316213614.16878-12-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:71Ems2SN6PmmzFPPtiukBDkUYuNynrxeRsXDKgWY70g+xeTL13m
 JXxRxp0b3I9TQF5SAaPD2wxWoQCKLCLVi3FI7iU/bxSMP54di1fANyWWzHPdrMmW3gvlozC
 4bMajAVw6iKPJGBj2JGLbdk0mhD2D/b7asl6usfEHDnm9473B5isWDdYdDswrvLMdqT+OvT
 J7KBZZ1AFnzK5yc9LcCng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6z1N8IsWJ6o=:pikQdePtLDAsFCN2wimBa4
 XEg4d6XrcRIPmeNvtgte+b1HdcScfBVsYVwBqTYV/9asFlJB2QrNy10s1NkcyYJftRFsh0BRZ
 ZUDdBTrf9cvtK6kqqGTvGJXfTW7nACbaoA2K5FbicM5Wei36P8dom/26s/vnDPPddNBq72p9f
 jJqON3O1lhMqsl4QFZTTbApHszsp4oLQev/o6987j0tmV8WhKOVJTIqBQkcnDwpWVLot6JP2e
 zrAKWR9Po8MqrFfH+XhsKKU40h9pLu5bEhzmXfVY6IpAuprw6WcZHfJ/mbu8qHhq/1WLjRlts
 S5fOqSdVl3YwUm99in+88dzkiO1doXYGLIfRUWXjq3q3ZMXlscTv3D1w4gqYEiPvjkq1rfsxe
 ADu1LuSNCrbDy4x0CoL553HquA5hLCo7rwMl6YDzV5vrQKUQ8Be7D8uOi/N6m7nDDqEA5KfJm
 lm9x6UgLmKI5VuTYAw8hsdukRyLW1fk2AxG+g8K3fx63oSNC83nHM66a34fG6hYKKfHnmR8hA
 Ra/ZwxVF1E05ZO7tyPo4RKR87HQvkRBRe7P7G7V4nqZXL4h1RgEOsGTIKdu4wQG2pqde4lkCr
 awgYXV3RHnRD0ndZNyS6XLYjJ4/WKvNo55+hDEc5fS38TkN45OeasPw3kkg0lYpgYymtqDOBU
 bmea6ynGC8yzPdVMYXnL4iVy/tCM3I5YzjxZzbbb4FL1TPj1WEpgBQ4PYfHHL7bqExqoYumAM
 3IrqAd9rmQvvQXKorRyHrUzimkjhFwkb/9Fj1YlzbBDPmSmrdnG72ZCjer7LOPXqIMJBWhsjT
 yro4LLRtXCzThyTGIA1YmhTu0ixFmxz4P+2SLVPkoffMsYkSLF8bzyFBpFL6AMgUvGzV1Ox5Y
 M7tXa4yIrW7MJ3vBJE7pNlIpqHe/FouJPeUHb3lzpugWSBQ52kFCFZw2w2NTomVHcf9B6tVWz
 6aDQNhdyHHvbDu4yhbQvSGET5JyGZ8+9o+D9xdhQjrUpBeJCXoY3D34x5ecPbUhYAgp59uOrp
 Vx3IY8rY2m9AXRLe9NpiHJ2vXuVemy5ORHN+ZjXeIjivN6OCwRwy3XFXwXAtc79rgKNsU/AlK
 ALpapOPgr87v/c=
Subject: [Buildroot] [PATCH v1 11/12] package/gst-omx: bump version to 1.20.1
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
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 0b95505c5f..33c20defbc 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.0.tar.xz.sha256sum
-sha256  c1e46b70ac379ac7b3646506370c9e1007b56ae293f4d334bc0e724c76c345dd  gst-omx-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.1.tar.xz.sha256sum
+sha256  86b52e30ebd0f59fcb5cf81a163211975f73ef32e5a6782562804646316bcd7c  gst-omx-1.20.1.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index f71e1242ff..462c88765b 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.20.0
+GST_OMX_VERSION = 1.20.1
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
