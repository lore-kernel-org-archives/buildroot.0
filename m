Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D75EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D011E61574;
	Fri, 13 Feb 2026 19:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzl_YuV859R3; Fri, 13 Feb 2026 19:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35ABC61558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011405;
	bh=SE4sdl3+yjNgSdiN9YL+lKhEWcXLpRTvBQtn7m6MFJA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JRT+Na2ZdMJTclQ/L0zbCO4X33EkE7NtchgKdws4FXbAPM4G4ySTGz3g65k3LvD/+
	 yX5bfTx1Zo++zMAJYGU9GXYUzx5hHaugoOULRbwE/mOmbFR9yp7jNdNZDAJRcLUjZ2
	 thQHYzacCcsk8F01n/uBOP1C5/8RjDXjsDbT/G3CtmK/+8tL7ZHQLSlmXaI4pAfxRU
	 y3CDwVHUZe0KmWJVIaKoZCNoWdN0e9DKCFjyXsIO8h7AmTp0fsDJCSYgvuYvKM8Cy2
	 F59RvDFwxBN5Hm99+9qLKhggnJALMvU5ln/l8f9SoiGbwGf7uMfNPH61/yjUcMBFg7
	 sXA2jvXO8fCQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35ABC61558;
	Fri, 13 Feb 2026 19:36:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0480CEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3196E41E42
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5j6ms0rWYIHB for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57BB641E36
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57BB641E36
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C1D183AF9; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:26 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5c76442776f3da587ec2f1467eb8b2efbf7299df
X-Git-Newrev: be7bd63d6ef7f4860424464f2de7d85f90ae9649
X-Patchwork-Hint: ignore
Message-Id: <20260213193530.4C1D183AF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/shadow: ensure
 that SHA support is enabled when requested
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/be7bd63d6ef7f4860424464f2de7d85f90ae9649
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Ensure that the SHA_CRYPT option is enabled when the system configuration is
set to SHA256/512, as otherwise passwd complains when a password is changed:

passwd
...
Invalid ENCRYPT_METHOD value: 'SHA512'.
Defaulting to DES.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7e72901eefeab51c7f718d4c8ce0d10d08f1c657)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/shadow/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index bbbea811ce..93216bd14c 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -3,6 +3,9 @@ menuconfig BR2_PACKAGE_SHADOW
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_SHADOW_SHA_CRYPT if \
+	       (BR2_TARGET_GENERIC_PASSWD_SHA256 || \
+	        BR2_TARGET_GENERIC_PASSWD_SHA512)
 	help
 	  Utilities to deal with user accounts.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
