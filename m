Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DDACD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C45D8424D;
	Fri, 15 May 2026 13:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tohmQCV7rt1t; Fri, 15 May 2026 13:30:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EC158429F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851804;
	bh=a6GW9Pu8fQl3dn0ni+AI0CP6OuDTOvZnoSSEe/kCmKk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JowI9pa2aSFUUMcwAsBDwFDdfOEeQMN5aOp9HofsV+VPEJJ17C84n7STXS2PBsKpz
	 aDEZPQXzWEPbK++ryf3DM/ym/ooC5lEvZH7v8jHiB+oSg80MJkshyAz4UpdyXzRyVg
	 SlPWJQGBGKuJvV1jW3yPg87c3UELM/09KEcD+7So6SmmC1q5oZ2LZIbjNMyR+lZ3Ck
	 2zKgVPGEjLV8N/kM9SFhU6dVh1SxEKjNk0layBVNG3tM+tr1xLMxvgWPztePvr8uyl
	 MGWGsSi6pkRxToP+dz0AnhTWnVxl6XxkadwrGJYtjkiy30UXsab8MAbm7krzhPaqDY
	 Iaup2E+uhf7WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EC158429F;
	Fri, 15 May 2026 13:30:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01F6C36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12F4541B26
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujBy2JcC-0Bl for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CD6D41A6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CD6D41A6F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90E9A86352; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:40:53 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 62ef552dd40842b0c7d8afe06fc57a41a5ff4895
X-Git-Newrev: 36bc94ee79df2219bec22dec6ccbf152ba953e11
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.90E9A86352@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libpcap: security
 bump to version 1.10.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/36bc94ee79df2219bec22dec6ccbf152ba953e11
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

fix CVE-2025-11961: Fix OOBR and OOBW in pcap_ether_aton()

For change log, see:
https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.10.6/CHANGES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 146c8a518d62f144275a73893b20d4fbf7ab0b98)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index 7f53b99b8c..098b059fdb 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.5.tar.gz.sig
-sha256  37ced90a19a302a7f32e458224a00c365c117905c2cd35ac544b6880a81488f0  libpcap-1.10.5.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.6.tar.gz.sig
+sha256  872dd11337fe1ab02ad9d4fee047c9da244d695c6ddf34e2ebb733efd4ed8aa9  libpcap-1.10.6.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 67adb0a978..c4feee5766 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.5
+LIBPCAP_VERSION = 1.10.6
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
