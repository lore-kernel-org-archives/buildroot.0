Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828F9F46C59
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 16:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C85C60A9B;
	Mon,  6 Apr 2026 16:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcjnIztsucLr; Mon,  6 Apr 2026 16:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5541B60AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775494084;
	bh=YNgdZmY6AMJHIo4D9aFT5jlxm7EaLxU3U6eL+IWmMg4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bMKrZ4wdiYBJkA8C90+RrzsGbKwEhlY8f7AwAHPK5gu8dApN0wLVFjbLhvANBRAfm
	 9DLYdTJ3rLvBbTkdH3ZZsfbeJXwQGyYVLGwckPHOGMG7xXzZMfhJDef6YDH1I9K6gq
	 tBToE4f+N+P1L/CmIyk+hkvXJd0RAbRgbaOuqtIH+cl3WZiALdF/GOWxZyg3TnFD89
	 THbuI5AVE6cXdrRx39UBI5Zr0ajQjoYOAogYcHK1kVqq87HWJ8qmreC7jfEF73hcgx
	 DAyazjdlm2uFfexKUS04EViVi2m0VZVDHfYg7i9jB6Rkf8G20Ag6HDszoW0arZr2r1
	 SPywnCInudhSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5541B60AAD;
	Mon,  6 Apr 2026 16:48:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A6AD219
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BF3260AAD
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p46L18w-EmlD for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 16:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62C9E60A9B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62C9E60A9B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E36C7804E8; Mon,  6 Apr 2026 16:48:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 18:38:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37a21dc9392d9f6b755a658347449056d39c7fb7
X-Git-Newrev: ec621099904b6e8d8d16bac3b9d31954faeb98e4
X-Patchwork-Hint: ignore
Message-Id: <20260406164801.E36C7804E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/leafnode2: fix build without
 pod2man
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec621099904b6e8d8d16bac3b9d31954faeb98e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes a build error when pod2man is missing on the host:

  pod2man ./tools/lsmac.pl >lsmac.1 || { rm -f lsmac.1 ; false ; }
  /bin/sh: line 1: pod2man: command not found

Fixes:
https://autobuild.buildroot.net/results/999/9996e81429f90f4615755827ac182094d416c467/

Although the build error only occurs since 2026-03-05 it should be
backported to LTS branches because the last change to the buildroot
package dates back to 2024.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/leafnode2/leafnode2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 566aaf3d55..8c44071209 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -11,6 +11,12 @@ LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
 LEAFNODE2_DEPENDENCIES = host-pcre pcre
 LEAFNODE2_AUTORECONF = YES
 
+# pod2man doesn't work when cross compiling
+define LEAFNODE2_DISABLE_POD2MAN
+	$(SED) 's/GENERATED_MANS=lsmac.1/GENERATED_MANS=/' $(@D)/Makefile.am
+endef
+LEAFNODE2_POST_PATCH_HOOKS += LEAFNODE2_DISABLE_POD2MAN
+
 LEAFNODE2_CONF_ENV = \
 	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
