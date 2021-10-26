Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4664C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:38:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A8B660F9D
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A8B660F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59BA480B94;
	Tue, 26 Oct 2021 19:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id goiYmb2tu5Vy; Tue, 26 Oct 2021 19:38:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB74480B76;
	Tue, 26 Oct 2021 19:38:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B980D1BF9B2
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4AFF817F5
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dhb-tjW3-n0P for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 028A981036
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:38:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 11BE888F04; Tue, 26 Oct 2021 19:34:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:34:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1fe3050f26618d5050f69db9427f5ac9e3151a3
X-Git-Newrev: c12e8a15f53909726006ecbae3f4190a2c4a4182
X-Patchwork-Hint: ignore
Message-Id: <20211026193445.11BE888F04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: security bump to
 version 5.9.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=c12e8a15f53909726006ecbae3f4190a2c4a4182
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index 2967682767..850bb7326e 100644
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
