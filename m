Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1252EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 10:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 913DE42360;
	Wed, 13 Jul 2022 10:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 913DE42360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaEB4NxAH9KW; Wed, 13 Jul 2022 10:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5356142309;
	Wed, 13 Jul 2022 10:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5356142309
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8CAE1BF484
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 10:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A12E540483
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 10:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A12E540483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJpiItQkPATA for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 10:54:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D54F140143
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 10:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D54F140143
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 05CC08387A; Wed, 13 Jul 2022 10:41:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Jul 2022 12:53:02 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d1e88798c14b3aed9bf1bd178ec660a3ebd2733a
X-Git-Newrev: 872e1523c9bc6148adcb616964da509a9df07fa3
X-Patchwork-Hint: ignore
Message-Id: <20220713104109.05CC08387A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/apache: security
 bump version to 2.4.54
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

commit: https://git.buildroot.net/buildroot/commit/?id=872e1523c9bc6148adcb616964da509a9df07fa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.54

Fixes CVE-2022-26377, CVE-2022-28330, CVE-2022-28614, CVE-2022-28615,
CVE-2022-29404, CVE-2022-30522, CVE-2022-30556 and CVE-2022-31813.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 78e5a9c40e0754bbe840ef7b8da85efc28eb8b48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 11dcdefe46..2c21a5bab8 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.53.tar.bz2.{sha256,sha512}
-sha256  d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63  httpd-2.4.53.tar.bz2
-sha512  07ef59594251a30a864cc9cc9a58ab788c2d006cef85b728f29533243927c63cb063e0867f2a306f37324c3adb9cf7dcb2402f3516b05c2c6f32469d475dd756  httpd-2.4.53.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.54.tar.bz2.{sha256,sha512}
+sha256  eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340  httpd-2.4.54.tar.bz2
+sha512  228493b2ff32c4142c6e484d304f2ea12e467498605fe12adce2b61388d8efe7b2e96ae2fd0abd1dc88a5f12d625e007d8da0ae5628cff2a5272806754f41e18  httpd-2.4.54.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index a6fb59d26b..315282baac 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.53
+APACHE_VERSION = 2.4.54
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
