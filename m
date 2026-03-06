Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301CEFCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C13C841F5F;
	Fri,  6 Mar 2026 19:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtMdTnYtreMU; Fri,  6 Mar 2026 19:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55EE841E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826752;
	bh=looJuiTaDJI+NKSkuj5MV1nvqJt0nwHqRyAo7GXlCS8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iAj2IWxLhT/dWzUg2H3auB83mUnEcl7OqSK5TQ6eEYWFbB9rY/rkl2YuFS4Wuvpu6
	 k6+ON9QTZNv2WIQc4IMdic/BtQ6FHmTOoO5hHAvHgGGiuB6ugV/TsBqZ5uwmnJMr18
	 BAZEuoPGLS6pJMGPMuICp1YFyhPlRry0SGVJpO4lI7RgiEaOKKsrM1Hti1wxBqUG0k
	 EMA/HCOVE7q+EGEVBrbVKp56k0VunVF4+3b1Hb+LHZtqKH09wkF/1Ym6yYDkqGzhpC
	 uKAjecGksTPVToADt5GJj2lgCcFPizdAPrk3Wi23B+zXrJhdcDGH+yfWn/CMuHonK/
	 a3lMgvlbzaXng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55EE841E9C;
	Fri,  6 Mar 2026 19:52:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0577A25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C84D41E80
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAU1W7Qlkmv4 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C3F41E53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8C3F41E53
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE66A83582; Fri,  6 Mar 2026 19:52:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:01:19 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4f0460c0492ff4721c2a41d778e48e237cf6456a
X-Git-Newrev: bb4cb7b5a4860f91d0411b69bc9eae75d1b9db38
X-Patchwork-Hint: ignore
Message-Id: <20260306195222.BE66A83582@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libssh: Security
 bump to 0.11.4
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
Content-Type: multipart/mixed; boundary="===============1407185859004995343=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1407185859004995343==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bb4cb7b5a4860f91d0411b69bc9eae75d1b9db38
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Change summary:
https://git.libssh.org/projects/libssh.git/tag/?h=libssh-0.11.4

Fixes:
CVE-2025-14821: libssh loads configuration files from the C:\etc directory
on Windows
CVE-2026-0964: SCP Protocol Path Traversal in ssh_scp_pull_request()
CVE-2026-0965: Possible Denial of Service when parsing unexpected
configuration files
CVE-2026-0966: Buffer underflow in ssh_get_hexa() on invalid input
CVE-2026-0967: Specially crafted patterns could cause DoS
CVE-2026-0968: OOB Read in sftp_parse_longname()
libssh-2026-sftp-extensions: Read buffer overrun when handling SFTP
extensions

Signed-off-by: Mattias Walström <lazzer@gmail.com>
[Julien:
 - add link to upstream change summary
 - fix signature link in hash file
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f54e7d710c6dd7d46702304ec8d7ea9e7a8252ec)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 1c15d77a45..5a103eb593 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.11/libssh-0.11.3.tar.xz.asc
+# https://www.libssh.org/files/0.11/libssh-0.11.4.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  7d8a1361bb094ec3f511964e78a5a4dba689b5986e112afabe4f4d0d6c6125c3  libssh-0.11.3.tar.xz
+sha256  002ac320e3d66c9e100ec6576e3e84aa0c48949efde3bf5b40a2802992297701  libssh-0.11.4.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 3c7e77a206..56de66d6ea 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.11
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).3
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1

--===============1407185859004995343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1407185859004995343==--
