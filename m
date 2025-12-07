Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5F9D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 23:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6850C4081A;
	Sun,  7 Dec 2025 23:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2vAplGNUEbx; Sun,  7 Dec 2025 23:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E1AD4081D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765149942;
	bh=/1Lf+P6XXvGWYkW5QMPZsyLhXMnpBUpz28+BGhUxTIs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mX7BxmhIy84itHKlz43QZjUz7alKZPBOJeVOMtV3Si8+JppL5sVtn+JqosEnTThk3
	 UUI68ZZKc4t307YTxiS4orhwhmL3FHhUeiHNWLCQfdJnEWLC+dwtenIOI4WKpb1UNd
	 GgFLEym3E36i3Rnd7NZVY9CEyPdzH/XiTXXuXXMJ/XuJMMDEgMEhS+OOmkDTsoSRkW
	 wSTI76aNnRP5KcFGHKMrUaqTKpqfdFYCsh2btxwAx0wi3xU9mk0XNCA2C5PKs3POGE
	 SLHriPl/GoqU/7oq7dqMUmKfPzTAqCHg5u9m1YpFWd+IGO4GRq+e9CqLUAd6T2rUKX
	 hQ8nNC4WLnvKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E1AD4081D;
	Sun,  7 Dec 2025 23:25:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 317692CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 23:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1879A4081D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 23:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nevNhKYkoWV0 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 23:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B2814081A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B2814081A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 23:25:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5421E86009; Sun,  7 Dec 2025 23:25:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 23:55:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bd818a06726b3bde02282bb9ae382a8e3af93be
X-Git-Newrev: 8745e0d5ca39abbbb664619e1512420c40bcd732
X-Patchwork-Hint: ignore
Message-Id: <20251207232540.5421E86009@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump version to
 3.13.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=8745e0d5ca39abbbb664619e1512420c40bcd732
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.python.org/downloads/release/python-31311/
https://docs.python.org/release/3.13.11/whatsnew/changelog.html

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-12084
https://www.cve.org/CVERecord?id=CVE-2025-13836

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - add link to detailed change log
 - add CVE-2025-13836 in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 778dca3b69..fddfcc1a4d 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-31310/
-md5  5ada33c7f08d5d2df881657bdb8e848d  Python-3.13.10.tar.xz
+# From https://www.python.org/downloads/release/python-31311/
+md5  4c3517dd8b1fd76377dcb3e5e8f71ad6  Python-3.13.11.tar.xz
 # Locally computed
-sha256  bc673c04375a1a3f0808c27ba8f0411ab811ad390a8740318ccb9c60fad8fd77  Python-3.13.10.tar.xz
+sha256  16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2  Python-3.13.11.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6200b8af4e..0189a505b4 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
