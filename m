Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AC2D3F09A
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB6C8408E3;
	Wed, 28 Jan 2026 17:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZfKXtzem4W2; Wed, 28 Jan 2026 17:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A275A408F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620841;
	bh=a2+w9oJu1AjOoV9DXvwITK/4DRjy1NjAVNa3ZqwK0As=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HcSPsR5YmRYXuTX6Mb7vdnFQ7XZzwnzqdKzG9sav/oISKdD1rgb0chKmyvBPFWZSD
	 awgF16M03CinsCH5mwdsnboFxPVvCcOCLFZr5C5pjJW3lBDzErpn29BmcOMDTBs4/m
	 8ZNmx4ZnjnShDn4+GXRVXeqTA7qeTFgS+4l4DCOz0rRI+rnaPec0Iq1yq84k3BuRsM
	 TMPWa0oPr5ekrwFehRhx7ErhJkH4g2S8Xl1JVsA8DqU4dC8FDVoeM9H17iTqUvqRCM
	 TK0Z1OlDTIlRlaH+HRUytyTkfe+MwSnRhQ7bSYvLAe3Yhm/K1U9BzbpkwbGc27Ouym
	 bgsUbprjmaQDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A275A408F0;
	Wed, 28 Jan 2026 17:20:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F7D01AD
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83232408F3
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fy9U6j9pyN7 for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B13D3408E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B13D3408E3
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A81B885FE9; Wed, 28 Jan 2026 17:20:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:52:03 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 40642f0d986bc1f518a70a622c1542fbcf65cbe7
X-Git-Newrev: 9b695b085a3a61bccf4cd4f2d921ca1caa7d550d
X-Patchwork-Hint: ignore
Message-Id: <20260128172037.A81B885FE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcec: remove
 optional dependency to lockdev
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b695b085a3a61bccf4cd4f2d921ca1caa7d550d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Buildroot commit bf1c9828f2c7ef37a0af4da5532472fb7e03ba67 bumped libcec
to version 4.0.2 that includes upstream commit
https://github.com/Pulse-Eight/libcec/commit/ff86c07a16a6a05be936b27e3f390b61f2ba4d2b
which removes the optional dependency to lockdev:
https://github.com/Pulse-Eight/libcec/blob/libcec-3.1.0/debian/changelog.in#L19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e1ef4e191bf5cd94db019412dd3dd3bf5ee15f80)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcec/libcec.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 33e0463eb8..49b5c619c5 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -12,10 +12,6 @@ LIBCEC_LICENSE_FILES = COPYING
 LIBCEC_INSTALL_STAGING = YES
 LIBCEC_DEPENDENCIES = host-pkgconf libplatform
 
-ifeq ($(BR2_PACKAGE_LOCKDEV),y)
-LIBCEC_DEPENDENCIES += lockdev
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBCEC_DEPENDENCIES += udev
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
