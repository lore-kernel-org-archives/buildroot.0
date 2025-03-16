Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42100C35FF3
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 20:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 011B1802E7;
	Sun, 16 Mar 2025 20:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-TFtFAi-eBn; Sun, 16 Mar 2025 20:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F266C81E7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F266C81E7E;
	Sun, 16 Mar 2025 20:28:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D853B1A0
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C760C803E6
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJzHX0utqgcS for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 20:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0A8B802E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0A8B802E7
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:27:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E07B08807C; Sun, 16 Mar 2025 20:27:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Mar 2025 21:04:59 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1637223b8d7df7b09ef02a6fcfca2153f8037c94
X-Git-Newrev: f0b2e3f224ed72365bc3fb0d62c34603a217300b
X-Patchwork-Hint: ignore
Message-Id: <20250316202756.E07B08807C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] boot/optee-os: add CPE
 identifier
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0b2e3f224ed72365bc3fb0d62c34603a217300b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

cpe:2.3:o:linaro:op-tee:4.3.0:*:*:*:*:*:*:* is a valid CPE ID.

See:
https://nvd.nist.gov/products/cpe/detail/2754E8CF-9BD5-448D-9F32-CFAC92278CD9

Note: this commit needs to set _CPE_ID_PREFIX because optee-os CPE
"part" needs to be set to "o" (OS), while the default Buildroot prefix
is "a" (Application).

Signed-off-by: Daniel Lang <dalang@gmx.at>
[Julien:
 - add extra info in commit log (and fix CVE to CPE)
 - add a new line after OPTEE_OS_CPE_ID_PRODUCT for readability
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f2498258d4d0c7e4f181a54a5334b45ab73612d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/optee-os/optee-os.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 36dfbd2cc9..018d51c450 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -10,6 +10,10 @@ ifeq ($(BR2_TARGET_OPTEE_OS_LATEST),y)
 OPTEE_OS_LICENSE_FILES = LICENSE
 endif
 
+OPTEE_OS_CPE_ID_PREFIX = cpe:2.3:o
+OPTEE_OS_CPE_ID_VENDOR = linaro
+OPTEE_OS_CPE_ID_PRODUCT = op-tee
+
 OPTEE_OS_INSTALL_STAGING = YES
 OPTEE_OS_INSTALL_IMAGES = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
