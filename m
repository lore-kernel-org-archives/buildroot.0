Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3919AC47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 13:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA92541A32;
	Tue,  9 Jan 2024 13:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA92541A32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZikWCpIPpoDP; Tue,  9 Jan 2024 13:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4278041919;
	Tue,  9 Jan 2024 13:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4278041919
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E230F1BF30E
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8CB9414C0
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8CB9414C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INZ_c3rSwHJg for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08617416A4
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08617416A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB90584E01; Tue,  9 Jan 2024 13:09:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jan 2024 13:38:27 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 9519bde956934fcafdc0835a4ad9a05258149060
X-Git-Newrev: 3b5860f271b20c8be5f4fe453d524737f31be6c1
X-Patchwork-Hint: ignore
Message-Id: <20240109130917.DB90584E01@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
 package/google-breakpad/gen-syms.sh: fix shellcheck warnings
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b5860f271b20c8be5f4fe453d524737f31be6c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fixes warning SC2068

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f1089391a83aa63b6977e65970451365f10dc66a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/google-breakpad/gen-syms.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/google-breakpad/gen-syms.sh b/package/google-breakpad/gen-syms.sh
index 2bc0afafb6..4bc020ec19 100755
--- a/package/google-breakpad/gen-syms.sh
+++ b/package/google-breakpad/gen-syms.sh
@@ -14,7 +14,7 @@ error() {
     exit 1
 }
 
-for FILE in ${@}; do
+for FILE in "${@}"; do
     f="${TARGET_DIR}${FILE}"
     if [ ! -e "${f}" ]; then
         error "%s: No such file or directory\n" "${FILE}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
