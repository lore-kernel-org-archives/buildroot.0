Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F1BC021AA
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 07:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A420839E5;
	Fri, 21 Feb 2025 07:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P63Bq91U1o8L; Fri, 21 Feb 2025 07:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDA3883A77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDA3883A77;
	Fri, 21 Feb 2025 07:08:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDB36194
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 07:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAD94403FA
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 07:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ja_4ArCXvM9 for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 07:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8164A40A7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8164A40A7C
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 07:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 699B3879AA; Fri, 21 Feb 2025 07:07:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Feb 2025 08:05:51 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: bc9ae1c3c35a3cb38c4fa07af622fc4e048f2c93
X-Git-Newrev: 2f5db263aab25797dd042a27c09216d754967c7c
X-Patchwork-Hint: ignore
Message-Id: <20250221070757.699B3879AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/foot: correct git
 download filename/hash
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f5db263aab25797dd042a27c09216d754967c7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes http://autobuild.buildroot.net/results/b5a7b55148244794d2a4e4534df41e1dcc19f735/

Commit be24ec40cde1 ("package/foot: change to git download to work around
codeberg archive issue") backported a commit to change to git download for
the foot package, but forgot to adjust the tarball filename and hash for the
download logic in 2024.02.x.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/foot/foot.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/foot/foot.hash b/package/foot/foot.hash
index 9a4335f2c6..a9d4874fc5 100644
--- a/package/foot/foot.hash
+++ b/package/foot/foot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ff81bca86178ef326588176f8bdf817bb3e0fbc891d026960144f69c8a74eb4d  foot-1.16.2-git4.tar.gz
+sha256  af299b149fbb08cf2253cb9130240b42ed1a638f2d50d6239f386b03eef78835  foot-1.16.2-br1.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
