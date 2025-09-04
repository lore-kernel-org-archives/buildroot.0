Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7812DCA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 505A740688;
	Thu,  4 Sep 2025 16:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyLkD9kDdSTX; Thu,  4 Sep 2025 16:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B2D440595
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B2D440595;
	Thu,  4 Sep 2025 16:35:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA3CEAE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98118400AA
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSQZONg9xlfv for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49BDC4006A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49BDC4006A
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47FCB87EEF; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:15:40 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 2f2eaa53b21c15e0ee5c9f02549c4b211548fe48
X-Git-Newrev: 8478600a1c3d16d924707d1fa0c61e3405a90f8e
X-Patchwork-Hint: ignore
Message-Id: <20250904163336.47FCB87EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/unbound: mark
 CVE-2025-5994 as not applicable
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8478600a1c3d16d924707d1fa0c61e3405a90f8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Unbound is vulnerable to CVE-2025-5994: "Cache poisoning via the ECS-enabled
Rebirthday Attack" if built with --enable-subnet, which is not the case in
Buildroot, so mark it as not applicable.

https://nlnetlabs.nl/downloads/unbound/CVE-2025-5994.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c7721b0174d9e978e58bdffba26ff2151b47af9c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/unbound/unbound.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 03a5e8e150..e9a32e6129 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -23,6 +23,9 @@ UNBOUND_CONF_OPTS = \
 	--with-libexpat=$(STAGING_DIR)/usr \
 	--with-ssl=$(STAGING_DIR)/usr
 
+# Only vulnerable if built with --enable-subnet
+UNBOUND_IGNORE_CVES += CVE-2025-5994
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 UNBOUND_CONF_OPTS += --with-pthreads
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
