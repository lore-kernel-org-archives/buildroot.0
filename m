Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E70C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 13:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B65F98146A;
	Fri, 14 Oct 2022 13:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B65F98146A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTE9CuplgHn9; Fri, 14 Oct 2022 13:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8B1A81457;
	Fri, 14 Oct 2022 13:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B1A81457
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 427061C1190
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 13:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73023411A1
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 13:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73023411A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqxMnC5zGIce for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 13:53:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BE9F411A0
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 13:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BE9F411A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8752886CA9; Fri, 14 Oct 2022 13:53:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 15:47:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78aa8141aaef8a8dc05d5385694b795100373c24
X-Git-Newrev: bb571dc3e87d0e84b3ae121e0d4a9c6039a051fa
X-Patchwork-Hint: ignore
Message-Id: <20221014135306.8752886CA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: security bump to version
 9.1p1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb571dc3e87d0e84b3ae121e0d4a9c6039a051fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release contains fixes for three minor memory safety problems.
None are believed to be exploitable, but we report most memory safety
problems as potential security vulnerabilities out of caution.

 * ssh-keyscan(1): fix a one-byte overflow in SSH- banner processing.
   Reported by Qualys

 * ssh-keygen(1): double free() in error path of file hashing step in
   signing/verify code; GHPR333

 * ssh-keysign(8): double-free in error path introduced in openssh-8.9

https://www.openssh.com/txt/release-9.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 4cfdb91484..81cea32d2c 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.0 (base64 encoded)
-sha256  03974302161e9ecce32153cfa10012f1e65c8f3750f573a73ab1befd5972a28a  openssh-9.0p1.tar.gz
+# From https://www.openssh.com/txt/release-9.1 (base64 encoded)
+sha256  19f85009c7e3e23787f0236fbb1578392ab4d4bf9f8ec5fe6bc1cd7e8bfdd288  openssh-9.1p1.tar.gz
 # Locally calculated
 sha256  d6807e99f3d159145c659060f57c3fa74e109faa39326dbfc38674cb550fd104  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 0e4253fa74..b70e327620 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.0
+OPENSSH_VERSION_MAJOR = 9.1
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
