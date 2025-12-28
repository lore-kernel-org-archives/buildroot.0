Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4B0D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DFB54074C;
	Sun, 28 Dec 2025 22:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ko1r29xPyIh; Sun, 28 Dec 2025 22:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A84E140760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959625;
	bh=GQ522NzOiHWIG7f11HQ7U8b+xKw/bxty15PvlS+qnkk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pfF6GeFaN5YmYIYfxuqKHEFeGmwBKgueMYChBmMMaFX+5A39FUlrus9oEbr1LJrrM
	 lf+fl8c9wD9o/FxPOngcXOeCa/BwrgVzs3XeobHRg0LY3b4RPrGhMnU+FpW/Hli/d5
	 T/LIbg1xJOY8YCDA4Q74r1tZL+jAzn8k2E6UVA5YLNFiOCVnJr7yG4S4mRvnnZ6T4a
	 c/e9nXFxb0faNWlNvDcrGPPnTSMNpf632ZrYvEvwgI0FJ7YjfSdgvlmyfp75l6kK9E
	 ZAwy/TJuCDkCuBWIHGGQlO9oVxlUZ+XdmwY3MCjWB34bv+W7HmD/MkkIbqhib4l4lg
	 qN4O7mjTRusxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A84E140760;
	Sun, 28 Dec 2025 22:07:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0FA3D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACF3840215
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3LbG1p0Lnho for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3B2C402F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3B2C402F0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1B4E8781C; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:02:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56be4052484dfb6e053b5ed79c807fedbbf26806
X-Git-Newrev: 92f633b6a76c456e3270054024e328c2c4f4df34
X-Patchwork-Hint: ignore
Message-Id: <20251228220645.D1B4E8781C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyfatfs: add md5 hash
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=92f633b6a76c456e3270054024e328c2c4f4df34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyfatfs/python-pyfatfs.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-pyfatfs/python-pyfatfs.hash b/package/python-pyfatfs/python-pyfatfs.hash
index 05e940779e..58f02ed7a0 100644
--- a/package/python-pyfatfs/python-pyfatfs.hash
+++ b/package/python-pyfatfs/python-pyfatfs.hash
@@ -1,4 +1,5 @@
-# From https://pypi.org/project/pyfatfs/#pyfatfs-1.1.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyfatfs/json
+md5  df7f61cdec5567ec16956cbae14514e0  pyfatfs-1.1.0.tar.gz
 sha256  9725ccd0a4da1c09c27358abbf10f08c043ac84210af576803e087f51a2b30e0  pyfatfs-1.1.0.tar.gz
-# Locally calculated
+# Locally computed sha256 checksums
 sha256  df8f053d3cbf23fe7002e6a34b06580653a74d40dc2e54f3b717a963ea9b70cb  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
