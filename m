Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B0BC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 08:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D40CD82304;
	Sat, 11 Mar 2023 08:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D40CD82304
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sg4tXmvd8zlq; Sat, 11 Mar 2023 08:53:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 326F4822E1;
	Sat, 11 Mar 2023 08:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 326F4822E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79A731BF312
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 08:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B94560B2C
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 08:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B94560B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUCKlFWRa-l7 for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 08:53:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AA6560AAD
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 08:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AA6560AAD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78004845F8; Sat, 11 Mar 2023 08:53:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 09:51:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ec39bad8062878cebd6dc95b712e33209b4e585
X-Git-Newrev: 1c89f36821b8b37143efcd53558c9fda24788808
X-Patchwork-Hint: ignore
Message-Id: <20230311085315.78004845F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 require FileHandle perl package for ace
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c89f36821b8b37143efcd53558c9fda24788808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ace needs FileHandle module:

Can't locate FileHandle.pm in @INC (you may need to install the FileHandle module) (@INC contains: /home/buildroot/autobuild/instance-0/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-0/output-1/build/ace-7.0.6/MPC/prj_install.pl line 17.
BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-0/output-1/build/ace-7.0.6/MPC/prj_install.pl line 17.

Fixes:
 - http://autobuild.buildroot.org/results/9dee7c09fd7b41d276df0285a0f3dcae1a71f041

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 563dbe1595..58f44c8723 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -302,7 +302,7 @@ if grep -q -E '^BR2_PACKAGE_(WEBKITGTK|WPEWEBKIT)=y' $BR2_CONFIG ; then
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
