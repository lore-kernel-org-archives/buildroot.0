Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9378DC433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48C88812D0;
	Fri,  4 Feb 2022 15:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vpqWisJgMJGV; Fri,  4 Feb 2022 15:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DEDE812C2;
	Fri,  4 Feb 2022 15:47:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 113C51BF2A6
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0059860E5C
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hGPapuS8B0NI for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90F9360B27
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989592;
 bh=txWh85MrTwOrO9szaxJLXLNFvb8GGjXSlQ6XCE1F4QQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=fdcpuGbQvc1vsi0ZWp/wRmk/62HHBMM3CWc77MyDKBmLCkMTtaILrARQJlp6mSZO6
 XtLqhjs62VpfGwIq27JavcMnHUq3KMnMpIcSlLTudnip+6e3kiV9v6cLpfRFfoQRSk
 i9eLoqz4ctLUWTbPjKXqrSyyj/exa+LpIDN0Y3eo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N3bSt-1mGnEp2WMV-010h3w for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:32 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:21 +0100
Message-Id: <20220204154631.17814-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:KV1icIK5t9m1hYlX2l1M2fhu0/YEGl5DEdQbiUS7b9y+o8Gqh9L
 +o/v20/yFoEk/1KvTWOfmcgkZoP6CQ5H3l5reFAcpAh7CtQCCirKMOm9vA08IQqafUDRW93
 1YgSsbcGaIBpplkBVsGkgvi90eXwFbVa5tk4mLkwX8rYTSg3Kh824uwaEaMc951d7IVWlKX
 yl5kxCSa4LXhZX2xmVv0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rv3c6Ezk+H0=:NvQBhzSmmqaah+fpCcoroj
 vOiaK1sj5f9MsaHChx4t+B1JeVTIB1hbbsC7MIiRQkPbw3cyHAgM58pM0gd/fpkaBaEkhr8+k
 6aAgJWWf6OXiQERvDx+YOhyeMBOmx5oIhGsdzlpx6hy5hyn6dNHFSyvJNwEUZmvs/F9ZtDxxD
 uLRhPGulAu57/6hvEUifEYfyad+2dVDEaisXmh+e414yQJNNCNICmyz6jJRWSw5HLfIuF4JSA
 kvFwW7FpqZ/QZnjFRq5FiS1vxB29xFMeM0/JJlSM9DL+9l8UHcfcwFYRNdJe5plF2V8ljEUIB
 xHqvV92X9IC7sdjFd6Qzmzl8CXpz2gBNqPaUO1y31gio5qBtdtBEbxveUo2LLCVnsNZr82WLP
 QUZ4hdmK7m1gWOGaraJL4yY8N10H/tcNDbdnVOM7DxonoYFVrB99/r3lleW25D/DQmTi0Axfn
 6ovD3IffACl6J/s2dDUhypp2efyoPhsiqPrPDhXUkGozpj+1CglY3OymB6DUTYkMGXXCq0/o6
 pnp1ujc6wAjHVlMU3alb4EH0gXWU8r9LFEfYezF5Zob6xyzmIoHkIye6z8I1CLPsXy9cNR12V
 /Dk2z3aUTxsTxVHU4aJ5CT+7GPbj7M2tsa9dI3sw99Upe9wzXKDZ4Q8SoI6nH16JNQO9Qrdxq
 WWO0gPrSGzRDaXI6soQurKx43ztE55Kq8DlQ5QNDm2MYsxtnNHVUJ0O8VxnhgD2f+CzZMaeTO
 oNfl7boazEFbboJoiEYfTU61tSZCRXd0OtibxNyB45JG4jMA12M37bBWd2PsTE9t3VB8N/80j
 du8MFKr3LEQL2yAaLudhr5uV4VB75fOSwTXOFpT95lP6P33T+TLbr7l2F19zHHTnmkLvprXay
 Lg51UhwQDmrDLmjFS0sn5YNukT8y07NCKXFljU8o7UG596Ld2d1bCRqkn4C6wzUaha2jyhvpl
 FzFHY2UG1OTDHeI4IXJMrOuMjxgeOxhEASuhQUze11qPkczAaE2MVbu2ijketnB+r7tDRVb+4
 gYk06YA5zZryINvRJjAtvSy/pd0MNC0jSCoCqMGHZJKy6QPXEL9MZjnBr+j7Fw0CmOygznxT/
 sYSxhjHnVIEMmk=
Subject: [Buildroot] [PATCH v1 02/12] package/gst1-plugins-base: bump
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

- removed 0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch
  (upstream accepted [1], [2])

[1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/974
[2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/d86cf6314f8f178c59600f55321ce73d4ca95d97.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...eo-gstvideoaggregator.c-fix-build-wi.patch | 45 -------------------
 .../gst1-plugins-base/gst1-plugins-base.hash  |  4 +-
 .../gst1-plugins-base/gst1-plugins-base.mk    |  2 +-
 3 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch

diff --git a/package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch b/package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch
deleted file mode 100644
index 87cd6493f5..0000000000
--- a/package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 012ca1bcd234ee02f576dd58b1f09baba18b89b0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 14 Dec 2020 07:42:55 +0100
-Subject: [PATCH] gst-libs/gst/video/gstvideoaggregator.c: fix build with gcc
- 4.8
-
-Fix the following build failure with gcc 4.8 which has been added with
-https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/d268c193ad39fb970351ed62898be806ebd0a71e:
-
-../gst-libs/gst/video/gstvideoaggregator.c: In function 'gst_video_aggregator_init':
-../gst-libs/gst/video/gstvideoaggregator.c:2762:3: error: 'for' loop initial declarations are only allowed in C99 mode
-   for (gint i = 0; i < gst_caps_get_size (src_template); i++) {
-   ^
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/974]
----
- gst-libs/gst/video/gstvideoaggregator.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gst-libs/gst/video/gstvideoaggregator.c b/gst-libs/gst/video/gstvideoaggregator.c
-index 2e3d813be..04dad6563 100644
---- a/gst-libs/gst/video/gstvideoaggregator.c
-+++ b/gst-libs/gst/video/gstvideoaggregator.c
-@@ -2786,6 +2786,7 @@ gst_video_aggregator_init (GstVideoAggregator * vagg,
- {
-   GstCaps *src_template;
-   GstPadTemplate *pad_template;
-+  gint i;
- 
-   vagg->priv = gst_video_aggregator_get_instance_private (vagg);
-   vagg->priv->current_caps = NULL;
-@@ -2800,7 +2801,7 @@ gst_video_aggregator_init (GstVideoAggregator * vagg,
-   pad_template =
-       gst_element_class_get_pad_template (GST_ELEMENT_CLASS (klass), "src");
-   src_template = gst_pad_template_get_caps (pad_template);
--  for (gint i = 0; i < gst_caps_get_size (src_template); i++) {
-+  for (i = 0; i < gst_caps_get_size (src_template); i++) {
-     const GValue *v =
-         gst_structure_get_value (gst_caps_get_structure (src_template, i),
-         "format");
--- 
-2.29.2
-
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 200ba0fe5d..081dc6f213 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.5.tar.xz.sha256sum
-sha256  960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3  gst-plugins-base-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.6.tar.xz.sha256sum
+sha256  56a9ff2fe9e6603b9e658cf6897d412a173d2180829fe01e92568549c6bd0f5b  gst-plugins-base-1.18.6.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 76757fd6a8..c99eeb6c59 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.18.5
+GST1_PLUGINS_BASE_VERSION = 1.18.6
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
