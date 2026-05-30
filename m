Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35D1CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ADD66F4EE;
	Sat, 30 May 2026 13:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7YJASakxMJQ; Sat, 30 May 2026 13:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B332E6F56D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149156;
	bh=yuv8qXvhmNUbnOxsHuvgbV5nOQe5cFDOQ9/XLpJ5mPI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EttlAseYoxuzPZnhvpO0Hwulpkh2N9PZgN7lnqXBOYbSpY+S10p2w95+DPEb5qF5H
	 UbiTkK0J7Y/3v7noq+v25CBDdR7oHzYL6D9JG8wgC175uC3HFdRP5dSydJG1GtACyA
	 Vctrr5iZbznkswQThX8wj0KEYusYbrjJyC2xmXxgFQoGnScl/SqDuyUYIuOFz4KjeM
	 9q/btGcWgZDpem4P62AjMz+tTjvbGa9LgLh1c+/SsX6LRnF0FY3CFyLLpdiWu00UZV
	 ti/Xf02I3ZXZv5c2LuS8jd9Yhqn9c+CeMJWeEKUYRuzn1rPr/02YfWHP0UnRa98n1F
	 NE9cie97dEiLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B332E6F56D;
	Sat, 30 May 2026 13:52:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EEEB6218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC25542671
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmsmNxzVy5XB for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 201384025D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 201384025D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 121228750A; Sat, 30 May 2026 13:52:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8c73968354a75608b24ea59877471f4568cc824e
X-Git-Newrev: a6e8c07a330a389e9578d8f1110e41becac264d2
X-Patchwork-Hint: ignore
Message-Id: <20260530135221.121228750A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/autoconf: bump version
 to 2.73
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6e8c07a330a389e9578d8f1110e41becac264d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://lists.gnu.org/archive/html/autoconf/2026-03/msg00060.html

Rebased patch due to upstream commit
https://cgit.git.savannah.gnu.org/cgit/autoconf.git/commit/build-aux/git-version-gen?id=2f1f41b8d3cf38101c6dce30e6319402f8c44b83

Added Upstream: tag to patch.

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                   |  1 -
 package/autoconf/0001-dont-add-dirty-to-version.patch | 12 ++++++++----
 package/autoconf/autoconf.hash                        |  5 +++--
 package/autoconf/autoconf.mk                          |  2 +-
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 139a5ee81c..b5c30bf691 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -191,7 +191,6 @@ package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch lib_p
 package/at/S99at lib_sysv.Indent lib_sysv.Variables
 package/attr/0001-build-with-older-GCCs.patch lib_patch.Upstream
 package/aumix/0001-fix-incorrect-makefile-am.patch lib_patch.Upstream
-package/autoconf/0001-dont-add-dirty-to-version.patch lib_patch.Upstream
 package/automake/0001-noman.patch lib_patch.Upstream
 package/avahi/S05avahi-setup.sh lib_sysv.Indent lib_sysv.Variables
 package/avahi/S50avahi-daemon lib_sysv.Indent lib_sysv.Variables
diff --git a/package/autoconf/0001-dont-add-dirty-to-version.patch b/package/autoconf/0001-dont-add-dirty-to-version.patch
index a1a50d2838..4ce3616d9d 100644
--- a/package/autoconf/0001-dont-add-dirty-to-version.patch
+++ b/package/autoconf/0001-dont-add-dirty-to-version.patch
@@ -10,19 +10,23 @@ commonly done in buildroot).
 The affect is that autoconf gets built as being version 2.65-dirty, which
 breaks programs (like Python) which explicitly checks for autoconf-2.65.
 
+Upstream: Not applicable (Buildroot specific)
+
 [Gustavo: update for autoconf 2.69]
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Bernd: rebased for version 2.73]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 
 diff -Nura autoconf-2.69.orig/build-aux/git-version-gen autoconf-2.69/build-aux/git-version-gen
 --- autoconf-2.69.orig/build-aux/git-version-gen	2013-06-27 11:31:02.340200154 -0300
 +++ autoconf-2.69/build-aux/git-version-gen	2013-06-27 11:31:13.734577033 -0300
-@@ -210,7 +210,7 @@
+@@ -234,7 +234,7 @@
        *) # Append the suffix only if there isn't one already.
            case $v in
-             *-dirty) ;;
--            *) v="$v-dirty" ;;
-+            #*) v="$v-dirty" ;;
+             *-dirty | *-modified) ;;
+-            *) v="$v-modified" ;;
++            #*) v="$v-modified" ;;
            esac ;;
    esac
  fi
diff --git a/package/autoconf/autoconf.hash b/package/autoconf/autoconf.hash
index f94b2d9de5..96f36ec3bd 100644
--- a/package/autoconf/autoconf.hash
+++ b/package/autoconf/autoconf.hash
@@ -1,4 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256  ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a  autoconf-2.72.tar.xz
+# From https://lists.gnu.org/archive/html/autoconf/2026-03/msg00060.html
+sha256  9fd672b1c8425fac2fa67fa0477b990987268b90ff36d5f016dae57be0d6b52e  autoconf-2.73.tar.xz
+# Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYINGv3
 sha256  1f1cde9fb68b9b3cff18c420894bec5bd4defacd700b7d13df54a887301e5350  COPYING.EXCEPTION
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 48bfc80e7f..6f29bba146 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_VERSION = 2.72
+AUTOCONF_VERSION = 2.73
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.xz
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
