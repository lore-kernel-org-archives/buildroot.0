Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE42C5CFDB
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 09:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7EED60E0F;
	Sat, 15 Aug 2026 09:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgeCdpdEioiA; Sat, 15 Aug 2026 09:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A037960DE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786785668;
	bh=2lJBfIz2cF4mYRLElrULo9w1MFWvYo+bitPqefK0MkM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J5jBVFkfNjk060AFenlOsWSeTbmsNAa8Tx+VGnrzgCew1K5i6MBbx7tGLnbHTqiyv
	 Arq7bwavwMfhV7RztWFxBKdMg1+iPD28gt3GrQdA4xQITU1r/UgwlNSC0i8EQbZMBD
	 RxYCB55QRWIPr7qN/dVrrF/qaVzCEl2O7HQOPnbFBh6eNAVOOWHACqwRl8IoeXoP7U
	 MA/IDxD5usxWDaQEweydiKUxcF/Ic6dbBJAzWipWjd3DLbj+dnA65uEasuxp2fQ044
	 Gtj/8E81S4Zg4JWvv1Cz9I4pkni5ynkDeIRjgQo2QV3nWSn/e6C7fjk3FzZenr3EPG
	 GrcTe+XAK/Kzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A037960DE6;
	Sat, 15 Aug 2026 09:21:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83C18139D
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 655DE4004E
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDu01QkJ9RnT for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 09:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4DA54005A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4DA54005A
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 09:21:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 510B5883DC; Sat, 15 Aug 2026 09:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 11:16:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55cb1e8eeab72d9c4bd17c24de3c13aa97c43e97
X-Git-Newrev: 19d11b523530f0966164e775b5955d51e138bad6
X-Patchwork-Hint: ignore
Message-Id: <20260815092010.510B5883DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsecret: update project URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/19d11b523530f0966164e775b5955d51e138bad6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libsecret/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
index 04a3e46fe7..8db083b1c2 100644
--- a/package/libsecret/Config.in
+++ b/package/libsecret/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_LIBSECRET
 	  using DBus. gnome-keyring and ksecretservice are both
 	  implementations of a Secret Service.
 
-	  https://wiki.gnome.org/Projects/Libsecret
+	  https://gitlab.gnome.org/GNOME/libsecret
 
 comment "libsecret needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
