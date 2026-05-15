Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F38FCD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 468E461510;
	Fri, 15 May 2026 09:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDeQycgiYqJ7; Fri, 15 May 2026 09:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E2C761511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839011;
	bh=9/KL7rnE4A7Ak/ZeR3w0qdjMuur3gVv468JyYZU/+aQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JcZJHbj8Qbp41q/n7WDsxN3Q5rgEht4HePVFobUHVAxoiINcVCPsiWWx4sh2WKrEn
	 K81ZTcsszpWUvN/mEXkwQWq55NEiwhi5P7iHa/reUs2BLD9hXx6F1k1PisZ35UI0BW
	 f5L1jPhbCh02lQoJSYOKY144OptfG9pY8KzWBdrgJPp9lV5CNiK4qMjlUFm5JyACS/
	 y9NSlsBpI5ICy5+GSb5/qTwdKT2wTStchQiGfSL87UZskDAFaNh3ZVw1vc4vnRC5T8
	 TzzMA5Jq20drDlD8ueelaxBn0iJ/R57E2SrtXEVxjm/a9YScaiUJsrHQgLCxZES46c
	 NOYVLoMNVPDbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E2C761511;
	Fri, 15 May 2026 09:56:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 482F0E7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DC4D41747
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTUXwvkt1ajG for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1AE14174F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1AE14174F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 131418632B; Fri, 15 May 2026 09:56:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:39:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4e05cde6527621736cb6cbbc26958adc4a9942ca
X-Git-Newrev: 7c941cb88b795e90b00892043c75c525b1d336f5
X-Patchwork-Hint: ignore
Message-Id: <20260515095634.131418632B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmbim: bump version
 to 1.34.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c941cb88b795e90b00892043c75c525b1d336f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/blob/1.34.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index d487b5156d..8e3ed5a8c4 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  7eca9f5af2eecfdb5e3a2a865a7f29d0ac9532ab187a9c6adce4d85f897eb385  libmbim-1.32.0.tar.gz
+sha256  55bb88df358f8a36b6e01e63877500d7c6420f5907d2d3101812b4912eabe08f  libmbim-1.34.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-or-later.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 190f3547ec..e2ae0d83d0 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.32.0
+LIBMBIM_VERSION = 1.34.0
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
