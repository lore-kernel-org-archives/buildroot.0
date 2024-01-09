Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B644AC47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 13:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65F8441B67;
	Tue,  9 Jan 2024 13:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F8441B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lpixVkAQk2bx; Tue,  9 Jan 2024 13:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97F0D41BDD;
	Tue,  9 Jan 2024 13:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97F0D41BDD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 711401BF30E
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1620C6059F
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1620C6059F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vgpYkBQPyPwC for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 13:06:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A2C160A6D
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 13:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A2C160A6D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4714484F64; Tue,  9 Jan 2024 13:06:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jan 2024 13:50:18 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7dbc0dde06452a87129b3f27b46399e73d40e41f
X-Git-Newrev: e98898bf5102c89cdbcc789030a4ca2be03803a4
X-Patchwork-Hint: ignore
Message-Id: <20240109130643.4714484F64@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] .checkpackageignore: stop
 ignoring ShellCheck issues in google-breakpad
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

commit: https://git.buildroot.net/buildroot/commit/?id=e98898bf5102c89cdbcc789030a4ca2be03803a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The issues have been fixed by commit
f1089391a83aa63b6977e65970451365f10dc66a ("package/google-breakpad/gen-syms.sh:
fix shellcheck warnings")

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/5815132933

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9212a719a5c3078048737d56596442e5ac7120a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dbff352d3b..1daee0b26c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -61,7 +61,6 @@ package/gamin/0002-no-const-return.patch Sob
 package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch Sob
 package/genromfs/0001-build-system.patch Sob
 package/gerbera/S99gerbera Indent
-package/google-breakpad/gen-syms.sh Shellcheck
 package/gpsd/S50gpsd Indent Shellcheck Variables
 package/haveged/S21haveged Shellcheck Variables
 package/htpdate/S43htpdate Shellcheck
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
