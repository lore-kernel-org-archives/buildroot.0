Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C37CD6E7B
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 21:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71F3C81E94;
	Fri,  5 Jun 2026 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCCTX1yxPJ5V; Fri,  5 Jun 2026 21:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96A6883955
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780694138;
	bh=ljBHftn8+ziJo72HnqaY+4YJhhL7FIEaAVUDjjPj+xI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p2oSoTsueAcvQFtQUCGnylwx9wnhzFKmH8pvj9A7U81pysU3MjypDr8O6q5xaRJEm
	 zICg97LrV2kmBTUKZ8nivzdic7c0OEd2PVmy9LklaVh7sKPPEw9mJkJDGBhjquzVju
	 wtLD9yKdR2eDV0LYbYBB7Qf78ETKWn4rzzsTDrUFeQoHvC5qExRsit6RS8yijmqfse
	 fCFYdmPOa7gQxHoQ1JldfSQ4hRvA17tZ1ILSfnhpvG9p6a1XQXAmlvkGOnH/rPmGCH
	 RAdRTuORX08vKKbVtVNxPQnYRn3EmhNxgqKiV3/c03tbDOvK+HW+49iSBlDWDn84xX
	 +5XnZsbHwh6XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96A6883955;
	Fri,  5 Jun 2026 21:15:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DD64388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2AA940765
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXhZ3K1HE904 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 21:15:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 398DB40323
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 398DB40323
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 284CF87A97; Fri,  5 Jun 2026 21:15:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 23:10:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9aefc702588c7aafb8b3bf605c4aed2ab8475ef
X-Git-Newrev: 1cc0363191c33545adfe327881b32756aef9594b
X-Patchwork-Hint: ignore
Message-Id: <20260605211520.284CF87A97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: security bump version to
 1.31.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1cc0363191c33545adfe327881b32756aef9594b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://lore.freedesktop.org/wayland-devel/aiDR_N7VUOSOfBUA@quokka/T/#u
https://seclists.org/oss-sec/2026/q2/809

Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2026-50265

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - remove release notes link to 1.31.2 in commit log
 - add link to CVE which is now assigned
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index c813993358..4ea45ead4d 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1daebac6cb5b8946139c9669a7e5c0e4c8f17320de232a6b9bf470f37dc569e4  libinput-1.31.2.tar.bz2
+sha256  01414457befc3d1c68a328ebe01eacec8e7077a4ff08e181f5659daf9f50930e  libinput-1.31.3.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 33fd012076..176a11e83d 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.31.2
+LIBINPUT_VERSION = 1.31.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
