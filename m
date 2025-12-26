Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69943E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 10:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 487A4815CA;
	Fri, 26 Dec 2025 10:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0Mi7d6vGkeE; Fri, 26 Dec 2025 10:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8215081402
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766745461;
	bh=p9PfWcsb1YYdXTd0XFX/SoO/Gz3jVDghxphMx/5bj84=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ee+DAEtOl4H5f67J62tyVmVMRMV6oa1LRmtaITyy4ImFOQq8GeDChmJw8Cd75HkRB
	 5M4zpHEN4Ea+52a8k9r+sD4TVeqBMR7ofaV2sVkY7SQsYq2bKIfTDnDTJrN6rTdJT9
	 iUJji4Mryz4khyrPZg6zM7fT/f+UwKE27Z+I9eFVlSPQJXLQQLrsug6KeHaLsp6LLI
	 AQO1q3L5i0qEyeBtFSbIQFXFFIUKYMWRSmE7UKDuo3+96+S6mew4nz7N5kTCFZotag
	 oI5Q7UlhKJ08DplGtvvrI2QVKdp8POI/1Wy910houHqiDy0UdhzooPTDtjqOJZRdCC
	 H1s60xGzYN7uQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8215081402;
	Fri, 26 Dec 2025 10:37:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C89F0B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A674F4091C
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlgoBVs-MEEF for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 10:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C03DA4091A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C03DA4091A
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:37:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA98587644; Fri, 26 Dec 2025 10:37:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 11:29:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1ab01cdc8bc3ceb41f8bceda2dce5261024cf05
X-Git-Newrev: 3ebd5a4b1068798ca5f0ca1ea9411f6702a8fe31
X-Patchwork-Hint: ignore
Message-Id: <20251226103736.BA98587644@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tmux: bump to version 3.6a
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ebd5a4b1068798ca5f0ca1ea9411f6702a8fe31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes: https://github.com/tmux/tmux/blob/3.6a/CHANGES
Release Notes: https://github.com/tmux/tmux/issues/4745

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...id-warnings-on-32-bit-architectures.-GitH.patch | 28 ----------------------
 package/tmux/tmux.hash                             |  2 +-
 package/tmux/tmux.mk                               |  2 +-
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch b/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch
deleted file mode 100644
index e9cd9d5acc..0000000000
--- a/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f812b8d30456c071ee23e9a02d6ce16036fd3f68 Mon Sep 17 00:00:00 2001
-From: Nicholas Marriott <nicholas.marriott@gmail.com>
-Date: Wed, 29 Oct 2025 08:47:45 +0000
-Subject: [PATCH] Cast to avoid warnings on 32-bit architectures. GitHub issue
- 4597.
-
-Upstream: https://github.com/tmux/tmux/commit/f812b8d30456c071ee23e9a02d6ce16036fd3f68
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- compat/utf8proc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/compat/utf8proc.c b/compat/utf8proc.c
-index dd4ab27f..147da696 100644
---- a/compat/utf8proc.c
-+++ b/compat/utf8proc.c
-@@ -48,7 +48,7 @@ utf8proc_mbtowc(wchar_t *pwc, const char *s, size_t n)
- 	 * *pwc == -1 indicates invalid codepoint
- 	 * slen < 0 indicates an error
- 	 */
--	slen = utf8proc_iterate(s, n, pwc);
-+	slen = utf8proc_iterate(s, n, (utf8proc_int32_t*)pwc);
- 	if (*pwc == (wchar_t)-1 || slen < 0)
- 		return (-1);
- 	return (slen);
--- 
-2.47.3
-
diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index c4eb508d78..867fbd6c55 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  16216bd0877170dfcc64157085ba9013610b12b082548c7c9542cc0103198951  tmux-3.5a.tar.gz
+sha256  b6d8d9c76585db8ef5fa00d4931902fa4b8cbe8166f528f44fc403961a3f3759  tmux-3.6a.tar.gz
 sha256  c031bd37f464c534277814f6aa38686fa023d094261d57fd2545ad592bb53ccd  COPYING
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 4cceeabfc5..1f98cad706 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 3.5a
+TMUX_VERSION = 3.6a
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
