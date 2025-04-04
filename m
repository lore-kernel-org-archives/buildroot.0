Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641DBC36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 17:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13CAC60A94;
	Fri,  4 Apr 2025 17:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCYYaRSHVeNa; Fri,  4 Apr 2025 17:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ECD360C18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ECD360C18;
	Fri,  4 Apr 2025 17:06:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 268DB1C7
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 17:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C0AD409FF
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 17:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZHHBCkAMdcN for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 17:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 048A440949
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 048A440949
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 17:06:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5E9383BA1; Fri,  4 Apr 2025 17:06:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 4 Apr 2025 19:04:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43abcd4c7dd8ad65d2f2012f3d4292362550a3ed
X-Git-Newrev: a3b4ae2eaca9791c7c184e49a04a348dd35185c3
X-Patchwork-Hint: ignore
Message-Id: <20250404170609.E5E9383BA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dillo: remove trailing slash in
 _SITE url
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3b4ae2eaca9791c7c184e49a04a348dd35185c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f2a862fe60 (package/dillo: move to github) changed the source
site for the Dillo package. This change introduced a trailing slash at
the end of the URL.

This cause an error when running `make show-info` with `BR2_PACKAGE_DILLO=y`:

```
package/dillo/dillo.mk:46: *** DILLO_SITE (https://github.com/dillo-browser/dillo/releases/download/v3.0.5/) cannot have a trailing slash.  Stop.
```

This commit removes the trailing slash.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dillo/dillo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index 5a823aa4a3..802be84717 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -6,7 +6,7 @@
 
 DILLO_VERSION = 3.0.5
 DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
-DILLO_SITE = https://github.com/dillo-browser/dillo/releases/download/v$(DILLO_VERSION)/
+DILLO_SITE = https://github.com/dillo-browser/dillo/releases/download/v$(DILLO_VERSION)
 DILLO_LICENSE = GPL-3.0+
 DILLO_LICENSE_FILES = COPYING
 # configure.ac gets patched, so autoreconf is necessary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
