Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C2DEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB7D784977;
	Fri, 13 Feb 2026 19:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30kJySbg1QBx; Fri, 13 Feb 2026 19:40:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 078188493B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011612;
	bh=ulYWyO5G9DWJi19n7+bSnsnac1LKNS8b0sghsyt1Wb8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RasOfSlqHOX801aF2yyPf7g8Sz87OsarxkR1GOYbIJbargCjna8PIpc0NGWt13h+x
	 ZYzbOhDEGdwvAciHsYK6RaBKWE3gbn+4nuJACCnW1RLKyJxdO3WWbG7tGqH7tFaioh
	 uc0/NrPkjsALEH3JrP03ajMPx/wNWCpLLQd8eA+EjE4oF6lzNx5/kZ12vBidGF0VyQ
	 ufTa608ZUGPZo0rVt8fypCF0ChoizHIWZqwtw+hvfetpOO3hGEJAceh7/8RunZOgLb
	 TKEnfQF976oyPm9d9bzOp9xTvrCY8qZZuSMVvKoyb25ktkX4Hm4wnlusyKR+czhe/O
	 au59kV2EvxFWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 078188493B;
	Fri, 13 Feb 2026 19:40:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6047A69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33ABD413CF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhGx7ofc3JDm for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03D1241300
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03D1241300
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED6FD825CC; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:55 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: a403a0d66287acc691ab3718d8f60c4f9ceb0143
X-Git-Newrev: 34b2c00d83b42fcdaca42ca2a94ce004b81ef061
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.ED6FD825CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/shadow: ensure
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34b2c00d83b42fcdaca42ca2a94ce004b81ef061
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
