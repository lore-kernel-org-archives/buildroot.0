Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3C1C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6CD160EBC;
	Fri,  3 Jul 2026 14:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0HGI3tQ2XG4; Fri,  3 Jul 2026 14:28:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FBFE60B22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088926;
	bh=Q8a4UATLUtUYQYq48BDF9Zm1b71FameJlXiOnCQRMMw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kAJ3kJ5ui/LGGXaGbz47lBAaif/KlIMP4HhewsocQYDGBsYF5vO5dkQCOyG3Kkhmf
	 xskADZPixs62NkP/7m4h26Kror3XyraHaImvXMzvknJ+SNracveiZTZQA6VtCi0esS
	 6y65JMkz/X5x+xfSIA0epfcn0lNXGr166VSN/6gxyjMTUgd967Fvw+t4oWEWy6Np6L
	 mr1YR+7jPpEobMcf10JgkwvSvrrghr0k9H4FoirVNiVoKix/2IeVR384MFwRfakOyZ
	 RCtMPu7kWr2MmjSpw1jBeaXDXyCZFxHWOz0tALCU3iv0Eh9WJ6M4FfZ9pjtnp5tGK9
	 F/sGCOrOcDx/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FBFE60B22;
	Fri,  3 Jul 2026 14:28:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA275363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC60740EA8
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7kNWUhqepy3 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C899A41195
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C899A41195
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A409864A8; Fri,  3 Jul 2026 14:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:49:31 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: cfe9d0e7cfaba645399990eaa5afa4041a8cd9c0
X-Git-Newrev: 4def9390ab12747e87eeb3e27e625c737c104aa4
X-Patchwork-Hint: ignore
Message-Id: <20260703142758.6A409864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/cpp-httplib:
 security bump version to 0.48.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4def9390ab12747e87eeb3e27e625c737c104aa4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/yhirose/cpp-httplib/releases/tag/v0.48.0
- this bump includes a security fix for the Mbed TLS and wolfSSL
  backends which are unused by buildroot
https://github.com/yhirose/cpp-httplib/releases/tag/v0.47.0
- this bump includes a security fix for the Mbed TLS and wolfSSL
  backends which are unused by buildroot
https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.1
https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.0
- this bump includes a security fix
https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.1
https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.0
https://github.com/yhirose/cpp-httplib/releases/tag/v0.44.0
- fixes CVE-2026-45372 & CVE-2026-46527
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.4
- fixes CVE-2026-45352
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.3
https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.2

https://github.com/yhirose/cpp-httplib/compare/v0.43.1...v0.48.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 614c32d2dd21eee612830e2608adc7aff3bef64d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index f3e05951e9..842b96f3eb 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  000832a5b50b67b82a77845c09d832f6e492011cd0ef1d4f72f808eb6a4fbeb3  cpp-httplib-0.43.1.tar.gz
+sha256  d9ed142d319c6e19a961f477257e67f846909ce15288502188df2281941be84e  cpp-httplib-0.48.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index e8bc0a56fe..94f270df94 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.43.1
+CPP_HTTPLIB_VERSION = 0.48.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
