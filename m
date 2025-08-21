Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C1CCA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DB638462E;
	Thu, 21 Aug 2025 18:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcbqwHinzKUd; Thu, 21 Aug 2025 18:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B59584628
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B59584628;
	Thu, 21 Aug 2025 18:57:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0612B1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CF16614D4
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTDRZMpvfk4s for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEA0A6141B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEA0A6141B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:56:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEB1387A05; Thu, 21 Aug 2025 18:56:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:36:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 490172faec7cf91a207ae275f6e5500b204687d1
X-Git-Newrev: 90ffd2cad98db3598f4fe40cde0f86fa99a9a083
X-Patchwork-Hint: ignore
Message-Id: <20250821185658.BEB1387A05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/luajit: add
 CPE_VERSION & CPE_UPDATE
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

commit: https://git.buildroot.net/buildroot/commit/?id=90ffd2cad98db3598f4fe40cde0f86fa99a9a083
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since this package hasn't had a proper release in a while this patch set
the CPE_VERSION and CPE_UPDATE to the latest tags available.

The annotation available on NVD all refers to this last available
version `cpe:2.3:a:luajit:luajit:2.1.0:beta3:*:*:*:*:*:*`.

See https://nvd.nist.gov/vuln/detail/CVE-2020-15890 for instance.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e388ef88f06aeffddf5da242c400269604b0fa7f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/luajit/luajit.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index b030a16cfc..ebec4d87ac 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -9,6 +9,8 @@ LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
 LUAJIT_CPE_ID_VENDOR = luajit
+LUAJIT_CPE_ID_VERSION = 2.1.0
+LUAJIT_CPE_ID_UPDATE = beta3
 
 LUAJIT_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
