Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAC7E8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B04D8407F7;
	Fri, 26 Dec 2025 18:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6B_HsVZ2a6U; Fri, 26 Dec 2025 18:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBC6340730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773267;
	bh=21r0TMhAWY15sQMecbX61a7p7z8jFacEVSxSk2kEMO0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lu16v4fAzNXfneluQ5PWJjkuhK5a1JlAfixN7JOAjV8SfVAwVhzdJ3zTv2AvMNJdf
	 7u6hRl9AwgPZrtjQnOpior5EOOoiOZS/sDe5IJv2/jXQTv1xdpMpoBmNuO153YDhpr
	 kTNLvZEJRJjoFsKHZbojUNWV0WcOya7HLyehJJ+rcujgWHskJavN59kXcQCKrAqO2c
	 FfYeY2unhyoxHG/R3CaRUw4hxZTdUyouOpuDTWrNZ1xDwq7bdLCPEAMG62ZLawEyHO
	 f6T+ePjK1501ww3TlQ73h7lufzO4qw3v5cT6fpXy+ntwiRCFZtGXFfrDTfgFk+c6pH
	 0xa49jdhPkmLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBC6340730;
	Fri, 26 Dec 2025 18:21:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BDF1B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E71F680C43
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XbvNj0NUSuo for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC628099C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AC628099C
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74C8F876F8; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77b6899c7d7252514f3ef26c7137cba50c42c1b8
X-Git-Newrev: b31dfc706cc86a9d658caeabeac55ce1c1957442
X-Patchwork-Hint: ignore
Message-Id: <20251226182054.74C8F876F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zziplib: bump version to 0.13.80
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

commit: https://git.buildroot.net/buildroot/commit/?id=b31dfc706cc86a9d658caeabeac55ce1c1957442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/gdraheim/zziplib/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zziplib/zziplib.hash | 2 +-
 package/zziplib/zziplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zziplib/zziplib.hash b/package/zziplib/zziplib.hash
index 3bff51f07f..1918f00029 100644
--- a/package/zziplib/zziplib.hash
+++ b/package/zziplib/zziplib.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  319093aa98d39453f3ea2486a86d8a2fab2d5632f6633a2665318723a908eecf  zziplib-0.13.74.tar.gz
+sha256  21f40d111c0f7a398cfee3b0a30b20c5d92124b08ea4290055fbfe7bdd53a22c  zziplib-0.13.80.tar.gz
 sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  docs/COPYING.LIB
 sha256  c2aa7d58cebd24cb877bbf11d6b13a4bb7cd08b9d7db5d3037ca06c46bf4cfd8  docs/COPYING.MPL
 sha256  9418aca218090f0bebfa91298c8145c7342de095eced3d72ea241c178df59368  docs/copying.htm.md
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index ba902b84fd..3624d5840c 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZZIPLIB_VERSION = 0.13.74
+ZZIPLIB_VERSION = 0.13.80
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
