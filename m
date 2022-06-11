Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A289FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 12:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 320C440CE2;
	Sat, 11 Jun 2022 12:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TBnp_PRF_8pR; Sat, 11 Jun 2022 12:16:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 543E140492;
	Sat, 11 Jun 2022 12:16:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D44E71BF418
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 12:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3256418DE
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 12:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-XvnEoRKCad for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 12:16:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A103B418D7
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 12:16:19 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout01.t-online.de (Postfix) with SMTP id 651B34763
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 14:16:16 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.12.97]) by fwd78.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o002I-14AjhJ0; Sat, 11 Jun 2022 14:16:14 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:49876)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o002I-0003m7-GC
 for buildroot@buildroot.org; Sat, 11 Jun 2022 14:16:14 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 14:16:13 +0200
Message-Id: <20220611121614.1172869-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220611121614.1172869-1-bernd.kuhls@t-online.de>
References: <20220611121614.1172869-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654949774-0143C329-1544C9D2/0/0 CLEAN NORMAL
X-TOI-MSGID: 85b882bd-b499-4a0e-be95-3a1b41f8450c
Subject: [Buildroot] [PATCH 2/3] package/apache: security bump version to
 2.4.54
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.54

Fixes CVE-2022-26377, CVE-2022-28330, CVE-2022-28614, CVE-2022-28615,
CVE-2022-29404, CVE-2022-30522, CVE-2022-30556 and CVE-2022-31813.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
