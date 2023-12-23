Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907DDC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 21:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B09882193;
	Sat, 23 Dec 2023 21:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B09882193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZhKi6a1praZ; Sat, 23 Dec 2023 21:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 832ED821A9;
	Sat, 23 Dec 2023 21:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 832ED821A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C9341BF869
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF7D560E78
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF7D560E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4STi64BhMDpw for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 21:21:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D1CC60E65
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 21:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D1CC60E65
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEECE82562; Sat, 23 Dec 2023 21:21:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 21:49:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8ac52108c12f0fcc9641b63e7922009270f96c6
X-Git-Newrev: f1089391a83aa63b6977e65970451365f10dc66a
X-Patchwork-Hint: ignore
Message-Id: <20231223212146.EEECE82562@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/google-breakpad/gen-syms.sh: fix
 shellcheck warnings
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f1089391a83aa63b6977e65970451365f10dc66a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes warning SC2068

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
