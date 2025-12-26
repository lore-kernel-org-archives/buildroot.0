Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6F3E8FDB5
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BDE840528;
	Fri, 26 Dec 2025 20:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYdwDvoYITmH; Fri, 26 Dec 2025 20:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 523CA4058C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766779641;
	bh=6TanxeBf1Hk/9eY5z/xio4XWDGRqzMXvDQpoN803fH8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UlplFf2dxopLWdvvnQ5DXICCDitlq3p9Xff8lIW2lbbHwb5yBXCQ+s8HRUz1FkPd6
	 NOUqRNfLGfpXHVoNq7Xu32gplRjapeaowJHJRE6Hg4MdV80blc1kqxVbE0C3LPoxHF
	 +GaIZyjj3xg3+qZHgUEgaFNvnPiYT4ylVS2tpT/Ga1yn9q4I62fZI8sHkOrHGYukhe
	 n/4H8s9JSss8PuJ54MjQ7VLo1t7WCP16VytzTxuqItzlzkYp3FaVTkLmG1WlzXq7fk
	 gu220ib0iuVP0BIyy90x/2o21KX4/oxgvYGQXgnwPM7mX1HxuY8NL77ADn55LQLJrw
	 4hX9Bf7Lq8imw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 523CA4058C;
	Fri, 26 Dec 2025 20:07:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC541EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D611C80A9E
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6McVRZzfFBx for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25AFC80A9A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25AFC80A9A
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 133D8876F3; Fri, 26 Dec 2025 20:07:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 20:53:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a62bdee61253e9556e746c479eb2c7f16452d830
X-Git-Newrev: 65ae2ad62babd8fb7267fd6ab45e5b67765c89c3
X-Patchwork-Hint: ignore
Message-Id: <20251226200719.133D8876F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libecoli: bump version to 0.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=65ae2ad62babd8fb7267fd6ab45e5b67765c89c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version is required to compile grout v0.14.2.

See the release note of the new versions:
https://github.com/rjarry/libecoli/releases/tag/v0.10.1
https://github.com/rjarry/libecoli/releases/tag/v0.10.0
https://github.com/rjarry/libecoli/releases/tag/v0.9.1

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index e200b796bf..4045c7e19d 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ac71cd336d7e19921ed1a0ae35ab14433792c7151d23abe92b247c6e36813246  libecoli-0.8.0.tar.gz
+sha256  ec359850f4f338b607d05200d508736b14eaa30fca8aefdfde980a283afd789d  libecoli-0.10.1.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index ad4fa62914..96617a1689 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.8.0
+LIBECOLI_VERSION = 0.10.1
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
