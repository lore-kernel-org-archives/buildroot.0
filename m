Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F215E8FDB0
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4634740788;
	Fri, 26 Dec 2025 18:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qLNg56d5uvw; Fri, 26 Dec 2025 18:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CB1E4080E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773270;
	bh=o53F2Mq38OxBzT8oOKia+ZHgDgK+vwJdP+SdyQOplVk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k0cdh7wSTTQwzUTrif7Mc/prwwhDRhEJhsku1+E8SXrwwQsdc5FxZTHdf34FR1J01
	 c2xfCSpwwcF28LJNAuS1vWl7K1bhjHB6AdClxVxZZFKgDV2meV3jFvHJ2NwWtuhJ1N
	 DI3ZhlEuyZW0n+R/vZxmGk/eQQq8TPXPAuSc8ZqWaWxt/v30Q+6SPJ3uiUrK2K3n/f
	 FjBqBh1OGAsSkiWFKzogbg9dbw3UoMgFqSHt3UqMYhrj3675k4aAQ27Jn6Cfodz/9H
	 YdTBxHn+Oap3cXgLC9zDki8uIcvSrAt/DDJaDwWiClqd2KNmPei2ek4lLQH0/DHVhb
	 qPaGOD9ywcYgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB1E4080E;
	Fri, 26 Dec 2025 18:21:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8E3EB9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52AFF80B00
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pGfht7Cg9bY for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6FC880ACF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6FC880ACF
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3A7783371; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdccb251a2d6c45e1faf113580ec819b63fc509e
X-Git-Newrev: 488d15b2ae0f059d1634cef0ccfe5500108ad920
X-Patchwork-Hint: ignore
Message-Id: <20251226182054.D3A7783371@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pinentry: bump version to 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=488d15b2ae0f059d1634cef0ccfe5500108ad920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=blob;f=NEWS;h=8bf192539fed9104a1ff431c6dcc3add7fb6771c;hb=d7660807593067d5cd7150b7d4d987d60957b5cb

Updated qt5 configure options due to upstream commit:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commitdiff;h=9fbecc223cf1755ac12f1a8a0cbbff54aa22a325;hp=da3144a702acab04cc5cc6812dcdfbfc78e1383c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pinentry/pinentry.hash | 4 ++--
 package/pinentry/pinentry.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index 3f02eec737..4a24631ae8 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  fb0bbb88211558c8f7e652b4b6a675b1972fba04  pinentry-1.3.1.tar.bz2
-sha256  bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04  pinentry-1.3.1.tar.bz2
+sha1  ca7c502f347f248377842f7e68df5e971059e4db  pinentry-1.3.1.tar.bz2
+sha256  8e986ed88561b4da6e9efe0c54fa4ca8923035c99264df0b0464497c5fb94e9e  pinentry-1.3.2.tar.bz2
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index ef17df7657..88a20ec3de 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 1.3.1
+PINENTRY_VERSION = 1.3.2
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
 PINENTRY_LICENSE = GPL-2.0+
@@ -62,10 +62,10 @@ endif
 
 # pinentry-qt5 backend
 ifeq ($(BR2_PACKAGE_PINENTRY_QT5),y)
-PINENTRY_CONF_OPTS += --enable-pinentry-qt
+PINENTRY_CONF_OPTS += --enable-pinentry-qt5
 PINENTRY_DEPENDENCIES += qt5base
 else
-PINENTRY_CONF_OPTS += --disable-pinentry-qt
+PINENTRY_CONF_OPTS += --disable-pinentry-qt5
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
