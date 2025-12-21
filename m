Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD89E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 12:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 233D060E4C;
	Sun, 21 Dec 2025 12:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61UGXPB4lc9R; Sun, 21 Dec 2025 12:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F09B60BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766321181;
	bh=dqnXu/W2kw5c9uo+FULrQ8mFQPbkxNsMRWXUQRPbYDA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qYa6XUSJWJo3C/fVrcshXQ1GofWKDBx8m0+rqdfOXQRz46dmnKLB4U7hwCLa9huVe
	 19p/XsV46r9f35IbrCEPd3hhrQTD6IKGfFuX3/zVoiG5pm3FZGDXI+Robu3zCSEDlv
	 CxgQNKEUT8knXWlnbHo0rzooGpGWMLF1rGBImDXPISsAtY5MHvB4AQB9UWLlOBnbyC
	 Ww2eTIszC2xopvW4rOsRc3PuUPoMlySlM2JZfJhw7KY19inmviBdYTu4gTajhO+20g
	 aumMSnRDgR9oe6aU3QNKfHP9j+4mwp7W+sP9EdIEjv8cVDCbX/HtXT96vaPCXxDzVP
	 PxgeZSv/oI19g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F09B60BBC;
	Sun, 21 Dec 2025 12:46:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F05F0195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D77434048A
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSJxk8W46Z8k for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 12:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121AA4046E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 121AA4046E
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:46:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 007178741C; Sun, 21 Dec 2025 12:46:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 13:21:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99585db1e896d7a75e204335af86f0725a30d357
X-Git-Newrev: fd991649d39c143fa60419691d01ffb816b39bf0
X-Patchwork-Hint: ignore
Message-Id: <20251221124619.007178741C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: host-python3 needs SSL
 support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fd991649d39c143fa60419691d01ffb816b39bf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 285097051d4a7dd821f01d15c705867f7e26c635 bumped
python-pip to version 25.3, causing build errors when host-python3 was
built without SSL support:

  WARNING: pip is configured with locations that require TLS/SSL,
   however the ssl module in Python is not available.
[...]
  Could not fetch URL https://pypi.org/simple/setuptools/:
   There was a problem confirming the ssl certificate:
   HTTPSConnectionPool(host='pypi.org', port=443): Max retries exceeded
   with url: /simple/setuptools/ (Caused by SSLError("Can't connect to
   HTTPS URL because the SSL module is not available.")) - skipping
  ERROR: Could not find a version that satisfies the requirement setuptools>=40.8.0 (from versions: none)

Reverting the python-pip bump reveals the true cause of the build error
by showing these messages:

  WARNING: pip is configured with locations that require TLS/SSL,
   however the ssl module in Python is not available.
[...]
  DEPRECATION: Building 'selinux' using the legacy setup.py bdist_wheel
  mechanism, which will be removed in a future version. pip 25.3 will
  enforce this behaviour change. A possible replacement is to use the
  standardized build interface by setting the `--use-pep517` option,
  (possibly combined with `--no-build-isolation`), or adding a
  `pyproject.toml` file to the source tree of 'selinux'.
  Discussion can be found at https://github.com/pypa/pip/issues/6334

Selecting BR2_PACKAGE_HOST_PYTHON3_SSL fixes the problem.

Criu, the only other buildroot package using host-python-pip as
dependency, already selects BR2_PACKAGE_HOST_PYTHON3_SSL.

Fixes:
https://autobuild.buildroot.net/results/fd6/fd6d3edd5f74d094621ac9fdb93db24520b7a6e3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libselinux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index bc40e32a46..db5694e7bd 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
 	help
 	  libselinux is the runtime SELinux library that provides
 	  interfaces (e.g. library functions for the SELinux kernel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
