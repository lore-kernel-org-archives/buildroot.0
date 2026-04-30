Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F18FF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 09:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5607D83EEB;
	Thu, 30 Apr 2026 09:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebzkH0XSqQ6H; Thu, 30 Apr 2026 09:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AAD284BF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777542733;
	bh=BwgZnfTjrmTFiNzmA/mdmn5z/gcYyUgrzLp7Z/pItho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rUOBEFFtKgQcXEQfqAbaaHsEni10S6HtejVuWsfJGp/e5S+a/o80hgxg7XHIWbVjs
	 H8F+rQxqDSd/ietUmEpu+qmkueixGMLZ+wrqjDFdb1VYvVvq1C/FdHtd1ohPCCqHt6
	 s8P6I9tA7zvLrNzkdtXdjA/fbM8jZfcsEK4QMYwqgfXD6MGgjbRjTT8/JLIHe9lX84
	 nz9jacGzT6ZkiG/OTi87Y8U/zi79JrP6Cie8pFvnnWy5nYX2r84Fu2Kdbgqeghs5ei
	 D0ZlkULyT+Xw6UsFFPxNXcKduuRd7PggX795u5BO1iLwf9ACy31qyv4tEjkoT6SQS1
	 rdUsIOpsMwBSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AAD284BF3;
	Thu, 30 Apr 2026 09:52:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72EAC192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 09:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 583E640661
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 09:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjYQNqf3xA2n for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 09:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2EC2404A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2EC2404A6
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 09:52:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF57083C2B; Thu, 30 Apr 2026 09:52:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 11:51:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9942e87930072d16818acb7f6949b4518c8050a
X-Git-Newrev: bf8c4f797278131df7332b7dbc2ed3a8728e81df
X-Patchwork-Hint: ignore
Message-Id: <20260430095209.AF57083C2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/psmisc: bump to version 23.7
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf8c4f797278131df7332b7dbc2ed3a8728e81df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
- v23.6:
  - buildsys: Fix DEJAGNU work-around (Debian #1015089)
  - killall: Use kill if pidfd_send_signal fails (Debian #1015228)
  - fuser: Do not mention nonexistent -reset option (#42)
  - fuser: Use modern statn where possible
  - pstree: Better AppArmor support (!30)
- v23.7:
  - Fix --disable-statx build option
  - fuser: Add stat() fallback, ignore EACCES errors
  - pstree: Fix assumption about root PID
  - killall: Output formatting fixes
  - Update gettext to 0.21

https://gitlab.com/psmisc/psmisc/-/tags/v23.6
https://gitlab.com/psmisc/psmisc/-/tags/v23.7

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/psmisc/psmisc.hash | 6 +++---
 package/psmisc/psmisc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
index fe146f90c9..f16b95eee3 100644
--- a/package/psmisc/psmisc.hash
+++ b/package/psmisc/psmisc.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/psmisc/files/psmisc/
-md5  014f0b5d5ab32478a2c57812ad01e1fb  psmisc-23.5.tar.xz
-sha1  a16073f459a19288c1ea2b413a84e1b996cab595  psmisc-23.5.tar.xz
+md5  53eae841735189a896d614cba440eb10  psmisc-23.7.tar.xz
+sha1  89046d35a8919def79200115c9cc78e91b98ad53  psmisc-23.7.tar.xz
 # Locally computed:
-sha256  dc37ecc2f7e4a90a94956accc6e1c77adb71316b7c9cbd39b26738db0c3ae58b  psmisc-23.5.tar.xz
+sha256  58c55d9c1402474065adae669511c191de374b0871eec781239ab400b907c327  psmisc-23.7.tar.xz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 3229184459..85caf30653 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSMISC_VERSION = 23.5
+PSMISC_VERSION = 23.7
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_SOURCE = psmisc-$(PSMISC_VERSION).tar.xz
 PSMISC_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
