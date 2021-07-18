Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D11C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:44:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AAB460F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AAB460F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 429F24225F;
	Tue,  3 Aug 2021 23:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UofE_IxGLsNa; Tue,  3 Aug 2021 23:44:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 807A642262;
	Tue,  3 Aug 2021 23:44:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53C521BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4453A40EB4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78RMjHaLoabz for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D7CE40EB0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BDEB187059; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 19:53:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d8f5a017b83265f96e154ac0e75ecb5a6fbdf8a5
X-Git-Newrev: a6855bb94a815de820374d5ee95d6a4a0af66b3d
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.BDEB187059@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vala: bump to version
 0.52.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a6855bb94a815de820374d5ee95d6a4a0af66b3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update patch

This will fix the following build failure with gssdp 1.2.3 which is
raised since commit 7a2f73e9930d3e46f1530aa865675439adc0e162:

FAILED: vala/gssdp-1.2.vapi
/home/buildroot/autobuild/run/instance-1/output-1/host/bin/vapigen --quiet --library=gssdp-1.2 --directory=/home/buildroot/autobuild/run/instance-1/output-1/build/gssdp-1.2.3/build/vala --pkg=gio-2.0 --pkg=libsoup-2.4 --metadatadir=/home/buildroot/autobuild/run/instance-1/output-1/build/gssdp-1.2.3/vala /home/buildroot/autobuild/run/instance-1/output-1/build/gssdp-1.2.3/build/libgssdp/GSSDP-1.2.gir
GSSDP-1.2.gir:1656.5-1656.29: error: unknown child element `docsection' in `namespace'

https://github.com/GNOME/vala/blob/0.52.4/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/e531029f75c8d6886f797b5bd01795d16f6848f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vala/0001-dont-add-dirty-to-valac-version.patch | 17 ++++++++++-------
 package/vala/vala.hash                                  |  4 ++--
 package/vala/vala.mk                                    |  4 ++--
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/package/vala/0001-dont-add-dirty-to-valac-version.patch b/package/vala/0001-dont-add-dirty-to-valac-version.patch
index a2a0623369..8d878cd495 100644
--- a/package/vala/0001-dont-add-dirty-to-valac-version.patch
+++ b/package/vala/0001-dont-add-dirty-to-valac-version.patch
@@ -11,15 +11,18 @@ The effect is that valac gets built as being version x.y.z-dirty, which
 breaks programs (such as Midori) that explicitly check for valac-x.y.z.
 
 Signed-off-by: Simon Dawson <spdawson@gmail.com>
+[Fabrice: update for 0.52.4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 diff -Nur a/build-aux/git-version-gen b/build-aux/git-version-gen
 --- a/build-aux/git-version-gen	2010-08-15 12:49:03.000000000 +0100
 +++ b/build-aux/git-version-gen	2012-05-14 10:17:19.977204570 +0100
 @@ -135,7 +135,7 @@
-     *) # Append the suffix only if there isn't one already.
- 	case $v in
- 	  *-dirty) ;;
--	  *) v="$v-dirty" ;;
-+	  #*) v="$v-dirty" ;;
- 	esac ;;
- esac
+       *) # Append the suffix only if there isn't one already.
+           case $v in
+             *-dirty) ;;
+-            *) v="$v-dirty" ;;
++            #*) v="$v-dirty" ;;
+           esac ;;
+   esac
+ fi
  
diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 319c7ef2f4..7f3a099940 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/vala/0.46/vala-0.46.6.sha256sum
-sha256  ef31649932872f094971d46453b21c60a41661670f98afa334062425b4aec47a  vala-0.46.6.tar.xz
+# From https://download.gnome.org/sources/vala/0.52/vala-0.52.4.sha256sum
+sha256  ecde520e5160e659ee699f8b1cdc96065edbd44bbd08eb48ef5f2506751fdf31  vala-0.52.4.tar.xz
 # Locally computed
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 93a304f19c..94e18d349b 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALA_VERSION_MAJOR = 0.46
-VALA_VERSION = $(VALA_VERSION_MAJOR).6
+VALA_VERSION_MAJOR = 0.52
+VALA_VERSION = $(VALA_VERSION_MAJOR).4
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
