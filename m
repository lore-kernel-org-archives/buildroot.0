Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E999C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 11:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C123F81F62;
	Mon,  7 Jul 2025 11:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dROoQp7kXXb; Mon,  7 Jul 2025 11:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14CA681F5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14CA681F5D;
	Mon,  7 Jul 2025 11:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF4271BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 11:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95A1281F62
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 11:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFtl4Mz-gttP for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 11:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F5A281F60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F5A281F60
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F5A281F60
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 11:56:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.121.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49lJ-1uhAT645vV-00sFV0; Mon, 07
 Jul 2025 13:56:14 +0200
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon,  7 Jul 2025 13:55:57 +0200
Message-ID: <20250707115557.171144-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:BGKs3GX6WC2z1bxUz/jfbGiMHhx1aelEi4r8VN7S5M9cvKFbnOl
 NDIH60Vexgc0rsAbB3yJSPS9UvUQUDSzPuHLGS15r+KRBM2a08UZTJfYJR+iLTKF/OsX/V8
 hDWUfZElYZn363bTiwgGQBWHuFWurnrq06ONKuV/4ET+1qHv3PRm/At9R8Jn/zQwj/jdbej
 d51wNa1OaY+1Lnwb6UARQ==
UI-OutboundReport: notjunk:1;M01:P0:zsS1UqPZuSQ=;jPftaBP6J7M1TBgDyNlYwUHqEdo
 6gnXyUCSFOnzEOVRoFiylJAvnLgoseb9lAA5kIhXwQzeITW+oIeqpD1jrSDtuvUMYdVBAFU/y
 fsUjc9GRDRi4wyej/NOLZ4f+EYKZ5u8gyL+Mo7P5Mn3DGDhyXD3eKA0u4EUl9+71jDVDarwBh
 7+ZDW33vmsS0Ta19iFJ4omgmCl0kiF5IVdqkRUaayXHL0apB0SFh+701qT9d6mmUGRmZUrXg6
 1PZHJZTsHrDUGs4shl2Nhhrq3i9VhAqQldJpJzz7uLSgNID5mbws1mwk2XehDF8/rcS/A8GT9
 7zQcOjx2LsMlCZwZLT+yS/kjrO0kYamCZFzjSfn8uczlUoRfOQRAfr6+FkMVL4Sv6sPgw/9ah
 7S/neguui0TCNI/TXiw3whCRQ7XdNjlGfwd2zaXbl2EpvFM1X53lMOReQvyQw154EKz0h1fRF
 /5kf+YFLyhemTqgQkvSa3MWLe7osGxxTfiYPOXPvmJ1FoXcESh5kASQxb5fB3QoXO8yaVNWLY
 YU4NTye+rm2K+J+3QO0N93F1QMfDFfjHqv6vs5Da8Y+h5HNI+b5XG5leYTbBrK93K+nZrPVpF
 TvJvEdfMFXBjz8Ec3KA+nRhNaDuFWhJjEqgXcjuIRjsWWBfw2O5xxvCTEy0AZfeod/sasaLC5
 WFxn1QBvN/7hmxHGqtSFEq6/dOalX4C4QViXAvqfPtAe1iq8loXUlvAn1qnEGyHGD0sg7H5eu
 b5co34shO4YMcPTOZ7UO2joX3xCqVHMU56ZpoB6WBADFtXLN/3fbwd9ODWwUkWignscN50No7
 aIDe3pnhWk76VxC+auPv/GmqdBcYMTXubsv2fta7P7B1lnkCvw9ONxaIMRT2bc/l/URoxj6n/
 2Lvuw1aeYnnXtDPuF2w1uOzjHn0GhJdz7PGiyWA+yNZYQ8Y3WPN3YOS5d6WXrFXXGjJsTPDbs
 /2S2BBidIBG1mFfAYbnTPrBNMwOfh4RnvI0nP9O+7uciacSVs5ESdcTVv0irvZFS79fCoYEA9
 oO+tTNvSZInjaJbYN5MNotuUM6I+fW/m9JK66SKs7QYtZBDaq/GdoC752fSIFkz7totyBQezt
 tyz51DLLXDTupWPTHtq6GQdhOi0lxvo/q9QCabOQdsUdIkhS0vhWoaNxhIryA2AmL2R7DofsG
 8al4sBpRXF+FuELId5hHcyfTv3AnM8wMDyZiKR0RUvBQnud4he7X0kehLoj+AQLc1ubsUHISr
 QerryCKtKU1gI6nNlp7veF1aQ6szQ4hhY6PUQFBlMLf8j1JX/atyGYy6+c4Y0T+bFN009uvle
 DMTT+BNCo4tS9hMrwXCL8p4yCkjTc9xFdpG+dzBHV04PVUAGRStpaWj4fYbGT9X9mX29IwZtT
 4nQvwMXFM1DbOS+0wWHrP/n/+/0vlL8E0Lv8M6f1fW06lIkeT6kyCK8pSBO3ysEM44rBCC0j9
 /GSgUj9Lhp9PgLqC+uyTqE+2O/QPpXd5eNGbcIjOGXJSdQZir3CK8SFvI7cUHUcaS3kpH1tE1
 X5zrrce1THGBAPUeJ1MULMYdzfBlBk8Th6ncFTrm81STYp+CJPDrUnV1n56iLZm39BKhYki23
 jBa2rGPyUFUw9lDEbdo2V8ToVpdCFVwSlPa/TWk49EorZaXyUna2pp5IfcPpmlCV1vfOulfUw
 8GtGuA24xjqwZgcb5PYXXKei1Ym31pYKtXb4Jg5FNMB9OPDlGJheJo8Q51wd0xePwYS7I/FJ5
 Z54Ys6NxbgTSGV4+GrIslaXDj6zkNZtuZ7Vpt9EHt10XYdbY5REF3Me1ZgXbQMrtzXKQaJ9Sq
 koKZdoOrVv1aQeCwObbh8l4R9+KGc7dqx/mL7lgLoc5chgE4JZlxnXA30wkbk9GWohLU5zowv
 PdbL+INMkXa+NQzKbvvEyLpThBGXbJD9CULRDSgfGw1O0+qrGDPA48OANjEPSj/sLYNXxTqmQ
 6KHdRkZRLlmp692qxoIb1fiI0QLPOonQ/L7dDc/p5Cfk4TbPmBh9rV9QGi6M5wLjD7F5XC8mI
 WPeX5R6yhm8U9Lf0k5qy1Cl1RxE/mJrq0TqayJZgdAnciSaJPsV3AeK9Z7qjoObQMyZ/FVr4h
 LZJHuubFV3eW+tcek5530l5h/SFZ+0Yn3Q9QsGaWS4N8Wk8pNM74uszCL2OQinnsg0dRA3vdG
 k8cl4Rkm58b67CznNIrNl621yD69Dsh8FsS5tkHJIqe1nnQW/Sb85dp/DcJbQ6/59T7EZYfT5
 4yIM+t45hI0OCC33djG15fd83OtD1xEYz1qegJx+UbKyJOC/f135diioAQxJi0KIwJXj+EeYj
 IQ550r8U6eqghiszPgu+mOKwtb+gpjk7lLuDPgTo07XPXwKPSVsqtDosaSpOnqZY4Hm0miqqA
 APzh725GYvhBxFfxO6BFHD9YVaxhMMAOvd+dNdCVB3Egnb7SDOvMcsgEHGlFnCNI4vGH9+QS0
 eOO8yr3AyMCPl3zbBc31C9dsDrx/4o+4uzf54izNqEOHtELVZlzbwhraF+EvdMLnYQ4a4umFI
 aGrjdejBkXYLffPqjV9fj0qI5z70ykGxQlDkNwnIRQAvXrEgTb7u+ExjDEpwdRcZL67D/SEHI
 VSogUoZCy+dcN6g2o1RGeY1BdILDagxuaslsI2REVkx3oMr3RjL6VQOiPWb7EBwYC9JzyPyBV
 PW+2QlGGDVd91FEKFdZh41Xkzh/W8taBoEkJMUHAlyfpMDyALfttMrHHOaZDX4l4jG6pu0EZ1
 T3zdOEau2O+khJgE7PKYaI6cHhM6Ap8PtDcjmolMPwfDe2YvGGm/BjInnFU+265MapNHRtjDN
 ZxPUth8YFCbr69rCL56SUjdSA8xCchKZV1+WOzXJbTmQVSwjv2Z2mTy6cw+oeH/98cvRD9mtM
 XbKR9Gm9EW5NrQOJjRsKojuD/SXHGuLjBKRJsJQB0ZkQsYysnSXDKTghRydyPdWUYuolXpcmg
 32mqfmIfkIsaSEqUep6qpFdcZ41iB5UlQi+h9jEOit/1owmpFRoKBgp8NKpYFnHBq5t2sDG8z
 gubUX8QbfUF5xUo+kSovnarFZlhqtwOHIRULkrjcSW8PfklktKRLUrZQbZ9Jbg2MAfRKCfSUi
 Kcy47ud64KVr27chHtJSaRK3VNL94dMtCu3vTTTiqGdairro3BcZsQNgknmDOSc5qvq3iPYrW
 0c4tDlqaK1aLrQEOeimCx/9Cad8WnVE537l5d0cTotpGo8YKNstNFwKWY13YXj4DcSfZMUiZd
 dqtXLrbMtQulqt/JiUhoqK12fTOO32xKlbP1r5yz0wUkVJUTs8Q+zb8wOMPlNFCt59XsSv/m5
 WjnIMAl5PaeSdRMlc4f1I6ChQOfNbpLXX2rHN2zK5mTmLrQpNIO+RHKGJaJeVByBiP330Nx0Y
 ZrevymZ/PphVrNraG5YUnraFJJxOlL1/mxkwuhnjNwJvPkyuTp2CVkbb1MSp15HTqh2eLWX+i
 MgbFHIUl38aJ2su+KpgR/GpZdd7VLnh2/hgyLHR1yRMqYMn0YKiwL
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1751889374; x=1752494174; i=fiona.klute@gmx.de;
 bh=3RVA2pvSXi5jy0KaoqKhu7sOatG9SzKU4P/e02NdoA4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=X70wDHZj46F473Ja4GBHTOkW/mXJozn91RHEIJG6F6NigplwhsWVgRGVbKtvaj4x
 IJFScm3tJ+HSiTOWoL+XcM+BetgzvJ8C4jjF34CykBfh28f0hSGn4oJaW2WBquYz0
 5/Y1ZX3BPyX0SmuoWsKynJNUfrKMflnPon8O9/kzonSrH1al1gutTHISlh1sPIJNq
 nSBE9jL8ODmpPHAbcFwCHGrztVGOpFiXg88vvOQPXZFk4fD4e2/mO3gXVNI6dq/62
 1zWJ3G9+3/ysToFnSYKBKE7XDPKUtvtPqI07fyjb94nTxfjGNMjmbo24gD9zho5OC
 aRAjD+BuSsC5sjiIVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=X70wDHZj
Subject: [Buildroot] [PATCH 1/1] package/genimage: bump version to 19
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This adds support for btrfs partition images, among other things.

Upstream changelog: https://github.com/pengutronix/genimage/releases/tag/v19

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/genimage/genimage.hash | 3 ++-
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 232ba6ef66..7bfd6f5dad 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,3 +1,4 @@
+# From https://github.com/pengutronix/genimage/releases/tag/v19
+sha256  7ec4fcb865662a8b2ff20284819044ffa84137bf3ca16fb749701291bc01f108  genimage-19.tar.xz
 # Locally calculated
-sha256  ebc3f886c4d80064dd6c6d5e3c2e98e5a670078264108ce2f89ada8a2e13fedd  genimage-18.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index b8ce7ff3c9..5fa34d8eb9 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 18
+GENIMAGE_VERSION = 19
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
