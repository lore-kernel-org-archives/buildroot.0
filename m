Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08939C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FE006117D;
	Wed, 22 Feb 2023 20:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FE006117D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8o8OXBEfR_0; Wed, 22 Feb 2023 20:58:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC2D56137C;
	Wed, 22 Feb 2023 20:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC2D56137C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3E91BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54F7E6129D
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F7E6129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czDVp4GXwYew for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D6AF60E46
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D6AF60E46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B89A868BF; Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 21:57:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 802cfb90d68f866bc8f61d9c6c3a764abae2580f
X-Git-Newrev: 8f4dec2107354ab7d6a3fa4fe6646a2c7c517418
X-Patchwork-Hint: ignore
Message-Id: <20230222205839.6B89A868BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: disable examples
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8f4dec2107354ab7d6a3fa4fe6646a2c7c517418
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Examples can be disabled since version 3.9.0.0 and
https://github.com/gnuradio/gnuradio/commit/530262c6df3fb9b87a80133dbde5650dbe948c4c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Gwenhael Goavec-merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/gnuradio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index c2fcba9586..c2e5ec5cad 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -22,6 +22,7 @@ GNURADIO_DEPENDENCIES = \
 GNURADIO_CONF_OPTS = \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DENABLE_DEFAULT=OFF \
+	-DENABLE_EXAMPLES=OFF \
 	-DENABLE_GNURADIO_RUNTIME=ON \
 	-DENABLE_TESTING=OFF \
 	-DXMLTO_EXECUTABLE=NOTFOUND
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
