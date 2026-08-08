Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F60DC5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 17:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 676236060A;
	Sat,  8 Aug 2026 17:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alqiG4nbTOzJ; Sat,  8 Aug 2026 17:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8179F60621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786211489;
	bh=ad81lhxIR3vRbhv9By5/0a4q+obvzNt1iFdVUEfDvCk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B8VAoR0XgRDUKWoUXeUwpIr2F8FD5nTpKLZDqZQc3yPnq5+YyA7RFwMQYiX35lr2/
	 GEgBxP0XGzk/b0hJ/ABXAKjSHUszB4eqcrBxPuZaKwgUbfGe9c6CLyAMfJqPb2JUnn
	 IWONsE6h4zFm4veMOIQjQNTqPqwOvyOoul9XrfZKUdq6qOOu+gTXCZval0pEJMsOY8
	 SD5gIeAU7Zw4JKvoqd7PapG+XW0so3dQp97b4lO98KYacIrJ2WvQkkqvVA6UzP3m96
	 GKqoD+FlUzHQ7L0rxTHsl/INhiY4lImimPf4JxVXzJ5j9bDm93LQivaN7gtyPEmHZf
	 qIOZ3kthlxX2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8179F60621;
	Sat,  8 Aug 2026 17:51:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DFA5A1AF
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D19AF60621
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unTwo16pD7dt for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 17:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCFD26060A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCFD26060A
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:51:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94D278CA9B; Sat,  8 Aug 2026 17:50:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 19:51:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7343017dcd4debb020b079d74a1c94f552058961
X-Git-Newrev: 7241fb2db05ec5e6f584a3965aed483ac2d673e0
X-Patchwork-Hint: ignore
Message-Id: <20260808175040.94D278CA9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stunnel: fix STUNNEL_CONF_ENV
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7241fb2db05ec5e6f584a3965aed483ac2d673e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In commit 45d056e7bf69aca4a036aba83e2573301996e9e0 stunnel got an
update to 5.78, but missed a change in configure.ac/configure.

Update STUNNEL_CONF_ENV accordingely.

Fixes:
 - https://autobuild.buildroot.net/results/69b/69b87d600ef9fa1d4eb8f65a7282c53808faf362/
 - https://autobuild.buildroot.net/results/b87/b87040d5264befa18da213d460f28a214410386b/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stunnel/stunnel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index adae204148..ef93dc6073 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -10,7 +10,7 @@ STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
 STUNNEL_CONF_ENV = \
-	ax_cv_check_cflags___fstack_protector=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
+	ax_cv_check_cflags___fstack_protector_strong=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
 	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 STUNNEL_LICENSE = GPL-2.0+
 STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
