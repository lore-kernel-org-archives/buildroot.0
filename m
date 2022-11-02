Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCBCC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFF2740B76;
	Wed,  2 Nov 2022 22:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFF2740B76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYF7yTHskkMA; Wed,  2 Nov 2022 22:52:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCB5F40B70;
	Wed,  2 Nov 2022 22:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB5F40B70
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDF5D1BF95F
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C645B41737
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C645B41737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOhYCsQK_Pa4 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:52:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B73B9401B2
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B73B9401B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A255D87AFD; Wed,  2 Nov 2022 22:52:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 23:50:04 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: d57cf26ea923305fca93a59579df65e6b8f5b686
X-Git-Newrev: 3f41aa67f0717577219a2e276097a6cd887ca35d
X-Patchwork-Hint: ignore
Message-Id: <20221102225212.A255D87AFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/dhcp: security
 bump to version 4.4.3-P1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f41aa67f0717577219a2e276097a6cd887ca35d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit 99a570ee2b1368ca8b2be36c496bbe71224679ad)
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
