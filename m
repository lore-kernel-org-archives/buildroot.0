Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0237C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:24:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FA5760F0F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FA5760F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7970B60596;
	Tue,  3 Aug 2021 21:24:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXY1vbLnVGJ0; Tue,  3 Aug 2021 21:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0919600C7;
	Tue,  3 Aug 2021 21:24:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27D781BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82DDD404D4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lfge_Wu0TtW for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15DE440430
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 602238B43E; Tue,  3 Aug 2021 21:09:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 May 2021 23:01:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aa31d10808df0560cc9e9b92acadad1af9a041e9
X-Git-Newrev: 9c108afab81b675eddc1f71cc496b47d9077bdb1
X-Patchwork-Hint: ignore
Message-Id: <20210803210936.602238B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/prosody: security bump
 to version 0.11.9
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3920529420459032304=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3920529420459032304==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9c108afab81b675eddc1f71cc496b47d9077bdb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security issues:

- CVE-2021-32918: DoS via insufficient memory consumption controls

  It was discovered that default settings leave Prosody susceptible to
  remote unauthenticated denial-of-service (DoS) attacks via memory
  exhaustion when running under Lua 5.2 or Lua 5.3.  Lua 5.2 is the default
  and recommended Lua version for Prosody 0.11.x series.

- CVE-2021-32920: DoS via repeated TLS renegotiation causing excessive CPU
  consumption

  It was discovered that Prosody does not disable SSL/TLS renegotiation,
  even though this is not used in XMPP.  A malicious client may flood a
  connection with renegotiation requests to consume excessive CPU resources
  on the server.

- CVE-2021-32921: Use of timing-dependent string comparison with sensitive
  values

  It was discovered that Prosody does not use a constant-time algorithm for
  comparing certain secret strings when running under Lua 5.2 or later.
  This can potentially be used in a timing attack to reveal the contents of
  secret strings to an attacker.

- CVE-2021-32917: Use of mod_proxy65 is unrestricted in default
  configuration

  mod_proxy65 is a file transfer proxy provided with Prosody to facilitate
  the transfer of files and other data between XMPP clients.

  It was discovered that the proxy65 component of Prosody allows open access
  by default, even if neither of the users have an XMPP account on the local
  server, allowing unrestricted use of the server’s bandwidth.

- CVE-2021-32919: Undocumented dialback-without-dialback option insecure

  The undocumented option ‘dialback_without_dialback’ enabled an
  experimental feature for server-to-server authentication.  A flaw in this
  feature meant it did not correctly authenticate remote servers, allowing a
  remote server to impersonate another server when this option is enabled.

For more details, see the advisory:
https://prosody.im/security/advisory_20210512/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 309ae0181f..50d5964712 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  24cd3c1f7ab16a6b3726423d2fff802d  prosody-0.11.8.tar.gz
-sha1  f1f030c75abde6e3c7232fedbe8371f5cb913245  prosody-0.11.8.tar.gz
-sha256  830f183b98d5742d81e908d2d8e3258f1b538dad7411f06fda5b2cc5c75068f8  prosody-0.11.8.tar.gz
-sha512  b0b7e1d3e41f47f0f88ad5b76444e4959b20f4c7a937f3cc605ba6ed5d92e713a3054dcb61ee6629063883a8f9ff1a03952893de4a0d840dcec4e5e42079eb57  prosody-0.11.8.tar.gz
+md5  be7e1c66c06b0eb4bdce37b67bcc6b51  prosody-0.11.9.tar.gz
+sha1  632c2dd7794d344d4edbcea18fc1b5f623da5ca4  prosody-0.11.9.tar.gz
+sha256  ccc032aea49d858635fb93644db276de6812be83073a8d80e9b4508095deff09  prosody-0.11.9.tar.gz
+sha512  fabbbbb1acb3de4ff01e3e8c6e9e4dc37cb161259f1649683a1f9d925ed9f1709e052bfc831cba3f1861a9cca599f2b725ee739bfcb57164d6f50ac07011b52a  prosody-0.11.9.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index a4482ad3c5..92c812ebfa 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.8
+PROSODY_VERSION = 0.11.9
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING

--===============3920529420459032304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3920529420459032304==--
