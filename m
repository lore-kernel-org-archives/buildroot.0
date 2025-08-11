Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979C8C87FDB
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 10:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6837183DAC;
	Mon, 11 Aug 2025 10:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6ly5aj6CDVs; Mon, 11 Aug 2025 10:03:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F3F583DC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F3F583DC1;
	Mon, 11 Aug 2025 10:03:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 525FD1C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E1E83DC1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20oo1BE1e59c for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 10:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75CF783DC0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75CF783DC0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:03:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6440F873AA; Mon, 11 Aug 2025 10:03:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 12:00:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d09bd49e8a2e20ff59c9e61bb7ff7bb34ab9f36
X-Git-Newrev: e388ef88f06aeffddf5da242c400269604b0fa7f
X-Patchwork-Hint: ignore
Message-Id: <20250811100356.6440F873AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: add CPE_VERSION &
 CPE_UPDATE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e388ef88f06aeffddf5da242c400269604b0fa7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since this package hasn't had a proper release in a while this patch set
the CPE_VERSION and CPE_UPDATE to the latest tags available.

The annotation available on NVD all refers to this last available
version `cpe:2.3:a:luajit:luajit:2.1.0:beta3:*:*:*:*:*:*`.

See https://nvd.nist.gov/vuln/detail/CVE-2020-15890 for instance.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
