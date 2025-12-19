Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79207E66891
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5147E40743;
	Fri, 19 Dec 2025 22:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Q9fiRAjN6lS; Fri, 19 Dec 2025 22:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3AF4067B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766184705;
	bh=ZPI895FmdhiVApLREW5J5aqfnTIzDbH5Q8t3cG+i334=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hhEhAs+UdnzmHHODk0KZrAvz/QtaoP8VhbHM5Gk7Vz4O2qpW9NzUXsfj90OwWOeF5
	 hc4lxMsp0r6oHzC8sP6NPr0Tii0WjRuRYT0VisUi9tnQm8+2GcLwBcBVSn/mer6Ddy
	 QuS+/uiwafpxx+aSHMwOkqCJSoUnx0aQlcq34CAu4vltT27LQUw2LYm48I7aCd+6lS
	 iKubJgtFK4dqANaL/psCqXghH7pmdMuH+6QFsRHG6qsL+xCc/dgqLqQv7gtBtnp8gM
	 nsUsA6qw1LHY4A8625LU3fIImtznGmUO9iM/oLZA7IzvrzadT8ckeVTHNph0oqxpSi
	 94v0EcJRkqMJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF3AF4067B;
	Fri, 19 Dec 2025 22:51:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CB80119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8206A81EC6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooGtF9iHGq93 for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D03B981E25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D03B981E25
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:51:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF4ED807B2; Fri, 19 Dec 2025 22:51:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Dec 2025 23:46:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44eea720c0351ddec6b6bda41520cb78a3ac80a9
X-Git-Newrev: f7fdac73ec3b67d5d3fb31170b2c9028e99c0e4f
X-Patchwork-Hint: ignore
Message-Id: <20251219225143.BF4ED807B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libldns: bump to version 1.9.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f7fdac73ec3b67d5d3fb31170b2c9028e99c0e4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/NLnetLabs/ldns/blob/1.9.0/Changelog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libldns/libldns.hash | 8 ++++----
 package/libldns/libldns.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
index ffdfbedc13..b8bb3f55a5 100644
--- a/package/libldns/libldns.hash
+++ b/package/libldns/libldns.hash
@@ -1,7 +1,7 @@
-# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.4-rc.1.tar.gz.sha1
-sha1  43d013b904e6df5ac5e28001cdc91bef537f3f6f  ldns-1.8.4.tar.gz
-# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.4.tar.gz.sha256
-sha256  838b907594baaff1cd767e95466a7745998ae64bc74be038dccc62e2de2e4247  ldns-1.8.4.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.0.tar.gz.sha1
+sha1  9cfe5623dcd40cee0e480b438318c3c4a26c1ecf  ldns-1.9.0.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.0.tar.gz.sha256
+sha256  abaeed2858fbea84a4eb9833e19e7d23380cc0f3d9b6548b962be42276ffdcb3  ldns-1.9.0.tar.gz
 
 # Hash for license file:
 sha256  9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 6ced75a44f..92c379f37b 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLDNS_VERSION = 1.8.4
+LIBLDNS_VERSION = 1.9.0
 LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
 LIBLDNS_SITE = https://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
