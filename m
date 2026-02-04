Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825A9E95396
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FAB381DF5;
	Wed,  4 Feb 2026 13:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7ff6AbS48pA; Wed,  4 Feb 2026 13:15:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58DD581E54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770210904;
	bh=7aYarCQ/JM7zc9sOar6XZ499dx0xvP9fqMHR08SJoLY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tDS8HccBLgFWyqhRnz44z4wdTorB+RhsHvNpWXrnfZuMyuHIX6zyXPR28kmzQgPN3
	 CcnH6BAINh0v3A6qioSsykFwCGa6M9I3E1quDiACO9U+Ao2X5EKpeD8nlimb8WOnjn
	 jD+l75vnS2C1oKu4nMBgrOAYLIm/lPqKFdSDmO5Ed5Wp+VC9Qf32jjKmpAIX+qh7+H
	 k5Q6IRL5YDMZD/OBxgblXfIa4xQp+dYQZ8x/4d3hGvkuoZjueiFM+jf2dZOho1MTzb
	 CILRy1Xwza5HcZPNEE7VmpbybboIyZKK/LuteOBqEDykkw+2of1/U8SI8SgxY3EusI
	 Vc7NOfUoYce/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58DD581E54;
	Wed,  4 Feb 2026 13:15:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6446AF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46D0860ABB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8Ec-6h-Ce8a for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66B3860A56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66B3860A56
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 518E5868F1; Wed,  4 Feb 2026 13:15:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 14:14:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b009935e27aaeb4b0e527391e75d47407e77ec83
X-Git-Newrev: 5a63ee3c09e95bfd7afd7822a1a9254e361b940f
X-Patchwork-Hint: ignore
Message-Id: <20260204131502.518E5868F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: also specify the CA
 bundle location
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5a63ee3c09e95bfd7afd7822a1a9254e361b940f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When given a certificate directory with --with-ca-path, curl doesn't
list the files in that directory. Instead, it uses the certificate hash
to directly open the requested CA certificate. Therefore, putting a
bundle in that directory and removing all the individual certificates is
not possible.

In order to support use of the bundle, a separate configuration option
--with-ca-bundle is needed. With this option, it is possible to remove
the individual certificates and include just the bundle, which reduces
the size of the root filesystem a bit.

Note that the bundle is generated by the ca-certificates package, which
also installs the individual certificates and the hash symlinks. It
keeps both individual certificates and the bundle in the target.

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libcurl/libcurl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e1e5a7facb..d9a712bcb6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -58,7 +58,8 @@ endif
 ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
 LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
-	--with-ca-path=/etc/ssl/certs
+	--with-ca-path=/etc/ssl/certs \
+	--with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
 else
 LIBCURL_CONF_OPTS += --without-openssl
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
