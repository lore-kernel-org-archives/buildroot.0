Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDADC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 426C740FE3;
	Wed, 22 Feb 2023 20:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 426C740FE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCInOco8Soqe; Wed, 22 Feb 2023 20:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D84941133;
	Wed, 22 Feb 2023 20:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D84941133
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1A91BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC103612A6
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC103612A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OggeQfgmWNTu for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:04:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 123A0612A2
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 123A0612A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00F7C86844; Wed, 22 Feb 2023 20:04:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 21:02:05 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4a17c925e063b3531202a67500879e39599ed1a8
X-Git-Newrev: a007e20b33ddc224d014392f5490218a12c94add
X-Patchwork-Hint: ignore
Message-Id: <20230222200429.00F7C86844@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 support/dependencies/dependencies.sh: require open perl package for
 libxcrypt
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

commit: https://git.buildroot.net/buildroot/commit/?id=a007e20b33ddc224d014392f5490218a12c94add
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fixes:
http://autobuild.buildroot.net/results/16c/16cba783be11cc5024f9c56bb0a7abb0acf13ef8/

The configure script of libxcrypt needs the open perl module on the host:

Can't locate open.pm in @INC (you may need to install the open module) (@INC
contains: /home/buildroot/autobuild/instance-2/output-1/host/lib/perl
/usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36
/usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5
/usr/share/perl5) at ./build-aux/scripts/expand-selected-hashes line 20.

So add a check for it in dependencies.sh similar to how it is done for mpv.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4cdd99190e89d538c25a8fc701372775fbde3b97)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index b879c58ff2..683bb5cb7e 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -280,6 +280,10 @@ required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by hos
 required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
 required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
 
+if grep -q ^BR2_PACKAGE_LIBXCRYPT=y $BR2_CONFIG ; then
+    required_perl_modules="$required_perl_modules open"
+fi
+
 if grep -q ^BR2_PACKAGE_MPV=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules Math::BigInt"
     required_perl_modules="$required_perl_modules Math::BigRat"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
