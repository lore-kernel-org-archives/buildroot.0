Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652FAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 23:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE38408E2;
	Wed, 29 Dec 2021 23:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBeCu8UqC2c4; Wed, 29 Dec 2021 23:19:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 206514091E;
	Wed, 29 Dec 2021 23:19:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E2661BF280
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87DA84091E
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEKyVWSUx5Ej for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 23:19:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D63C408E2
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 23:19:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D581482B9F; Wed, 29 Dec 2021 23:13:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 00:18:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c830c21a0bb0b00ed2e39c8e7856e6530920158
X-Git-Newrev: 792ce13913bd01b3b8c508075f134ffb525ea7f0
X-Patchwork-Hint: ignore
Message-Id: <20211229231309.D581482B9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gmrender-resurrect: bump to
 version 0.0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=792ce13913bd01b3b8c508075f134ffb525ea7f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/hzeller/gmrender-resurrect/releases/tag/v0.0.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../gmrender-resurrect/0001-Drop-UpnpInit.patch    | 175 ---------------------
 package/gmrender-resurrect/gmrender-resurrect.hash |   4 +-
 package/gmrender-resurrect/gmrender-resurrect.mk   |   2 +-
 3 files changed, 3 insertions(+), 178 deletions(-)

diff --git a/package/gmrender-resurrect/0001-Drop-UpnpInit.patch b/package/gmrender-resurrect/0001-Drop-UpnpInit.patch
deleted file mode 100644
index 18ec7bb515..0000000000
--- a/package/gmrender-resurrect/0001-Drop-UpnpInit.patch
+++ /dev/null
@@ -1,175 +0,0 @@
-From dc8c4d4dc234311b3099e7f1efadf5d9733c81e9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 21 Aug 2020 21:29:00 +0200
-Subject: [PATCH] Drop UpnpInit
-
-UpnpInit has been dropped from libupnp 1.14.x as it can't be fixed
-against CallStranger a.k.a. CVE-2020-12695 so replace it by UpnpInit2
-which is available since version 1.6.7 and
-https://github.com/pupnp/pupnp/commit/2bcbdffd89a70364147d345ec5e70a3fce5cbc29
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://github.com/hzeller/gmrender-resurrect/pull/214]
----
- dist-scripts/centos7/README.md     |  2 +-
- dist-scripts/debian/gmediarender.1 |  8 ++------
- dist-scripts/fedora/README.md      |  2 +-
- src/main.c                         | 13 ++++---------
- src/upnp_device.c                  | 18 +++++++++---------
- src/upnp_device.h                  |  2 +-
- 6 files changed, 18 insertions(+), 27 deletions(-)
-
-diff --git a/dist-scripts/centos7/README.md b/dist-scripts/centos7/README.md
-index 278d777..ed82fb6 100644
---- a/dist-scripts/centos7/README.md
-+++ b/dist-scripts/centos7/README.md
-@@ -45,7 +45,7 @@ Additional configuration is also recommended, sice there's no configuration file
-     # vi /etc/systemd/system/gmediarender.service.d/customize.conf   # or nano, or emacs, or whatever editor you like
-     [Service]
-     ExecStart=
--    ExecStart=/usr/bin/gmediarender --port=49494 --ip-address=<your_IP_address> -f "DLNA Renderer GMediaRender"
-+    ExecStart=/usr/bin/gmediarender --port=49494 --interface-name=<your_interface_name> -f "DLNA Renderer GMediaRender"
- 
-     # systemctl daemon-reload
-     # systemctl start gmediarender.service
-diff --git a/dist-scripts/debian/gmediarender.1 b/dist-scripts/debian/gmediarender.1
-index 96123ff..b2b1359 100644
---- a/dist-scripts/debian/gmediarender.1
-+++ b/dist-scripts/debian/gmediarender.1
-@@ -50,12 +50,8 @@ Usually, it is desirable for the renderer
- to show up on controllers under a recognisable and unique name. This is 
- the option to set that name.
- .TP
--.B \-I, \-\-ip\-address \fI\<ip-address\>\fP
--The local IP address the service is running and advertised on.  
--
--This can 
--only be a single address, and must be explicitly specified (i.e. not 
--0.0.0.0).
-+.B \-I, \-\-interface\-name \fI\<interface-name\>\fP
-+The local interface name the service is running and advertised on.
- .TP
- .B \-p, \-\-port \fI\<port>\fP
- Port to listen to. [49152..65535].
-diff --git a/dist-scripts/fedora/README.md b/dist-scripts/fedora/README.md
-index 7b9ea4b..45aa536 100644
---- a/dist-scripts/fedora/README.md
-+++ b/dist-scripts/fedora/README.md
-@@ -43,7 +43,7 @@ Additional configuration is also recommended, sice there's no configuration file
-     # vi /etc/systemd/system/gmediarender.service.d/customize.conf   # or nano, or emacs, or whatever editor you like
-     [Service]
-     ExecStart=
--    ExecStart=/usr/bin/gmediarender --port=49494 --ip-address=<your_IP_address> -f "DLNA Renderer GMediaRender"
-+    ExecStart=/usr/bin/gmediarender --port=49494 --interface-name=<your_interface_name> -f "DLNA Renderer GMediaRender"
- 
-     # systemctl daemon-reload
-     # systemctl start gmediarender.service
-diff --git a/src/main.c b/src/main.c
-index ef720e3..2030c49 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -69,11 +69,7 @@ static gboolean show_transport_scpd = FALSE;
- static gboolean show_outputs = FALSE;
- static gboolean daemon_mode = FALSE;
- 
--// IP-address seems strange in libupnp: they actually don't bind to
--// that address, but to INADDR_ANY (miniserver.c in upnp library).
--// Apparently they just use this for the advertisement ? Anyway, 0.0.0.0 would
--// not work.
--static const gchar *ip_address = NULL;
-+static const gchar *interface_name = NULL;
- static int listen_port = 49494;
- 
- #ifdef GMRENDER_UUID
-@@ -92,9 +88,8 @@ static const gchar *mime_filter = NULL;
- static GOptionEntry option_entries[] = {
- 	{ "version", 0, 0, G_OPTION_ARG_NONE, &show_version,
- 	  "Output version information and exit", NULL },
--	{ "ip-address", 'I', 0, G_OPTION_ARG_STRING, &ip_address,
--	  "The local IP address the service is running and advertised "
--	  "(only one, 0.0.0.0 won't work)", NULL },
-+	{ "interface-name", 'I', 0, G_OPTION_ARG_STRING, &interface_name,
-+	  "The local interface name the service is running and advertised", NULL },
- 	// The following is not very reliable, as libupnp does not set
- 	// SO_REUSEADDR by default, so it might increment (sending patch).
- 	{ "port", 'p', 0, G_OPTION_ARG_INT, &listen_port,
-@@ -302,7 +297,7 @@ int main(int argc, char **argv)
- 			  listen_port);
- 		return EXIT_FAILURE;
- 	}
--	device = upnp_device_init(upnp_renderer, ip_address, listen_port);
-+	device = upnp_device_init(upnp_renderer, interface_name, listen_port);
- 	if (device == NULL) {
- 		Log_error("main", "ERROR: Failed to initialize UPnP device");
- 		return EXIT_FAILURE;
-diff --git a/src/upnp_device.c b/src/upnp_device.c
-index db65e4f..3151238 100644
---- a/src/upnp_device.c
-+++ b/src/upnp_device.c
-@@ -416,13 +416,13 @@ static UPNP_CALLBACK(event_handler, EventType, event, userdata)
- 
- static gboolean initialize_device(struct upnp_device_descriptor *device_def,
- 				  struct upnp_device *result_device,
--				  const char *ip_address,
-+				  const char *interface_name,
- 				  unsigned short port)
- {
- 	int rc;
- 	char *buf;
- 
--	rc = UpnpInit(ip_address, port);
-+	rc = UpnpInit2(interface_name, port);
- 	/* There have been situations reported in which UPNP had issues
- 	 * initializing right after network came up. #129
- 	 */
-@@ -430,13 +430,13 @@ static gboolean initialize_device(struct upnp_device_descriptor *device_def,
- 	static const int kRetryTimeMs = 1000;
- 	while (rc != UPNP_E_SUCCESS && retries_left--) {
- 		usleep(kRetryTimeMs * 1000);
--		Log_error("upnp", "UpnpInit(ip=%s, port=%d) Error: %s (%d). Retrying... (%ds)",
--			  ip_address, port, UpnpGetErrorMessage(rc), rc, retries_left);
--		rc = UpnpInit(ip_address, port);
-+		Log_error("upnp", "UpnpInit2(interface=%s, port=%d) Error: %s (%d). Retrying... (%ds)",
-+			  interface_name, port, UpnpGetErrorMessage(rc), rc, retries_left);
-+		rc = UpnpInit2(interface_name, port);
- 	}
- 	if (UPNP_E_SUCCESS != rc) {
--		Log_error("upnp", "UpnpInit(ip=%s, port=%d) Error: %s (%d). Giving up.",
--			  ip_address, port, UpnpGetErrorMessage(rc), rc);
-+		Log_error("upnp", "UpnpInit2(interface=%s, port=%d) Error: %s (%d). Giving up.",
-+			  interface_name, port, UpnpGetErrorMessage(rc), rc);
- 		return FALSE;
- 	}
- 	Log_info("upnp", "Registered IP=%s port=%d\n",
-@@ -483,7 +483,7 @@ static gboolean initialize_device(struct upnp_device_descriptor *device_def,
- }
- 
- struct upnp_device *upnp_device_init(struct upnp_device_descriptor *device_def,
--				     const char *ip_address,
-+				     const char *interface_name,
- 				     unsigned short port)
- {
- 	int rc;
-@@ -516,7 +516,7 @@ struct upnp_device *upnp_device_init(struct upnp_device_descriptor *device_def,
- 		webserver_register_buf(srv->scpd_url, buf, "text/xml");
- 	}
- 
--	if (!initialize_device(device_def, result_device, ip_address, port)) {
-+	if (!initialize_device(device_def, result_device, interface_name, port)) {
- 		UpnpFinish();
- 		free(result_device);
- 		return NULL;
-diff --git a/src/upnp_device.h b/src/upnp_device.h
-index 3e635e1..8c8e783 100644
---- a/src/upnp_device.h
-+++ b/src/upnp_device.h
-@@ -49,7 +49,7 @@ struct upnp_device;
- struct action_event;
- 
- struct upnp_device *upnp_device_init(struct upnp_device_descriptor *device_def,
--				     const char *ip_address,
-+				     const char *interface_name,
- 				     unsigned short port);
- 
- void upnp_device_shutdown(struct upnp_device *device);
diff --git a/package/gmrender-resurrect/gmrender-resurrect.hash b/package/gmrender-resurrect/gmrender-resurrect.hash
index dc474be612..526b2b6c34 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.hash
+++ b/package/gmrender-resurrect/gmrender-resurrect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1f0cef76e4543879c9cd31cad73d6c4f778b965884c586405efcf63f2bdbb06f  gmrender-resurrect-0.0.8.tar.gz
-sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
+sha256  c3a9c80c7058a9a1f32175da25a564fb3021a7055c2df3941e8da8860a509009  gmrender-resurrect-0.0.9.tar.gz
+sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
index 3500ab3760..4a7efd71ab 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.mk
+++ b/package/gmrender-resurrect/gmrender-resurrect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMRENDER_RESURRECT_VERSION = 0.0.8
+GMRENDER_RESURRECT_VERSION = 0.0.9
 GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,v$(GMRENDER_RESURRECT_VERSION))
 # Original distribution does not have default configure,
 # so we need to autoreconf:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
