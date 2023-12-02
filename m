Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4F7C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 08:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC1D4437CA;
	Sat,  2 Dec 2023 08:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC1D4437CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oaf-7d46OqOO; Sat,  2 Dec 2023 08:41:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1B58437D3;
	Sat,  2 Dec 2023 08:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1B58437D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AACD1BF3BF
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 08:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23E1A42227
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 08:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23E1A42227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22snD50Vi-5d for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 08:40:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 327A642225
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 08:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327A642225
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F5D287555; Sat,  2 Dec 2023 08:40:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Dec 2023 09:40:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d8e0a263f277ca113b78b1f283292c418528c11
X-Git-Newrev: 38c4aa2826ce31bd77140a55b5dca78eb28e53a5
X-Patchwork-Hint: ignore
Message-Id: <20231202084059.0F5D287555@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpjsip: security bump to version
 2.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: multipart/mixed; boundary="===============4703927557091936728=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4703927557091936728==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=38c4aa2826ce31bd77140a55b5dca78eb28e53a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-38703: PJSIP is a free and open source multimedia
communication library written in C with high level API in C, C++, Java,
C#, and Python languages. SRTP is a higher level media transport which
is stacked upon a lower level media transport such as UDP and ICE.
Currently a higher level transport is not synchronized with its lower
level transport that may introduce use-after-free issue. This
vulnerability affects applications that have SRTP capability
(`PJMEDIA_HAS_SRTP` is set) and use underlying media transport other
than UDP. This vulnerability’s impact may range from unexpected
application termination to control flow hijack/memory corruption. The
patch is available as a commit in the master branch.

https://github.com/pjsip/pjproject/security/advisories/GHSA-f76w-fh7c-pc66
https://github.com/pjsip/pjproject/releases/tag/2.14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.hash | 2 +-
 package/libpjsip/libpjsip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index 2edd97bed4..d72e1090e3 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  32a5ab5bfbb9752cb6a46627e4c410e61939c8dbbd833ac858473cfbd9fb9d7d  pjproject-2.13.1.tar.gz
+sha256  5805c1171acab4af9684d7ad096dcb92f71fc42809852144e97e1413468c9981  pjproject-2.14.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index f97d547fd7..8169e0dcee 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.13.1
+LIBPJSIP_VERSION = 2.14
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 

--===============4703927557091936728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4703927557091936728==--
