Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0423AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 11:28:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F9E261058
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 11:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F9E261058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3A6040010;
	Sat,  6 Nov 2021 11:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCLaGMMuTzAy; Sat,  6 Nov 2021 11:28:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0B90401A3;
	Sat,  6 Nov 2021 11:28:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF6601BF83E
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 11:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAE1C401A3
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 11:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8jlaB8-brBW for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 11:28:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24CED40010
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636198086;
 bh=4nl19F8dhuxf9RZjgAIUNZc5ec/0gZjTchge4Y6UmFA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=FhaDHemgFtTHV1DTerak5opWJoiqFXko0ktRQFyaVqobwck9gz1xRd8O1EoMpE24X
 sy2aGAHjUtJ9ttmTfInltoGxGRslQp03VZ+PM+4b5kY3o7SFENinFn0Je5lRHCQzPA
 9ta/3QUzhxEwQfgbe+pexemhorzewxWc0VOm8j1E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.26]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPXd2-1n4iKy1FL8-00MaZ9; Sat, 06
 Nov 2021 12:28:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 12:28:05 +0100
Message-Id: <20211106112805.7076-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:O4p4yZ9j7mygWL0mRw/FnUonqiXJXVwXmx0dfAm0T2gnGu9SJ7P
 gXJvuaMzoKAEiZF7kU7xtlKl6nW93hqmxCSiUqcUQW9t2qajoePlPu7Ibj+YwCm4hN3WA5x
 QyqV/UYlinqA728gqKyD20qb8onj2tC4Du/7gDVGofSb9fMl+hSOkuPJAFofky8D1Dup6Ad
 QW2vq6xslCeoIEK7eoGnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X0Bi//0KcEU=:tOGqNPjqBXGL1hSgghXAEi
 OtBzIbA8GkhB0lBA0Ya1HjH/V5q0iuXroO/uFeaxLZ7QGHBvSWMB0i0O4bY7pUIZTWWS5ELng
 5cN0g4P5spXasqEwePTdB7+53e1oiiHnWZb4Hgd7laFB3Bbxwh0R1pUjKjq6ML8B554/anmHn
 O4sxb5afIuzBJyzTkxJXrL4OWay0Lr9gF6YJT+x6SlwVphNlDW0iEIp99s4e4D2BxUfHYYqnO
 Yfx9u2EFPdNXH6jszVf+OogVSo/EVCYJQPSfuDZkrEUW1alQlD5Hy2zhb+OYMbA1L7Kypm0yN
 X02PteQmnHqreFRwrUT2QkJ4gqGW/3qk3K3icLJ0JfOxCdPaRZ/LRw+ZJXu/KQXIFRyLz94h5
 jAczrB1M6fnLlgO1Zk9DOqlDLMj28fpsXPYOGgxgxv5D2qktXQ/HITMId0ZNEMVnMPlnyexIO
 PzeLCTiuHIlBCUK1MQEVR9U8k74j0RAhmh5T/ucQBWg6zh9gqNmmZHGeQhugAu6lHdvA2thUO
 yQv5jo/KKdKfJYbSQzmvwiyWsqdu2IFvYskDYvbtnWiIIwrCofcuvv7wZbr609+KEm9b9B6Xc
 oRZfEpiuSLWXrMk3JoEpATOyH2Sr3k0pRuDI0xRnTEKx/WhJoi818o9mcjhf3sqddeWgcNucb
 zXNu1IDgBteZ9Y78bzHkeXc2Eb1mMONN/grzvVd7uII7KpB0bU6Dr6tgxH0gW07zT3Bj1cErJ
 d6pkJo8QQ/o17OxwttNL8WIcMQKhMxTHHgogOpHK0cP6XuTu4EUNPdL9eOPwkwJLKShs/QSYy
 r6W6lOOEQJkcm6wLZsW+rXMoeVrFlz76MjzCsApIpHDCWxflURuisVAFI5buc1r3O2aMCiENe
 hF9dSRiVX4uLEzMlxmCbzmNZXoklF0fKIa+POmpH+UoSsM/nsDMSpzviMh3gP1z1AcWb3pwd9
 rXaWsdpszci/P89oJ+4x05EBRMxNPkkRq3NJK1t+I/GkyQVUONPW2t6zpEw0YdDHkUt9rHgtK
 7mRMK/FoaifTDYe/is15wqvfvbLWuC0/fa1dNoQ6tZzXK3oJoZlvCUIlC3CpTepQ1lPpY85bk
 tLg73K3f/jWFQY=
Subject: [Buildroot] [PATCH v1] package/olsr: add upstream patch to fix
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

[1] https://github.com/OLSR/olsrd/commit/69ae23be9f96b9e7dd68a0252f3ad05986bb222d

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:

  - @Fabrice: did not find a corresponding buildroot patch from you,
     did you sent one and I missed it?
---
 .../0005-pud-fix-build-with-gpsd-3.23.1.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/olsr/0005-pud-fix-build-with-gpsd-3.23.1.patch

diff --git a/package/olsr/0005-pud-fix-build-with-gpsd-3.23.1.patch b/package/olsr/0005-pud-fix-build-with-gpsd-3.23.1.patch
new file mode 100644
index 0000000000..a8d53482b9
--- /dev/null
+++ b/package/olsr/0005-pud-fix-build-with-gpsd-3.23.1.patch
@@ -0,0 +1,44 @@
+From 69ae23be9f96b9e7dd68a0252f3ad05986bb222d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 24 Oct 2021 23:22:11 +0200
+Subject: [PATCH] pud: fix build with gpsd >= 3.23.1
+
+Fix the following build failure raised with gpsd >= 3.23.1 and
+https://gitlab.com/gpsd/gpsd/-/commit/d4a4d8d3606fd50f10bcd20096a8a0cdb8b2d427:
+
+src/gpsdclient.c: In function 'nmeaInfoFromGpsd':
+src/gpsdclient.c:374:30: error: 'STATUS_NO_FIX' undeclared (first use in this function); did you mean 'STATUS_PPS_FIX'?
+  374 |   if (gpsdata->fix.status == STATUS_NO_FIX) {
+      |                              ^~~~~~~~~~~~~
+      |                              STATUS_PPS_FIX
+
+Fixes:
+ - http://autobuild.buildroot.org/results/53b06e72fb2d8b4c8b6ba41baf775ff33654cd18
+
+[Fixed-Commit-Message by: Nick Hainke <vincent@systemli.org>]
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream: https://github.com/OLSR/olsrd/commit/69ae23be9f96b9e7dd68a0252f3ad05986bb222d]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ lib/pud/src/gpsdclient.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/pud/src/gpsdclient.c b/lib/pud/src/gpsdclient.c
+index a2a9cee0..9c98f4df 100644
+--- a/lib/pud/src/gpsdclient.c
++++ b/lib/pud/src/gpsdclient.c
+@@ -370,7 +370,9 @@ void nmeaInfoFromGpsd(struct gps_data_t *gpsdata, NmeaInfo *info, struct GpsdCon
+           );
+ 
+   gpsdata->set &= ~STATUS_SET; /* always valid */
+-  #if GPSD_API_MAJOR_VERSION >= 10
++  #if GPSD_API_MAJOR_VERSION >= 12
++  if (gpsdata->fix.status == STATUS_UNK) {
++  #elif GPSD_API_MAJOR_VERSION >= 10
+   if (gpsdata->fix.status == STATUS_NO_FIX) {
+   #else
+   if (gpsdata->status == STATUS_NO_FIX) {
+-- 
+2.33.1
+
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
