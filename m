Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9035C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C1B9419FD;
	Tue, 31 May 2022 08:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uA2PX5HqUT88; Tue, 31 May 2022 08:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4762941BD4;
	Tue, 31 May 2022 08:43:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C52D1BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A2AF60FCB
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZo2FIVI6dr3 for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEE8960761
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:43:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9D87486864; Tue, 31 May 2022 08:31:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:26:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c3c19e82b482538870906161dc72a3efa7ca1b20
X-Git-Newrev: 63c5c26646ba31caef1a3f3bb16c49a11903e5a8
X-Patchwork-Hint: ignore
Message-Id: <20220531083127.9D87486864@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang-idna: bump
 version to 230a917
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

commit: https://git.buildroot.net/buildroot/commit/?id=63c5c26646ba31caef1a3f3bb16c49a11903e5a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove the unicode_util_compat library, which is not needed for the
erlang version packaged in Buildroot.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-idna/erlang-idna.hash | 4 ++--
 package/erlang-idna/erlang-idna.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-idna/erlang-idna.hash b/package/erlang-idna/erlang-idna.hash
index 2200bbad8d..7ee4807195 100644
--- a/package/erlang-idna/erlang-idna.hash
+++ b/package/erlang-idna/erlang-idna.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d57e20ee88018ff0431e0275e91ada5915782870c9981fc798bcd05589031d6f erlang-idna-6.0.0.tar.gz
-sha256 95f5c9410a95332b0833c4606028ee00008cd8c497336e230df3144d1a720bda LICENSE
+sha256  916b092cb8d35ca6e63ec183a674a28ff2f745ce05fd0c9c06da34875f6fe8d8  erlang-idna-230a917.tar.gz
+sha256  95f5c9410a95332b0833c4606028ee00008cd8c497336e230df3144d1a720bda  LICENSE
diff --git a/package/erlang-idna/erlang-idna.mk b/package/erlang-idna/erlang-idna.mk
index 27a32fb06d..4ef34e82bf 100644
--- a/package/erlang-idna/erlang-idna.mk
+++ b/package/erlang-idna/erlang-idna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_IDNA_VERSION = 6.0.0
+ERLANG_IDNA_VERSION = 230a917
 ERLANG_IDNA_SITE = $(call github,benoitc,erlang-idna,$(ERLANG_IDNA_VERSION))
 ERLANG_IDNA_LICENSE = MIT
 ERLANG_IDNA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
