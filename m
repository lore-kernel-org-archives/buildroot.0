Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7435606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sZkgoFXN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E71440C02;
	Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Xlmo8R7X2wE; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A5D4740BDB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369891;
	b=oq8Vm77pQCHYFsHTdr+QavfZ8scPWLOJF6CFrZ9HiLuzv3V1/InroPkFqoY0owSlOHBJ
	 CS8DhA2e6jNwRA5QbwyB82JRTwaKx3RpNUPJp1itd6d3BXDWaAThCAW8MfD+9whKe8PX2
	 Pb2LSAFEsnxOvRC54Dk3F218l0abBrIp/HYBIcIDP2fV4ulNy0il3+uULP0UiP/pbEED8
	 TFTPoxtLP9ckUsHiBjE70NeDtBB0opvOtzsz8y01CDw0FKtTggY4NHtx/OUKky6ED5Jij
	 kWNnd2x0E6kgKhzYd19z5S67yAT4I5WqdysH+yx5xGFMKOAZXF0/uIVuP3WJX+G8CmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369891;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=j53ZKDO5CSibMRmqu0WVVCiW6zbwy/aLFJJCuCyMzKM=;
	b=ByeFgLAXIs9nOT5PzultelAhs8WhtPNDXTiyIqEB4xUScFdOxv8o24lD0q13n6OX3XL7
	 3aCby0ndybnHx7vuAsFMit0tRgE9UyxnDJJQlwXBXhfXJS1/avewgdCWGy4JH56nnTY5C
	 I+9G6J6u8vl7dCXqbu17GmUaK5zZ6pbqIwNbTMNPd5jrDFT8LYlRlopy4qTRfbIIwhxWh
	 m90hTNy1Ahw/4+8c9U8gftIM3fAKmc1M8Bdp6MxKAQFA5t6886VT5x49xzbIMtDMOdp2V
	 +34PEBgMdLEGqHwVssQDdKlPHIKo/Xr/wJPVsxIiQFCU8Mq3AcOYuQ2kaYU9+BaBTjA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369891;
	bh=j53ZKDO5CSibMRmqu0WVVCiW6zbwy/aLFJJCuCyMzKM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sZkgoFXN/GkDMp9W18jbgQSMLSH+Hnel3j+RrppyGqOUqrHCXfjhZ5rrnbhL0l2mf
	 GFNwK15V00eF3F6iCKo90+3KH00SDcl/y7B3f+5oFQTpgAZ41pKCPTRzpckPpBfix2
	 pCJCoukzqU2rxPRWBH9WWYuTasONVHwTnUOsAnSWT1nWnnAynvBAsS0egYP42g+yxN
	 76h9Q9W9TN4qpm1aWE+fjk4gXzKNw/TfCHrwv2LltBeU9yekViukG3vpRA6IaCzq/u
	 JSOYkTp7EAi43eDSLMQ1Rqanw3xYpK0LjA1h1mPyHgP372q9PohhViQntMYnhcLv2A
	 DjsV7Z/36nhZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5D4740BDB;
	Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B283D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D676400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KyKQTm2SDKfW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AF80940243
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369883;
 b=b7nE41uBqh8SdR5D3UfXZhHX9WzwqURRuMqUvvMBKHEdvYbuDoXPHjRI7+s7SnVwiqrw
 TZCAM5vpINcB3F+u0Y3Qatnlra2PwZCWuI7UzitxzVkzfckPU8c2xUWWrXMcNROIa16yV
 tjblkzynyb4eSqQYHOeacAZXFpavMQWWlsnaGLhP26VyQqyzLj7oG1FQVUW5cgHTTxRzT
 yUrN+7gdIFk0IHQGwz6eZ5FYHtfIr+FGjBZcANXq6VhvcvKMG2ozp3N4f96RA3gfKdfbb
 v9ds9sM06h9P0F1CjU9sMfEfNaqI/2HDAO3wweej0j/tE4CtnYbuDrJMwh5ru6x72Kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369883;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mWUVRqTwKuWnRBRFGdD8LRKjyKoyM1fnQneKVyBq8wQ=;
 b=EA2spo4ZtyrKHjsfpoq2afDBetsbnHUOC7YgMjbuuY98daau2IKqHl41JoFSy6e23IA5
 d8A4WBSIeUvJrK92nwRe4Rvgre2OAsfYM1EbqjXeaoPNoILBLpeuDZMc1tUZ+A/TKStEr
 kJMcPVis9hbQwP7TIAhDAUVIV7/ptwfqToEihm4l6aX8VR+koGCm+/zr6Foinlgv8ulUl
 nkIscBWjX2GUset29DB3AVWNM/jKjx0cwrJsBORXsRf4+AS1Se+eNZljHjV5Oaf2NL4oR
 ddIjK0mNWjl/ZZVTWOol+URL/X2GKcHzEZPKhyWhmfTwiaRDd4SN8tQeL3NLEw+FQ1g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF80940243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAEBC9D38B; Fri, 30 Oct 2026 14:16:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:03 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: bad8be6c65ce4c0d225b295b150a257c05881501
X-Git-Newrev: 7674709e657f8b5d70619a2ed14f3ee0485f388e
X-Patchwork-Hint: ignore
Message-Id: <20261030141635.CAEBC9D38B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/mender-update-modules: add missing BR2_USE_MMU dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2564493071096080665=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2564493071096080665==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7674709e657f8b5d70619a2ed14f3ee0485f388e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM selects BR2_PACKAGE_RPM without
replicating its BR2_USE_MMU dependency.

BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU selects BR2_PACKAGE_SWUPDATE
without replicating its BR2_USE_MMU dependency.

This commit fixes that by properly propagating the missing
dependencies. There is in practice no functional change:
BR2_PACKAGE_MENDER_UPDATE_MODULES depends on
BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS and go is only supported on
MMU-capable CPU architectures. But since there is no formal
relationship between BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS and
BR2_USE_MMU, automatic validation cannot infer that
BR2_PACKAGE_MENDER_UPDATE_MODULES cannot be selected on !MMU systems.

Fixes: a474642fdcd8c69e12126bbe8304479aa855d916 ("package/mender-update-modules: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 24590006a64e09a52ea6ed254c706877b9706e61)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/mender-update-modules/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 88e0805976..dac83c47ec 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -208,6 +208,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # rpm
 	select BR2_PACKAGE_RPM
 	help
 	  The Rpm Update Module updates software on the device using
@@ -220,6 +221,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/rpm
 
 comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -228,6 +230,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
 	bool "swupdate"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # swupdate
+	depends on BR2_USE_MMU # swupdate
 	select BR2_PACKAGE_JQ # runtime
 	select BR2_PACKAGE_SWUPDATE
 	help
@@ -240,6 +243,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/swu
 
 comment "swupdate support needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS
 

--===============2564493071096080665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2564493071096080665==--
