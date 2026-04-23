Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE96FED3EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E6784DC6;
	Fri, 24 Apr 2026 16:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60vlkPEgLTkr; Fri, 24 Apr 2026 16:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEA3084DDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048721;
	bh=ZyL8hdvZzTKyUSF8Vh0YLiKBkgGpWdhTAbT2AjcySaw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kzWNhni9KhPhfwOBhxtohGkEB4pYsAIZMPcS42rNdsgNWoFNFKsd/JYYN32hj+PPd
	 zw7fDxhT11aOZrocsG04P0ZzyxT92uWzSbcHTXAz7ja7pMvFXZbINyQQDqLkXQvQ0j
	 8nD/IZJIvVvRamm2/9KPF2xbwztRXFUrHuzN4bQYneH3uOr3l3Xh9YAKvflGrfs+Na
	 ap1hnIKabrvp0aUOEUwjGllLu3eMocY3AN5K+KYCn6gstUSO2tXM+W1eUIaimumAfB
	 S9U//7BHiMKvcr+UUwSWD7Iz97cJ9bIOnRC/9kJcZxq+bEcVi0CrM7AJa1qYNNS6z/
	 jHFK7ZVN9eiLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEA3084DDF;
	Fri, 24 Apr 2026 16:38:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C9024D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78C8B61C36
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQpxr816GAiC for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFE7C61C39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFE7C61C39
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9899C82B2F; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 14:26:56 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: e898ab668ff4aab151d53508fbdba513416d1ce1
X-Git-Newrev: 7a1f92b0dfcf8d944fc198421bdd64b429d54570
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.9899C82B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libmicrohttpd:
 security bump version to 1.0.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7a1f92b0dfcf8d944fc198421bdd64b429d54570
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://lists.gnu.org/archive/html/libmicrohttpd/2026-04/msg00003.html

Fixes CWE-444: https://cwe.mitre.org/data/definitions/444.html

Version 1.0.4 contains a bug and was never officially announced:
https://lists.gnu.org/archive/html/libmicrohttpd/2026-04/msg00002.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 712121326f84e2508ab161053c2b04e45511c79f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index bd5d0b3e8b..4dfe62deeb 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7816b57aae199cf5c3645e8770e1be5f0a4dfafbcb24b3772173dc4ee634126a  libmicrohttpd-1.0.3.tar.gz
+sha256  b46d00f58efa6f497b97d2e782c4ee66301d412ddd855dd3068518b3a2cd3ea2  libmicrohttpd-1.0.5.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index b74a7a1338..7a243b42cf 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.3
+LIBMICROHTTPD_VERSION = 1.0.5
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
