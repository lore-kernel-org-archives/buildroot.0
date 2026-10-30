Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4255D606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fH+Z++Dh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 213FF60BDB;
	Fri, 30 Oct 2026 14:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6ENNExxUb_U; Fri, 30 Oct 2026 14:08:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0B09560B96
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369313;
	b=nbNxzH87mUKoDHNgOS3TIfI1Ddh2440m7Sk8Y7Dk4k6FEW7L3OFATQJl8ScLhaWSJ19d
	 Oqo/OUMAT+YQCbGQ1/qvPD7rRsJc9sAI/Fgg6csY4485Src6FuKCMp4Lhg8Sk5TJw3C2o
	 7EoSLZ9w4v9riuS2TuOOjUMW9cLmZVfacFvqs+OmmYpyxATIqX9NM6GF/BdORVYwpjMl6
	 QMPKzpoMQALIyKWAxHPemOjrGwqNlQvhjEvkBUBfrxXI4pC4BAghbZ8PMJGconvDbFmzb
	 MeWU018ghCaJr76l/phnSxx1AKofwti3ySNqDsuGdGaooaPphDA1DTCtpVjoZFE4nmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=clYlCj5Onmp8ar7j567RKT9oGPhbp35PFrt1vI67yLg=;
	b=J1lTZBx1OVxP9EqATrp3p4PfV0zLzmuwf/q86Bmr91HleQI70riwxtPqUbzUi5sfhoxh
	 szLTOyZV2mRtxgtPonS/668BKNF6JVRALbchtTgsmhwZ7Nd5Y5yW9hH8kisDhVp/hjCWK
	 ohQnZe9Ir8EYcW4lRivOlk8y7DtyYwQCz5STbuV26YxquScfz/05+rnCdYfpS+BkDanO2
	 YMwMAtdoYpzhsWrS+kbGP0tf18OMel1lVEL4S9XvMV7VAuHeZe6/QaNgZFSiFiQ8qoE76
	 6XvQew3Pg4PoNkZvaQX+ZqtUtOl7Qy132fg2UGX/VV11kwQcLbxJqWAV90Pn7v6z3qQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369313;
	bh=clYlCj5Onmp8ar7j567RKT9oGPhbp35PFrt1vI67yLg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fH+Z++Dh6NxDFAjqdfqqQu3T6thrzVkB/rYGPU8YzefjgSLfBfKFbEuvoptH7VDYu
	 SU86f+5b0tC0GTLVdPu8yoTa6F+v1Nbk3F+hAhejc7gIAa7/GbFanW/pqQg1iCox9o
	 pbZu3kkeQTuL6Q2IUnVt+Jn7TlSNUOVvSls4W1IoljsVZVzuqoHlB+WmHQDPQJaNyg
	 NqdbCOjBEzl6gn9OmdFcsV8C92c5lbsmqTehTAVOaNHz8EPP+RVjYK00gxoy54AHcA
	 eB7dWXwLYn43sBqXsPg4YmtPJPu1YkWyCMbUtz3AwmEQExP+T4Rj3GbFvI4tOpiw9d
	 7+K1R7E8LYXxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B09560B96;
	Fri, 30 Oct 2026 14:08:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A0CDD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 303CF81180
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGhAJ2MSqwmk for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 627DF8118C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369169;
 b=aXnY4tSVzTTUFP6I3BISypapc6GHlByC4mmLBe8XikNC7FL1G/7YDCaIEqsZLDZ8mA5x
 H+buAJPn7+ab9vHeeU7Sxdw7UiXHTkfit8nKPUvqPRk1fnwTG4VWApd+7L22YprhIivlt
 NijOTJo2IvI34EwFrWD68JkQw0kiAwQDPdoNZXbQXVhU2+WhCsF/SvAJ8XdDu1h0RzLqD
 kraG/4Uj49w2P+6HgPkb3NPxZtan0o/W3juYPn8EyL+WeXc3C98rNUwmuXEELENlv4rSL
 IG4qKrZoisl5e/V62Fg64zbqt+5pyQVEkoYUcCJdo9CuhMRU+DJOsAcwIz9oznzBwsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369169;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XqfkCbbqwVJ4uALvx/iF+L6nQZ4lAmULiGz3Wg4f8ic=;
 b=PSK1MLzBCiLNXTnwSD5+WVOmL09j/dtxMq/Uh3DdKdp56JPD+9ua8uMJ28jYdfHm1JhP
 bC5RnLNxR/o3xlxHR8exyvTXzOt6wEyaF9jbz9Aeg915hHCfMDwEf8b3Ic+aXNWPVbMvj
 mumMIQuuju5Ug8gresyKbHtqhmU7939j89pngQI707SoHaX3UZgQus3LRYWNxqAG+ncLo
 DxUbMYB4qeCQWbM70nj2Gf7wLfARsfRKmmda4BlolNKeaQigVGbqTkO+LxnEKRJwGrTJA
 Lwv1rdoA2xKRSd6AjLuSZmNfwU8Rg1Cxd/krp59VBYZ9ZbToOh8l7G3t810SXSSq+Zw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 627DF8118C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8291E9D389; Fri, 30 Oct 2026 14:04:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 09:28:44 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ab849408e33a335d7636b799232ad0c81e2a2f52
X-Git-Newrev: efc09a0fce6f76d79d5974790175c8c5323e132f
X-Patchwork-Hint: ignore
Message-Id: <20261030140441.8291E9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/fluidsynth:
 upstream patch for CVE-2026-61714
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5597850248473938124=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5597850248473938124==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/efc09a0fce6f76d79d5974790175c8c5323e132f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This patch fixes the following vulnerability:

- CVE-2026-61714:
    FluidSynth is a software synthesizer based on the SoundFont 2
    specifications. From 2.2.4 until 2.5.6, configuring synth.midi-
    channels above 16 allows the MIDI player to index
    _fluid_player_t::channel_isplaying outside its fixed-size heap
    allocation while tracking active channels. The resulting out-of-bounds
    reads and writes invoke undefined behavior and may compromise
    confidentiality, integrity, or availability. No crafted MIDI file is
    required because the unsafe condition is created by the channel-count
    configuration itself. Keeping synth.midi-channels at its default value
    of 16 avoids the vulnerable path. This issue is fixed in version
    2.5.6.
    https://www.cve.org/CVERecord?id=CVE-2026-61714

This vulnerability has been fixed on the master branch by the following
package bump [1].

[1] 566bdcb97f package/fluidsynth: security bump to version 2.5.7

(alternative to commit 566bdcb97f5706aa08f40a88e4728e4a0bed8257)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/fluidsynth/0003-CVE-2026-61714.patch | 48 ++++++++++++++++++++++++++++
 package/fluidsynth/fluidsynth.mk             |  3 ++
 2 files changed, 51 insertions(+)

diff --git a/package/fluidsynth/0003-CVE-2026-61714.patch b/package/fluidsynth/0003-CVE-2026-61714.patch
new file mode 100644
index 0000000000..5fa7a5ad1e
--- /dev/null
+++ b/package/fluidsynth/0003-CVE-2026-61714.patch
@@ -0,0 +1,48 @@
+From 772702e00cc6acc7c607efb40283e2269211effc Mon Sep 17 00:00:00 2001
+From: derselbst <tom.mbrt@googlemail.com>
+Date: Sat, 27 Jun 2026 08:51:10 +0200
+Subject: [PATCH] Fix heap buffer overflow in MIDI player GHSA-976m-35rw-h3m6
+
+CVE: CVE-2026-61714
+Upstream: https://github.com/FluidSynth/fluidsynth/commit/772702e00cc6acc7c607efb40283e2269211effc
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/midi/fluid_midi.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/midi/fluid_midi.c b/src/midi/fluid_midi.c
+index 6a501b277..39c06c910 100644
+--- a/src/midi/fluid_midi.c
++++ b/src/midi/fluid_midi.c
+@@ -1617,10 +1617,11 @@ fluid_track_send_events(fluid_track_t *track,
+         {
+             if(player->playback_callback)
+             {
++                int *chan_is_playing = &player->channel_isplaying[event->channel % MAX_NUMBER_OF_CHANNELS];
+                 player->playback_callback(player->playback_userdata, event);
+-                if(event->type == NOTE_ON && event->param2 != 0 && !player->channel_isplaying[event->channel])
++                if(event->type == NOTE_ON && event->param2 != 0 && !*chan_is_playing)
+                 {
+-                    player->channel_isplaying[event->channel] = TRUE;
++                    *chan_is_playing = TRUE;
+                 }
+             }
+         }
+@@ -2138,7 +2139,7 @@ fluid_player_callback(void *data, unsigned int msec)
+     {
+         if(fluid_atomic_int_get(&player->stopping))
+         {
+-            for(i = 0; i < synth->midi_channels; i++)
++            for(i = 0; i < MAX_NUMBER_OF_CHANNELS; i++)
+             {
+                 if(player->channel_isplaying[i])
+                 {
+@@ -2186,7 +2187,7 @@ fluid_player_callback(void *data, unsigned int msec)
+         seek_ticks = fluid_atomic_int_get(&player->seek_ticks);
+         if(seek_ticks >= 0)
+         {
+-            for(i = 0; i < synth->midi_channels; i++)
++            for(i = 0; i < MAX_NUMBER_OF_CHANNELS; i++)
+             {
+                 if(player->channel_isplaying[i])
+                 {
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 747aa5c1eb..22c4e96563 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -18,6 +18,9 @@ FLUIDSYNTH_IGNORE_CVES += CVE-2025-56225
 # 0002-CVE-2026-58264.patch
 FLUIDSYNTH_IGNORE_CVES += CVE-2026-58264
 
+#0003-CVE-2026-61714.patch
+FLUIDSYNTH_IGNORE_CVES += CVE-2026-61714
+
 ifeq ($(BR2_PACKAGE_FLUIDSYNTH_ALSA_LIB),y)
 FLUIDSYNTH_CONF_OPTS += -Denable-alsa=1
 FLUIDSYNTH_DEPENDENCIES += alsa-lib

--===============5597850248473938124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5597850248473938124==--
