Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B66E63F19
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 22:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F8082477;
	Sun, 15 Feb 2026 22:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJf6VXH8zD5I; Sun, 15 Feb 2026 22:19:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B73B82496
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771193945;
	bh=gL92ghHTtS5h3H8CSPxYvNq72IwmDFgplHBJq268H3Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tx73hfLoeaNywZg9BQcfote4hWd/DF23ZKPb+W3CEOtP1SXWjAlBQNzITev5pmfbF
	 jAiyePHE/NEqubZ0tGPviIG5W9MKYhLwOgL0TQXqOC8m5PQmfLRZ8ECjBParOK14Fx
	 y7pSMo3bQ/1MpPV/vHp7DuHA2ddWaQuWM8wyXFhwP9kkONgSmJ6L6ae98/sju6QZpZ
	 X8koLoa33DQb8FLybTtN1W8EO6q0Po1euM/fGARUK6UuanSLItAn5J/X4eXgDPexAc
	 dWcw3rSnFjve0uvgUrrmhsamsjxCDJJsvWYH469KR4Rihcvnpg+cmtw8sDX0cR9z0y
	 RtPzY1f5VzEkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B73B82496;
	Sun, 15 Feb 2026 22:19:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B11F270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C84D8235C
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Kk2RZx89RNO for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 22:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 428928236F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 428928236F
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CE7C86EA1; Sun, 15 Feb 2026 22:18:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 23:13:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 429bcb111baada7445ac69b31e83e858559d7f9b
X-Git-Newrev: df61ce39c1ae66e9778f225e875ce191275835b7
X-Patchwork-Hint: ignore
Message-Id: <20260215221858.7CE7C86EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_acqua_a5_*: remove
 at91bootstrap3 license
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
Content-Type: multipart/mixed; boundary="===============0147165258809978136=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0147165258809978136==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df61ce39c1ae66e9778f225e875ce191275835b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When using a specific git repo and version for at91bootstrap3,
BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES defaults to "LICENSES/MIT.txt".
However the git version we use (namely v3.10.3) does not provide this
file. Actually, it does not provide a license file at all. This causes
‘make legal-info’ to fail with:

>>> at91bootstrap3 v3.10.3 Collecting legal info
sha256sum: /builds/buildroot.org/buildroot/output/build/at91bootstrap3-v3.10.3/LICENSES/MIT.txt: No such file or directory
ERROR: while checking hashes from boot/at91bootstrap3/at91bootstrap3.hash
ERROR: LICENSES/MIT.txt has wrong sha256 hash:
ERROR: expected: 5a3809b1c2ba13b7242572322951311c584419f1f8516f665d6c06f0668d78de
ERROR: got     :
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Let's be explicit that there is no license file to check.

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815386
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/12992815390

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/acmesystems_acqua_a5_256mb_defconfig | 1 +
 configs/acmesystems_acqua_a5_512mb_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index ca4ba27a28..f2ab66631f 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -23,6 +23,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 240dfc46b6..172eaef39f 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -23,6 +23,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y

--===============0147165258809978136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0147165258809978136==--
