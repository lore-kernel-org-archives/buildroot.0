Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4B3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 18:09:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBCC861101
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 18:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBCC861101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69B7460632;
	Sat,  6 Nov 2021 18:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y39NIkaU-4ks; Sat,  6 Nov 2021 18:09:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B587F60641;
	Sat,  6 Nov 2021 18:09:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3BAC1BF350
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 18:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB962401FE
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 18:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0MmassOvCq0 for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 18:09:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D82844010B
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 18:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636222183;
 bh=bQqA1mUprtZbVQbE8RsrezGa3pCl9dnfKaZN8HdKI10=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=PqmJIbDiVowJU+lLuOpG38IqT1R1702+fe8wes5FbjTaJFfu3g+2tKX3IDgRHFH6P
 6gQ+tlQ8g1SCKIUiTCOSJod4NepmPMo6mWyLE03HpBJFaaDn4yljbiCfPsFl+h/CrE
 8ybC661LhijXWPygh4cg7J3A+IINPx5+jiop24vU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.26]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Mj-1m9oSy0w2V-00aGES; Sat, 06
 Nov 2021 19:09:43 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 19:09:42 +0100
Message-Id: <20211106180942.27850-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:AWHt62xDf5JMHRrqr4WexWToPGD3yvyTnVvresAqxIvttASCmua
 cC79mRWPEDP1QdenXWy1UeXP3psWeISXSh3jvCaVLvHLKWXZMhewhWZZoJ2OpRWjLxmGrIE
 jcev7TWug6TMuPN25Qq8Or4B2k2QkZeeDMxs0Bt8qDz2WnjlpTOrACvzGq68LqmOgJr3AMc
 FUIE/hSl6bRu+X2YoKH8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:f4rMwieZI4w=:Za0yhReAecTVbxCxxYsKya
 8Nar4ZRyDjdiG964WjoGV5D2W0679sSo0b2TUd+HO6dou7ZYqFbAEfwY4hH1SCGW8pgf6bd47
 019XicKGBi1OAlWlt9NLXwMmVhpxk7lYfck8a3JN+P50qZCEFJuwBnAc0fmy5YY+VLevTo0UY
 LcT0gVt++nuVzsq1LqQFKL41RT0AOX1gW7rRkxdCT5XsUYTzwuWGTLgSA1SF6GuMOn8c67C8z
 g4PyGj6yeWnXWScuQMaulUFlJ5ApwXemypRf64qt7jJXus5OmHIL2EgxtVitW52IxaCOmKN8t
 qSu8NsCn++HhU0zZRgF2/4CGU6qh4sXTJtGMf7btkE0K7onCUY8K2F6AEnR+msCsU+EUBaZhN
 r9DZPp8RhguGjOhR8R4PEMQ/E1XYzvFg8QfiUXFHGTHHnbnwy6QI5bS9f9gb7/XOHqnM5TSLT
 KgmN/D1bJHe4MCLLHmn+3ZgNKMUK+gO8prk0jUgQqyOoQaE+QXfsuZol2nAMBsnkSZXzwuPcJ
 AilFD1h5Eaw8lOwKEOoTDB2N93Pgn7UFx4xxhiDYlM+se36/jMLXOSgC9UmB5Ib/aE/RcK6Zi
 FAlULI23yZE57VcsiGohCQ4/o3eDDk7O2L9EYjGkI8WlbBspQs58BFt8wsX3H/8LQkgko6+Sh
 tvFA5AhcttQecQbdfxt3Mp+++qvlKL1CjXm6ML+CHriPpI6hZOyAQmS4H9hIxlrhLegVR5Kpe
 7ZD89hC/Q60RfGYaLZAaPIE2+EaogOpESMGZl6w61gm2CG0+yQz0jTWk+88NajYC8z/KnPW3F
 w70Q5PNWjWabQ7aIo59geLIQcTo8O/5A8wzCnDDLlNL0N8OtKGe8SfYZ9+R9nXrNRarAkPvhQ
 k/6mybE4OakePj8Ikax0vTQVGKVPofYopX+sQACtwLA1vK+gIDyrsnIj6tinwDiCZ8AGFllf0
 8QLtJ8CuYF921eHENGCgP9Hu6vsvOj4EyL6KGqdz4fMP0Fn2uD6UDDAqhkx6U6njpotg592UA
 Cm55RrWTyJPICnhctsVKpAjL8WhjQptBE0ZQZob1mWs1Zp2ssWpwa/vK8rQZ41K7RdXzvok1Z
 AHL6X4UoKr2dkU=
Subject: [Buildroot] [PATCH v2] package/olsr: add upstream patch to fix
 compile with gpsd-3.23.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add upstream patch ([1]) to fix compile with gpsd-3.23.1

Fixes:

  - http://autobuild.buildroot.org/results/53b06e72fb2d8b4c8b6ba41baf775ff33654cd18
  - http://autobuild.buildroot.net/results/54cae924711e26f04045f8208db0d772292a3933

  src/gpsdclient.c: In function 'nmeaInfoFromGpsd':
  src/gpsdclient.c:374:30: error: 'STATUS_NO_FIX' undeclared (first use in this function); did you mean 'STATUS_PPS_FIX'?
    374 |   if (gpsdata->fix.status == STATUS_NO_FIX) {
        |                              ^~~~~~~~~~~~~
        |                              STATUS_PPS_FIX

[1] https://github.com/OLSR/olsrd/commit/665051a845464c0f95edb81432104dac39426f79

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:

  - previous upstream patch was (after some discussion) reverted and
    replaced with the now provided one
---
 ...client.c-drop-handling-of-gpsdata-fi.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/olsr/0005-lib-pud-src-gpsdclient.c-drop-handling-of-gpsdata-fi.patch

diff --git a/package/olsr/0005-lib-pud-src-gpsdclient.c-drop-handling-of-gpsdata-fi.patch b/package/olsr/0005-lib-pud-src-gpsdclient.c-drop-handling-of-gpsdata-fi.patch
new file mode 100644
index 0000000000..7ea3fbadd7
--- /dev/null
+++ b/package/olsr/0005-lib-pud-src-gpsdclient.c-drop-handling-of-gpsdata-fi.patch
@@ -0,0 +1,49 @@
+From 665051a845464c0f95edb81432104dac39426f79 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 6 Nov 2021 15:50:58 +0100
+Subject: [PATCH] lib/pud/src/gpsdclient.c: drop handling of
+ gpsdata->fix.status
+
+Here is an extract of https://gpsd.gitlab.io/gpsd/gpsd_json.html:
+
+The optional "status" field (aka fix type), is a modifier (adjective) to
+mode. It is not a replacement for, or superset of, the "mode" field. It
+is almost, but not quite, the same as the NMEA 4.x xxGGA GPS Quality
+Indicator Values. Many GNSS receivers do not supply it. Those that do
+interpret the specification in various incompatible ways.
+
+So status field is optional and STATUS_NO_FIX has been explicitly
+renamed into STATUS_UNK to avoid confusion with MODE_NO_FIX (which is
+already handled by gpsdclient.c) so drop the if block to fix the build
+failure with gpsd >= 3.23.1.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream: https://github.com/OLSR/olsrd/commit/665051a845464c0f95edb81432104dac39426f79]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ lib/pud/src/gpsdclient.c | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/lib/pud/src/gpsdclient.c b/lib/pud/src/gpsdclient.c
+index a2a9cee0..d448867d 100644
+--- a/lib/pud/src/gpsdclient.c
++++ b/lib/pud/src/gpsdclient.c
+@@ -370,15 +370,6 @@ void nmeaInfoFromGpsd(struct gps_data_t *gpsdata, NmeaInfo *info, struct GpsdCon
+           );
+ 
+   gpsdata->set &= ~STATUS_SET; /* always valid */
+-  #if GPSD_API_MAJOR_VERSION >= 10
+-  if (gpsdata->fix.status == STATUS_NO_FIX) {
+-  #else
+-  if (gpsdata->status == STATUS_NO_FIX) {
+-  #endif
+-    nmeaInfoClear(info);
+-    nmeaTimeSet(&info->utc, &info->present, NULL);
+-    return;
+-  }
+ 
+   if (!gpsdata->set) {
+     return;
+-- 
+2.33.1
+
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
