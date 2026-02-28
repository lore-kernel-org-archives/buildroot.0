Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F85EEF31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB7F380D21;
	Thu,  5 Mar 2026 08:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byRYJdFxQz7t; Thu,  5 Mar 2026 08:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D31C880D82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697746;
	bh=oMou4EqSq2K/XczGeJxcIWg1E0rnwloa/PlYxFYK6r4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oB2dMYSJDtnB9LfI+LI1hCpt5bUbR7srmy6JNyNzap5kLW4E8RpSxicbOh7QvEdvA
	 fySzKeVta9NHD1HXJeV+IcLKOckj9wmE5BcCuojFHq954A++BWTCSI9SBuJzAHa5LU
	 +GxralNPKnFvo79L02CQtwpLoB0y0yf1vz/B1WjuMg91I+JTqeXuSmNKIKF62Puphe
	 lR4o0yuYO5lbDANpBcp8jsf9iDCKNRxYM/ErQCB02BjYx3mbVbePjBYOj8/pWksxN1
	 EF61WhrIDMwm5++ctkfdf74KD0eIxD1t+99X9G3P3eYEJ260ZmYs82YSZVdXYH371V
	 Knx8WmjDBLqHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D31C880D82;
	Thu,  5 Mar 2026 08:02:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21AB234F
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 693476065A
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mN7dE9Ur1Q1Y for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 709E1605EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 709E1605EE
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C6D1805FE; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 15:52:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a26c13c8e15efdd3f2548d261e5df29f9ff5ecba
X-Git-Newrev: 5cdd2f3a506318b25840b294e287cec72b215cb1
X-Patchwork-Hint: ignore
Message-Id: <20260305080208.7C6D1805FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkrb5: bump version to 1.22.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5cdd2f3a506318b25840b294e287cec72b215cb1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://web.mit.edu/Kerberos/www/krb5-1.22/README-1.22.2.txt

Updated license hash due to copyright year bump:
https://github.com/krb5/krb5/commit/21a2231e9e906f2f5e84694ec211755bb1980624

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libkrb5/libkrb5.hash | 6 +++---
 package/libkrb5/libkrb5.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 14fb45ef48..93b02362f6 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# from https://web.mit.edu/kerberos/dist/krb5/1.22/krb5-1.22.1.tar.gz.asc
+# from https://web.mit.edu/kerberos/dist/krb5/1.22/krb5-1.22.2.tar.gz.asc
 # with key C4493CB739F4A89F9852CBC20CBA08575F8372DF
-sha256  1a8832b8cad923ebbf1394f67e2efcf41e3a49f460285a66e35adec8fa0053af  krb5-1.22.1.tar.gz
+sha256  3243ffbc8ea4d4ac22ddc7dd2a1dc54c57874c40648b60ff97009763554eaf13  krb5-1.22.2.tar.gz
 
 # Hash for license file:
-sha256  83914195f655de4f4970014a26f38b16bf4c5ff357ea51645ca2aea3a92764eb  NOTICE
+sha256  d37fcb886de2ad1c602f61c99c6893bcbd9a1949f54d9a6bb40d191204eb605e  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index ede0b8afd3..6bf08a2516 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBKRB5_VERSION_MAJOR = 1.22
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).1
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).2
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
