Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BB6C43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898BB83367;
	Wed,  6 Jul 2022 21:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898BB83367
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id beKP9tglJmIv; Wed,  6 Jul 2022 21:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C10783E47;
	Wed,  6 Jul 2022 21:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C10783E47
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 555DD1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F7A740B67
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F7A740B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u5kitHTPx52u for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:29:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B7FE40C4A
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B7FE40C4A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9D14E82C6C; Wed,  6 Jul 2022 21:16:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:29:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbd365b748b09c50cd2c89a3aea7db838e96919b
X-Git-Newrev: 07f26d8aa9352de95eba57f215e13f70c8b517f4
X-Patchwork-Hint: ignore
Message-Id: <20220706211617.9D14E82C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pigz: bump to version 2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=07f26d8aa9352de95eba57f215e13f70c8b517f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball
- Update hash of README (version and date updated:
  https://github.com/madler/pigz/commit/cb8a432c91a1dbaee896cd1ad90be62e5d82d452)

https://zlib.net/pipermail/pigz-announce_zlib.net/2022-January/000017.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pigz/pigz.hash | 6 ++++--
 package/pigz/pigz.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
index 512bf785c7..4a149605b3 100644
--- a/package/pigz/pigz.hash
+++ b/package/pigz/pigz.hash
@@ -1,3 +1,5 @@
+# From http://zlib.net/pigz
+sha256  b4c9e60344a08d5db37ca7ad00a5b2c76ccb9556354b722d56d55ca7e8b1c707  pigz-2.7.tar.gz
+
 # Locally calculated
-sha256  577673676cd5c7219f94b236075451220bae3e1ca451cf849947a2998fbf5820  pigz-2.6.tar.gz
-sha256  830b3e1b05cc20f443d89d7d8703a3c63fd64c57ab716f5e81fd178517df1e11  README
+sha256  67e2b9e30e924724a9d72549a6004ed15a041f51d9ea9ab781e048fa27ae07a2  README
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index 3e5e892797..fd48ab463d 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PIGZ_VERSION = 2.6
-PIGZ_SITE = $(call github,madler,pigz,v$(PIGZ_VERSION))
+PIGZ_VERSION = 2.7
+PIGZ_SITE = http://zlib.net/pigz
 PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
 PIGZ_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
