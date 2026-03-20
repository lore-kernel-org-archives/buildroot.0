Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46EFF483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8252C60843;
	Mon, 23 Mar 2026 19:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLLbI1TFSYUU; Mon, 23 Mar 2026 19:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A4B660847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295247;
	bh=1kiVEA6OyUNv2Cie+iieq59FcLKgHCGuVU+ndqJIg2Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SEE8WtSMkeLDJckKLExLA3SBoiPXFZB06KIQHVN3iWDwHk1SADJiL8brDs9wTJiAN
	 56FGbcDSNh5Lr1Bf0XeoygQrIb+/+MOKZSYh6qrKTJkqqErytc252EDIMmEp/KnC28
	 MYYvSJl2cnzYtoPDUAgKjY4WEvqkz4m8kufFBytH33lyL00smMcmwxx6riNqDq7Wic
	 n1QKRSaunqIUtmUaZcvJMynM7HjGSgALwDq9PQi9ZTOuBfV+EX+bPYnUtL7gecU32J
	 4LV3ELzkBi+G+6grgGHsLbAvjCyBJu9PegkmYWkqD/kyqbV/VRLgDNfX+5DXf76VDB
	 a2+NOmShbCESA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A4B660847;
	Mon, 23 Mar 2026 19:47:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CE54F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7A0040BB1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGhUlIhkGFAr for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152DA4060F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 152DA4060F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51ABE84C53; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:52:07 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7560493b6e909b994bc6280c61f4c3bbcd72663c
X-Git-Newrev: c90d46d83ac544a6aa4e8798223efb31f00e9809
X-Patchwork-Hint: ignore
Message-Id: <20260323194714.51ABE84C53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/br2-external:
 remove leftover trap
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c90d46d83ac544a6aa4e8798223efb31f00e9809
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The trap was initially introduced in c5fa9308ea4e (core/br2-external:
properly report unexpected errors), in 2017, to catch all unexpected
errors, back when a single file was generated, and errors emitted to
stderr.

Since commit d027cd75d098 (core: generate all br2-external files in
one go), in 2019 the single output file 'ofile' is no longer created,
as multiple output files were then introduced, while messages for
*expected errors* were redirected to a Makefile variable assignment
emitted on stdout, at which point the script just exits (in error);
expected failures only occur in do_validate().

Unexpected errors can only occur on failure to create, or write to,
output files, either '.br2-external.mk' in do_validate() or do_mk(),
or any of the kconfig fragments in do_kconfig(). Cause for failure to
create those can only be a no-space-left-on-device condition, as they
are created in a directory that was just created by the script earlier
in main(), and thus has the necessary mode; failure to create that
directory is now caught explicitly.

A trap on ERR is not called when the shell exits explicitly with a call
to 'exit', thus, only failures to create or write to output file would
be caught. In that case, we are better off not trying to write to those
files anyway: failure to create the file would already be reported by
the shell on stderr, while disk-full would not allow to store the output
anyway...

In any case, the script exits in error, which is going to be caught by
the caller, which will terminate.

So, drop the trap altogether.

As a side effect, that squelches a shellcheck error.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 244e4283a918d775c3dff17b03a532658c0f7f4a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/br2-external | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 8aea479d20..6d4fc1a791 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -30,10 +30,10 @@ main() {
         error "no output directory specified (-d)\n"
     fi
 
-    # Trap any unexpected error to generate a meaningful error message
-    trap "error 'unexpected error while generating ${ofile}\n'" ERR
+    if ! mkdir -p "${outputdir}"; then
+        error "Cannot create output directory '%s'\n" "${outputdir}"
+    fi
 
-    mkdir -p "${outputdir}"
     do_validate "${outputdir}" ${@//:/ }
     do_mk "${outputdir}"
     do_kconfig "${outputdir}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
