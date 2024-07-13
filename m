Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79A8C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 819DA408ED;
	Sat, 13 Jul 2024 14:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JY9oiGcsem2u; Sat, 13 Jul 2024 14:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BDDE40942
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BDDE40942;
	Sat, 13 Jul 2024 14:27:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 812121BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DF3C400A4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEjOaUeJ_UvT for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6902840096
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6902840096
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:27:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5703B864C6; Sat, 13 Jul 2024 14:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:27:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c1a85a87d5aabfc2a4ec99da7c48df9f1884797
X-Git-Newrev: bbc8cc1cb6ed0db859bc6caf6b52d8913d51506e
X-Patchwork-Hint: ignore
Message-Id: <20240713142748.5703B864C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs: add time64 status of uClibc-ng
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bbc8cc1cb6ed0db859bc6caf6b52d8913d51506e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/faq-troubleshooting.adoc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/manual/faq-troubleshooting.adoc b/docs/manual/faq-troubleshooting.adoc
index 5f132f99f6..2122a6892f 100644
--- a/docs/manual/faq-troubleshooting.adoc
+++ b/docs/manual/faq-troubleshooting.adoc
@@ -253,9 +253,10 @@ There are multiple situations to consider:
 
  * On 32-bit architectures, the situation depends on the C library:
 
- ** With _uclibc-ng_, there is no support for 64-bit +time_t+ on
-    32-bit architectures, so systems using _uclibc-ng_ on 32-bit
-    platforms will not be Y2038 compatible.
+ ** With _uclibc-ng_, there is support for 64-bit +time_t+ on 32-bit
+    architectures since version 1.0.46, so systems using _uclibc-ng_
+    on 32-bit platforms will be Y2038 compatible when
+    UCLIBC_USE_TIME64 is y.  This is the default since 1.0.49.
 
  ** With _musl_, 64-bit +time_t+ has always been used on 32-bit
     architectures, so systems using _musl_ on 32-bit platforms are
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
