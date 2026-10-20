Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E252B60A3801
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 16:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=D8I4QZ3G
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA38C810E4;
	Tue, 20 Oct 2026 16:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4klYzPjBk16C; Tue, 20 Oct 2026 16:45:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DD53B8109E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792514710;
	b=jaRcKGVvsVkPk0qqtvgp2RPL1A8SrWRn+FIy3d98+3/R2hfLaq+W+pNDEKY/wC+nD1uZ
	 9nTNHI6U4mPrbW4yUhJAgTpGG3liAU3H9lKRA7EVdPKMeUPmo5/Arg/Cq0t2gBsGGOS8R
	 0hdxpSw0YWahONs35UgrqQ1G5rDH+QR+J7fcPqkcKZIbUxa81BHjucTDOID7cocPXfJ04
	 NUaSA6RfKHT1TW2eEDL/UGtpN5JPGePHhMpdaeWeAzYQ/unNzNnnEW/R8CUJKWtimcLEE
	 HuQnhbvyRYtYRKwFW6UkDzecxLpBPkbp/EYk/g66fMJtSPgy9t49JDXtZcBEFMWIlbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792514710;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=gamF6MzwDhWVIgoPFgaNy6qKtMvtmhMoFtcWzpLLVFI=;
	b=ZOj7K8YAdl9H+BCHIj1mmmlMeYIzNZYSAKmPMvwuOV3x2/ZdWuL3HHo0KlocDztk4rjX
	 wndUMK8yNpCBZM5PxpD7hOuKMiro6hJ9mQRaJCzJayEmWmxrNuPR08cfkvDxdTA8rARyj
	 v0CJBHc0wG3RovOWExkYKstsVcuaA5FxawfSjRC46O5d6DU+V+4XIIcTqObBfvqI5EEJF
	 ggMuHwWlNAv/O1YswukqAhLEJdySPghPoYb38bvRYzDKT5TRd+97B+vo5qk82ShfBGg4k
	 j0qFN2Ilcp7zSTuWo9FpaCk2LLYZ+ggjUzHRbKlw3UX1ZNFGjkk8suDAFYFs5b8jOQA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792514709;
	bh=gamF6MzwDhWVIgoPFgaNy6qKtMvtmhMoFtcWzpLLVFI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D8I4QZ3GnODPvt1B1k1VKHC83M5XAVGyRhtqWehfUbcUnj2tUB/9Waf4ETjtUBrxw
	 7O+nHo93YI9zuonTnijlrPQXbeAOADvIAwuipNMj0F7iqFrtiSRflPOg2XH/GN/kkz
	 /DWyReePNmvnJlVn9DBjZ242dY3mlTL8wenw6bgmSu8WcY5b2yoLjKXP1hipBu+bLW
	 pcqg9kQHZEErE2BwkItkP18oTVgjze9g5tU4fIjRE2PrCry81+/7UNvWX5kunWVjyB
	 sIMVP8sc2Ztlhaos0htpFdrnvB4FfcAvsXHvdTfliYhERBwT8JktZuqkbb5KuuRCGR
	 oavDK16y+Zwig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD53B8109E;
	Tue, 20 Oct 2026 16:45:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8F4D930
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF3268109E
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyDijB33T81o for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 16:45:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23A1880FB7
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792514707;
 b=HkXlG9BmUdWfPcArYDoQ/cL7jZN8VpS+mFds6QbgzfqG25YXjsyw0cBOzvub05yfSrqi
 CHsmq1t/2FKRQtBSbwPn+3IpVecC2hKyfSBjJZ+75EHeYZSjn+E5rhv9qkvZp8Jc2hAQf
 X46RS/PI7aK1ZCeepts1+mLjiYRTE04fElIXCUSjTKSEhfMdcsjDi9xHmPc2XCM8K/OFQ
 bsc2hdWMUhcH1Q7hJOQeZWMXjbFAbEe2aOuLhtlbPSBoC5LesoXN5Tvy3VTqmj1qP8B2+
 F5ZtDvXZpLgBF3FeQz/CyHRdQhrTkvmC6IaCo2wGoziuzatfL5ucVUw1c4exRBM5C2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792514707;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=M2fieUzyYyECqwlQG/m4wHKkUviHR+QC4zB54ofTErs=;
 b=jV6dn1MN/F/flqBaGvLyppOAF+PTcYOqUgt7UYkgww6WtdSvNmXrON8iN3oMamR/kswA
 skfA0IV1Onz2gUJrXPkZDK6abaL3QWgb4vkIAHgbcYOo6+HfF1DoBGnXoPR1fCl97thB4
 d6oOLjxr6DOIdbX9HYzshMKUF1j85Ld+4PygNlQz6tx8sQOc2NE8u/POmHrbWW8XVUVoU
 TOFrcf4WAhtyH3bkIIlEV5PhK4+uP6Bp+To5WpnyCQEvfVbKZBMDtMvbOg40xDodLXBcf
 gLwViLrO7qFugGmOV8au9r40kbKVSHp4aDdIB7n/6Ox9HM1HR0vbQGsAuQ+614MkMFw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23A1880FB7
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:45:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AD519991A; Tue, 20 Oct 2026 16:43:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 18:44:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 450a2c4857f381251f5613e1c6234462c4521ab4
X-Git-Newrev: 75a25f5c902a1c2c147a0db71d3eae1bfcdf6db5
X-Patchwork-Hint: ignore
Message-Id: <20261020164344.0AD519991A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvncserver: explicitly disable
 Qt support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75a25f5c902a1c2c147a0db71d3eae1bfcdf6db5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Qt can optionally be used to build an example VNC client. Like for the
other example clients (Gtk, SDL, etc.), let's disable building this
example client. First because we don't care, and second because it
fails to build:

CMake Error: Cannot determine link language for target "client_examples_qt5client".
CMake Error: CMake can not determine linker language for target: client_examples_qt5client

This Qt client was introduced in libvncserver version 0.9.15 (by
upstream commit b44665c0a28ba3776edebb57548562cf7ddc117f).

No autobuilder issues were found, but the problem can be reproduced
using:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_GUI=y
BR2_PACKAGE_QT5BASE_WIDGETS=y
BR2_PACKAGE_LIBVNCSERVER=y
BR2_PACKAGE_LIBVNCSERVER_INSTALL_STOREPASSSWD=y

Fixes: 3b62f17f327ddacaca9ba134c4a9c1570bd869b6 ("package/libvncserver: bump to version 0.9.15")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvncserver/libvncserver.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 49c94b8708..e541c2471b 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -24,6 +24,7 @@ LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_FFMPEG=OFF \
 	-DWITH_GTK=OFF \
 	-DWITH_SDL=OFF \
+	-DWITH_QT=OFF \
 	-DWITH_TESTS=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
