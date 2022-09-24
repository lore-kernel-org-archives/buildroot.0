Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19C3C32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 13:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C0B78403D;
	Sat, 24 Sep 2022 13:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C0B78403D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjzLHvBI3zEU; Sat, 24 Sep 2022 13:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A483683E76;
	Sat, 24 Sep 2022 13:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A483683E76
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83CDD1BF966
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 13:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DF3F419D7
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 13:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DF3F419D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bsoxANjuKsCI for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 13:57:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6918F419BF
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 13:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6918F419BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52CE584447; Sat, 24 Sep 2022 13:57:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 15:53:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a70659328200244c1e3c491f31b9f3a81360176d
X-Git-Newrev: 53993f25290f83d0f75dde2c923dc88f346ca02f
X-Patchwork-Hint: ignore
Message-Id: <20220924135717.52CE584447@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/double-conversion: bump to version
 3.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=53993f25290f83d0f75dde2c923dc88f346ca02f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:

    Disable quiet nan test on windows by @floitsch in #174
    Test on all platforms. by @floitsch in #175
    Fix warnings on Windows by @floitsch in #176
    Run ctests first. by @floitsch in #177
    Give shared-lib option and test install by @floitsch in #179
    Install Windows debbuger (pdb) files. by @floitsch in #178
    Add a cast to silence a signedness conversion warning. by @pkasting in #182
    Issue #184 : Fixed all -Wzero-as-null-pointer-constant warnings by @seanm in #185

See https://github.com/google/double-conversion/releases/tag/v3.2.1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/double-conversion/double-conversion.hash | 2 +-
 package/double-conversion/double-conversion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
index 8124ec2f82..a2ecd4422c 100644
--- a/package/double-conversion/double-conversion.hash
+++ b/package/double-conversion/double-conversion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3dbcdf186ad092a8b71228a5962009b5c96abde9a315257a3452eb988414ea3b  double-conversion-3.2.0.tar.gz
+sha256  e40d236343cad807e83d192265f139481c51fc83a1c49e406ac6ce0a0ba7cd35  double-conversion-3.2.1.tar.gz
 sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
index ae46fa06fe..af1fbab078 100644
--- a/package/double-conversion/double-conversion.mk
+++ b/package/double-conversion/double-conversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOUBLE_CONVERSION_VERSION = 3.2.0
+DOUBLE_CONVERSION_VERSION = 3.2.1
 DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
 DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
 DOUBLE_CONVERSION_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
