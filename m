Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885E9C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 08:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E6F82668;
	Mon, 17 Oct 2022 08:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34E6F82668
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRbNGXt2ZcWJ; Mon, 17 Oct 2022 08:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F94B82612;
	Mon, 17 Oct 2022 08:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F94B82612
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 319A91BF97F
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C47DD403FF
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C47DD403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNUh8hfUl8Oe for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 08:38:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04BDA409F8
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04BDA409F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E89C086DF9; Mon, 17 Oct 2022 08:38:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 10:37:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1684cd72b0557444ee80195b60c5ab57ff6b1313
X-Git-Newrev: 99a570ee2b1368ca8b2be36c496bbe71224679ad
X-Patchwork-Hint: ignore
Message-Id: <20221017083837.E89C086DF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcp: security bump to version
 4.4.3-P1
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

commit: https://git.buildroot.net/buildroot/commit/?id=99a570ee2b1368ca8b2be36c496bbe71224679ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Corrected a reference count leak that occurs when the server builds
  responses to leasequery packets. Thanks to VictorV of Cyber Kunlun
  Lab for reporting the issue.
  [Gitlab #253]
  CVE: CVE-2022-2928

- Corrected a memory leak that occurs when unpacking a packet that has an
  FQDN option (81) that contains a label with length greater than 63 bytes.
  Thanks to VictorV of Cyber Kunlun Lab for reporting the issue.
  [Gitlab #254]
  CVE: CVE-2022-2929

https://kb.isc.org/docs/cve-2022-2928
https://kb.isc.org/docs/cve-2022-2929
https://ftp.isc.org/isc/dhcp/4.4.3-P1/dhcp-4.4.3-P1-RELNOTES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.hash | 4 ++--
 package/dhcp/dhcp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index be03423db8..7dd80a7acc 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/dhcp/4.4.3/dhcp-4.4.3.tar.gz.sha256.asc
-sha256  0e3ec6b4c2a05ec0148874bcd999a66d05518378d77421f607fb0bc9d0135818  dhcp-4.4.3.tar.gz
+# Verified from https://ftp.isc.org/isc/dhcp/4.4.3-P1/dhcp-4.4.3-P1.tar.gz.sha256.asc
+sha256  0ac416bb55997ca8632174fd10737fd61cdb8dba2752160a335775bc21dc73c7  dhcp-4.4.3-P1.tar.gz
 # Locally calculated
 sha256  45a39c430be0920cb9570f34b32d2378fe6048c034f2f3265b9326d64ada73df  LICENSE
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 183c8322d6..7be40191c8 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.4.3
+DHCP_VERSION = 4.4.3-P1
 DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
