Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA14C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 10:22:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED65F604DA
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 10:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED65F604DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C73AE818D0;
	Wed, 27 Oct 2021 10:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80boYsY9BFQL; Wed, 27 Oct 2021 10:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0A380E56;
	Wed, 27 Oct 2021 10:22:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 107F01BF2F4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 10:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 000E360ADF
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 10:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVO0WwdLHHU6 for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 10:22:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 405E5606E5
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 10:22:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DE8E588FB1; Wed, 27 Oct 2021 10:18:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 12:21:32 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: aefbe5cc683c0f7d445e51069da6974b481d1dd8
X-Git-Newrev: 4eea95a98980373633c603520b3966b40345171f
X-Patchwork-Hint: ignore
Message-Id: <20211027101854.DE8E588FB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/strongswan:
 security bump to version 5.9.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4eea95a98980373633c603520b3966b40345171f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

- Fixed a denial-of-service vulnerability in the gmp plugin that was
  caused by an integer overflow when processing RSASSA-PSS signatures
  with very large salt lengths. This vulnerability has been registered
  as CVE-2021-41990.
- Fixed a denial-of-service vulnerability in the in-memory certificate
  cache if certificates are replaced and a very large random value
  caused an integer overflow. This vulnerability has been registered as
  CVE-2021-41991.

https://www.strongswan.org/blog/2021/10/18/strongswan-vulnerability-(cve-2021-41991).html

https://github.com/strongswan/strongswan/blob/5.9.4/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c12e8a15f53909726006ecbae3f4190a2c4a4182)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index a19b311458..69b3547f91 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.1.tar.bz2.md5
-md5  1f4db969d072e120dc12d1c116a0f658  strongswan-5.9.1.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.4.tar.bz2.md5
+md5  9c387eb77f0159fdefbcf7e81c905c35  strongswan-5.9.4.tar.bz2
 # Calculated based on the hash above
-sha256  a337c9fb63d973b8440827755c784031648bf423b7114a04918b0b00fd42cafb  strongswan-5.9.1.tar.bz2
+sha256  45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518  strongswan-5.9.4.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 322abfbd7b..dbdcfe0a28 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.1
+STRONGSWAN_VERSION = 5.9.4
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
