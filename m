Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131B2C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 17:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5ECD60749;
	Sat, 24 Feb 2024 17:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QThiEQ6Yvgqm; Sat, 24 Feb 2024 17:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D005B60A77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D005B60A77;
	Sat, 24 Feb 2024 17:16:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BA2B1BF2C4
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 17:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48A69404B1
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 17:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vV-VBNhnV_7w for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 17:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3047840298
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3047840298
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 17:16:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E53C87A26; Sat, 24 Feb 2024 17:16:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 18:14:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01f24d041d36c9d132a7888b7fefe8055b4ad321
X-Git-Newrev: 120cb19056dc22b11d921714dc4e2ac94b84242f
X-Patchwork-Hint: ignore
Message-Id: <20240224171605.7E53C87A26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s390-tools: disable cargo
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

commit: https://git.buildroot.net/buildroot/commit/?id=120cb19056dc22b11d921714dc4e2ac94b84242f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/s390-tools/s390-tools.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index bc39a9bd19..04d193a467 100644
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
