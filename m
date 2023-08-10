Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E36C001DB
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 05:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33143400E7;
	Thu, 10 Aug 2023 05:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33143400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzVrPFWz3mLk; Thu, 10 Aug 2023 05:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62952408D0;
	Thu, 10 Aug 2023 05:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62952408D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC5081BF3F6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8580460B25
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8580460B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b909i5pgJq0S for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 05:49:42 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91E3F60AEB
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 05:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E3F60AEB
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.223.222]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MxUnp-1pbIZC2l4r-00xpqf; Thu, 10 Aug 2023 07:49:36 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 07:48:45 +0200
Message-ID: <20230810054856.100816-1-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:8KjVxGQ2opDzAtPgGS5rA7Uw1eR7vfcb5P8Mc74Rx3NInaZNs8M
 NarEXfffjn2foFpGkSmbYx4FRSraTNvJnXgjOLI6z6Xaiy8da3F/Dna/Y5Vt1fSPknL5xXW
 AQH+RRVPJQSTlHyPaa3oAX9j4JSvbNSob4pB06GzUDKQHb7bWRBoxxmwcBNknZAAPHnuPfn
 +++vaR/Zu2MGSeCzGgwzw==
UI-OutboundReport: notjunk:1;M01:P0:8GmAZj79IRY=;28YKMgtMiYjpkCU10URvrE2W4Or
 OMkW1R8mUQ68V7rucrXFDpH/0Wh6JodE5DnZAC17tFZFVrXkG02wvdZS8N3ma8roLfO0riZ5p
 HMwH8vCvaWEYZ5SPEdQNa7yz1faMM9Ems/bfdhrbNXwvR+Ailv3FwzR1S1pA2BFy1VtREoA3n
 QDtEZvkWDl9D3lCqx0d8x2QtmhWjJbS6VEF8bfHS3Vs5DsTsfPmYI2QzRgTciJcLJs13wjQXY
 shnsdv22H7SKC/8xP/p3s+S8kfEwp/d+2jfQkeGJmT+CEMAw6l4RlXVXadoezWY5xvIv9DGM/
 BPFK2BsLSsmn0/oDKSGjPBEvDBG3dkHl7MR3zwrfDoCo2hkZ5KFLbnPzSxJPOxYUMJ+vdmJv4
 j8qqAIe9znwLGbHThZTk28aY+OFFRCWO00II5fuyz8EBr/j8AkYiiCtv/Z+gAUU9QllPL3Ai/
 oF9s947CWhPJ4L+MbEMOYvqG7fyFblx7qoJPI7V74l7vqs2/E+epDYEpMSc+G81nHgaJnjO5/
 QcY+cbHMB9OvBmn35OnAu/Yk2QkYWFzb4OYKeuLcRfYgYFlN/jxtf9lveHxle4cdfSCJkfnb2
 9Zm2q4XD+68t2Z5+KhzVnl+yM5SKQZ7jZTAZljZRk3GbyU5jJSTvMnEug4U/4JL2HAUaV0qIF
 EPBHR5mgJ/LpFw4ehGFlPuX1ZRImzZqbSrPznlWCdZE7zO//lB1H1jhzYmVoYwOhVnZfGR+E7
 8UQBPqb3ULtDW+Z9UUlx5a26vZMfY3UQkXIRXZGcSsSTjmF9JNbuGsLiQfuw6RXOkL0dL+u0b
 G1BCMI1B9EuwimglrZyw0+1rUUu68w4iq/auSaqAnWTo00yEMTCqwdMAcPrhwGQNBFtf348RO
 yypVALZppMxglMqG/TH+lPhZ838H2mx58Xc+iseYmKnd361zV1dTN/LuCUP2PK6Z86le662Uj
 IhXp+PBloWxgkftT7yZNSpjc2Rs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691646576; x=1692251376; i=dalang@gmx.at;
 bh=5Kqt+gn/CRd2mEAz5vSquxKNvsuXbPlGTR77Vp3wvg0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=RKJLhoAUoVFN0edNE+MhWo0dAw97zHUo0qMIklhg1UJjT2nZ2Hixuk5vjzqK/i61NgJ/3HX
 837GlIUbna0eEqXOZsJWxa1kjefe8Nblg3RBgJdxgdGV6gu8fSqbMiMPpjj8wyYd3Seu4bUHb
 MVeYieFhoDVHhFqqd2T1Pxjv3Zik1ylLBNXztu9OmQeGVjiScEU5K96aLpTY5NG027Mih3Fcu
 nXNjCGkKby+l9XRYBjSkTgfvJ5mbXwGe3SpuuQca9o8q8OfJ6i03/F9cJUAEGVVb17REeAqSh
 g1Y75AEfC6IP/NuHPUnLlJZTb1aLfTHha6evWrPH0ZonhwT3LrkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=RKJLhoAU
Subject: [Buildroot] [PATCH v2 1/7] support/scripts/pkg-stats: fix typos
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 support/scripts/pkg-stats | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3248e3678d..eea900124c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -84,7 +84,7 @@ class Package:
     all_ignored_cves = dict()
     all_cpeids = dict()
     # This is the list of all possible checks. Add new checks to this list so
-    # a tool that post-processeds the json output knows the checks before
+    # a tool that post-processes the json output knows the checks before
     # iterating over the packages.
     status_checks = ['cve', 'developers', 'hash', 'license',
                      'license-files', 'patches', 'pkg-check', 'url', 'version']
@@ -259,7 +259,7 @@ class Package:
         if var in self.all_cpeids:
             self.cpeid = self.all_cpeids[var]
             # Set a preliminary status, it might be overridden by check_package_cpes()
-            self.status['cpe'] = ("warning", "not checked against CPE dictionnary")
+            self.status['cpe'] = ("warning", "not checked against CPE dictionary")
         else:
             self.status['cpe'] = ("error", "no verified CPE identifier")
 
@@ -499,7 +499,7 @@ def check_package_latest_version_set_status(pkg, status, version, identifier):
 
 
 async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
-    url = "https://release-monitoring.org//api/project/Buildroot/%s" % pkg.name
+    url = "https://release-monitoring.org/api/project/Buildroot/%s" % pkg.name
     try:
         async with session.get(url) as resp:
             if resp.status != 200:
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
