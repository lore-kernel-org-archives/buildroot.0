Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50D2CA0FEC
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 19:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 813C060758;
	Fri,  1 Sep 2023 19:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 813C060758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZ4dn8nyRhv5; Fri,  1 Sep 2023 19:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8C9360644;
	Fri,  1 Sep 2023 19:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8C9360644
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E7551BF576
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC558404B9
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC558404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E23JMTvwebIy for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 19:28:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6702A40960
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 19:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6702A40960
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.144]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MxlzC-1pjtTE0bYE-00zItx; Fri, 01 Sep 2023 21:28:06 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Fri,  1 Sep 2023 21:27:10 +0200
Message-ID: <20230901192719.102415-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230901192719.102415-1-dalang@gmx.at>
References: <20230901192719.102415-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:2F8G5eq8AQAe2/wf3K/A+G/WwNweqjb2WqSTjWN43VbnGC2tQe1
 kdsyRW4lhQH3ido30BDQsNH3dsf4d4L7i7p5E6ZcZpvNuWt6N7wYsSWIjFk1dQshsE2GCwC
 b7TMeOhrxyyPIqeIxaINMzrYq/S26YURppMs1i0gYe8fmxPLHuU/bwN17Mcq58tKUN8v18s
 HO3FfIa4S458Jt8TQORQQ==
UI-OutboundReport: notjunk:1;M01:P0:6kW/mSRb3es=;1tzOMnrs3vTuIIkz5n9HFy243Ha
 6PdN2cKx1Dk1v6BxDk7To3JX/ZPk2lrbC/CQua29rsVASglO6cUs+1iiCrR5b8+ssrHqX8p3Y
 jEuQKUsprCc17o2EgGA1rmjmw4GnChQo+lvN1gGD+J87FhyRtuJDuxrXnR/4dipveLklTSd/p
 mU7NK4/LKw18gmIbyFAqLeS9Vu+SAV7ocdFLuYhGC+Jk4PhFVNgvAhHDPgeeb9cphtfjTIXu0
 hRTy3PJjMNisgCbsAHLWWKhUp5i38phlO+PEB/feueimc69Ivk9Jb2ab2FnDh8oWiEI26naLh
 HU2OLD5xzoOatF1wIlLKlaihax2fxUatorDp70iuq6h/9Mgh8KyJ3u7GQUdKqCh+c3SvSs0Dt
 52f0B0LKSBjCDrGKeX2owhkRc2jLOxnsYirnLG28T66cuVH2n+V75GDC2iFipqa32V6jmF6BZ
 FxUtwdhVj07LRTzhr26OFiqWCAb+7MSHLOZ14RhewIX6RDpvcVszauYmK0W0b5Q1l+J8u6zYO
 qYcY2+7Dro1HKweBFyPVyT1Qk1katHSQ7/OxWtBlHCu6tzUDWzMQVi0kNKcmHSQ1KpTYZuzu+
 G0aIPwEO/VWOpp0Fmh0lBvwoJ8rfncN4H7+QAgJIYVls88ataAR3Ou0ud52WnANSleVH0tiLe
 m8wWbKNwB10myV3XSer4iERlR6RkpdAMrSJQi69PxPTKsdViteZ4d58lfueC1LG98kZKOCzmC
 lIs3f3f/JfsstHL5KAGwNTQ6Sj7PMipJB2DhJwtnahFQBI9b+KXw+PVv6WjXpIvRBOFrGTBYI
 7g+np/4dedSrQbU/h9XDyBJW9qsFXYJz+qO/J2pnySC1yskHzS535MqfhywawBCaWisn86QEN
 gHVd6T5joI6sAYEOtGSwO8D1nu03fSo/HklD0myXupxS32D9Chug4OC4oWGDnP2kBMqu+k7AP
 17BdKMfAf6ZLFVD4zmSZZiXaf9A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1693596486; x=1694201286; i=dalang@gmx.at;
 bh=9yvzTWDx8zLDekr/PaiHKrNMcISrAb0xoMMAfxhS7/I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ZJ6LRSNS2FdJ6oq2wumkhtkV4FV7TZ8SekYIXX2pBTXn0R6rpuTULQZwuTNuJx84SoxAqAY
 PE0tQu/roX1iQNhTt8vjVjJengPf61wwEp/ePe7MzvtxaydvQeMFtuo7hZGIM0V6FhZXZSKBX
 pBB9OBQfHKC3L5Ct+sLapQYBb3Y1yO/xv5laLOAn6qomlEqxUTXQy3t8zqLmoTeR+QBblKkGg
 2o9eM8YoDP4c/adwBDEbbyF4C+acN4odkY9Rh5pt4bK+KrG7gWIKSSKieEJzZMYBz4QkyvMrU
 CxFvlT12pwfBXvURAJ+dd9RLFsCPfhg4yZLAraFcqJRSse+GFq/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=ZJ6LRSNS
Subject: [Buildroot] [PATCH v4 2/6] support/scripts/pkg-stats: check all
 files for warnings
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

Instead of only checking .mk and Config.in{,.host}, check
all files in a package directory.
.checkpackageignore isn't considered here, therefore the shown number
includes ignored warnings as well.
Add another css class to signal some warning, compared to a lot (>5),
similar to patches.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v3 -> v4:
- use yellowish bachground for "some" warnings
v2 -> v3:
- new patch

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 support/scripts/pkg-stats | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index eca638f396..9349a0df57 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -272,8 +272,7 @@ class Package:
         self.status['pkg-check'] = ("error", "Missing")
         for root, dirs, files in os.walk(pkgdir):
             for f in files:
-                if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
-                    cmd.append(os.path.join(root, f))
+                cmd.append(os.path.join(root, f))
         o = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()[1]
         lines = o.splitlines()
         for line in lines:
@@ -876,7 +875,7 @@ function expandField(fieldId){
  .wrong, .lotsofpatches, .invalid_url, .version-needs-update, .cpe-nok, .cve-nok {
    background: #ff9a69;
  }
- .somepatches, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown {
+ .somepatches, .somewarnings, .missing_url, .version-unknown, .cpe-unknown, .cve-unknown {
    background: #ffd870;
  }
  .cve_ignored, .version-error {
@@ -1033,6 +1032,8 @@ def dump_html_pkg(f, pkg):
     div_class.append(f'_{pkg_css_class}')
     if pkg.warnings == 0:
         div_class.append("correct")
+    elif pkg.warnings < 5:
+        div_class.append("somewarnings")
     else:
         div_class.append("wrong")
     f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{pkg.warnings}</div>\n')
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
