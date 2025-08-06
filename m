Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32065C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 12:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03BE14122C;
	Wed,  6 Aug 2025 12:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5CBNpTcr5ZcN; Wed,  6 Aug 2025 12:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FD174101D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FD174101D;
	Wed,  6 Aug 2025 12:59:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14F6F31
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFD3460E93
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXndMHBTfB6O for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 12:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B75160DF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B75160DF0
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:59:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A08786F29; Wed,  6 Aug 2025 12:59:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Aug 2025 14:57:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8083972a9098d174f3f7e1be007a55b134864cd8
X-Git-Newrev: 7407f797a611bef3cdc5cc095ef2b8100d698818
X-Patchwork-Hint: ignore
Message-Id: <20250806125918.1A08786F29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: update mirror url
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

commit: https://git.buildroot.net/buildroot/commit/?id=7407f797a611bef3cdc5cc095ef2b8100d698818
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the 2.4.65 release of this package is available on
https://dlcdn.apache.org/httpd older version are removed from this
location in favour of https://archive.apache.org/dist/httpd.

In 2025.02.x branch the apache package hasn't been bumped to the latest
version yet so the following error started appearing on the autobuilder:

```
>>> apache 2.4.64 Downloading
wget -nd -t 3 --no-check-certificate -O '/workdir/instance-0/output-1/build/.httpd-2.4.64.tar.bz2.hfXgDB/output' 'https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2'
WARNING: The certificate is NOT trusted. The certificate issuer is unknown.
[0] Downloading 'https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2' ...
HTTP ERROR response 404  [https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2]
make: *** [package/pkg-generic.mk:179: /workdir/instance-0/output-1/build/apache-2.4.64/.stamp_downloaded] Error 1
make: Leaving directory '/workdir/instance-0/buildroot'
```

To avoid running in the same error once the next package version is
released this patch update the site to the archive mirror with all the
releases.

Fixes: https://autobuild.buildroot.org/results/7a0/7a0982bcf9db4dcbcf4f6cf31b9f19571c061ee4/build-end.log
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 2 +-
 package/apache/apache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index ca9d1580ad..5b0aab0af2 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.65.tar.bz2.{sha256,sha512}
+# From https://archive.apache.org/dist/httpd/httpd-2.4.65.tar.bz2.{sha256,sha512}
 sha256  58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3  httpd-2.4.65.tar.bz2
 sha512  202f8bfe2aafcfbcd7315191d466e9c10b9a8c0abafb7864510b6e1abe4cb660aaacc2456aa77d43e48ef7a49e591d0b54170d3daf67abc3e06c3da1c63fdffc  httpd-2.4.65.tar.bz2
 # Locally computed
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index cb029274c5..23332f3e85 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -6,7 +6,7 @@
 
 APACHE_VERSION = 2.4.65
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
-APACHE_SITE = https://dlcdn.apache.org/httpd
+APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
 APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
