Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C2ACD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB12485DEC;
	Tue,  9 Jun 2026 13:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nV1q1NiMwaxh; Tue,  9 Jun 2026 13:05:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F62885DCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010326;
	bh=GFA7YsYH5OBIfRULHigtP8fQBd7PPoRsyk1V6WmoUmQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LAFc/6VrlyVw7HSf1y6kppzMNfhV/c9dSpIpg5Fak53VHW/ET3byjOolk06cHg3Uq
	 YQkaxWsdbDGYV47eLZ5ASTC8njYrakK2WN7HGfqjizVM/Rr60OCBmu/6HKSnG7OsEJ
	 o9BhAEYtuInDAHlODXLHL22ThQ8JCOjNjRjbZ1VAYLw3KW96TcK6wTB8HpPziqGA0w
	 gpXDO82RsUa4hrhKozOK5EV85NmRX9d34vrbUpvQvtR6XST4aSgQuZF60Tjj8rc2ji
	 8waBTPBpM9o5vorOIY4yr6tp3PZ6+9KIKVzBtjjnYHxkDkL9oVfM0D8rTIBRI08zv3
	 prq4YM6srnUzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F62885DCD;
	Tue,  9 Jun 2026 13:05:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32CC12EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9721542730
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCH0yovMgOfb for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0197426EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0197426EF
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 180DA87E7E; Tue,  9 Jun 2026 13:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3329ed3e027f7a57f5b96a2a842643bebbee693
X-Git-Newrev: 504840bcc24e7f01e21e38512b67d6747603b129
X-Patchwork-Hint: ignore
Message-Id: <20260609130123.180DA87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_17
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/504840bcc24e7f01e21e38512b67d6747603b129
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 624b5e9d21..863a1eed34 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -344,6 +344,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_16
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
