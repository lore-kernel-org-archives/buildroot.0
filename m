Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7F9C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 08:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F6694160B;
	Fri, 17 Mar 2023 08:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F6694160B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHVWW89E5mDk; Fri, 17 Mar 2023 08:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F036D416E5;
	Fri, 17 Mar 2023 08:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F036D416E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A20681BF276
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48FAF613B8
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48FAF613B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6N3rHFDHDDB for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85E8B6132F
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85E8B6132F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75F68874F7; Fri, 17 Mar 2023 08:38:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 09:30:12 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: aa9f2eae457e1ff1154e55bcd9023e7a3cda274f
X-Git-Newrev: d9a6f6a6e8b7179fbeef2c7a7d7238c7e2ae20e6
X-Patchwork-Hint: ignore
Message-Id: <20230317083810.75F68874F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/dependencies/dependencies.sh: require FileHandle perl package for
 ace
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9a6f6a6e8b7179fbeef2c7a7d7238c7e2ae20e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

ace needs FileHandle module:

Can't locate FileHandle.pm in @INC (you may need to install the FileHandle module) (@INC contains: /home/buildroot/autobuild/instance-0/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-0/output-1/build/ace-7.0.6/MPC/prj_install.pl line 17.
BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-0/output-1/build/ace-7.0.6/MPC/prj_install.pl line 17.

Fixes:
 - http://autobuild.buildroot.org/results/9dee7c09fd7b41d276df0285a0f3dcae1a71f041

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1c89f36821b8b37143efcd53558c9fda24788808)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index b99dca1294..f421d9bb8e 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -311,7 +311,7 @@ if grep -q -E '^BR2_PACKAGE_(WEBKITGTK|WPEWEBKIT)=y' $BR2_CONFIG ; then
     required_perl_modules="${required_perl_modules} JSON::PP"
 fi
 
-if grep -q ^BR2_TARGET_SYSLINUX=y $BR2_CONFIG ; then
+if grep -q -E '^BR2_(PACKAGE_ACE|TARGET_SYSLINUX)=y' $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules FileHandle"
 fi
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
