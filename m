Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B264C44508
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 09:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 228D660756;
	Tue, 14 Jul 2026 09:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-erT6GsVpv8; Tue, 14 Jul 2026 09:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49119608A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784021913;
	bh=FIzEBUI0ix5+T/NCMn75J72MHybdwqW54nEOnfM5t30=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HNjCtOvQ9Q717oxT1dh4Em6XCMylXjpP2xFwFUqAItFeKuVRtE9O5HhCI6yGC6Piu
	 OXXEeECH5n3otb9cRDbueKmNWFlsNC6iA3iUAnqGmVwelN7padO2IS0aEA8rp8vjtI
	 WJJ6kJFQ0zUdUEFSpHJghvY/zqNO+twHWpNCAiYbeN2nM3Eq8JcsAV25BaZB1NcBhS
	 HqKZpZ+E0hHKXjx0jVly9vXzsnAf1hLa/zT3B16KlS+cEmPQ16EWl/WbSXhwOph1qO
	 Qo+UrZdEUAdB5Ek9aeDQhEpqsUNcc6/aR+sPIKyeer1GjZ5326BgZcFZqyOV4WCQL5
	 Yj+dHQsy06stw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49119608A8;
	Tue, 14 Jul 2026 09:38:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28F0FB88
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D5E1406A3
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tp1pdUGysNDI for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 09:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31F9C405BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31F9C405BB
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:38:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C4FF88840; Tue, 14 Jul 2026 09:37:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 11:36:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67b9534b382d251e6adea2fcbaa852fca9957633
X-Git-Newrev: fe1f45c1330f5975722c416e4d1c518471e49307
X-Patchwork-Hint: ignore
Message-Id: <20260714093755.7C4FF88840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ogre: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fe1f45c1330f5975722c416e4d1c518471e49307
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Vulnerabilities such as [1][2] are assigned to the ogre package with the
cpe: ogre3d:ogre.

To correctly match against those vulnerabilities the CPE_ID_VERSION uses
the version without the 'v' prepended.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-11014
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-11017

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ogre/ogre.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index f3e3fc1d8e..4f19b285be 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-OGRE_VERSION = v14.4.1
+OGRE_VERSION_UPSTREAM = 14.4.1
+OGRE_VERSION = v$(OGRE_VERSION_UPSTREAM)
 OGRE_SITE = https://github.com/OGRECave/ogre
 OGRE_SITE_METHOD = git
 OGRE_LICENSE = MIT (main library, DeferredShadingMedia samples), Public Domain (samples and plugins)
 OGRE_LICENSE_FILES = LICENSE
 OGRE_INSTALL_STAGING = YES
+OGRE_CPE_ID_VENDOR = ogre3d
+OGRE_CPE_ID_VERSION = $(OGRE_VERSION_UPSTREAM)
 
 # Download with imgui submodule (https://github.com/ocornut/imgui
 OGRE_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
