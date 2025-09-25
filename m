Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AABCAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AEC141749;
	Thu, 25 Sep 2025 20:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptanfHXEAZ8t; Thu, 25 Sep 2025 20:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CB9841723
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CB9841723;
	Thu, 25 Sep 2025 20:20:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1098612D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C54D7415AA
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3Uxsb3KFS_X for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D85241505
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D85241505
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B60586418; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0d1625f8e1cf75345a94c82dec8c0c18fb2196ae
X-Git-Newrev: f3733d1e7b83d1c4c6a5048cad18302ef601e21a
X-Patchwork-Hint: ignore
Message-Id: <20250925201942.1B60586418@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cpp-httplib: fix
 deprecated CPE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f3733d1e7b83d1c4c6a5048cad18302ef601e21a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The CPE 'cpp_httplib_project:cpp-httplib' has been deprecated in favour
of 'yhirose:cpp-httplib'.

See https://nvd.nist.gov/products/cpe/detail/5D557BEA-8246-464C-AB90-EA9495A0732A

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cf480bda614f66842e51cb14603a5082798a6c35)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cpp-httplib/cpp-httplib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 928cef8a86..556368efa0 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -8,7 +8,7 @@ CPP_HTTPLIB_VERSION = 0.19.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
-CPP_HTTPLIB_CPE_ID_VALID = YES
+CPP_HTTPLIB_CPE_ID_VENDOR = yhirose
 CPP_HTTPLIB_INSTALL_STAGING = YES
 CPP_HTTPLIB_CONF_OPTS = \
 	-Dcpp-httplib_test=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
