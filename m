Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC68FC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FD2161393;
	Wed, 22 Feb 2023 20:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD2161393
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6U14DmNRg3UZ; Wed, 22 Feb 2023 20:59:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3373613B5;
	Wed, 22 Feb 2023 20:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3373613B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 953AA1BF59E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EF9740135
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF9740135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6aNcUPEgRkqB for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BA37402DC
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BA37402DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 878B6868BC; Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 21:58:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55dff4a30b7b7a577ac84768466ee88a8c6fa262
X-Git-Newrev: 25c8c00b98e37186d23ea6515e944060e59cfa8f
X-Patchwork-Hint: ignore
Message-Id: <20230222205839.878B6868BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: add gr-network block
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=25c8c00b98e37186d23ea6515e944060e59cfa8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

grnet networking block support is available since version version
3.9.0.0 and
https://github.com/gnuradio/gnuradio/commit/cc37c3e8cd5eabcb5c9d919e5fffc5d938690140

gr-network is a mandatory dependency of latest gqrx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Gwenhael Goavec-merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/Config.in   | 6 ++++++
 package/gnuradio/gnuradio.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 1824589263..51237e62b9 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -134,6 +134,12 @@ config BR2_PACKAGE_GNURADIO_FILTER
 	help
 	  Filter signal processing blocks
 
+config BR2_PACKAGE_GNURADIO_NETWORK
+	bool "gr-network support"
+	select BR2_PACKAGE_GNURADIO_BLOCKS
+	help
+	  TCP and UDP source/sink blocks
+
 config BR2_PACKAGE_GNURADIO_QTGUI
 	bool "gr-qtgui"
 	depends on BR2_PACKAGE_GNURADIO_PYTHON
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 59fb23d89d..d9218b533d 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -106,6 +106,12 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_NETWORK),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_NETWORK=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_NETWORK=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GNURADIO_DEPENDENCIES += python3 python-pybind \
 	host-python-numpy host-python-packaging
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
