Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287D0C4320E
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:09:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD075610FB
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD075610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA0FA60681;
	Tue,  3 Aug 2021 22:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dg8Rb6bOIUXc; Tue,  3 Aug 2021 22:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E783D60680;
	Tue,  3 Aug 2021 22:09:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 106D41BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEF6A83AC8
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jnfca-GJLwEr for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CF3F8356C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 64FF981278; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 09:25:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9070a7355b443c01760876bd8870a8ab7cc87286
X-Git-Newrev: f5906644b45269b1a5fe109cb64fad837e4fbff2
X-Patchwork-Hint: ignore
Message-Id: <20210803211013.64FF981278@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bird: bump to version
 2.0.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6395153437747888104=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6395153437747888104==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f5906644b45269b1a5fe109cb64fad837e4fbff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patches (already in version)
- Update indentation in hash file (two spaces)

https://gitlab.nic.cz/labs/bird/-/blob/v2.0.8/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Nest-Fix-build-without-protocols.patch    | 28 ------------------
 package/bird/0002-Added-missing-extern.patch       | 34 ----------------------
 package/bird/bird.hash                             |  4 +--
 package/bird/bird.mk                               |  2 +-
 4 files changed, 3 insertions(+), 65 deletions(-)

diff --git a/package/bird/0001-Nest-Fix-build-without-protocols.patch b/package/bird/0001-Nest-Fix-build-without-protocols.patch
deleted file mode 100644
index 48d21441ca..0000000000
--- a/package/bird/0001-Nest-Fix-build-without-protocols.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f9eb9b4cab65b850c61738dd56632bae0e7329ca Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 19 Oct 2019 12:50:27 +0200
-Subject: [PATCH] Nest: Fix build without protocols
-
-(CHECK keyword added by commiter)
-[Retrieved from:
-https://gitlab.labs.nic.cz/labs/bird/commit/f9eb9b4cab65b850c61738dd56632bae0e7329ca]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- nest/config.Y | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/nest/config.Y b/nest/config.Y
-index c62501a3..1bc203dd 100644
---- a/nest/config.Y
-+++ b/nest/config.Y
-@@ -75,6 +75,7 @@ CF_KEYWORDS(BGP, PASSWORDS, DESCRIPTION, SORTED)
- CF_KEYWORDS(RELOAD, IN, OUT, MRTDUMP, MESSAGES, RESTRICT, MEMORY, IGP_METRIC, CLASS, DSCP)
- CF_KEYWORDS(TIMEFORMAT, ISO, SHORT, LONG, ROUTE, PROTOCOL, BASE, LOG, S, MS, US)
- CF_KEYWORDS(GRACEFUL, RESTART, WAIT, MAX, FLUSH, AS)
-+CF_KEYWORDS(CHECK, LINK)
- 
- /* For r_args_channel */
- CF_KEYWORDS(IPV4, IPV4_MC, IPV4_MPLS, IPV6, IPV6_MC, IPV6_MPLS, IPV6_SADR, VPN4, VPN4_MC, VPN4_MPLS, VPN6, VPN6_MC, VPN6_MPLS, ROA4, ROA6, FLOW4, FLOW6, MPLS, PRI, SEC)
--- 
-2.21.0
-
diff --git a/package/bird/0002-Added-missing-extern.patch b/package/bird/0002-Added-missing-extern.patch
deleted file mode 100644
index 00aab3e92b..0000000000
--- a/package/bird/0002-Added-missing-extern.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4bbc10614f3431c37e6352f5a6ea5c693c31021e Mon Sep 17 00:00:00 2001
-From: Maria Matejka <mq@ucw.cz>
-Date: Tue, 4 Feb 2020 10:11:16 +0100
-Subject: [PATCH] Added missing extern
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Thanks to Robert Scheck <bird@robert-scheck.de> who reported it
-and Toke Høiland-Jørgensen <toke@toke.dk> who suggested this patch.
-
-[Retrieved from:
-https://gitlab.nic.cz/labs/bird/-/commit/4bbc10614f3431c37e6352f5a6ea5c693c31021e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- nest/route.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nest/route.h b/nest/route.h
-index d2a07f09..b927db5f 100644
---- a/nest/route.h
-+++ b/nest/route.h
-@@ -458,7 +458,7 @@ typedef struct rta {
- 					   protocol-specific metric is availabe */
- 
- 
--const char * rta_dest_names[RTD_MAX];
-+extern const char * rta_dest_names[RTD_MAX];
- 
- static inline const char *rta_dest_name(uint n)
- { return (n < RTD_MAX) ? rta_dest_names[n] : "???"; }
--- 
-2.26.2
-
diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index 303fc21205..2d20491dd6 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256 631d2b58aebdbd651aaa3c68c3756c02ebfe5b1e60d307771ea909eeaa5b1066  bird-2.0.7.tar.gz
-sha256 94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
+sha256  19d2de83ee25a307b9e5b9e58797dd68766d439bcee33e3ac617ed502370e7f6  bird-2.0.8.tar.gz
+sha256  94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 4d6159b075..a8b9b18b50 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIRD_VERSION = 2.0.7
+BIRD_VERSION = 2.0.8
 BIRD_SITE = ftp://bird.network.cz/pub/bird
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README

--===============6395153437747888104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6395153437747888104==--
