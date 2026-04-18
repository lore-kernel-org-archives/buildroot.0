Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB95F99C8E
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 19:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC2AF60DD8;
	Sat, 18 Apr 2026 19:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdFkqfHRcw4Q; Sat, 18 Apr 2026 19:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C10A860BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776540360;
	bh=rYe45ChYLSb3A8cMDujP/WIXxd6KRnSus4yT4S4dBuY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mnfse0AihTNv26duRuz9s0t1NlSVUiHYr5VJPkLCjCHPfEj6A5E95kHBFlIyVWwK+
	 FwftZgKxnCVO6gEfzO0ScUuIjqMM/ap0ifFZCgvoG5BSSVXIV2aRtXD3NQHtRL1qcW
	 ixU7JClb9VPgBOE+ViytFtvpt4UDL6/EgzZD+3s6X/xUmIUTtSlG/hy4uygDsDfhsy
	 2+Us7HLImAC8Kz9UfW6rHDgkexiYYzwam0CWkx3XjA2ekg22vwZ/1227+vDaf+Uyt3
	 HXdQNyBhMelQ5MjeHhRzbg5S/p3cBQqhr4SO+UDD8sK6ztdiRGlyPZF/5wshyS56/a
	 ali7bIr0K0HwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C10A860BB3;
	Sat, 18 Apr 2026 19:26:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4875259
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAA6B40C0C
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0fXd2xT9KQS for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 19:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D176840BE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D176840BE5
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 19:25:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 788908078F; Sat, 18 Apr 2026 19:25:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Apr 2026 21:19:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e6b2b82d5301977cf2f59adfd633d8774830f69
X-Git-Newrev: 7e24f892f6120d008e6a73617398ddc3111ee3a2
X-Patchwork-Hint: ignore
Message-Id: <20260418192557.788908078F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dash: security bump to version
 0.5.13.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e24f892f6120d008e6a73617398ddc3111ee3a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=601bc50bfc2858ab7a9ec327fe4e33a9c4877759

Fixes CVE-2026-31323.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix hash file format to also fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dash/dash.hash | 6 +++---
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index aa41d10af6..95e6b440c0 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,5 +1,5 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.2.tar.gz.sha512sum
-sha512  7e9a06409eec925fc83c81192cab420a76ec25821f0a4cec8db4a93b00e51d343438b8cfe56069b4d7fb185f529d1b5171a7603525de00a7852298425b2f433f  dash-0.5.13.2.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.3.tar.gz.sha512sum
+sha512  4f463ea9d9bd72cb9852578a43ce04a211e2e775782f4cb6b2af328d51f80fcf9cff3255c519f60027f7b0d8b9d3c9ebed100925bf6324bbef81381ebd3c77ae  dash-0.5.13.3.tar.gz
 # Locally calculated
-sha256  e7136826b1eed6ce3193e8affa2f70b1b2b9168dd91ffa7ddb4f46e9e62054fe  dash-0.5.13.2.tar.gz
+sha256  a83727c1299ac4c3d9d43979393b3a4eb00275d5636ae02526e7979d51d6fbd1  dash-0.5.13.3.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 547fe8c9b0..8c9224782c 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13.2
+DASH_VERSION = 0.5.13.3
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
