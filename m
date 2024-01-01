Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F508C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4398C40A9B;
	Mon,  1 Jan 2024 21:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4398C40A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEC4i6ZCr9KY; Mon,  1 Jan 2024 21:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4867A4357C;
	Mon,  1 Jan 2024 21:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4867A4357C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 120921BF3ED
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB84543662
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB84543662
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqUtwSTB3kgB for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:18:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5149643664
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5149643664
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B75983B65; Mon,  1 Jan 2024 21:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:16:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9b465c66c42e936a80292f7854f605d4c88564e
X-Git-Newrev: 9cbffdf9be622c8ddad3b28106851b3101b3d201
X-Patchwork-Hint: ignore
Message-Id: <20240101211802.3B75983B65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoup3: enable vala bindings
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cbffdf9be622c8ddad3b28106851b3101b3d201
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vala bindings are needed to build gssdp 1.6 vapi bindings and avoid the
following build failure since commit
0cd1096eb067542070a991120c953811d6e5e4d1:

FAILED: vala/gssdp-1.6.vapi
/home/buildroot/autobuild/instance-2/output-1/host/bin/vapigen --quiet --library=gssdp-1.6 --directory=/home/buildroot/autobuild/instance-2/output-1/build/gssdp-1.6.3/build/vala --pkg=gio-2.0 --pkg=libsoup-3.0 --metadatadir=/home/buildroot/autobuild/instance-2/output-1/build/gssdp-1.6.3/vala /home/buildroot/autobuild/instance-2/output-1/build/gssdp-1.6.3/build/libgssdp/GSSDP-1.6.gir
error: Package `libsoup-3.0' not found in specified Vala API directories or GObject-Introspection GIR directories

Fixes:
 - http://autobuild.buildroot.org/results/e5fbfc95964beac314c9faffc2c12541d0a10a48

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoup3/libsoup3.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
index 76105cec4e..10caa5bea4 100644
--- a/package/libsoup3/libsoup3.mk
+++ b/package/libsoup3/libsoup3.mk
@@ -28,8 +28,7 @@ LIBSOUP3_CONF_OPTS = \
 	-Dntlm=disabled \
 	-Dsysprof=disabled \
 	-Dtests=false \
-	-Dtls_check=false \
-	-Dvapi=disabled
+	-Dtls_check=false
 
 ifeq ($(BR2_PACKAGE_BROTLI),y)
 LIBSOUP3_CONF_OPTS += -Dbrotli=enabled
@@ -39,10 +38,10 @@ LIBSOUP3_CONF_OPTS += -Dbrotli=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBSOUP3_CONF_OPTS += -Dintrospection=enabled
-LIBSOUP3_DEPENDENCIES += gobject-introspection
+LIBSOUP3_CONF_OPTS += -Dintrospection=enabled -Dvapi=enabled
+LIBSOUP3_DEPENDENCIES += host-vala gobject-introspection
 else
-LIBSOUP3_CONF_OPTS += -Dintrospection=disabled
+LIBSOUP3_CONF_OPTS += -Dintrospection=disabled -Dvapi=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
