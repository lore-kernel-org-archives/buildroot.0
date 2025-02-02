Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E91C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45C5084D24;
	Fri, 28 Feb 2025 17:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfqmrsroS_JM; Fri, 28 Feb 2025 17:07:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AA6785920
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AA6785920;
	Fri, 28 Feb 2025 17:07:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07E3868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08B894250D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xEN-d1rC-rjS for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4BC441970
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4BC441970
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCBCA8616F; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 2 Feb 2025 12:16:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f3e99436eec2b5a096ac94c18b9a835806ee9de3
X-Git-Newrev: d70df3ab44159f297d562af47e164d00c724ba28
X-Patchwork-Hint: ignore
Message-Id: <20250228163023.BCBCA8616F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/socat: security bump
 to version 1.8.0.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d70df3ab44159f297d562af47e164d00c724ba28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It fixes an arbitrary file overwrite vulnerability in the readline.sh.
(CVE-2024-54661)

see - http://www.dest-unreach.org/socat/contrib/socat-secadv9.html

README hash changed due to version update.

Note: Buildroot is not impacted by this vulnerability as the
readline.sh is not installed on target.

Quoting changelog [1]:

    Mitigating factors: readline.sh is usually neither installed in a bin
    directory nor is it documented. Major Linux distributions install it in
    examples/ or doc/; however it is invoked by test.sh script.

[1] https://repo.or.cz/socat.git/blob/refs/tags/tag-1.8.0.2:/CHANGES

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
[Julien: add note that Buildroot is not impacted in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/socat/socat.hash | 6 +++---
 package/socat/socat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 70c6e6a8f1..136dce4a71 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  e53a6e8e8594ac87476fe4ae361bbcd1  socat-1.8.0.1.tar.bz2
+md5  7272fe53d51c63ca0e08e0339681803a  socat-1.8.0.2.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  6a283565db7cf86292c6f70504c58abb03e29888adeed5a6c5f3457e803c1b81  socat-1.8.0.1.tar.bz2
+sha256  adc07a9c2723527cf6568d2fb96559794cf9c254a4bc2edd36f7f3789e9f7625  socat-1.8.0.2.tar.bz2
 # Locally calculated
-sha256  6c07bae42bf0a919c9dd6583f76cc9020a472652dcdad3e84923074a1f412d75  README
+sha256  a18cf021c6380e8ef212c7a95460aff2d96fe9e2146bb09058651bc3b86f4d43  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 84d9cd3cf8..aa9a94aec4 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.8.0.1
+SOCAT_VERSION = 1.8.0.2
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
