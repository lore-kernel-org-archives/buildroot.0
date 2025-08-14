Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF02DCA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4C896074E;
	Thu, 14 Aug 2025 19:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdJ4TGXA4tjZ; Thu, 14 Aug 2025 19:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C005B60724
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C005B60724;
	Thu, 14 Aug 2025 19:56:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FE1B1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77347404B8
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CH-OH64jf3HW for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26F3F4046D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26F3F4046D
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1564087609; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:25:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 43e2ee5b2636d362962363743ed71d9a58958ff5
X-Git-Newrev: b0d06c13fec64f24e2a0ddaaa24ce3f575b8239e
X-Patchwork-Hint: ignore
Message-Id: <20250814195611.1564087609@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/apache: update
 mirror url
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0d06c13fec64f24e2a0ddaaa24ce3f575b8239e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 7407f797a611bef3cdc5cc095ef2b8100d698818)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
