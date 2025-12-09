Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D27D3B994
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 21:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6714A848A8;
	Tue,  9 Dec 2025 21:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfZUnFa4-kan; Tue,  9 Dec 2025 21:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5844C848AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765315149;
	bh=sY6nSxv+Vn6norQjXnq58KZ2He9ZFOb22syAboyGPWw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l20dikFVIgFMuW0kg9KIuU7DBv6x+x0wFPj0cB2QqcUTko0Rti7S1kwAV11JYQoRL
	 8xU3fPXjWi1GgE0xrJV76UaRZTDNkuyLbQ6VCn4e+jQbSMfG8XHm5u4+K/M8pyBbRD
	 YdpHjtKEL2Fo3jNhu/J5iGROleGaYa8plA9ntSyN384XOKFGOL66iMHK5cKNxuYJXd
	 KBDF9EbhizI1D3IAJqA+sF5WukAT1ugPiQ15YNVKYzOJmgh34kSFhov5B833qfoRtV
	 LyizXsxcw6BbPSbb0g92thZe3dOn8DU4lZqSWIzBXVVln6dWCfaCbNt14kSsgZL8fp
	 Ozc0bONOOW9ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5844C848AD;
	Tue,  9 Dec 2025 21:19:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E9C22C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6412F848AD
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xiztsMjlUehs for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 21:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29958848B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29958848B2
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:19:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18135869AD; Tue,  9 Dec 2025 21:19:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 22:16:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55a3abfcca75d084153b31ee84a3936aa12fbcc6
X-Git-Newrev: 638224b4e62d24a64ea6043d3efdbeb9278f94ad
X-Patchwork-Hint: ignore
Message-Id: <20251209211907.18135869AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pigz: switch site to HTTPS
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

commit: https://git.buildroot.net/buildroot/commit/?id=638224b4e62d24a64ea6043d3efdbeb9278f94ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prefer HTTPS for source downloads.
No functional change; hashes unchanged.
Align comment in .hash and Config.in.

Signed-off-by: Preyas <preyas17@zohomail.in>
[Julien: also update Config.in package home page]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pigz/Config.in | 2 +-
 package/pigz/pigz.hash | 2 +-
 package/pigz/pigz.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pigz/Config.in b/package/pigz/Config.in
index af229060cf..c6db83d490 100644
--- a/package/pigz/Config.in
+++ b/package/pigz/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PIGZ
 	  processors and multiple cores to the hilt when compressing
 	  data.
 
-	  http://www.zlib.net/pigz/
+	  https://www.zlib.net/pigz/
 
 comment "pigz needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
index d09930b62b..d63c5a5717 100644
--- a/package/pigz/pigz.hash
+++ b/package/pigz/pigz.hash
@@ -1,4 +1,4 @@
-# From http://zlib.net/pigz
+# From https://zlib.net/pigz
 sha256  eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0  pigz-2.8.tar.gz
 
 # Locally calculated
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index e3273c71c1..0708882a15 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PIGZ_VERSION = 2.8
-PIGZ_SITE = http://zlib.net/pigz
+PIGZ_SITE = https://zlib.net/pigz
 PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
 PIGZ_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
