Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E6FC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 680EF6FBE6;
	Fri, 28 Feb 2025 17:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wl8w9fYdu-pA; Fri, 28 Feb 2025 17:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F6EC703ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F6EC703ED;
	Fri, 28 Feb 2025 17:09:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A687711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00E2A42F2C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObegokUsdNmm for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5B8642B50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5B8642B50
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE67386A52; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 18:58:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 34b047a442b1b3c64713972fc54d98c05a672c7c
X-Git-Newrev: 2e8a600fea1f29fb4162ba6e2a2f9b62c1d6e50e
X-Patchwork-Hint: ignore
Message-Id: <20250228163026.DE67386A52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openldap: update to
 2.5.19
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
Content-Type: multipart/mixed; boundary="===============0512476906358809536=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0512476906358809536==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2e8a600fea1f29fb4162ba6e2a2f9b62c1d6e50e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See here for a changelog:
https://www.openldap.org/software/release/changes_lts.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Reviewed-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openldap/openldap.hash | 4 ++--
 package/openldap/openldap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 32bd83f349..69c3e978b1 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,5 +1,5 @@
 # Verified by locally checking against the SHA3-512 hash available in
-# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.18.sha3-512
+# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.19.sha3-512
 # Locally computed
-sha256  2670ae43d8d99dd6b1ba182101d982350d613d09c098eb1607ea6b36e6b51d3e  openldap-2.5.18.tgz
+sha256  56e2936c7169aa7547cfc93d5c87db46aa05e98dee6321590c3ada92e1fbb66c  openldap-2.5.19.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 68cfb89c41..da67562a40 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.5.18
+OPENLDAP_VERSION = 2.5.19
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License

--===============0512476906358809536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0512476906358809536==--
