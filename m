Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970CBC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 12:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A88081B7B;
	Sun,  3 Mar 2024 12:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_0MDMi4xDaA; Sun,  3 Mar 2024 12:15:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6824381BB4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6824381BB4;
	Sun,  3 Mar 2024 12:15:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C00891BF34A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 12:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADA3C81491
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 12:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cr_I9P63KMTE for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 12:15:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BD08148E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6BD08148E
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 12:15:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFBBC87F82; Sun,  3 Mar 2024 12:15:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 13:13:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1692f2514a48ee369e09753007e9c67ff90daaf3
X-Git-Newrev: fe1b0818364be4742815f69a102ac2e676784136
X-Patchwork-Hint: ignore
Message-Id: <20240303121523.DFBBC87F82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 libopenssl needs perl bigint on s390x
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe1b0818364be4742815f69a102ac2e676784136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7ea38660e01a87ab70c02e38c78a49202e8e5c21 confused bigint [1] with
Math::BigInt [2]:

Can't locate bigint.pm in @INC (you may need to install the bigint module) (@INC contains: /home/buildroot/autobuild/instance-1/output-1/build/libopenssl-3.2.1/crypto/chacha/asm/../.. /home/buildroot/autobuild/instance-1/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-1/output-1/build/libopenssl-3.2.1/crypto/chacha/asm/../../perlasm/s390x.pm line 16.
BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-1/output-1/build/libopenssl-3.2.1/crypto/chacha/asm/../../perlasm/s390x.pm line 16.

[1] https://perldoc.perl.org/bigint
[2] https://perldoc.perl.org/Math::BigInt

Fixes: 7ea38660e01a87ab70c02e38c78a49202e8e5c21
 - http://autobuild.buildroot.org/results/777d86a1e53dc3d6a16c829348673f1c33245a6c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 3d83cb3285..6d5fc36037 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -283,7 +283,7 @@ required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopens
 required_perl_modules="$required_perl_modules IPC::Cmd" # Used by (host-)libopenssl
 
 if grep -q ^BR2_PACKAGE_LIBOPENSSL=y $BR2_CONFIG && grep -q ^BR2_s390x=y $BR2_CONFIG ; then
-    required_perl_modules="$required_perl_modules Math::BigInt"
+    required_perl_modules="$required_perl_modules bigint"
 fi
 
 if grep -q ^BR2_PACKAGE_MOSH=y $BR2_CONFIG ; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
