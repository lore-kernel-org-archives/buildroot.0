Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2568CAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CADED6166B;
	Thu, 25 Sep 2025 20:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcwCC7sDcRGI; Thu, 25 Sep 2025 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB59961666
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB59961666;
	Thu, 25 Sep 2025 20:20:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 080F512D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F07DE4161B
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKIzdF5gSjUL for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BE1B4121F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BE1B4121F
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A32A86418; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6b503d76dc9b321c3ca096d141208b9d7e2ec6ef
X-Git-Newrev: 1ffb53af6c7459cfc1dd45e3d47fe0dd46b2ff1e
X-Patchwork-Hint: ignore
Message-Id: <20250925201942.4A32A86418@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/upx: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ffb53af6c7459cfc1dd45e3d47fe0dd46b2ff1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The CPE 'upx_project:upx' has been deprecated in favour of 'upx:upx'.

See the following:
  - https://nvd.nist.gov/products/cpe/detail/36CA8E94-4A35-4373-8D69-22313060322B
  - https://nvd.nist.gov/vuln/detail/CVE-2020-24119

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ff492a2c87933305dc6e6aa72adf944c853bd983)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/upx/upx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 65f4bac517..210114b926 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -9,7 +9,7 @@ UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
 UPX_LICENSE_FILES = COPYING
-UPX_CPE_ID_VALID = YES
+UPX_CPE_ID_VENDOR = upx
 UPX_SUPPORTS_IN_SOURCE_BUILD = NO
 
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
