Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED4BC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 11:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D483407CE;
	Sun, 28 Apr 2024 11:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-81F2waQR5Z; Sun, 28 Apr 2024 11:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EECA407E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EECA407E7;
	Sun, 28 Apr 2024 11:20:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 246391BF8B4
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10A5440443
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYJBoQZ0RVGD for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 11:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F0074018B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F0074018B
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:20:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BF458612D; Sun, 28 Apr 2024 11:20:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 13:00:02 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b14e8aa5ee25133c9fe16188ac20e7fface9f3a0
X-Git-Newrev: abd0d26e0828bea3387a9a036539791fddc44959
X-Patchwork-Hint: ignore
Message-Id: <20240428112005.3BF458612D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/googlefontdirectory: fix command to generate license file hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=abd0d26e0828bea3387a9a036539791fddc44959
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

In commit ebe5d9edfe8d07eafd7b61c4f77ce509bb98a0ad ("boot, package,
support, toolchain: switch to 2 spaces for the hash file"), all hash
files were migrated to use 2 spaces as the separator.

However, in the googlefontdirectory hash file, a command is present in
a comment to indicate how to generate the part of the hash file that
provides the list of license file hashes. This command was not updated
as part of ebe5d9edfe8d07eafd7b61c4f77ce509bb98a0ad, so it still emits
a result in which a single space is used a separator between the hash
type (sha256) and the hash value.

This commit fixes that by using a 2-space separator.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
[Thomas: extracted from
https://patchwork.ozlabs.org/project/buildroot/patch/20240228145013.411919-2-christian@klarinett.li/
into a separate patch]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f139aab6fedfe1d9924fc205c0a61c51351e4972)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/googlefontdirectory/googlefontdirectory.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/googlefontdirectory/googlefontdirectory.hash b/package/googlefontdirectory/googlefontdirectory.hash
index 10f3bf60b1..a92015f509 100644
--- a/package/googlefontdirectory/googlefontdirectory.hash
+++ b/package/googlefontdirectory/googlefontdirectory.hash
@@ -1,7 +1,7 @@
 # Locally calculated
 sha256  ec2ddbeee673cce1b0796e3b20fbff5fd836ce9ba6d88deed8b59154fa255f06  googlefontdirectory-94dff3eaa9301b6640cccc63c56d6ff33d82882c.tar.gz
 # Locally calculated with
-# for i in $(find apache/ ofl/ ufl/ -name 'LICENSE.txt' -o -name 'OFL.txt' -o -name 'LICENCE.txt') ; do printf "sha256 %s\n" "$(sha256sum $i)" ; done
+# for i in $(find apache/ ofl/ ufl/ -name 'LICENSE.txt' -o -name 'OFL.txt' -o -name 'LICENCE.txt') ; do printf "sha256  %s\n" "$(sha256sum $i)" ; done
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/robotocondensed/LICENSE.txt
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  apache/opensanscondensed/LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache/walterturncoat/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
