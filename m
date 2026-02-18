Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28462E9A057
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B867610C8;
	Thu, 19 Feb 2026 17:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nogsp_ktOMAy; Thu, 19 Feb 2026 17:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1791610D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521881;
	bh=qLanhGh1Qql73la2FRZ8PqNF0t7THgnrgdqr0qH2uSk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E2/T1WtRb1RelUNoREZZA+zFp+TgBWPj7YY/WWcd53w8XKMA9NtX84l81Xu8/8zru
	 46MRpR4EYXs85m07BwghL4igVp1aDs86Y+tW4Kox+MvKbeSjpUejlOVr7TJFUQkJwi
	 prcq4/j3r+OTHm9K0AVpYwyE+h4cnTxaLi1Wl0iAkTHfmRaNXnDWXI8S8FWmXRBgWg
	 EaeMcbEgebBoniqVW5R95yCA1iLKRixSp5xpteHc1HOZ5G0VUHvRzffPxQWqv76skm
	 l5bGnpOKEQGZh7+l1dWbjWRsEX2sNyBi6XscBZs9oxj6BUUYEnn2pjTdaf2uXmgc26
	 pXPa3me3E1c1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1791610D1;
	Thu, 19 Feb 2026 17:24:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46FC0206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3613740CF8
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9nt_sD0jhML for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E93A40CFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E93A40CFD
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C19F82205; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:29:23 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d21f8a7c73d6b2c27a6a9b96a304a58760844ec3
X-Git-Newrev: bda1452e19236bc58eb52d747126ba95209c0a77
X-Patchwork-Hint: ignore
Message-Id: <20260219172414.4C19F82205@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/haproxy: ignore
 CVE-2023-45539
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bda1452e19236bc58eb52d747126ba95209c0a77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The CVE-2023-45539 has incomplete informations (see [1]) and will be
reported as exploitable by pkg-stats for haproxy v2.6.22.

The vulnerability has been fixed upstream since version 2.6.15 [2][3].

This commit mark this vulnerability as ignored.

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-45539
[2] https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
[3] https://security-tracker.debian.org/tracker/CVE-2023-45539

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d6e219adf0dec76cbf0d68eafb4739651562031b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/haproxy/haproxy.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 77195d966b..f60cb1e08a 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -11,6 +11,10 @@ HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
 HAPROXY_CPE_ID_VENDOR = haproxy
 
+# Incomplete NVD annotations, fixed since v2.6.15
+# https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
+HAPROXY_IGNORE_CVES += CVE-2023-45539
+
 HAPROXY_MAKE_OPTS = \
 	LD=$(TARGET_CC) \
 	PREFIX=/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
