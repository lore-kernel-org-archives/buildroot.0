Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2027FA3742
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5882E40249;
	Mon, 31 Oct 2022 12:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5882E40249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ieRiZIG2WMF; Mon, 31 Oct 2022 12:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4994140155;
	Mon, 31 Oct 2022 12:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4994140155
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 534811BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E1E440170
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E1E440170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gui9s6sMCMXa for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:25:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4064140155
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4064140155
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 267DD8790B; Mon, 31 Oct 2022 12:25:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 13:25:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bada3ae53f051e3788bdacb8483cd386c2f4a419
X-Git-Newrev: fbe2a973da559ecf6fec9c2fa313cfa1fd50ea6e
X-Patchwork-Hint: ignore
Message-Id: <20221031122549.267DD8790B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oracle-mysql: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbe2a973da559ecf6fec9c2fa313cfa1fd50ea6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:oracle:mysql is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aoracle%3Amysql

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/oracle-mysql/oracle-mysql.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index f1f16abbb4..1086e4125f 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -13,6 +13,8 @@ ORACLE_MYSQL_DEPENDENCIES = ncurses
 ORACLE_MYSQL_AUTORECONF = YES
 ORACLE_MYSQL_LICENSE = GPL-2.0
 ORACLE_MYSQL_LICENSE_FILES = README COPYING
+ORACLE_MYSQL_CPE_ID_VENDOR = oracle
+ORACLE_MYSQL_CPE_ID_PRODUCT = mysql
 ORACLE_MYSQL_SELINUX_MODULES = mysql
 ORACLE_MYSQL_PROVIDES = mysql
 ORACLE_MYSQL_CONFIG_SCRIPTS = mysql_config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
