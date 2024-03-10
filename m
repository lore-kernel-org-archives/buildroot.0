Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F314AC54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 22:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAAA5817A4;
	Sun, 10 Mar 2024 22:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CiaEdW2Etrpt; Sun, 10 Mar 2024 22:18:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A35C81492
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A35C81492;
	Sun, 10 Mar 2024 22:18:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CFBA1BF28B
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A30681799
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 22:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCra5gGZ26Al for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 22:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6152814A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6152814A9
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 22:18:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF5948822A; Sun, 10 Mar 2024 22:18:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 22:38:04 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: b7e0a3db0f4d6533daed12a9c48404c2a2ba453b
X-Git-Newrev: 6d77f9954c17a66791b092ed7264b97e783eeb94
X-Patchwork-Hint: ignore
Message-Id: <20240310221827.BF5948822A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/gst1-python:
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d77f9954c17a66791b092ed7264b97e783eeb94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
