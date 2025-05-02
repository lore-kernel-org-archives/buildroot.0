Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80638C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5284041A50;
	Fri,  2 May 2025 11:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AN3pO6_59X8I; Fri,  2 May 2025 11:12:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 884ED41512
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 884ED41512;
	Fri,  2 May 2025 11:12:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12AB2EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FF9441E41
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_x73l6IwDaN for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31335416FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31335416FF
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C6EB860E9; Fri,  2 May 2025 11:11:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:11:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: be4c07f3149b55b11a52e8823f655db8b82c9c8b
X-Git-Newrev: b890ec4331493a8d21e7ed72c50ed916dcde1910
X-Patchwork-Hint: ignore
Message-Id: <20250502111136.2C6EB860E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libopenmpt:
 install to staging to fix pkg-config
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4512716498209603289=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4512716498209603289==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b890ec4331493a8d21e7ed72c50ed916dcde1910
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Without this, packages using libopenmpt are not able to find
the dependency.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
[Julien: reword commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 24a41c8fb5a63cb1e2dd512368e023af73beabf8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libopenmpt/libopenmpt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libopenmpt/libopenmpt.mk b/package/libopenmpt/libopenmpt.mk
index 74ffbdbbd4..57c45c6ea1 100644
--- a/package/libopenmpt/libopenmpt.mk
+++ b/package/libopenmpt/libopenmpt.mk
@@ -11,6 +11,7 @@ LIBOPENMPT_LICENSE = BSD-3-Clause
 LIBOPENMPT_LICENSE_FILES = LICENSE
 LIBOPENMPT_CPE_ID_VENDOR = openmpt
 LIBOPENMPT_DEPENDENCIES = host-pkgconf
+LIBOPENMPT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBOPENMPT_OPENMPT123),y)
 LIBOPENMPT_CONF_OPTS += --enable-openmpt123

--===============4512716498209603289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4512716498209603289==--
