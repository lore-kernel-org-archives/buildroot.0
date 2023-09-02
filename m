Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20BCC71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 895C240500;
	Sat,  2 Sep 2023 15:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 895C240500
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GADTmvonLJwZ; Sat,  2 Sep 2023 15:50:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9B5140547;
	Sat,  2 Sep 2023 15:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9B5140547
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CB351BF863
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66C798200A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C798200A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMzcybfYHDDY for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:50:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81D8E81E25
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D8E81E25
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C8B8868C5; Sat,  2 Sep 2023 15:50:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 17:49:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2be2ccb4873f3e63626c40519ed69ac2e5d456b3
X-Git-Newrev: 5c9f31041a2c36e3b97cd2f9577f68d88ee91174
X-Patchwork-Hint: ignore
Message-Id: <20230902155034.6C8B8868C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/edk2: bump to version
 edk2-stable202308
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
Content-Type: multipart/mixed; boundary="===============7333870935002326179=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7333870935002326179==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5c9f31041a2c36e3b97cd2f9577f68d88ee91174
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log since version edk2-stable202305, see:
- https://github.com/tianocore/edk2/releases/tag/edk2-stable202308

The main motivations of this bump are the RISC-V QEMU Virt support
improvements (not yet supported in Buildroot).

Cc: Dick Olsson <hi@senzilla.io>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/edk2/edk2.hash | 2 +-
 boot/edk2/edk2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/edk2/edk2.hash b/boot/edk2/edk2.hash
index 34d4b10e29..17918ee7bb 100644
--- a/boot/edk2/edk2.hash
+++ b/boot/edk2/edk2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ca55351913e6258ebd8c08106f369ac71073d9cfaa80427fc5f131b06d808940  edk2-edk2-stable202305-br1.tar.gz
+sha256  9389ad20bc75f2a8fa9e7c1b1948ef07481c94e96dec57ae2f9f9be9c754f92c  edk2-edk2-stable202308-br1.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index f49258ecb5..186854a14c 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDK2_VERSION = edk2-stable202305
+EDK2_VERSION = edk2-stable202308
 EDK2_SITE = https://github.com/tianocore/edk2
 EDK2_SITE_METHOD = git
 EDK2_LICENSE = BSD-2-Clause-Patent

--===============7333870935002326179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7333870935002326179==--
