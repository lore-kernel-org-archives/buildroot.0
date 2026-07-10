Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2325C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 23:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B0A760AA5;
	Fri, 10 Jul 2026 23:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MT_ROnxWw5Sz; Fri, 10 Jul 2026 23:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5222460A8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783724430;
	bh=+c4M3uV9o3d0ku1nu42K4cNg7+0rDEfJDx3WuzshT4o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GVec6+r+Ra0KlKQkyNzdqIsFMIQlfhbq47kpaRhpiwCRR5kAI+Fx73YMgZKc0rbaO
	 AdtccI1HgHP1LcoBs4gpWENAeJZFfF3HgMq8HPZyWRM/GJt4AYFDRsB9ymeHGXpDMh
	 6RhL8SJ+/w+NvjTgAuD0RmKrkAJsaXxYGl2epzgqlObYu88HXC3yXvwZKb7vEFkdTp
	 81om+rQ+YYv4PC3aUClzPzO3Qg+cTFsfbY06NZjJ0BpDKQJcHnjcL1qpOnVALd1lGQ
	 uWweyU/T0pUQ7M6FwftIh4Pm6bZMBIfaSSGmhu16zSBBnxL7AGGdgd2aUn/yoKC70L
	 LXSB4ooXoSadw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5222460A8D;
	Fri, 10 Jul 2026 23:00:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74E13372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7291040394
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_mO3jXzZuDt for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 23:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C78ED400A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C78ED400A8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:00:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B4EB88717; Fri, 10 Jul 2026 22:59:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Jul 2026 00:38:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f42ee2bef29857aabb787761ac6ee10eb2175fcc
X-Git-Newrev: 57795860f563b2e5cff37d1720a2bacf9c582336
X-Patchwork-Hint: ignore
Message-Id: <20260710225952.6B4EB88717@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p11-kit: enable host build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4322562267605051283=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4322562267605051283==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/57795860f563b2e5cff37d1720a2bacf9c582336
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable to build p11-kit on the host.
This is to support enabling pkcs11 in host-gnutls.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/p11-kit/p11-kit.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 68b1894183..4f4b76d543 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -44,4 +44,13 @@ P11_KIT_CONF_OPTS += \
 	--without-libtasn1
 endif
 
+HOST_P11_KIT_DEPENDENCIES = host-pkgconf
+
+HOST_P11_KIT_CONF_OPTS = \
+	--without-libffi \
+	--without-trust-paths \
+	--disable-trust-module \
+	--without-libtasn1
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))

--===============4322562267605051283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4322562267605051283==--
