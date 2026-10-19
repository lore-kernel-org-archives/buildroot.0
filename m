Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F493606A31B
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 21:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Kt94XQIe
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A1CD607BD;
	Mon, 19 Oct 2026 21:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxXN6yGrxp-r; Mon, 19 Oct 2026 21:47:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 329B460778
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792446443;
	b=BRg8oOsLm0WhYBrneYT6lLLT0shawX2RhIH2ODDePdJb3qIRUT7y3ozVkwf31Zm7FAZB
	 TMlDy4K2t/T4yKWRi2d2OZbBZG10xIwNkm9+wbLKw/k/s7e/o8qzO5wlsQS2mM2LDix6J
	 bwgTgE28gNlAdOBjfwU9GOXt9rLLJoQFO44Fq74hQi0qegDSM+hOXm9m12i5oukeXZ5s/
	 aBC5iqlCd2dNeFc+67mBgQ9lhXIDE4z1uercGE2S+oyAhN9sUNkSBcJCirASWGyERzrSc
	 xpoyiLdsHnCpxWosw9jzxGkXKE9l/O1o7yC7Ht2PAI4wkWIQdMeYiyZjRuf1rnhdW4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792446443;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NuHusq1QHsAY8qRvc3xryirN59DHTZe6OoOFg2TfyxU=;
	b=J8TlT5zs7vZBVzIX+GPqm5fz8feJKhR1+scLnFunQNY6F8AN9Ygjf7u5ly1e7jEqsBC5
	 3ng4k1eXlHGswjs2WKs5cHRvGnhrMrKY6EsTq6ICHGHlOiyKqMFTg4ymC/+CoHiFp/im/
	 QaQZzBJ4hD7jm5nv/vyjpRH93JP4zNZ3qYUSaUlGpaqOzor3+VHzCcPymCQHvo3+azC2r
	 zjhxJbq0m65B2K86C5n4WhyE7ZGEEhEAP8RH5Ae4rNIgB6+xF5GPLHyV1W789kGT/RstB
	 TTQuB5EtXB4cmVUmtt0Bi+sLKvJWsBR0F5c5ez+LlijiTUz41l2klKP9MkB4cbUpIpw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792446443;
	bh=NuHusq1QHsAY8qRvc3xryirN59DHTZe6OoOFg2TfyxU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kt94XQIeNHXg2+3HoKmkMnxf3IajYZeH1pPrsgc24rkuEbKQyqDSANoQx38WChATD
	 34ZO4KdI0rYsXNWtv1mbIEDyC88IUwlJIQbxtiKvW+KFHbzbbj3VZisWtj8wpS5HtZ
	 99S9VK0j89zI0b7p/H1W3Ba2RHao7eFwFFlTyLjG98hCtnPC6VUzH/vbIFJU9NlpRG
	 W547HdLDTicEmuc/m2uLPIEfbOppUwJL4iH6JkswOEcQqvJwcvANfgOxof+d0qVcQl
	 nqcgzqfTwJTpFTY+2YCq/fFrms/KhZIcJVphlVbW7urJLPsHdmB80s64CDfyrXVyAT
	 tzgFzbPM4tSYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 329B460778;
	Mon, 19 Oct 2026 21:47:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78D3712F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AC06401D5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUs-tZ5ZzZk9 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6C933402C1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792446424;
 b=WRxq+HODklf1exOiJAgvFgovnERwC/LSzzgDsXLbW9MkXjWNGIyjkJZdFl84Tflv5mQu
 sH5cZuWVTzR9m7ogDPXxwJxZvcm/0jwdmDrgCkyhiBFcwcz5DYMRndBgOXhaMbTiMbiKS
 5JAYDlfT2flwwTxUWwPsc0fz5sKN/keXnNljxRAseFqz3UlgZrhxzsJZ+TwH/3nSqOXVP
 4GT2J8BdqBnFowLX1hDtNaiQlfzj0HQYkd9/tyHuF1HPhjnNvMe9uIX+AuyapO68vFMtE
 aJo77i2+zKnpj51THVwQFrYsEHaMXKW43VQLMVM9sv2//TroJ9Eniw9+CtTxzTn0E2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792446424;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4FxOcZXmZ1it12J7P2rOdNfv6YTQJT4WdORePHGjzAk=;
 b=cN78Umce3yK2Yl8K0B6/+SOJ/ixR6CAaMgGB02oFHKxumr5MYVg0fUGbuztwzqcQOJPE
 xkO76w3ehAiAUHnaiHRm6V5o6yl9ByeT42+LMd4E3CtbFoXOHfKokzmCqC+O74tF2lvsm
 hSMXJdoQ8uoYviZZMlynGfWE0h2STm5PiyAq27icMTO43s7gT/12lw3vMaoAaxN9VFf1c
 2tpwlI1vHFkOnHzrJ6QKfWuD89zfuj5agjpfAUpGjdWGTkrH+7bf6fCf7W7KYAXj3nKNm
 djkr/IUQuuSW+RAofS5iyzc6ef9PlnM8FZVmn0bfYAP6OfGMcF7MuhH+gc4DRwxaaMg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C933402C1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 21:47:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5C1699626; Mon, 19 Oct 2026 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 23:46:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6588d61513f8eccf8c9a1eae6185a286d47ece42
X-Git-Newrev: 3f89e8c1926fafb30163df76985d4711c8985f76
X-Patchwork-Hint: ignore
Message-Id: <20261019214541.B5C1699626@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_net: new package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f89e8c1926fafb30163df76985d4711c8985f76
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

SDL3_net is the small cross-platform networking library for SDL3,
providing TCP and UDP sockets and hostname resolution.

Samples are not built and the man pages are not installed: the samples
are demo programs that are never installed, and Buildroot removes
/usr/share/man from the target anyway.

Built with CMake, like sdl3 itself, rather than with the autotools setup
the SDL2 counterpart uses.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/sdl3_net/Config.in     |  9 +++++++++
 package/sdl3_net/sdl3_net.hash |  3 +++
 package/sdl3_net/sdl3_net.mk   | 19 +++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f46d09db5a..95499bbf0c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -171,6 +171,7 @@ F:	package/xen/
 N:	Alsey Coleman Miller <alseycmiller@gmail.com>
 F:	package/liblc3/
 F:	package/plutovg/
+F:	package/sdl3_net/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
 F:	package/dcron/
diff --git a/package/Config.in b/package/Config.in
index d041291bcb..1741e74ac5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ comment "Graphic libraries"
 	source "package/sdl3/Config.in"
 	source "package/sdl3_gfx/Config.in"
 	source "package/sdl3_image/Config.in"
+	source "package/sdl3_net/Config.in"
 	source "package/sdl3_ttf/Config.in"
 	source "package/spirv-headers/Config.in"
 	source "package/tk/Config.in"
diff --git a/package/sdl3_net/Config.in b/package/sdl3_net/Config.in
new file mode 100644
index 0000000000..8375e5e0b6
--- /dev/null
+++ b/package/sdl3_net/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SDL3_NET
+	bool "sdl3_net"
+	depends on BR2_PACKAGE_SDL3
+	help
+	  SDL3_net is a small cross-platform networking library for
+	  SDL3, providing TCP and UDP sockets and hostname
+	  resolution.
+
+	  https://github.com/libsdl-org/SDL_net
diff --git a/package/sdl3_net/sdl3_net.hash b/package/sdl3_net/sdl3_net.hash
new file mode 100644
index 0000000000..af871c8e99
--- /dev/null
+++ b/package/sdl3_net/sdl3_net.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  098522fc26d4e302ef9348aee6e76e67fe504dfefd7f596236568f8330570c41  SDL3_net-3.2.0.tar.gz
+sha256  1c040b8271b37e5076359f8fd54240e371114112924d2df81ef87c7d6a1dfdfd  LICENSE.txt
diff --git a/package/sdl3_net/sdl3_net.mk b/package/sdl3_net/sdl3_net.mk
new file mode 100644
index 0000000000..51ae016c67
--- /dev/null
+++ b/package/sdl3_net/sdl3_net.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# sdl3_net
+#
+################################################################################
+
+SDL3_NET_VERSION = 3.2.0
+SDL3_NET_SOURCE = SDL3_net-$(SDL3_NET_VERSION).tar.gz
+SDL3_NET_SITE = https://www.libsdl.org/projects/SDL_net/release
+SDL3_NET_LICENSE = Zlib
+SDL3_NET_LICENSE_FILES = LICENSE.txt
+SDL3_NET_INSTALL_STAGING = YES
+SDL3_NET_DEPENDENCIES = sdl3 host-pkgconf
+
+SDL3_NET_CONF_OPTS = \
+	-DSDLNET_SAMPLES=OFF \
+	-DSDLNET_INSTALL_MAN=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
