Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D337BD6E2B1
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A14FE41173;
	Thu, 18 Dec 2025 16:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYBsiXtDol9n; Thu, 18 Dec 2025 16:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E345C4116A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766076252;
	bh=UDKz9rFdppiutqvKpmyA8iXyqVpEK8aTkbUUfAcdRNY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O8s2fbj3b9gdQfaIWVJ8KZWh209fHXZnc3ErbXgNWpVqYpKeELtTRmIfucwgpGJ/o
	 FbADLbdv16aeoqSEdZm3ufoVrVRELqCstSjY8ZOOfH2zO8VGn62MoKsheZGi6FdNot
	 pmEsXeGJj5b0PYWIjg0LMV9ZnjGfQ8jnQZrXyOWyU044+GOx1bkRV1dnZhtJGCz78O
	 QfTc5A/jwesHemoNMQMZLmhs0I683GSez0mqCMJ1fPXDlyVoDOfbhgP+BFLKesfSek
	 /D6s91TZA4gggqsqzSTVGFGkE8FAMmDLPhFtDXtgpQye1VF6DDPxga8aGWAFyTgucE
	 Rcs7rFj2iqvnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E345C4116A;
	Thu, 18 Dec 2025 16:44:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 727D2361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA6EA83E7D
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8sj_fUbDPlI for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 613F383E6D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 613F383E6D
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 510A9873D6; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:55:56 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 0580d6a0b1e8a0248b7f58ca33cdd7e0b4e05d3f
X-Git-Newrev: b807e9d0537cc8be8d1dee1c066c33929017d759
X-Patchwork-Hint: ignore
Message-Id: <20251218164358.510A9873D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-brotli:
 security bump to version 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b807e9d0537cc8be8d1dee1c066c33929017d759
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

https://github.com/google/brotli/blob/v1.2.0/CHANGELOG.md

Adds the following security hardening:

python: added Decompressor::can_accept_more_data method and optional
output_buffer_limit argument Decompressor::process; that allows mitigation
of unexpectedly large output

Which is needed to complete the security fixes in python-urllib3 2.6.0.

Added dependency to host-python-pkgconfig to fix build error which would
be introduced by this bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: mark as security bump, describe the relation with urllib3]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fe5dcf402c0075b6ab86a92733ec75135f9dd760)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-brotli/python-brotli.hash | 4 ++--
 package/python-brotli/python-brotli.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
index e8036d3bb8..ed8eea72eb 100644
--- a/package/python-brotli/python-brotli.hash
+++ b/package/python-brotli/python-brotli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/brotli/json
-md5  908d109a0309c33b626d01137eb4a060  Brotli-1.1.0.tar.gz
-sha256  81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724  Brotli-1.1.0.tar.gz
+md5  af164f216cba527bf6f24d09c9d3576b  brotli-1.2.0.tar.gz
+sha256  e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a  brotli-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index 865c4e363f..e2343a24b2 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_BROTLI_VERSION = 1.1.0
-PYTHON_BROTLI_SOURCE = Brotli-$(PYTHON_BROTLI_VERSION).tar.gz
-PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/2f/c2/f9e977608bdf958650638c3f1e28f85a1b075f075ebbe77db8555463787b
+PYTHON_BROTLI_VERSION = 1.2.0
+PYTHON_BROTLI_SOURCE = brotli-$(PYTHON_BROTLI_VERSION).tar.gz
+PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285
 PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE
+PYTHON_BROTLI_DEPENDENCIES = host-python-pkgconfig
 
 PYTHON_BROTLI_CFLAGS = $(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
