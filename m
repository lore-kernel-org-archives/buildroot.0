Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86238E87841
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F76640C0C;
	Tue,  3 Feb 2026 15:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nw6zjdIPZbaK; Tue,  3 Feb 2026 15:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE6F840C28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770133164;
	bh=gVGvQ5qacndrx+EI3KWYOsmnQFnO4QAaVAkDNSIrx8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H5B92FsK8y02GLKCslGFFCUyhjVa+ivNAMYG9vWlFBa/Zdap5WA7GPCwahvbiHkT2
	 vh6LTMQ2Nkyde53MuWV0ibBxXi9PZxn88YVgc0ouZ3GQ6BP4zNo+JOc2tS49wB69aa
	 NCp7zj6meRmsPBXFFbDIId7EQzZ7H09dn0T7ebpZVpD0mulDWG1/f2swtz1yZORJ5b
	 CltF9XYXrC/C2AR73U5zMn1oYD0pYpt5x+MqZXsD6l/3ovEaYs96cgXq9vGM4j7NwZ
	 HDQLBMz0vCu9GXDy51fkkyDYhP1mjy5BseBu3i+M6T8THnh6uoewZePVsRJvPKUsCv
	 8fG0ZhsEjIISQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE6F840C28;
	Tue,  3 Feb 2026 15:39:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D50C1F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E6FF6086F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xS8UIQIIj-6M for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BEB860870
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BEB860870
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83CFD866F3; Tue,  3 Feb 2026 15:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 16:21:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d41ed2ea5420c65fef009f87c17b2095e0be35c3
X-Git-Newrev: 37ef4f862f037bb4bdc0d700931f0b37a26d276e
X-Patchwork-Hint: ignore
Message-Id: <20260203153917.83CFD866F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: bump version to 3.27.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=37ef4f862f037bb4bdc0d700931f0b37a26d276e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.com/gpsd/gpsd/-/blob/release-3.27.2/NEWS

All patches can be dropped as they are in this upstream release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-logfile-and-dumpfile-options-for-gpsprof.patch |  40 ---
 .../0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch   |  78 -----
 ...Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch |  49 ---
 ...d_core.c-Make-client-UDP-socket-non-block.patch |  32 --
 ...ver_nmea2000.c-Fix-issue-356-skyview-buff.patch | 379 ---------------------
 ....c-Fix-integer-underflow-is-malicious-Nav.patch | 161 ---------
 package/gpsd/gpsd.hash                             |   2 +-
 package/gpsd/gpsd.mk                               |   2 +-
 8 files changed, 2 insertions(+), 741 deletions(-)

diff --git a/package/gpsd/0001-Fix-the-logfile-and-dumpfile-options-for-gpsprof.patch b/package/gpsd/0001-Fix-the-logfile-and-dumpfile-options-for-gpsprof.patch
deleted file mode 100644
index d466c9fc58..0000000000
--- a/package/gpsd/0001-Fix-the-logfile-and-dumpfile-options-for-gpsprof.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f18e52dad4eeba2434a988bc899f6c7fe973f4ba Mon Sep 17 00:00:00 2001
-Message-Id: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-From: Richard Lindsley <rich.lindsley@gmail.com>
-Date: Fri, 23 May 2025 18:48:57 -0700
-Subject: [PATCH] Fix the --logfile and --dumpfile options for gpsprof
-
-The open() function requires that the "encoding" argument is a str or
-None.
-
-Upstream: https://gitlab.com/gpsd/gpsd/-/commit/bad9973b8e73e9e2cc0af2555edc9c8a0855d203
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- clients/gpsprof.py.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
-index 8b1a5234b..e5e448a53 100644
---- a/clients/gpsprof.py.in
-+++ b/clients/gpsprof.py.in
-@@ -1208,7 +1208,7 @@ if __name__ == '__main__':
-     options = parser.parse_args()
- 
-     if options.logfile:
--        options.logfp = open(options.logfile, "w", encoding=ascii)
-+        options.logfp = open(options.logfile, "w", encoding="ascii")
-     else:
-         options.logfp = None
- 
-@@ -1255,7 +1255,7 @@ if __name__ == '__main__':
-         plot.postprocess()
-         # Save the timing data (only) for post-analysis if required.
-         if options.dumpfile:
--            with open(options.dumpfile, "w", encoding=ascii) as fp:
-+            with open(options.dumpfile, "w", encoding="ascii") as fp:
-                 fp.write(plot.dump())
-         if options.logfp:
-             options.logfp.close()
--- 
-2.34.1
-
diff --git a/package/gpsd/0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch b/package/gpsd/0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch
deleted file mode 100644
index d07a8970f4..0000000000
--- a/package/gpsd/0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 98e61729d84b3e3698cde4ec7fe446b932d333fc Mon Sep 17 00:00:00 2001
-Message-Id: <98e61729d84b3e3698cde4ec7fe446b932d333fc.1749533625.git.yann.morin@orange.com>
-In-Reply-To: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-References: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Thu, 5 Jun 2025 17:40:56 -0700
-Subject: [PATCH] gpsd/gpsd.c: Fix empty gst[,] in POLL.
-
-Fix issue 336.
-
-Upstream: https://gitlab.com/gpsd/gpsd/-/commit/3185c5790c3e7e31c6cc80174940f0385cba2617
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- gpsd/gpsd.c | 30 ++++++++++++++++++++++--------
- 1 file changed, 22 insertions(+), 8 deletions(-)
-
-diff --git a/gpsd/gpsd.c b/gpsd/gpsd.c
-index 5a98a4470..3797ace13 100644
---- a/gpsd/gpsd.c
-+++ b/gpsd/gpsd.c
-@@ -1555,10 +1555,15 @@ static void handle_request(struct subscriber_t *sub, const char *buf,
-         for (devp = devices; devp < devices + MAX_DEVICES; devp++) {
-             if (allocated_device(devp) && subscribed(sub, devp)) {
-                 if (0 != (devp->observed & GPS_TYPEMASK)) {
-+                    size_t rlen = strnlen(reply, replylen);
-+
-                     json_tpv_dump(NAVDATA_SET, devp, &sub->policy,
--                                  reply + strnlen(reply, replylen),
--                                  replylen - strnlen(reply, replylen));
-+                                  reply + rlen, replylen - rlen);
-                     rstrip(reply, replylen);
-+                    if (strnlen(reply, replylen) == rlen) {
-+                        // no data
-+                        continue;
-+                    }
-                     (void)strlcat(reply, ",", replylen);
-                 }
-             }
-@@ -1568,10 +1573,15 @@ static void handle_request(struct subscriber_t *sub, const char *buf,
-         for (devp = devices; devp < devices + MAX_DEVICES; devp++) {
-             if (allocated_device(devp) && subscribed(sub, devp)) {
-                 if (0 != (devp->observed & GPS_TYPEMASK)) {
--                    json_noise_dump(&devp->gpsdata,
--                                    reply + strnlen(reply, replylen),
--                                    replylen - strnlen(reply, replylen));
-+                    size_t rlen = strnlen(reply, replylen);
-+
-+                    json_noise_dump(&devp->gpsdata, reply + rlen,
-+                                    replylen - rlen);
-                     rstrip(reply, replylen);
-+                    if (strnlen(reply, replylen) == rlen) {
-+                        // no data
-+                        continue;
-+                    }
-                     (void)strlcat(reply, ",", replylen);
-                 }
-             }
-@@ -1581,10 +1591,14 @@ static void handle_request(struct subscriber_t *sub, const char *buf,
-         for (devp = devices; devp < devices + MAX_DEVICES; devp++) {
-             if (allocated_device(devp) && subscribed(sub, devp)) {
-                 if (0 != (devp->observed & GPS_TYPEMASK)) {
--                    json_sky_dump(devp,
--                                  reply + strnlen(reply, replylen),
--                                  replylen - strnlen(reply, replylen));
-+                    size_t rlen = strnlen(reply, replylen);
-+
-+                    json_sky_dump(devp, reply + rlen, replylen - rlen);
-                     rstrip(reply, replylen);
-+                    if (strnlen(reply, replylen) == rlen) {
-+                        // no data
-+                        continue;
-+                    }
-                     (void)strlcat(reply, ",", replylen);
-                 }
-             }
--- 
-2.34.1
-
diff --git a/package/gpsd/0003-SConscript-Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch b/package/gpsd/0003-SConscript-Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch
deleted file mode 100644
index 16a0ca6f88..0000000000
--- a/package/gpsd/0003-SConscript-Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a1f36cf216861ac6499654b4e6e4d54107142cfc Mon Sep 17 00:00:00 2001
-Message-Id: <a1f36cf216861ac6499654b4e6e4d54107142cfc.1749533625.git.yann.morin@orange.com>
-In-Reply-To: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-References: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Thu, 5 Jun 2025 18:14:55 -0700
-Subject: [PATCH] SConscript: Do not force _TIME_BITS on a 32 bit system.
-
-The build assumed that if _TIME_BITS existed on a system then it was OK
-to set it.  Turns out that is a bad assumption.
-
-Leave it to the builds to decide when _TIME_BITS should be used.
-
-Upstream: https://gitlab.com/gpsd/gpsd/-/commit/95814d22276c34abe72a35b89065b1190d34f9bf
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- SConscript | 16 +++-------------
- 1 file changed, 3 insertions(+), 13 deletions(-)
-
-diff --git a/SConscript b/SConscript
-index 28105fa7b..357c53f2b 100644
---- a/SConscript
-+++ b/SConscript
-@@ -1335,19 +1335,9 @@ if not cleaning and not helping:
-     # check for 64 bit time_t.  Needed for 2038.
-     sizeof_time_t = config.CheckTypeSize("time_t", "#include <time.h>",
-                                          expect=8)
--    if 0 == sizeof_time_t:
--        # see if we can force time64_t
--        # this needs glibc 2.34 or later, and a compatible kernel
--        sizeof_time_t = config.CheckTypeSize("time_t",
--                                             "#define _TIME_BITS 64\n"
--                                             "#define _FILE_OFFSET_BITS 64\n"
--                                             "#include <time.h>",
--                                             expect=8)
--        if 0 != sizeof_time_t:
--            # force time64_t
--            confdefs.append("// Forcing 64-bit time_t\n"
--                            "#define _TIME_BITS 64\n"
--                            "#define _FILE_OFFSET_BITS 64\n")
-+    # do not try to  force time64_t, that is a distro decision.
-+    # it needs glibc 2.34 or later, and a compatible kernel
-+    # CFLAGS += "-D_TIME_BITS 64 -D_FILE_OFFSET_BITS 64"
- 
-     if 0 == sizeof_time_t:
-         announce("WARNING: time_t is too small.  It will fail in 2038")
--- 
-2.34.1
-
diff --git a/package/gpsd/0004-gpsd-libgpsd_core.c-Make-client-UDP-socket-non-block.patch b/package/gpsd/0004-gpsd-libgpsd_core.c-Make-client-UDP-socket-non-block.patch
deleted file mode 100644
index 73ecce5b8b..0000000000
--- a/package/gpsd/0004-gpsd-libgpsd_core.c-Make-client-UDP-socket-non-block.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0b1769a3abe386c139a8b4d4967b57a00f0f286a Mon Sep 17 00:00:00 2001
-Message-Id: <0b1769a3abe386c139a8b4d4967b57a00f0f286a.1749533625.git.yann.morin@orange.com>
-In-Reply-To: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-References: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-From: Miroslav Lichvar <mlichvar@redhat.com>
-Date: Tue, 10 Jun 2025 00:21:52 +0200
-Subject: [PATCH] gpsd/libgpsd_core.c: Make client UDP socket non-blocking.
-
-Resolving issue #337
-
-Upstream: https://gitlab.com/gpsd/gpsd/-/commit/992a90e6a50b4d3dcb091fff4658e7892c985c7f
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- gpsd/libgpsd_core.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gpsd/libgpsd_core.c b/gpsd/libgpsd_core.c
-index f328648f7..6b77e2b97 100644
---- a/gpsd/libgpsd_core.c
-+++ b/gpsd/libgpsd_core.c
-@@ -614,7 +614,7 @@ int gpsd_open(struct gps_device_t *session)
-                  "CORE: opening UDP feed at %s, port %s.\n", host,
-                  port);
-         if (0 > (dsock = netlib_connectsock1(AF_UNSPEC, host, port, "udp",
--                                             0, true, NULL, 0))) {
-+                                             1, true, NULL, 0))) {
-             // cast for 32-bit ints.
-             GPSD_LOG(LOG_ERROR, &session->context->errout,
-                      "CORE: UDP device open error %s(%ld).\n",
--- 
-2.34.1
-
diff --git a/package/gpsd/0005-drivers-driver_nmea2000.c-Fix-issue-356-skyview-buff.patch b/package/gpsd/0005-drivers-driver_nmea2000.c-Fix-issue-356-skyview-buff.patch
deleted file mode 100644
index 6966749627..0000000000
--- a/package/gpsd/0005-drivers-driver_nmea2000.c-Fix-issue-356-skyview-buff.patch
+++ /dev/null
@@ -1,379 +0,0 @@
-From 07383119d8c6605165ee3d5dc2b5941aa7f101bf Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Tue, 2 Dec 2025 19:36:04 -0800
-Subject: [PATCH] drivers/driver_nmea2000.c: Fix issue 356, skyview buffer
- overrun.
-
-CVE: CVE-2025-67268
-Upstream: https://github.com/ntpsec/gpsd/commit/dc966aa74c075d0a6535811d98628625cbfbe3f4
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- drivers/driver_nmea2000.c | 123 ++++++++++++++++++++++----------------
- 1 file changed, 71 insertions(+), 52 deletions(-)
-
-diff --git a/drivers/driver_nmea2000.c b/drivers/driver_nmea2000.c
-index 71e04e134..3e40dc768 100644
---- a/drivers/driver_nmea2000.c
-+++ b/drivers/driver_nmea2000.c
-@@ -12,11 +12,11 @@
-  * Message contents can be had from canboat/analyzer:
-  *     analyzer -explain
-  *
-- * This file is Copyright 2012 by the GPSD project
-+ * This file is Copyright by the GPSD project
-  * SPDX-License-Identifier: BSD-2-clause
-  */
- 
--#include "../include/gpsd_config.h"  /* must be before all includes */
-+#include "../include/gpsd_config.h"  // must be before all includes
- 
- #if defined(NMEA2000_ENABLE)
- 
-@@ -68,7 +68,7 @@ typedef struct PGN
- 
- #if LOG_FILE
- FILE *logFile = NULL;
--#endif /* of if LOG_FILE */
-+#endif  // of if LOG_FILE
- 
- extern bool __attribute__ ((weak)) gpsd_add_device(const char *device_name,
-                                                    bool flag_nowait);
-@@ -89,14 +89,14 @@ static int scale_int(int32_t var, const int64_t factor)
- static void print_data(struct gps_context_t *context,
-                        unsigned char *buffer, int len, PGN *pgn)
- {
--    if ((libgps_debuglevel >= LOG_IO) != 0) {
--        int   l1, l2, ptr;
-+    if (LOG_IO <= libgps_debuglevel) {
-+        int   l1;
-         char  bu[128];
- 
--        ptr = 0;
--        l2 = sprintf(&bu[ptr], "got data:%6u:%3d: ", pgn->pgn, len);
-+        int ptr = 0;
-+        int l2 = sprintf(&bu[ptr], "got data:%6u:%3d: ", pgn->pgn, len);
-         ptr += l2;
--        for (l1=0;l1<len;l1++) {
-+        for (l1 = 0; l1 < len; l1++) {
-             if (((l1 % 20) == 0) && (l1 != 0)) {
-                 GPSD_LOG(LOG_IO, &context->errout, "%s\n", bu);
-                 ptr = 0;
-@@ -276,7 +276,7 @@ static gps_mask_t hnd_127258(unsigned char *bu, int len, PGN *pgn,
-                              struct gps_device_t *session)
- {
-     print_data(session->context, bu, len, pgn);
--    /* FIXME?  Get magnetic variation */
-+    // FIXME?  Get magnetic variation
-     GPSD_LOG(LOG_DATA, &session->context->errout,
-              "pgn %6d(%3d):\n", pgn->pgn, session->driver.nmea2000.unit);
-     return(0);
-@@ -358,7 +358,7 @@ static gps_mask_t hnd_126992(unsigned char *bu, int len, PGN *pgn,
- {
-     // uint8_t        sid;
-     // uint8_t        source;
--    uint64_t usecs;       /* time in us */
-+    uint64_t usecs;       // time in us
- 
-     print_data(session->context, bu, len, pgn);
-     GPSD_LOG(LOG_DATA, &session->context->errout,
-@@ -434,6 +434,7 @@ static gps_mask_t hnd_129540(unsigned char *bu, int len, PGN *pgn,
-                              struct gps_device_t *session)
- {
-     int         l1;
-+    int         expected_len;
- 
-     print_data(session->context, bu, len, pgn);
-     GPSD_LOG(LOG_DATA, &session->context->errout,
-@@ -441,24 +442,39 @@ static gps_mask_t hnd_129540(unsigned char *bu, int len, PGN *pgn,
- 
-     session->driver.nmea2000.sid[2]           = bu[0];
-     session->gpsdata.satellites_visible       = (int)bu[2];
-+    if (MAXCHANNELS <= session->gpsdata.satellites_visible) {
-+        // Handle a CVE for overrunning skyview[]
-+        GPSD_LOG(LOG_WARN, &session->context->errout,
-+                 "pgn %6d(%3d): Too many sats %d\n",
-+                 pgn->pgn, session->driver.nmea2000.unit,
-+                 session->gpsdata.satellites_visible);
-+        session->gpsdata.satellites_visible = MAXCHANNELS;
-+    }
-+    expected_len = 3 + (12 * session->gpsdata.satellites_visible);
-+    if (len != expected_len) {
-+        GPSD_LOG(LOG_WARN, &session->context->errout,
-+                 "pgn %6d(%3d): wrong  length %d s/b %d\n",
-+                 pgn->pgn, session->driver.nmea2000.unit,
-+                 len, expected_len);
-+        return 0;
-+    }
- 
-     memset(session->gpsdata.skyview, '\0', sizeof(session->gpsdata.skyview));
--    for (l1=0;l1<session->gpsdata.satellites_visible;l1++) {
--        int    svt;
--        double azi, elev, snr;
--
--        elev  = getles16(bu, 3+12*l1+1) * 1e-4 * RAD_2_DEG;
--        azi   = getleu16(bu, 3+12*l1+3) * 1e-4 * RAD_2_DEG;
--        snr   = getles16(bu, 3+12*l1+5) * 1e-2;
-+    for (l1 = 0; l1 < session->gpsdata.satellites_visible; l1++) {
-+        int offset = 3 + (12 * l1);
-+        double elev  = getles16(bu, offset + 1) * 1e-4 * RAD_2_DEG;
-+        double azi   = getleu16(bu, offset + 3) * 1e-4 * RAD_2_DEG;
-+        double snr   = getles16(bu, offset + 5) * 1e-2;
- 
--        svt   = (int)(bu[3+12*l1+11] & 0x0f);
-+        int svt   = (int)(bu[offset + 11] & 0x0f);
- 
--        session->gpsdata.skyview[l1].elevation  = (short) (round(elev));
--        session->gpsdata.skyview[l1].azimuth    = (short) (round(azi));
-+        session->gpsdata.skyview[l1].elevation  = elev;
-+        session->gpsdata.skyview[l1].azimuth    = azi;
-         session->gpsdata.skyview[l1].ss         = snr;
--        session->gpsdata.skyview[l1].PRN        = (short)bu[3+12*l1+0];
-+        session->gpsdata.skyview[l1].PRN        = (int16_t)bu[offset];
-         session->gpsdata.skyview[l1].used = false;
--        if ((svt == 2) || (svt == 5)) {
-+        if ((2 == svt) ||
-+            (5 == svt)) {
-             session->gpsdata.skyview[l1].used = true;
-         }
-     }
-@@ -588,7 +604,7 @@ static gps_mask_t hnd_129029(unsigned char *bu, int len, PGN *pgn,
-                              struct gps_device_t *session)
- {
-     gps_mask_t mask;
--    uint64_t usecs;    /* time in us */
-+    uint64_t usecs;    // time in us
- 
-     print_data(session->context, bu, len, pgn);
-     GPSD_LOG(LOG_DATA, &session->context->errout,
-@@ -675,7 +691,7 @@ static gps_mask_t hnd_129038(unsigned char *bu, int len, PGN *pgn,
-             (unsigned int)ais_direction((unsigned int)getleu16(bu, 21), 1.0);
-         ais->type1.turn = ais_turn_rate((int)getles16(bu, 23));
-         ais->type1.status    = (unsigned int) ((bu[25] >> 0) & 0x0f);
--        ais->type1.maneuver  = 0; /* Not transmitted ???? */
-+        ais->type1.maneuver  = 0;  // Not transmitted ????
-         decode_ais_channel_info(bu, len, 163, session);
- 
-         return(ONLINE_SET | AIS_SET);
-@@ -730,8 +746,9 @@ static gps_mask_t hnd_129039(unsigned char *bu, int len, PGN *pgn,
- 
- /*
-  *   PGN 129040: AIS Class B Extended Position Report
-+ *
-+ *  No test case for this message at the moment
-  */
--/* No test case for this message at the moment */
- static gps_mask_t hnd_129040(unsigned char *bu, int len, PGN *pgn,
-                              struct gps_device_t *session)
- {
-@@ -781,8 +798,8 @@ static gps_mask_t hnd_129040(unsigned char *bu, int len, PGN *pgn,
-         ais->type19.epfd         = (unsigned int) ((bu[23] >> 4) & 0x0f);
-         ais->type19.dte          = (unsigned int) ((bu[52] >> 0) & 0x01);
-         ais->type19.assigned     = (bool)         ((bu[52] >> 1) & 0x01);
--        for (l=0;l<AIS_SHIPNAME_MAXLEN;l++) {
--            ais->type19.shipname[l] = (char) bu[32+l];
-+        for (l = 0; l < AIS_SHIPNAME_MAXLEN; l++) {
-+            ais->type19.shipname[l] = (char)bu[32+l];
-         }
-         ais->type19.shipname[AIS_SHIPNAME_MAXLEN] = (char) 0;
-         decode_ais_channel_info(bu, len, 422, session);
-@@ -914,7 +931,7 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
-         ais->type5.draught       = (unsigned int) (getleu16(bu, 51)/10);
-         ais->type5.dte           = (unsigned int) ((bu[73] >> 6) & 0x01);
- 
--        for (l=0,cpy_stop=0;l<7;l++) {
-+        for (l = 0, cpy_stop = 0; l < 7; l++) {
-             char next;
- 
-             next = (char) bu[9+l];
-@@ -929,7 +946,7 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
-         }
-         ais->type5.callsign[7]   = (char) 0;
- 
--        for (l=0,cpy_stop=0;l<AIS_SHIPNAME_MAXLEN;l++) {
-+        for (l = 0, cpy_stop = 0; l < AIS_SHIPNAME_MAXLEN; l++) {
-             char next;
- 
-             next = (char) bu[16+l];
-@@ -944,7 +961,7 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
-         }
-         ais->type5.shipname[AIS_SHIPNAME_MAXLEN] = (char) 0;
- 
--        for (l=0,cpy_stop=0;l<20;l++) {
-+        for (l = 0, cpy_stop = 0; l < 20; l++) {
-             char next;
- 
-             next = (char) bu[53+l];
-@@ -978,7 +995,7 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
-                date2.tm_year+1900,
-                ais->type5.hour,
-                ais->type5.minute);
--#endif /* of #if NMEA2000_DEBUG_AIS */
-+#endif  // end of #if NMEA2000_DEBUG_AIS
-         decode_ais_channel_info(bu, len, 592, session);
-         return(ONLINE_SET | AIS_SET);
-     }
-@@ -988,8 +1005,9 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
- 
- /*
-  *   PGN 129798: AIS SAR Aircraft Position Report
-+ *
-+ * No test case for this message at the moment
-  */
--/* No test case for this message at the moment */
- static gps_mask_t hnd_129798(unsigned char *bu, int len, PGN *pgn,
-                              struct gps_device_t *session)
- {
-@@ -1016,8 +1034,8 @@ static gps_mask_t hnd_129798(unsigned char *bu, int len, PGN *pgn,
-         ais->type9.alt       = (unsigned int) (getleu64(bu, 21)/1000000);
-         ais->type9.regional  = (unsigned int) ((bu[29] >> 0) & 0xff);
-         ais->type9.dte       = (unsigned int) ((bu[30] >> 0) & 0x01);
--/*      ais->type9.spare     = (bu[30] >> 1) & 0x7f; */
--        ais->type9.assigned  = 0; /* Not transmitted ???? */
-+//      ais->type9.spare     = (bu[30] >> 1) & 0x7f;
-+        ais->type9.assigned  = 0;  // Not transmitted ????
-         decode_ais_channel_info(bu, len, 163, session);
- 
-         return(ONLINE_SET | AIS_SET);
-@@ -1028,8 +1046,9 @@ static gps_mask_t hnd_129798(unsigned char *bu, int len, PGN *pgn,
- 
- /*
-  *   PGN 129802: AIS Safety Related Broadcast Message
-+ *
-+ * No test case for this message at the moment
-  */
--/* No test case for this message at the moment */
- static gps_mask_t hnd_129802(unsigned char *bu, int len, PGN *pgn,
-                              struct gps_device_t *session)
- {
-@@ -1043,8 +1062,8 @@ static gps_mask_t hnd_129802(unsigned char *bu, int len, PGN *pgn,
-     if (decode_ais_header(session->context, bu, len, ais, 0x3fffffff) != 0) {
-         int                   l;
- 
--/*      ais->type14.channel = (bu[ 5] >> 0) & 0x1f; */
--        for (l=0;l<36;l++) {
-+//      ais->type14.channel = (bu[ 5] >> 0) & 0x1f;
-+        for (l = 0; l < 36; l++) {
-             ais->type14.text[l] = (char) bu[6+l];
-         }
-         ais->type14.text[36] = (char) 0;
-@@ -1079,7 +1098,7 @@ static gps_mask_t hnd_129809(unsigned char *bu, int len, PGN *pgn,
-                  "NMEA2000: AIS message 24A from %09u stashed.\n",
-                  ais->mmsi);
- 
--        for (l=0;l<AIS_SHIPNAME_MAXLEN;l++) {
-+        for (l = 0; l < AIS_SHIPNAME_MAXLEN; l++) {
-             ais->type24.shipname[l] = (char) bu[ 5+l];
-             saveptr->shipname[l] = (char) bu[ 5+l];
-         }
-@@ -1119,12 +1138,12 @@ static gps_mask_t hnd_129810(unsigned char *bu, int len, PGN *pgn,
- 
-         ais->type24.shiptype = (unsigned int) ((bu[ 5] >> 0) & 0xff);
- 
--        for (l=0;l<7;l++) {
-+        for (l = 0; l < 7; l++) {
-             ais->type24.vendorid[l] = (char) bu[ 6+l];
-         }
-         ais->type24.vendorid[7] = (char) 0;
- 
--        for (l=0;l<7;l++) {
-+        for (l = 0; l < 7; l++) {
-             ais->type24.callsign[l] = (char) bu[13+l];
-         }
-         ais->type24.callsign[7] = (char )0;
-@@ -1158,7 +1177,7 @@ static gps_mask_t hnd_129810(unsigned char *bu, int len, PGN *pgn,
-         for (i = 0; i < MAX_TYPE24_INTERLEAVE; i++) {
-             if (session->driver.aivdm.context[0].type24_queue.ships[i].mmsi ==
-                 ais->mmsi) {
--                for (l=0;l<AIS_SHIPNAME_MAXLEN;l++) {
-+                for (l = 0; l < AIS_SHIPNAME_MAXLEN; l++) {
-                     ais->type24.shipname[l] =
-   (char)(session->driver.aivdm.context[0].type24_queue.ships[i].shipname[l]);
-                 }
-@@ -1566,7 +1585,7 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
-                           frame->can_id & 0x1ffffff);
-             if ((frame->can_dlc & 0x0f) > 0) {
-                 int l1;
--                for(l1=0;l1<(frame->can_dlc & 0x0f);l1++) {
-+                for(l1 = 0; l1 < (frame->can_dlc & 0x0f); l1++) {
-                     (void)fprintf(logFile, "%02x", frame->data[l1]);
-                 }
-             }
-@@ -1591,8 +1610,8 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
-         if (!session->driver.nmea2000.unit_valid) {
-             unsigned int l1, l2;
- 
--            for (l1=0;l1<NMEA2000_NETS;l1++) {
--                for (l2=0;l2<NMEA2000_UNITS;l2++) {
-+            for (l1 = 0; l1 < NMEA2000_NETS; l1++) {
-+                for (l2 = 0; l2 < NMEA2000_UNITS; l2++) {
-                     if (session == nmea2000_units[l1][l2]) {
-                         session->driver.nmea2000.unit = l2;
-                         session->driver.nmea2000.unit_valid = true;
-@@ -1641,7 +1660,7 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
-                              "pgn %6d:%s \n", work->pgn, work->name);
-                     session->driver.nmea2000.workpgn = (void *) work;
-                     session->lexer.outbuflen =  frame->can_dlc & 0x0f;
--                    for (l2=0;l2<session->lexer.outbuflen;l2++) {
-+                    for (l2 = 0; l2 < session->lexer.outbuflen; l2++) {
-                         session->lexer.outbuffer[l2]= frame->data[l2];
-                     }
-                 } else if ((frame->data[0] & 0x1f) == 0) {
-@@ -1659,7 +1678,7 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
- #endif /* of #if NMEA2000_FAST_DEBUG */
-                     session->lexer.inbuflen = 0;
-                     session->driver.nmea2000.idx += 1;
--                    for (l2=2;l2<8;l2++) {
-+                    for (l2 = 2; l2 < 8; l2++) {
-                         session->lexer.inbuffer[session->lexer.inbuflen++] =
-                             frame->data[l2];
-                     }
-@@ -1668,7 +1687,7 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
-                 } else if (frame->data[0] == session->driver.nmea2000.idx) {
-                     unsigned int l2;
- 
--                    for (l2=1;l2<8;l2++) {
-+                    for (l2 = 1; l2 < 8; l2++) {
-                         if (session->driver.nmea2000.fast_packet_len >
-                             session->lexer.inbuflen) {
-                             session->lexer.inbuffer[session->lexer.inbuflen++] =
-@@ -1689,7 +1708,7 @@ static void find_pgn(struct can_frame *frame, struct gps_device_t *session)
-                         session->driver.nmea2000.workpgn = (void *) work;
-                         session->lexer.outbuflen =
-                             session->driver.nmea2000.fast_packet_len;
--                        for(l2 = 0;l2 < (unsigned int)session->lexer.outbuflen;
-+                        for(l2 = 0; l2 < (unsigned int)session->lexer.outbuflen;
-                             l2++) {
-                             session->lexer.outbuffer[l2] =
-                                 session->lexer.inbuffer[l2];
-@@ -1792,7 +1811,7 @@ int nmea2000_open(struct gps_device_t *session)
-     (void)strlcpy(interface_name, session->gpsdata.dev.path + 11,
-                   sizeof(interface_name));
-     unit_ptr = NULL;
--    for (l=0;l<strnlen(interface_name,sizeof(interface_name));l++) {
-+    for (l = 0; l < strnlen(interface_name, sizeof(interface_name)); l++) {
-         if (interface_name[l] == ':') {
-             unit_ptr = &interface_name[l+1];
-             interface_name[l] = 0;
-@@ -1909,7 +1928,7 @@ int nmea2000_open(struct gps_device_t *session)
-                 interface_name,
-                 MIN(sizeof(can_interface_name[0]), sizeof(interface_name)));
-         session->driver.nmea2000.unit_valid = false;
--        for (l=0;l<NMEA2000_UNITS;l++) {
-+        for (l = 0; l < NMEA2000_UNITS; l++) {
-             nmea2000_units[can_net][l] = NULL;
-         }
-     }
-@@ -1933,8 +1952,8 @@ void nmea2000_close(struct gps_device_t *session)
-         if (session->driver.nmea2000.unit_valid) {
-             unsigned int l1, l2;
- 
--            for (l1=0;l1<NMEA2000_NETS;l1++) {
--                for (l2=0;l2<NMEA2000_UNITS;l2++) {
-+            for (l1 = 0; l1 < NMEA2000_NETS; l1++) {
-+                for (l2 = 0; l2 < NMEA2000_UNITS; l2++) {
-                     if (session == nmea2000_units[l1][l2]) {
-                         session->driver.nmea2000.unit_valid = false;
-                         session->driver.nmea2000.unit = 0;
--- 
-2.52.0
-
diff --git a/package/gpsd/0006-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch b/package/gpsd/0006-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch
deleted file mode 100644
index 80507847c4..0000000000
--- a/package/gpsd/0006-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From b28910e0d5a48de4cb4d8675689297dc407af0c6 Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Wed, 3 Dec 2025 19:04:03 -0800
-Subject: [PATCH] gpsd/packet.c: Fix integer underflow is malicious Navcom
- packet
-
-Causes DoS.  Fix issue 358
-
-CVE: CVE-2025-67269
-Upstream: https://gitlab.com/gpsd/gpsd/-/commit/ffa1d6f40bca0b035fc7f5e563160ebb67199da7
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- gpsd/packet.c | 64 ++++++++++++++++++++++++++++++++++++++-------------
- 1 file changed, 48 insertions(+), 16 deletions(-)
-
-diff --git a/gpsd/packet.c b/gpsd/packet.c
-index f9a7db8d0..0c2350072 100644
---- a/gpsd/packet.c
-+++ b/gpsd/packet.c
-@@ -1141,18 +1141,22 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
- #endif  // SIRF_ENABLE || SKYTRAQ_ENABLE
- #ifdef SIRF_ENABLE
-     case SIRF_LEADER_2:
--        // first part of length
--        lexer->length = (size_t) (c << 8);
-+        // first part of length, MSB
-+        lexer->length = (c & 0x7f) << 8;
-+        if (lexer->length > MAX_PACKET_LENGTH) {
-+            lexer->length = 0;
-+            return character_pushback(lexer, GROUND_STATE);
-+        } // else
-         lexer->state = SIRF_LENGTH_1;
-         break;
-     case SIRF_LENGTH_1:
-         // second part of length
-         lexer->length += c + 2;
--        if (lexer->length <= MAX_PACKET_LENGTH) {
--            lexer->state = SIRF_PAYLOAD;
--        } else {
-+        if (lexer->length > MAX_PACKET_LENGTH) {
-+            lexer->length = 0;
-             return character_pushback(lexer, GROUND_STATE);
--        }
-+        } // else
-+        lexer->state = SIRF_PAYLOAD;
-         break;
-     case SIRF_PAYLOAD:
-         if (0 == --lexer->length) {
-@@ -1194,6 +1198,7 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
-             return character_pushback(lexer, GROUND_STATE);
-         }
-         if (MAX_PACKET_LENGTH < lexer->length) {
-+            lexer->length = 0;
-             return character_pushback(lexer, GROUND_STATE);
-         }
-         lexer->state = SKY_PAYLOAD;
-@@ -1376,14 +1381,29 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
-         }
-         break;
-     case NAVCOM_LEADER_3:
-+        // command ID
-         lexer->state = NAVCOM_ID;
-         break;
-     case NAVCOM_ID:
--        lexer->length = (size_t)c - 4;
-+        /* Length LSB
-+         * Navcom length includes command ID, length bytes. and checksum.
-+         * So for more than just the payload length.
-+         * Minimum 4 bytes */
-+        if (4 > c) {
-+            return character_pushback(lexer, GROUND_STATE);
-+        }
-+        lexer->length = c;
-         lexer->state = NAVCOM_LENGTH_1;
-         break;
-     case NAVCOM_LENGTH_1:
-+        // Length USB.  Navcom allows payload length up to 65,531
-         lexer->length += (c << 8);
-+        // don't count ID, length and checksum  in payload length
-+        lexer->length -= 4;
-+        if (MAX_PACKET_LENGTH < lexer->length) {
-+            lexer->length = 0;
-+            return character_pushback(lexer, GROUND_STATE);
-+        }  // else
-         lexer->state = NAVCOM_LENGTH_2;
-         break;
-     case NAVCOM_LENGTH_2:
-@@ -1510,11 +1530,11 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
-         lexer->length += 2;     // checksum
-         // 10 bytes is the length of the Zodiac header
-         // no idea what Zodiac max length really is
--        if ((MAX_PACKET_LENGTH - 10) >= lexer->length) {
--            lexer->state = ZODIAC_PAYLOAD;
--        } else {
-+        if ((MAX_PACKET_LENGTH - 10) < lexer->length) {
-+            lexer->length = 0;
-             return character_pushback(lexer, GROUND_STATE);
--        }
-+        }  // else
-+        lexer->state = ZODIAC_PAYLOAD;
-         break;
-     case ZODIAC_PAYLOAD:
-         if (0 == --lexer->length) {
-@@ -1549,6 +1569,7 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
-             lexer->state = UBX_LENGTH_2;
-         } else {
-             // bad length
-+            lexer->length = 0;
-             return character_pushback(lexer, GROUND_STATE);
-         }
-         break;
-@@ -1604,6 +1625,7 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
-         lexer->length += (c << 8);
-         if (MAX_PACKET_LENGTH <= lexer->length) {
-             // bad length
-+            lexer->length = 0;
-             return character_pushback(lexer, GROUND_STATE);
-         }  // else
- 
-@@ -1841,16 +1863,16 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
-         lexer->state = GEOSTAR_MESSAGE_ID_2;
-         break;
-     case GEOSTAR_MESSAGE_ID_2:
--        lexer->length = (size_t)c * 4;
-+        lexer->length = c * 4;
-         lexer->state = GEOSTAR_LENGTH_1;
-         break;
-     case GEOSTAR_LENGTH_1:
-         lexer->length += (c << 8) * 4;
--        if (MAX_PACKET_LENGTH >= lexer->length) {
--            lexer->state = GEOSTAR_LENGTH_2;
--        } else {
-+        if (MAX_PACKET_LENGTH < lexer->length) {
-+            lexer->length = 0;
-             return character_pushback(lexer, GROUND_STATE);
--        }
-+        }  // else
-+        lexer->state = GEOSTAR_LENGTH_2;
-         break;
-     case GEOSTAR_LENGTH_2:
-         lexer->state = GEOSTAR_PAYLOAD;
-@@ -2160,6 +2182,16 @@ static bool nextstate(struct gps_lexer_t *lexer, unsigned char c)
- #endif  // STASH_ENABLE
-     }
- 
-+    /* Catch length overflow.  Should not happen.
-+     * length is size_t, so underflow looks like overflow too. */
-+    if (MAX_PACKET_LENGTH <= lexer->length) {
-+        GPSD_LOG(LOG_WARN, &lexer->errout,
-+                 "Too long: %zu state %u %s c x%x\n",
-+                 lexer->length, lexer->state, state_table[lexer->state], c);
-+        // exit(255);
-+        lexer->length = 0;
-+        return character_pushback(lexer, GROUND_STATE);
-+    }
-     return true;        // no pushback
- }
- 
--- 
-2.52.0
-
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index 984ddab125..a7b76afbc6 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc7e465968c1540e61bc57c7586d6a57a0047212a014efdad348f907bc2e0990  gpsd-3.26.1.tar.gz
+sha256  ebb66ed92018b79cec88efb60e35a596925eef46502cf03d6ff0aea636ee7461  gpsd-3.27.2.tar.gz
 sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 99cc0b8161..6dc01253a5 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.26.1
+GPSD_VERSION = 3.27.2
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
