Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B40C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 13:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A2D241B67;
	Tue,  9 Jan 2024 13:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A2D241B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFiexV5SKsbZ; Tue,  9 Jan 2024 13:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99FCB41B18;
	Tue,  9 Jan 2024 13:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99FCB41B18
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22C221BF30E
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEFF960BDC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEFF960BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRhFfsxXNqK3 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 13:06:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FB136059F
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 13:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB136059F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DBAE84F5B; Tue,  9 Jan 2024 13:06:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jan 2024 13:40:12 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1c537e0bf22357d043a9c5a7e2b72a4fff2b75e0
X-Git-Newrev: 731d17da87c66b789d0ef0fcc69d8d984bd1b000
X-Patchwork-Hint: ignore
Message-Id: <20240109130643.1DBAE84F5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=731d17da87c66b789d0ef0fcc69d8d984bd1b000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
