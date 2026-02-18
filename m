Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD23E9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8227580E42;
	Thu, 19 Feb 2026 17:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-TQlpX8iau3; Thu, 19 Feb 2026 17:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0F9E80EC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521870;
	bh=ZgqxQmvRBs+eLoQbB5rcKIsK2j02vDTawn/BI0wiyqY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HCoKArijuBTmGhlZapl5skWkZwkZrroa3mHAEJNPiqMQJyx47O7tfciIzhVbHFbLg
	 w6pJ+2oWDgQE9Vn5R6KVx/j3nCoh2ElZhv8drNma3IFNp7BK8fyk0dfDSH+vAOAbiG
	 iUbCoW4OVT1uZDWndBMO9EzP2NShIYSphpixIQ9rZS1AuRZfZY2431P1wvfKk8VITO
	 X7AWbvgIeo5K2d5SRIxAUl0J4NBp7xFNRDFKs6j+YNoNQukeuyKAxRks92TMMuvfDw
	 2XDdiTwg13t/pN4V6VkUfEP4105EChgtlldlREgAlMT5460rj0hAIej/qXuKQfHkhp
	 F/j5RdyhZlYKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0F9E80EC3;
	Thu, 19 Feb 2026 17:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FCC8355
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB5144083B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ulu1npqCRXT3 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62D6C4084B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62D6C4084B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6096286FA5; Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:31:26 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5dc325e5a8bc64c766ef68e4527c98bed1ea3203
X-Git-Newrev: a5d0f1c6c264fccc54c9f95d6262759bf1836767
X-Patchwork-Hint: ignore
Message-Id: <20260219172414.6096286FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 configs/acmesystems_acqua_a5_*: remove at91bootstrap3 license
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
Content-Type: multipart/mixed; boundary="===============3335677315101511414=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3335677315101511414==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a5d0f1c6c264fccc54c9f95d6262759bf1836767
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
(cherry picked from commit df61ce39c1ae66e9778f225e875ce191275835b7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 configs/acmesystems_acqua_a5_256mb_defconfig | 1 +
 configs/acmesystems_acqua_a5_512mb_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 9e6d35a859..e3cca2408c 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -22,6 +22,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 8e6d9774da..1a38c742d8 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -22,6 +22,7 @@ BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
+BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y

--===============3335677315101511414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3335677315101511414==--
