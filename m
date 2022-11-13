Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BF1C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B14A40361;
	Sun, 13 Nov 2022 16:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B14A40361
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t69hbKyE7bVp; Sun, 13 Nov 2022 16:59:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EADD4032F;
	Sun, 13 Nov 2022 16:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EADD4032F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57E1A1BF267
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3372D60BCC
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3372D60BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvhUxEY4RMHX for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:59:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6340B607AA
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6340B607AA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DE7883757; Sun, 13 Nov 2022 16:59:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:49:28 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 3db40bf45c918f0aa317fe1a001d94c8e773593c
X-Git-Newrev: f732be4b1f2b2a38730683d4014081e202dbec36
X-Patchwork-Hint: ignore
Message-Id: <20221113165947.4DE7883757@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/oracle-mysql: add
 CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=f732be4b1f2b2a38730683d4014081e202dbec36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

cpe:2.3:a:oracle:mysql is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aoracle%3Amysql

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fbe2a973da559ecf6fec9c2fa313cfa1fd50ea6e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
