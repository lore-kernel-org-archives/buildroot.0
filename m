Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05265CD5BA4
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11934185D;
	Wed, 20 May 2026 19:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GV-tslJtFZxD; Wed, 20 May 2026 19:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0D0A41868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779305184;
	bh=eGimDBe8ut5GFi1zYIzYt8/Ix6m1JuJCKQGtmOBTFkA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HZYELmqv/vum4ZftsChhkGNQ8PDWVp9hd6nDXRFVQr/MYP9av+19qV5h+23eo8lv4
	 58U9dDDaN5jylL4DnbVKWDQNO0n6jnjd9TVE3Oc95QPlWQBVnZTQhs3wHT76ZUnRow
	 gNo8cEuclGpD0AIOC+AaE6IzMiNsH8zFlXEeJxLw3mzarvb8Rp0dEnxF/qLLAR/8lx
	 SZkK9FKxl41bJPgi1BIPQXg+CL8fSLERV3Jx9SmK5xTpJ5gGv87qcVkLuuwl0pM+bL
	 IE7Hcj30bvn+ttvaclrNRzjIH64QJwC42oZU/IIU3k9XRtf3zQZxUFpdfVt20ucyhu
	 ejXFP11TdDKhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0D0A41868;
	Wed, 20 May 2026 19:26:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F6201B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3502D40D03
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75kpSW4zQDs0 for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48053405E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48053405E4
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:26:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C566868F0; Wed, 20 May 2026 19:26:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 21:25:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f7ae0140907910640e7f434d2b564b91e2a4cd5
X-Git-Newrev: 1ef471a61da87e356054d39e406edbb16878bd89
X-Patchwork-Hint: ignore
Message-Id: <20260520192614.0C566868F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libargon2: fix pkgconfig version
 string
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ef471a61da87e356054d39e406edbb16878bd89
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Current build generated pkgconfig/libargon2.pc has wrong version string.
    Version: ZERO

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libargon2/libargon2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
index b3f6e1b216..1f3acbe042 100644
--- a/package/libargon2/libargon2.mk
+++ b/package/libargon2/libargon2.mk
@@ -11,6 +11,7 @@ LIBARGON2_LICENSE_FILES = LICENSE
 LIBARGON2_INSTALL_STAGING = YES
 
 LIBARGON2_OPTS = LIBRARY_REL=lib
+LIBARGON2_OPTS += ARGON2_VERSION=$(LIBARGON2_VERSION)
 
 # GCC_TARGET_ARCH is not defined for all architectures, but libargon2
 # only uses it to detect if some x86 optimizations can be used, and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
