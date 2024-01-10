Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3A6C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F06A3400C1;
	Wed, 10 Jan 2024 20:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F06A3400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYYHzyVp560t; Wed, 10 Jan 2024 20:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E588E436D7;
	Wed, 10 Jan 2024 20:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E588E436D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89ACD1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62B6B61568
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B6B61568
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHv9bSApJhIo for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:49:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9723A61595
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9723A61595
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 795AC85DB2; Wed, 10 Jan 2024 20:49:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:22:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27b02945bd35a48607f3785666b2107e01ec7ffb
X-Git-Newrev: 7ea38660e01a87ab70c02e38c78a49202e8e5c21
X-Patchwork-Hint: ignore
Message-Id: <20240110204909.795AC85DB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 libopenssl needs perl Math::BigInt on s390
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ea38660e01a87ab70c02e38c78a49202e8e5c21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libopenssl needs perl Math::BigInt for s390x asm to avoid the following
build failure since commit a5cacb63082b9e58194c4b9f8b2af2c3e38ff15c:

Can't locate bigint.pm in @INC (you may need to install the bigint module) (@INC contains: /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../.. /home/buildroot/autobuild/instance-0/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../../perlasm/s390x.pm line 16.
BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance-0/output-1/build/libopenssl-3.2.0/crypto/poly1305/asm/../../perlasm/s390x.pm line 16.

Fixes:
 - http://autobuild.buildroot.org/results/986cb07d368c7214ffbc9d60c378e7ac00797f00

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 6e7d067ccd..3d83cb3285 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -282,6 +282,10 @@ required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-auto
 required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
 required_perl_modules="$required_perl_modules IPC::Cmd" # Used by (host-)libopenssl
 
+if grep -q ^BR2_PACKAGE_LIBOPENSSL=y $BR2_CONFIG && grep -q ^BR2_s390x=y $BR2_CONFIG ; then
+    required_perl_modules="$required_perl_modules Math::BigInt"
+fi
+
 if grep -q ^BR2_PACKAGE_MOSH=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules diagnostics"
 fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
