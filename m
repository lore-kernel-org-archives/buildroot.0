Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DC1CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C80C83F84;
	Thu, 21 Aug 2025 19:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQzV6mbwu4dX; Thu, 21 Aug 2025 19:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5480083F71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5480083F71;
	Thu, 21 Aug 2025 19:20:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B53F93D
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71F2D41987
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_IHcsHTCV2l for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93D6D41921
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93D6D41921
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EBD386DE8; Thu, 21 Aug 2025 19:20:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:49:01 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 59f1851e4ac61081056d283900e798c114d94d6a
X-Git-Newrev: 1000831e36ed16120f32fa72839b09a06174553d
X-Patchwork-Hint: ignore
Message-Id: <20250821192003.8EBD386DE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/luajit: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=1000831e36ed16120f32fa72839b09a06174553d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
