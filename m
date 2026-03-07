Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7F0FC9EDA
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4313783EAF;
	Sat,  7 Mar 2026 10:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xn_oHpsQ80GG; Sat,  7 Mar 2026 10:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73EAA83E2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772878467;
	bh=VGL6BwTfnEF+bo2pYE6w0AXyPwoqg84LroKrInLJ0cI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZxIO7mGOC0uiQlonqtGuBMtXZtptAAcdaUaSI53lCkspRMI7XhB1efWdgJnCmCr79
	 Ie4N/Y8EUDg4t5kZbxhxcrR7BebsFGgpkZpUvL5A89AUDJGsi0deVsyjcdTXWIAue0
	 jlydzCAJcZCp+JiJeJRMZ3dwgawwm+QJH3ez+qL3TBRH/yihi+pqicPwJl8pb/K3B6
	 YkssDxsekC65ut4yWpmOADZAYrDyj8brMUApc5s7GPflPYYJ33Lbar35JHuIDrCl4j
	 JVo3Soy/HNRdAbsQCDYovucADjx7nbCN6jYFTqCLbu+xV5faCFphyYMl7RdZMK2Qu1
	 SlffvP14mYiNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73EAA83E2F;
	Sat,  7 Mar 2026 10:14:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 218E12F8
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 137FD4192C
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7__e1axJr77 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6009A40A65
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6009A40A65
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:14:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67AF18409F; Sat,  7 Mar 2026 10:14:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 11:13:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9faac374c740e2dc1df32b47303a2e05ea7f5592
X-Git-Newrev: d7e8b0d2375ae70605e02426ab3d9ed9b10b82cb
X-Patchwork-Hint: ignore
Message-Id: <20260307101425.67AF18409F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libid3tag: needs host-gperf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7e8b0d2375ae70605e02426ab3d9ed9b10b82cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 0ed1707ba559103f0aa298d40b5017b6bad0394c bumped the
package to 0.16.4 which re-added the dependency to host-gperf:
https://codeberg.org/tenacityteam/libid3tag/commit/2d7e73eb9f580b2258e434e0a8d63c69687ff5ef

Fixes:
https://autobuild.buildroot.net/results/133/133adafe89bc2b7df28dcb10eb30c19272100670/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libid3tag/libid3tag.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index e310f50b7d..be6f629c86 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -10,6 +10,6 @@ LIBID3TAG_SITE = https://codeberg.org/tenacityteam/libid3tag/releases/download/$
 LIBID3TAG_LICENSE = GPL-2.0+
 LIBID3TAG_LICENSE_FILES = COPYING COPYRIGHT
 LIBID3TAG_INSTALL_STAGING = YES
-LIBID3TAG_DEPENDENCIES = zlib
+LIBID3TAG_DEPENDENCIES = host-gperf zlib
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
