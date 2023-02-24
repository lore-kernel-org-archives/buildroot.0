Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8005DC64ED8
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 07:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EEAD60E96;
	Fri, 24 Feb 2023 07:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EEAD60E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egpHwS_hVDYk; Fri, 24 Feb 2023 07:36:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40ECA60EC2;
	Fri, 24 Feb 2023 07:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40ECA60EC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA5DC1BF2A4
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 07:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93D4A81DFB
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 07:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D4A81DFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xmGM4xDg3DQX for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 07:36:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B839081B7B
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 07:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B839081B7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A805686A03; Fri, 24 Feb 2023 07:36:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 08:35:36 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 421f58cfa996a27d85b01775521b3c52125de264
X-Git-Newrev: 3c4fb99b80ae2925e04676cfc9ecffd0c35c430c
X-Patchwork-Hint: ignore
Message-Id: <20230224073609.A805686A03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] utils/test-pkg: proper
 output on host without jq installed
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
Content-Type: multipart/mixed; boundary="===============4122456330415122410=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4122456330415122410==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3c4fb99b80ae2925e04676cfc9ecffd0c35c430c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

On host without jq installed, test-pkg's output is as following:

$ ./utils/test-pkg -p mmc-utils
                    bootlin-armv5-uclibc [1/6]: which: no jq in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/14/bin:/usr/lib/llvm/13/bin:/usr/lib64/opencascade/bin)
JQ IS
OK
                     bootlin-armv7-glibc [2/6]: which: no jq in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/14/bin:/usr/lib/llvm/13/bin:/usr/lib64/opencascade/bin)
JQ IS
OK
                   bootlin-armv7m-uclibc [3/6]: which: no jq in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/14/bin:/usr/lib/llvm/13/bin:/usr/lib64/opencascade/bin)
...

Since test-pkg handles this case we can hide this error message and have
proper output:

$ ./utils/test-pkg -p mmc-utils
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 09ac5a9e18e96ba6d3cd13e5e8d34aeccfcb603d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/test-pkg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 4ebfd9af66..e7f5464817 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -201,7 +201,7 @@ build_one() {
 
     # Validate that we generate proper json as show-info
     { tput smso; printf '>>> Running show-info\n'; tput rmso; } >> "${dir}/logfile" 2> /dev/null;
-    JQ="$(which jq)"
+    JQ="$(which jq 2> /dev/null)"
     if [ -z "${JQ}" ]; then
         make O="${dir}" host-jq >> "${dir}/logfile" 2>&1
         JQ="${dir}/host/bin/jq"

--===============4122456330415122410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4122456330415122410==--
