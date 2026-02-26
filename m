Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C6FFD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A371860765;
	Thu, 26 Feb 2026 20:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lm6F6qbb0lJG; Thu, 26 Feb 2026 20:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6FCD6073C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138652;
	bh=PEVplwsDrOpHdgQA95PGmI9jYys7bsnzexBxJrHxLEM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aBJUMvuPQrKsCDFwZLDX9SRtf0n+JYDa4L4mgLBrEcsDlaRZd7+DWiLaBdY4L3VnX
	 WMyGVDSEF0cT73YauBxWRQpleR28e/tVZyOlpg1IkDjCPEmx1Wo0kRREtnk2yr73wA
	 CAVTn9utD+6z9nsNh4V6pdwoCrbOrRUmg5irboJO9ndFkrjlFqssq9mDJ+Q/kichWV
	 nDVaulvmcrlLgPWXvbvdybsClGl0H6Bsbvmbmc3Fyjhmtb/Vf674nNcHhEyFMXdPYX
	 RABjtChAmSmvAI1rCl9YhCKcnTv+zo9P3+tzWYU2+C4IT+cPV8daNHwDMMCGEJ5jo3
	 XO+w62chfB51w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6FCD6073C;
	Thu, 26 Feb 2026 20:44:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB34272
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15C9A40246
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0fVT6pePCaZ for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 769ED40122
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 769ED40122
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6692E87506; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:20:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ff3b00e7d01894963ce05f8cc9077ac0d61d4ad9
X-Git-Newrev: 75544817343920418b670e2b1579a09a557f88bf
X-Patchwork-Hint: ignore
Message-Id: <20260226204356.6692E87506@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/fluidsynth: add
 patch for CVE-2025-56225
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/75544817343920418b670e2b1579a09a557f88bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerability:

- CVE-2025-56225:
    fluidsynth-2.4.6 and earlier versions is vulnerable to Null pointer
    dereference in fluid_synth_monopoly.c, that can be triggered when
    loading an invalid midi file.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-56225
  - https://github.com/FluidSynth/fluidsynth/commit/45f2a79f4265dcc4f98cfbafdb10727fb1c0d411

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ullpointer-dereference-during-legato-mode.patch | 25 ++++++++++++++++++++++
 package/fluidsynth/fluidsynth.mk                   |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/package/fluidsynth/0001-Fix-a-nullpointer-dereference-during-legato-mode.patch b/package/fluidsynth/0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
new file mode 100644
index 0000000000..a155164bcf
--- /dev/null
+++ b/package/fluidsynth/0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
@@ -0,0 +1,25 @@
+From 45f2a79f4265dcc4f98cfbafdb10727fb1c0d411 Mon Sep 17 00:00:00 2001
+From: "Tom M." <tom.mbrt@googlemail.com>
+Date: Mon, 14 Jul 2025 18:13:38 +0200
+Subject: [PATCH] Fix a nullpointer dereference during legato mode (#1607)
+
+CVE: CVE-2025-56225
+Upstream: https://github.com/FluidSynth/fluidsynth/commit/45f2a79f4265dcc4f98cfbafdb10727fb1c0d411
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/synth/fluid_synth_monopoly.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/synth/fluid_synth_monopoly.c b/src/synth/fluid_synth_monopoly.c
+index d1de13196..6e6e2a906 100644
+--- a/src/synth/fluid_synth_monopoly.c
++++ b/src/synth/fluid_synth_monopoly.c
+@@ -410,7 +410,7 @@ int fluid_synth_noteoff_mono_LOCAL(fluid_synth_t *synth, int chan, int key)
+                 fluid_channel_breath_msb(channel))
+         {
+             /* legato playing detection */
+-            if(channel->mode  & FLUID_CHANNEL_LEGATO_PLAYING)
++            if (channel->mode & FLUID_CHANNEL_LEGATO_PLAYING && channel->preset != NULL)
+             {
+                 /* the list contains others notes */
+                 if(i_prev >= 0)
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 1c9139aa9f..bde3f416a7 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -12,6 +12,9 @@ FLUIDSYNTH_CPE_ID_VENDOR = fluidsynth
 FLUIDSYNTH_INSTALL_STAGING = YES
 FLUIDSYNTH_DEPENDENCIES = libglib2
 
+# 0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
+FLUIDSYNTH_IGNORE_CVES += CVE-2025-56225
+
 ifeq ($(BR2_PACKAGE_FLUIDSYNTH_ALSA_LIB),y)
 FLUIDSYNTH_CONF_OPTS += -Denable-alsa=1
 FLUIDSYNTH_DEPENDENCIES += alsa-lib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
