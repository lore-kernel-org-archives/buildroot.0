Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E777C28B28
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 21:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0071F41529;
	Fri,  7 Mar 2025 21:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t62mEd5oRWlT; Fri,  7 Mar 2025 21:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B96154154C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B96154154C;
	Fri,  7 Mar 2025 21:14:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52D4F71F
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 21:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F9F860BD0
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 21:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7gvY4-xvAHr for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 21:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DE1960BC1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DE1960BC1
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 21:14:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 555DF87F64; Fri,  7 Mar 2025 21:14:25 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 7 Mar 2025 22:12:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17134726213a2188946a07b73ff2e2d0363ad636
X-Git-Newrev: f2498258d4d0c7e4f181a54a5334b45ab73612d8
X-Patchwork-Hint: ignore
Message-Id: <20250307211425.555DF87F64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: add CPE identifier
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2498258d4d0c7e4f181a54a5334b45ab73612d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 boot/optee-os/optee-os.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 883f166fc1..25c917e2fc 100644
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
