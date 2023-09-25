Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305ADCE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 06:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D205140347;
	Mon, 25 Sep 2023 06:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D205140347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qbsTzEq-3QNj; Mon, 25 Sep 2023 06:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34FB440C01;
	Mon, 25 Sep 2023 06:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34FB440C01
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B48D1BF95D
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 06:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21B5540AA1
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 06:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21B5540AA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lg8x-EWhugeS for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 06:44:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F07740347
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 06:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F07740347
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 320B3876F5; Mon, 25 Sep 2023 06:44:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 08:38:12 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 08659a7fb56f504b80b9fe28049636aea522d67e
X-Git-Newrev: c01bba1bf85af4d2e654267ad45c86fe614c400f
X-Patchwork-Hint: ignore
Message-Id: <20230925064418.320B3876F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/bind: drop
 CVE-2017-3139 from IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=c01bba1bf85af4d2e654267ad45c86fe614c400f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

As of 2021-05-14 CVE-2017-3139 is no longer listed as affecting bind, only RHEL.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8bf82aab0c0b7a1d329a02395e0353bb9c2eae67)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index b934ab3190..618b5b9278 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -14,8 +14,6 @@ BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_CPE_ID_VENDOR = isc
 BIND_SELINUX_MODULES = bind
-# Only applies to RHEL6.x with DNSSEC validation on
-BIND_IGNORE_CVES = CVE-2017-3139
 # Library CVE and not used by bind but used by ISC DHCP
 BIND_IGNORE_CVES += CVE-2019-6470
 BIND_TARGET_SERVER_SBIN = arpaname ddns-confgen dnssec-checkds dnssec-coverage
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
