Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BF1CD6E52
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 062046F57A;
	Sat, 30 May 2026 13:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0H8eHA4xK16M; Sat, 30 May 2026 13:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D951A6F4A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149159;
	bh=R6jJ427JQAyFp2sX2V+dFCoqFhvjKfpqbNko3hp5KUY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CbAt8Y4Jr8Kn/PSu4sFH8FUNV1MFO+a7hibJ/LqhPNU8xenDR3f2Pd4OhH/w/TnM6
	 YitQX6QLgQBnqd92WLyQOODSDCikMKqP/SVzB1A4lNNyuiWyQE5kGeKa7Q6tZiKZpl
	 jk7/vtZS0liW2kU6gekABLfUk1DKulMAwJ6tHjIxmLn+h5xUAxdUX8rkowWmw4w6r7
	 wbWdiwJ7u5w/tE8SwMR9i7uWPXZEJJZpysfamDsdoADh8SA6WIUoG3fViaaSaTpfqh
	 gGfLNPLDGu7ku5dUTLrx22hfn6hvEQ8lkzGKh3lbwR9zh5jmLgkaROllx4nBiNf9o9
	 crwahGy+yEJrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D951A6F4A7;
	Sat, 30 May 2026 13:52:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E41BF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8069852B5
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOZmiwkO7JZC for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33BEB82664
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33BEB82664
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 342718750D; Sat, 30 May 2026 13:52:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e4ac5015b994205f9b879912e703e5ab2a36a424
X-Git-Newrev: e9f6b03f032e87b21c33e27b5f0e927d7bca9c77
X-Patchwork-Hint: ignore
Message-Id: <20260530135221.342718750D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dump1090: disable
 -Werror
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9f6b03f032e87b21c33e27b5f0e927d7bca9c77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Fixes build error with gcc 16.x:

interactive.c: In function 'interactiveShowData':
interactive.c:334:49: error: '%5d' directive output may be truncated
 writing between 5 and 11 bytes into a region of size 7
 [-Werror=format-truncation=]
  334 |                 snprintf(strFl, sizeof(strFl), "%5d ", convert_altitude(modeC * 100));
      |                                                 ^~~

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dump1090/dump1090.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index 1ecdfca47f..9a18c356cc 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -11,6 +11,11 @@ DUMP1090_LICENSE_FILES = LICENSE
 DUMP1090_DEPENDENCIES = host-pkgconf ncurses
 DUMP1090_MAKE_OPTS = BLADERF=no CPUFEATURES=no LIMESDR=no
 
+define DUMP1090_NO_WERROR
+	$(SED) 's/-Werror//' $(@D)/Makefile
+endef
+DUMP1090_POST_PATCH_HOOKS += DUMP1090_NO_WERROR
+
 ifeq ($(BR2_PACKAGE_HACKRF),y)
 DUMP1090_DEPENDENCIES += hackrf
 DUMP1090_MAKE_OPTS += HACKRF=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
