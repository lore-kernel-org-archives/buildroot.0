Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794A0C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 979BE40529;
	Fri,  4 Feb 2022 15:48:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3cupYaea3jD; Fri,  4 Feb 2022 15:48:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CEF9405D3;
	Fri,  4 Feb 2022 15:48:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 683F91C1162
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DE4D60B27
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iw41g9cdWPhV for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DABAD60E4D
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989593;
 bh=0UAZGtUTmVpO171YuC0NqBf58F/nPWYoj8YJFkF3rr8=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=kVxO/+m0cbphRvdbo6oeOxwB5KBtZcvtYp2Nrfy/Lbopa61bvfdCie8R9ItcM1vc2
 qUGVllXcIa8nhUsVevzLnHlcUnFzdbEZYQzJ86d8MDJsulCQAHEETxC4wVCjq6lbCB
 4jKnlnYPitjILQ8Y5J8AsWsKbdKLV02cVDrQTR1U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M2wKq-1nChwD0PZk-003Jk7 for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:33 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:24 +0100
Message-Id: <20220204154631.17814-6-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lf9aAtnEfqYoHd09HvWf9pej70mO3lJ8c+hzrhYLThh1j71rMwR
 XvEqFx987byJIZFn9/t3PKjIUqoEUrDy/HApCYrKy73vek5jMo+sEQIDRiqeqNUbPXZoyvS
 wIyIsz35bz8LCQMMGnuHFZMhpy2UQ/Br6VGyhFixu1OXKgESEdyoAmV4rHcc9XpdL28GpCd
 IBEqekhMQauvZ2QK/hAzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oDx1ciyoOnU=:G6CmZEyLy8RjkWF8zT8WEB
 fSiOW+AP8SUbirln1FkM4i1k8KuyFLkKemBIUbSCrr1/xuQicDtMrC8ACeTw4b1QydT9WynyK
 Y2+8y8T4fXZOBCKwmxa80Xt2G3h+F1oNGQnOU2+SnpN3pYqRiPgsavga3lMSrisbEA/zeH05I
 VSKarTPdgsySxZbOH/k4kUmdsALrevI9gkw12EpHDV6ZboG+fzxkBLFyhz3SnBmapvdtJQq2d
 YdF1F4kaSGef+yzTRAjZzaDiUKa71y83+82TnReuGOwDtdl6l4irTqJRW/fiptI7l4+5UfA72
 kI0A7qeeCobxOge2loRjlu9pWMJrKiQ3JiwKTaiu09mRzEan3H/Gd92nfnHbnTeUX7s+gANDP
 vukzIyfJAoSIoUDnii35veEkEf2vBgSccg+PxwCagp7PmJ5p1VMIwHhDI/6a6OPNgCR4qJWpM
 d4rU/mTW/TINuUdte4eAVx69ScWjxKfQ/1UD+mkhx+UVmVX7XrG6AR9lK8Og9pF+1VXRu/Lc4
 9jng+2ynHbK6qWsyrAyxmKIfTax/+EXCkrz9Ft7SbzCsGYu7OscMdEjW8v9I+IQeaCr9W8Hax
 2q7peecKHRzyiGlDlzuAE7Ss93CE5qEcLaShPT8w49JBW8XLpdXA3Ghc3jOygWAsFSXFs63yT
 eEEjI9H3zaBp4lwK8JaaKa8ab+Kar/v/MZ0K0s2hBpQpbnksf8gIWKte5WFBfDNaMe1Yw9lqG
 IUD2yWZ3SfViISXLVa38vk+V34E3wBduGmVNI/k0FQru/0fMjTagYgkz1M/+GK5GK8trRqitd
 2MwfqtHzQnA1Nk8ToPR8OKBX/Y/uPFMMZEA4Ne0GjCB7trlBG2A08vGdwDk3Aez0Xo477Ui+E
 IjBm932zCQ/B7OqXp2WV/qBzJoNJ+YkvrW/OvP+CIs7Gaozm0fo98ND70KNmknR5Kb8mtE6mQ
 Sj1oYD7WjHbPx3wpzIroDi7VXBgP8+cteFIGvnGIvZqSZ8iaBEqBm0D2pGFwxVcadt1pj/MGg
 Tofs/ujyrSA3gHQg68WjG/kXG+CZua3zBUofYlMOLUdph+Dz8/5nNNuxGYLsuqHQzzGtS3rNp
 Uy43Mm604aVU1w=
Subject: [Buildroot] [PATCH v1 05/12] package/gst1-plugins-ugly: bump
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
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 93945cdecd..26fd0fd9ac 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.18.5.tar.xz.sha256sum
-sha256  df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a80619d9f5c69f66d9  gst-plugins-ugly-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.18.6.tar.xz.sha256sum
+sha256  4969c409cb6a88317d2108b8577108e18623b2333d7b587ae3f39459c70e3a7f  gst-plugins-ugly-1.18.6.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index a25110264e..7f483deb81 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.18.5
+GST1_PLUGINS_UGLY_VERSION = 1.18.6
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
