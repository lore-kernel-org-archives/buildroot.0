Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C0EC54E67
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 19:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D7BA6062B;
	Sun, 17 Mar 2024 19:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0pnPu-NQbhy; Sun, 17 Mar 2024 19:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E90460635
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E90460635;
	Sun, 17 Mar 2024 19:45:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6F551BF3DC
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10AA60635
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pv1aH2l61eL4 for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 107DB6062B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 107DB6062B
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F250982821; Sun, 17 Mar 2024 19:45:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 20:39:02 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 5b8e420b697012a0610012f33ac6ff3af6af2f51
X-Git-Newrev: 11811dc5007f5407ca37ec6f7b1fb9e1d78b5bc0
X-Patchwork-Hint: ignore
Message-Id: <20240317194548.F250982821@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/s390-tools:
 disable cargo
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

commit: https://git.buildroot.net/buildroot/commit/?id=11811dc5007f5407ca37ec6f7b1fb9e1d78b5bc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Set HAVE_CARGO=0 to avoid the following build failures raised since bump
to version 2.29.0 in commit 68df20336664d4d0b1a9d8d0285d23eba631845a and
https://github.com/ibm-s390-linux/s390-tools/commit/e6add997ebbcd967734391da8a8987c7926e168f:

error: could not compile `pvsecret` (bin "pvsecret") due to previous error

[...]

ERROR: architecture for "/usr/bin/pvsecret" is "AArch64", should be "IBM S/390"

Fixes: 68df20336664d4d0b1a9d8d0285d23eba631845a
 - http://autobuild.buildroot.org/results/22035cb4d8e251f9930a7d529b91b128919252bb
 - http://autobuild.buildroot.org/results/99be6d3b2bab7c952ce02853f54924c5219aecc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 120cb19056dc22b11d921714dc4e2ac94b84242f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/s390-tools/s390-tools.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index c3155a13ff..90a0f7a92a 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -12,7 +12,8 @@ S390_TOOLS_DEPENDENCIES = zlib
 
 S390_TOOLS_MAKE_OPTS = \
 	ARCH=$(BR2_ARCH) \
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+	HAVE_CARGO=0
 
 ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 S390_TOOLS_DEPENDENCIES += libcurl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
