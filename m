Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CB7606A31E
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=an2vsGOr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0203406E4;
	Tue, 27 Oct 2026 20:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_7a6LE4moHg; Tue, 27 Oct 2026 20:00:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E381440699
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793131221;
	b=MCldGd07XeFMwQT9qLAH3UVIVtsDeIi1LtQ6HP+ZMcjFTlYPYb+RoX6XMMM2PJiUYc/0
	 9LP3F4LY8gmKXCjkNgykASRFBgMd/JvVb4M3KZK7Bed4hbB7hoYa0P4C99UbXhBTJoRKr
	 0zrhzC9D/23jg6Z1Oy3Y7CYbtqL0Hr2n9q2buO46bebU8/BgpWePx3eg0JVZbntzYILTA
	 pU46za9TjHMtZaUBWiq1HNgv5I2KMVwnaW9IkNFdzjtDXsR5qweYP/Z6grOh+zB4VSvBJ
	 yt3CBcl1XLx+DWqL8ynx8sbcXbB8hOC0dxTGIzv4MSsDT4ED7JQBzF+9MVZtu6rHGnQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793131221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cne0cg5qkOxdQLVZK721WI8wzgbnw+IaFo8qVuGKJag=;
	b=OfsuPlUVXj2mReBmNi9JEeTzQhQATRew7ZQi+vYMxQo3hXSFXBqw/LQwX+BEQA8NBHoA
	 vbRMGxkaWBqFLdDPEyq3d1DSt84EUhKiBSylmvUomvh+xWEDgSSTwrUiqZ9BJP84N3HHM
	 3Nndkh3AkO52d2bDydqOQyk/49sMed68971iCu34IOPxznZFpTQHIjmROFpspIbvCiDQa
	 7MVWzXS1cFBH82yZdok95FPofXq8pBN/Jng114u2FLTp7R86MVBaQ4zhAAgg/t215UN3c
	 FOC1rZm2/4E3daCNr/RM6xMMr/JzcCv/19d7ljCCJn5IcbpFP+g2rbKMkndQ89gYjjQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793131221;
	bh=cne0cg5qkOxdQLVZK721WI8wzgbnw+IaFo8qVuGKJag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=an2vsGOrJrQLUp3IqaGsvBwZzZ+2GJeKn/z1KdxlvkZCFfCPCYPfafc4goFpafbGl
	 /3056m/3WHy/cxAZVuDY+PXn+4unngDP5BdbxGOSFe3XEEy64Xg4wnox43Jcuv+zbK
	 nTxcxGEsLqUK6tBVltnilk/GAkXdizkOXsZ4YeJOahSSraMPWIc25LQfRsJ6cY0cEN
	 A50P3bNs1uNAWkMFYkVs9BUM8R+EW3P4ViP1F3qUuzYze0lOBexvwCjbUQmsgqe/+Q
	 Q6uRa4022/jAQuygNzHEe9X+yVV98nrCaTzOv/R3Re55s+BDa1dLJ9dTlqfTeC0TPX
	 WMOM9IZzljMfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E381440699;
	Tue, 27 Oct 2026 20:00:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14034279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED90A80C95
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ohj11DKDaNxF for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:00:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3DA3F80C88
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793131218;
 b=DbyTPuWo6c2YHSmip9n7s/0jU/HtcboaXPv8zAMqEOxGYISNTHYLOIlXVr4VKhQ336tP
 MzwvnjcvE3WMX2RlhAiDpbw0vnJo6JVhOMpcQxQCYi3P876zSxWMjqcgmC8ibbhjI4yLL
 Tqy+7Byz5o8QaCyby8o82ooVQ2kxldExPkTA3wOraEa7Zk3NMknNcBviM87KE0JjTWDct
 TrER4oHWrvlxqePOwLzWoI7CFbmbnI80mgnx19gv//0xl0iomgA//l33l1Y62YXYDJZCb
 L2jLTM7lr74tsxD7it2yhbM1VLp+SxePZQa85iW2ximRysxhxx9Yc8CRGCFum8a4r5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793131218;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=afHiLB5s8I4tMOuheloTATKgZLIvcicJY97PjNLME7U=;
 b=Gq1vJTRWtR5uGRwrgZzHqdSRDWSDpMgYqLKpDqlzZfc1RNlX2ZBkozzV6ICezEOUh3mu
 Vaf2MPGtVmKkoDdWRw68vLGMo+gLq30Fc/FXlx07CL67VWzy7CX558hTQ5OlD3QsrXVNN
 qs5fyRh6sTDSSCJLrOKKoxXCc51Auh02AptDWwxZuovcFdcPZDE1sZTYWAWyJBW243jt0
 EwcxMjOQpiCfxhX4LmfnRSJby5cPiPsXKaJUOBk2n3hhNvdN2yKOLV/8pL0n33qNsH8e0
 6GA7haJOl0YOHShAQWruBhJv96h3S9qDcO8CKQPZxIrP9rI8txVvQa0NS1jKzEsU+Fg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DA3F80C88
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:00:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D1409D14E; Tue, 27 Oct 2026 19:58:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 20:59:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5541e44c0bb0675fee4dc778e4c38c347e0ede96
X-Git-Newrev: 7a94b98c0a78e010e2bdc8c5c8c020aad4e86de7
X-Patchwork-Hint: ignore
Message-Id: <20261027195851.9D1409D14E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-update-modules: add
 persistent-app module
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7a94b98c0a78e010e2bdc8c5c8c020aad4e86de7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-update-modules/Config.in                | 18 ++++++++++++++++++
 package/mender-update-modules/mender-update-modules.mk |  9 +++++++++
 2 files changed, 27 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 7c5a7e4442..0c00ce2933 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -125,6 +125,24 @@ comment "ipk support needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_PERSISTENT_APP
+	bool "persistent-app"
+	help
+	  The Persistent App Update Module installs files to a
+	  user-defined directory on the persistent data partition,
+	  ensuring deployments survive rootfs A/B updates.
+
+	  This module uses the data-partition software filesystem
+	  namespace, which means version tracking in mender
+	  show-provides persists across system updates. When a
+	  rootfs update clears rootfs-image.* provides, the
+	  data-partition.* provides remain intact.
+
+	  The module supports rollback by maintaining backups on
+	  the same persistent partition.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/persistent-app
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	bool "podman"
 	depends on BR2_USE_MMU  # podman
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index d18b5111ae..c0b69de7e6 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -32,6 +32,15 @@ ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK),y)
 MENDER_UPDATE_MODULES_MODULES += ipk
 endif
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_PERSISTENT_APP),y)
+MENDER_UPDATE_MODULES_MODULES += persistent-app
+define MENDER_UPDATE_MODULES_INSTALL_MENDER_PERSISTENT_APP_GEN
+	$(INSTALL) -D -m 0755 $(@D)/persistent-app/module-artifact-gen/persistent-app-artifact-gen \
+		$(HOST_DIR)/bin/persistent-app-artifact-gen
+endef
+MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS += MENDER_UPDATE_MODULES_INSTALL_MENDER_PERSISTENT_APP_GEN
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN),y)
 MENDER_UPDATE_MODULES_MODULES += podman
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
