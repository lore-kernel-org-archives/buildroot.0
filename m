Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFD9C77B72
	for <buildroot@archiver.kernel.org>; Thu, 20 Apr 2023 17:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC3C941DDB;
	Thu, 20 Apr 2023 17:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC3C941DDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7wXjSsq2p2L; Thu, 20 Apr 2023 17:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A095404B4;
	Thu, 20 Apr 2023 17:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A095404B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E43F11BF3DC
 for <buildroot@lists.busybox.net>; Thu, 20 Apr 2023 17:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDEBF404B4
 for <buildroot@lists.busybox.net>; Thu, 20 Apr 2023 17:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDEBF404B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMVQAbYYR3ww for <buildroot@lists.busybox.net>;
 Thu, 20 Apr 2023 17:00:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 280F940412
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 280F940412
 for <buildroot@buildroot.org>; Thu, 20 Apr 2023 17:00:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.48]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mw9UE-1q8IwT2Ltk-00s9jb
 for <buildroot@buildroot.org>; Thu, 20 Apr 2023 19:00:05 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 20 Apr 2023 19:00:05 +0200
Message-Id: <20230420170005.13243-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Uq1SahzKJLaWpNkDCyQBkfuZKSxOMBF7f9w1zvfCyoxcEuoPuEQ
 Ah8ML5IPv8OhYP9TyITWahdu9T8WROMGrWNiEDOgSk98TPuDVRabjLxC/rj7//HZjtQjGnP
 3B91qtzUGwBud1HoF0rHVfb9EQWOCfoK7lYtRM4ydxkEkDnmBs4nCKbr0N0CCXoYDfgz2Pd
 DVA3upIvyk318WAtSqtvQ==
UI-OutboundReport: notjunk:1;M01:P0:VdHpoGmNByg=;/rc5kmOCDO0ElSDT15IRZuiiRjh
 0QmRt/IDsTYigodi3eo29AyRrNEYsPYnZ0Q/8VEv0UbH6IX4s1pFAYq1Kr9xf2EooAygN14dy
 OzWbjD4tjDWlUazOIWymDlBLzwh/RRdi0k7JQ8+WPKNwDldhAqcwpw5OdgmE1vVF0MmbKmJ5j
 +vFAHc6hzJs1D7b67FFILhyJezOzsgCrpPwXXttU1MRwh5CpCMPIkQHy3a35Yg6GGxOuFalOG
 mJPQ9+kodPrB9Zei6owIpqPlLhtId5y/38iQKGKwtFKJI/Dso6z2ctqFRWkCTh5jdQIWbR5y9
 PHGjahXoGdKIUZsxZE1khDuRPcbibs3GT5vsMvLYJv70XQvdUZfr5iHnmB+UryAVVLACv0+ul
 gyVSZAGb/a8GjH3/nxIzloTPOM2wC0jxZQfLE/WLSyUS/HpRPja/4heK03jjFYp7EeMsUYSEP
 2WkIa938rgDHAnQYawR+42JkfrWjBtb5UnaKL6gnReNZ/7pkEaYsOhdrtpqS9xtso/K1I9nf9
 RpYk1FlWL7JDeUwM6BcATWX37Ud//iKMLMDEZcAL3i9vN5/yogUmdOR8cCKCrVs1PaqzOoOXG
 bRsgkhZVyCHFrHS78kIVEyeCjnn/n5A3wPbmBnptpTqr87IfF9erzBeWbDcsUdhQycGlLOKsz
 EaUqvXdDN9FE3+dLTDOBqMjoLZulcfL/I6knKpQmiPIfd7McmSHeXAqlqW2iKDKuU5jwu2OLN
 cYIFoZaOscI3SWoDXJw0xY+GE94qYySaCbvDX6pi1PNo6FBga+ZkCiBp0bS4mK5etsfHhzqqr
 zmHG57oFjqzhQ2aRlUHphuBaN1VJcoICd7jSlhFxsJpFmEDmiGwbRjC0lO331miKZB1xdqq0W
 +RVKcf0rhZaGp+FlOQNY0lT6CSfXdydgZvteg3whkrAxa6HKmDuwIoW+iLrd8YhInJ16KA6Sv
 nGEML2EGUThPLZOiKe7WqK/AHog=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1682010005; i=ps.report@gmx.net;
 bh=68sIaK/Xx7qPDqUZ5v32YNv+S6JYl5NyaQpD9dseoa0=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=IiQCJgchWuDTHBmpmUhLogTcbLK+PQIQF7vmcahk2WVoIvI+OfHzPSgE7nLuUK/hO
 4qeEIwXQaYZT1zg5jG9wzLyPwUIjTk71yWO55AzIl8JunPmExPdoXvoRnltc2jJUPV
 qpNsa21ojtU0lGWEztu0PUiSj/7FAn5VRnSe13UxFmSYpa7C+QitXmx3Ha3VKmwGpW
 phnLvRN7V0CG2pDDLLxn64l+Tk2krm4aCVrP2bDk6lpROtPUB15c56bM6KpnCiGz1V
 ozFf26ojJPy/2cUKjU+J9a8YWig/EIJGfB0xFTlga6P0ngt36RTJMXXQGrtjjgBAgH
 wl95h3nYGZhmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=IiQCJgch
Subject: [Buildroot] [PATCH v1] package/coreutils: bump version to 9.3
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

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2023-04/msg00006.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 72f63b242d..7df1048afa 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  6885ff47b9cdb211de47d368c17853f406daaf98b148aaecdf10de29cc04b0b3  coreutils-9.2.tar.xz
+sha256  adbcfcfe899235b71e8768dcf07cd532520b7f54f9a8064843f8d199a904bbaa  coreutils-9.3.tar.xz
 # Locally computed
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 9b07bb31d2..2c12e8ef2f 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.2
+COREUTILS_VERSION = 9.3
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
