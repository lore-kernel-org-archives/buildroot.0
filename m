Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D80E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 11:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CC6A60673;
	Sat, 14 Dec 2024 11:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BrH14KvRWvM; Sat, 14 Dec 2024 11:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7711C60674
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7711C60674;
	Sat, 14 Dec 2024 11:17:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F82EC5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7049260668
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaJaIdwM5xmB for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 11:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89B52605E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89B52605E1
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:17:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8319B86F82; Sat, 14 Dec 2024 11:17:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 11:58:23 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 27914e481db0aa199d275a932b9b1790b92bcf97
X-Git-Newrev: 79299da8c44e677447d926a14b9582c15a8c59b0
X-Patchwork-Hint: ignore
Message-Id: <20241214111740.8319B86F82@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/wget: security
 bump version to 1.25.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=79299da8c44e677447d926a14b9582c15a8c59b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes:
https://lists.gnu.org/archive/html/bug-wget/2024-11/msg00002.html

Fixes the following vulnerabilities:

- CVE-2024-38428: url.c in GNU Wget through 1.24.5 mishandles semicolons in
  the userinfo subcomponent of a URI, and thus there may be insecure
  behavior in which data that was supposed to be in the userinfo
  subcomponent is misinterpreted to be part of the host subcomponent.

  https://nvd.nist.gov/vuln/detail/CVE-2024-38428

- CVE-2024-10524: Applications that use Wget to access a remote resource
  using shorthand URLs and pass arbitrary user credentials in the URL are
  vulnerable.  In these cases attackers can enter crafted credentials which
  will cause Wget to access an arbitrary host.

  https://www.openwall.com/lists/oss-security/2024/11/18/6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 295b2c4f8ecaf0b6e03725a6c8412795e91888c8)
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.hash | 8 ++++----
 package/wget/wget.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index a0561d8d0a..da71b49d09 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,8 +1,8 @@
-# From https://lists.gnu.org/archive/html/bug-wget/2024-03/msg00008.html
-sha1  01659f427c2e90c7c943805db69ea00f5da79b07  wget-1.24.5.tar.lz
+# From https://lists.gnu.org/archive/html/bug-wget/2024-11/msg00002.html
+sha1  ca79e61fbf1d32133f60ef7c7d476b250b6da423  wget-1.25.0.tar.lz
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.24.5.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.25.0.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  57a107151e4ef94fdf94affecfac598963f372f13293ed9c74032105390b36ee  wget-1.24.5.tar.lz
+sha256  19225cc756b0a088fc81148dc6a40a0c8f329af7fd8483f1c7b2fe50f4e08a1f  wget-1.25.0.tar.lz
 # Locally calculated
 sha256  f7dc7522e7e1be9227f3dc8de8b39a4d1d2471968c893af15f00c1a2076a0eec  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index d2a3a38e50..e3143647d7 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.24.5
+WGET_VERSION = 1.25.0
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
