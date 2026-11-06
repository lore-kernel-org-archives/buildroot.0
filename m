Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CC1606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SjpkTNjs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20DCB408E8;
	Fri,  6 Nov 2026 17:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1dIG08yBzwQ; Fri,  6 Nov 2026 17:17:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 343EC408F3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793985456;
	b=RKZIAyuw0FgV6lNdLreD6XqRrgj3xrHXv8WHKoZgjTZjG8TxCbuNxFkw94lbT7tZkoBW
	 y+UYWe1icii0oZgklOldRvzsZJYYyPtKrDjk4qNmm8WtIwNIq9wtgrhZrUbsL4SwCndgj
	 TtrukazSdwdKoiiMHprM1v6XnMsCkSUQWdwZGg4pCMyk9C1IqB6RdpM48mFU52tEbeFIs
	 efOyahB/us2MLbFJ3l7iC3g/6nAgMjrTg5w9vidUsy+U6dorcaAlCUYTZuS9SC6yP1q32
	 xDwLrNrF/R3Yu1Szge8yupLlDPqU+61QhXQlIyoWl7iYBsv08GvJFURLsrLTikUbykA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793985456;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uIbqPyLKGI8hSoznHN56bVl/3GOc8ehLS09hNHAxAaE=;
	b=XN4797eCWb1Ld4naNogcXYCuFUyK7oYHT+pL4c/UYenYa5+4YrfZ7kEh7jarCxJ7pIo8
	 oHphvyQtD11w2/77k1piqknKRtDl69PiVoo9TRGdBe/WRiXP6O9GYeo5gmswmNgLro3cp
	 67O5bfyBisMinA4A7m18u0Fg6nRDLBR4nie94J0b3mmDHq/unJyJhsgNncyb8I/DbcHIQ
	 6swOjQ77Ff+PtLcfzz/s7vvJ2R0h+4fmdMJ+CGGuJW3qM8JHBhYuHmCMLbnNJZmwa8Sbm
	 sfpdhbyJIL97CoZh9AR5nhKb982fwYoM8t+GL4gbGPIZTEn2z8KbLqkbPAs8SOorWMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793985456;
	bh=uIbqPyLKGI8hSoznHN56bVl/3GOc8ehLS09hNHAxAaE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SjpkTNjspEgbqN9X9WOfejHt/sC/Yd/YwYgJwNJEZaDGtRTJmxbql/SWnGe1r2c3/
	 9dBTmVt0CRVCPvcvVXc0r1TEB64AxKPGfIMhKVKWDuEMkHuN+KcWCNTnBvCwn1PeoE
	 UZXPp40ZQvDC/o098ppwe9He+Kzp4gAuIhYkhiy7eXtxo8ow49S4wj41ESWbohhHcq
	 8mQB0l8PeXjoo079CmQ7kICZJe/AAaOZuoRyp/WIf/drd1gE/n+L9d5pnoUrgn3pF6
	 8mh25bePgFr/T5pALlQXHNtwylRrYc+ezLOH5Wa/46HH/ow/hlDpN7YQ4XDJW3XDgJ
	 VsDcF8Eh6Leiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 343EC408F3;
	Fri,  6 Nov 2026 17:17:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25A3634D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16EE7810FB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viR6Ji5-SMGr for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 17:17:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 289E9810E7
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 289E9810E7
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 17:17:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 569F29E0B5; Fri,  6 Nov 2026 17:16:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 18:15:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b21d9e744cd35dd5fd4e0cceb7918d05fcc4b705
X-Git-Newrev: a0426cc2f58ad51366bfdb6a03b24cb9a70ba190
X-Patchwork-Hint: ignore
Message-Id: <20261106171602.569F29E0B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: bump version to 2.7.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0426cc2f58ad51366bfdb6a03b24cb9a70ba190
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenVPN/openvpn/blob/v2.7.9/Changes.md

All CVE's are win32-related.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 9274a853f1..0c4a73a59e 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  c070d1d2440b5a6fca6c2c68645c98cd492116ac36ef4f0946177115532c8e36  openvpn-2.7.8.tar.gz
+sha256  c42a6ed892ddfe2d6e3317a5040f19bec5827564affb2fe3f2b3904a94daacb1  openvpn-2.7.9.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 01c049cd05..16f9b7201f 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.8
+OPENVPN_VERSION = 2.7.9
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
