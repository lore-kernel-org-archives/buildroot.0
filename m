Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10101C001DB
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 10:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 601FE408AF;
	Sun, 13 Aug 2023 10:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 601FE408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9PYNBeGlQ6eN; Sun, 13 Aug 2023 10:17:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 483B5408B6;
	Sun, 13 Aug 2023 10:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 483B5408B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5BC1BF424
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 10:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DFE2402D7
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 10:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DFE2402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLgiIDQ-s2PY for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 10:17:31 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 913F640119
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 10:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 913F640119
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B2B6B352BD3A; Sun, 13 Aug 2023 12:17:28 +0200 (CEST)
Date: Sun, 13 Aug 2023 12:17:28 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNituOHmh8/+1QYr@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691921848; bh=WzVzF9HjHx46TYa1QyaQjGMN2l/qJBM7stZqWW3zEm0=;
 h=Date:From:To:Subject:From;
 b=qUmUBnunXDtDKGtNBAQZo6yfkOk3PJ9FbZuwAwAX8CvWt8jonC+gINPyWWLlOdJ7a
 izv+TV0Ci1zUkS2quBFe89zThMqgrQ+Ytp+O32/+GOCEAQFHqaC4z+PW6oK8OPRyiv
 vx8m0kimPY9noCnlFZVdEDI9W8TJXueYMYdc1C83iyv9lkD8DLNyvXfOKWtwLns7wi
 +Hxwitp30VD94SxfE2HuG2nvXcC3K2332FWeCOsJxQdVQCsR7osLsmEB2CyNHqCDYG
 31vzSvjNDSrFXjyND5riKtbzuPaygK0tYgr8qcNpxNOQG1WfVoMSaIYRzYHxr24ATd
 KqbV6bAn96Gag==
Subject: [Buildroot] [PATCH] package/util-linux: add missing autoreconf
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit 898bdbca1f11fe81e8be7924371326f85f466a27 we added a patch
for configure.ac and missed to run autoreconf.

Fixes:
 - http://autobuild.buildroot.net/results/06f/06f2e368982a620b3e810eccfdc307ae99271e22

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/util-linux/util-linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index bdb4fd6b90..18315ea659 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -31,6 +31,8 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 UTIL_LINUX_INSTALL_STAGING = YES
+# We're patching configure.ac
+UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs) \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
