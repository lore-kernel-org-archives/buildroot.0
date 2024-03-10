Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16A8C54E49
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 22:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 797BD817F2;
	Sun, 10 Mar 2024 22:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 33aH4d_zfstv; Sun, 10 Mar 2024 22:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12CF1817AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12CF1817AA;
	Sun, 10 Mar 2024 22:17:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 161F31BF85D
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0304E40298
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VT8oaNNLTpjc for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 22:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F6EB40106
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F6EB40106
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 22:17:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D480088134; Sun, 10 Mar 2024 22:17:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 22:38:09 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7fd91f10abce998b1e82f18e55d6187663780374
X-Git-Newrev: 5d99b844a1b2484cd10585e16b13dac6c7d8e05d
X-Patchwork-Hint: ignore
Message-Id: <20240310221720.D480088134@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gst1-python:
 disable tests
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d99b844a1b2484cd10585e16b13dac6c7d8e05d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

We don't need tests enabled which can also cause build issues.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ae8cb9b2bfa95a3107ad312748316a11801d8472)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-python/gst1-python.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index f843e37052..501ca5e02b 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -34,6 +34,7 @@ GST1_PYTHON_CONF_ENV += \
 # the correct .so file, and the resulting compiled library has the appropriate
 # path of /usr/lib/python3.$(PYTHON3_VERSION_MAJOR).so
 GST1_PYTHON_CONF_OPTS += \
-	-Dlibpython-dir=/usr/lib/
+	-Dlibpython-dir=/usr/lib/ \
+	-Dtests=disabled
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
