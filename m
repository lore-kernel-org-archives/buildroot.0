Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4E4606A31F
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cCG8iY3m
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15C82405EE;
	Mon, 19 Oct 2026 19:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BcOCwzDy8QZX; Mon, 19 Oct 2026 19:30:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2A709406CD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792438245;
	b=iyU47IW7RcNZNmTd32+aelJgy1Ls6Qgj+LHnXSFBPw3SXskCsptNWmQiPh7bU3v8BXiW
	 zL0zFiPlKa59TuFyX3Pivloq4U+wY4hXbvZ9qu2yD8ay98COAK6K+L5vARitnuac0Qa+Y
	 Bpbv3q6tRfKwgrbohuv8naT6CBQF3V4zNP8ODv7MV605CV71HEhfqgK+Igf6crfODV0im
	 0YhSkd0Nn/2MVdkbECJWIN7zZEboDYOOgE9y3P1jWB7Lh8g1UH3pAGwXhkGZkbPy0VjTQ
	 2Vf34iLdL4O8xiPS0Y79xXZct6wYviQF4p+PxXTRMV8B0hTcR0tsrG7z/XVmOBuBdJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792438245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jlFzcVVai8/hAH5fYBslx7ohKe7sYmOQC07wvNum9Zc=;
	b=PUMTe8rVJgtmZIULUMGp4MHMMv9SosKXVkoW1BvCrwJ4E4fC+DqDugq0YDYpW+CMON85
	 xvPmlS1qvqTr5rzswB52cs/leF+R1E4M+aWTJQWviGJJZZwebBnHq4yMTvBUktw56UcvP
	 4wr3zNv+31kaSw6qX1c7DHBzV7CXsOpr+9x8JmC+d8SX+/rgdg0nAEyriM49jrl/C15yp
	 w5R4e2CzgLtBMmgpFCUvQheDHBovmknF7jV2Wewa9ZslI3FETHdTXXja2DeFjUKg5hqPQ
	 srT3e8NJH3hGDsorkl0zQ5E0JAwUzz+aVAU0XeM3kkEylmgv0ASidQ5SAa+q9D/WyqQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792438245;
	bh=jlFzcVVai8/hAH5fYBslx7ohKe7sYmOQC07wvNum9Zc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cCG8iY3mMV9exAYVdOKTx5fuZ5FL414BZI/HzG3ze2NX5webRUu7IBmTd664MUdUm
	 rxG+LZs6YbcI3ojLY1ew1D7QyvI6QSb0Clk1dk3Itm8iGA2goKwpJUNAh/DVIWEkOf
	 PEIzgPOEo4+JvLwUVc+XiiKQo26JuMqSYk9Ua8tRBVrWJXWtfLpctl7IUwZli7iMBa
	 sTITtjhxKCmfHI4Cm7993htT2zV8n3tnafkWFqn6gTPrCYoGd4EIQZnsKSMYn7yVXM
	 c83Nz0Siwja8hxYd45p13hnrF7zFjwTy3w7YQOCExsS7jdvu+5ORt0QIireZYBnrxA
	 rOCE6MVX+qV3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A709406CD;
	Mon, 19 Oct 2026 19:30:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABE5911CA
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C32140286
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w81Ueoj7ZG1o for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:30:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 50C80401D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792438240;
 b=U9rXZnbCX65s+Da4dDqKF6Sl3FvWlQfeI/3WrQKlh2TXsIxFDHk+u55O21WyTeQ6J0J4
 FMwcpMx4Mt+HCg5Yw3j7pe3riiVnEZq2xB9ClHrcc4yb8iOFUc8nFXj9b0u+RUNcOu+Zd
 VbXwhHepJcOiRaxiA7dq6eLbI+8B/BHXfLuBo044J8jpiWNTW/g/9D6uTad+sMefQBezX
 yLuo5VBJ/YLliWYzktN+c4Kmx3ieqg4ek9q7dZKenoTrVU7Oa6LhhKp+B+O7xaZjuT+nu
 jOGXtTsPmJFS44wklmpoDMuWN0wpGwdHlCcNpNlY8lxrCq9zDXfoL6S9lywAVjA7vgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792438240;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uteBUGozYriIrN9G8VJpbCAwa7bKJLMZAvPU8oLCZLw=;
 b=ZA50TuDvnzkGJOGHbNmxh36KLWqlKermr0TrCtdviMrLAxPSeUh3rqMD4WdvHNGZ+dFA
 TXyamayvPXZsHUNZtledvqwacCSphpZGy2DT4AP9Wi+kzrZt4el/hXyhKCXy5wTwBAdwv
 u+EdPFuQV+UcHi/kY7L58UxVejgxw294czTuCRpeXOQ5mjudeVoqfNZ95rAaB6PzkhRwQ
 E3BKqJIBjUY00GS/bs7UrFuiaW67rAcs1YBCBJZ7cjHdH6hcnJwzCI/L7BelwNpo50Zlu
 ZQSltCv0Q4KemBsTAkXm28ssa3R1xMYzx3I6vRT7nYCnFECDmEpq0LliyaGp7WZRgNw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50C80401D5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2D5A995B1; Mon, 19 Oct 2026 19:29:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 21:25:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e1ac8ad16a8d0d54cf0757faa414ff663174ae1
X-Git-Newrev: f09b4c5bf7becfc1bf22a1880ec4c029b768647d
X-Patchwork-Hint: ignore
Message-Id: <20261019192917.A2D5A995B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/podman: propagate missing
 dependency inherited from shadow
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f09b4c5bf7becfc1bf22a1880ec4c029b768647d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_PODMAN selects BR2_PACKAGE_SHADOW, but forgot to propagate
its !BR2_STATIC_LIBS dependency. This commit fixes this inconsistency.

We also propagate it to the only reverse dependency of podman, which
is mender-update-modules.

Fixes: ebbaac08e3f462bf023c12077f739ed1c0543eb2 ("package/podman: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mender-update-modules/Config.in | 6 ++++--
 package/podman/Config.in                | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 53ffd13dbf..1fd7384f59 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -136,6 +136,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # podman
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # podman
 	depends on BR2_USE_WCHAR  # podman
+	depends on !BR2_STATIC_LIBS # podman
 	select BR2_PACKAGE_JQ # runtime
 	select BR2_PACKAGE_PODMAN
 	help
@@ -151,7 +152,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/podman
 
-comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
+comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
@@ -160,7 +161,8 @@ comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT
 	bool "reboot"
diff --git a/package/podman/Config.in b/package/podman/Config.in
index a8c625c5b1..2f20f77507 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_PODMAN
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # shadow
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon
 	depends on BR2_USE_WCHAR  # conmon
+	depends on !BR2_STATIC_LIBS # shadow
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_CA_CERTIFICATES  # runtime
 	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_CGROUPFS_MOUNT && !BR2_INIT_SYSTEMD  # runtime
@@ -89,7 +90,7 @@ endchoice
 
 endif
 
-comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
+comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
@@ -98,4 +99,5 @@ comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
