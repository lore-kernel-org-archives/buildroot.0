Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A85606A324
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rfzM0E9V
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C3AB40641;
	Mon, 26 Oct 2026 14:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHlI1mZsT9zq; Mon, 26 Oct 2026 14:29:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1ACD640653
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793024988;
	b=mYygpzxIvB41WheIDka5XAxBuBazQMo5FHu8BJ7IP9jdMemTed4CB4uKIjxZpue2nSdd
	 l8ERz3zMPu0oTESfCNlODF3qRHE3tSW2XT16WlvJwdbfP/Ri+ysc85PcX1Si2R4zQhjJX
	 pXQspSCbP9XfAEBLyKPnKxHRQ9t+7javL/bP+YAhNuChXVfMIJHRzezGfPGRK51fr5+gQ
	 yCl5XUNLUMJo7Ay5k0rNKHn18ygxlAubBYNk6srfKBsCKUvxN6smg7/0ptFGnLGEgr/Pt
	 22BYhCW7y9HxOsnQ8nt7YOQgoOI/QP+u2n45crVeIAEXlHQA54/tnmA30UhmtZJvMpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793024988;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vDO1CQessKnO99JL3V8rlVDJTZ6H/9t5hJmoDT9kOfc=;
	b=kbcEGnas0pwizicauvNnDIL0g4JCaHzUv/h6prZ+3cP/jiTv8J4qzIvAH034WGNnrtS5
	 w564GfmnBlHmeUxv4zW4tT43Py821KnwfZLWNbyNEUI1LmHuqZwQWOFvhk55Cf4q0Ix0L
	 ORr2/Gs9qv346tzjKpWfOTZbyc818DmqpxMjKcwM3jtUltQ/wAfzTBXbD5Ef6a2ujH03F
	 kMQvyVQvVYZVVcOEi3SmLRB4FVp/WaeDRtX6UEQU+ZdO2/kSDI+mi6GMCFS+4UB1uNro1
	 oTYqXKRCn0llNY3+AD55MCyLdkn71KVLzG7Y7kTgPXjXDyt9N8/NIU8RlB6l/JvA2CQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793024988;
	bh=vDO1CQessKnO99JL3V8rlVDJTZ6H/9t5hJmoDT9kOfc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rfzM0E9Vkv8KdIRWd6+LVaZ0YPJgxAg4DdriwYFsnSc3lSEDnaEJrWAL5oSVt1Kza
	 JgNsgHIAtWp5YhmWo4xhoMqnSmAboaw6390pGRa+VREq5DMvwP1XHUhr/Yf34aFCc4
	 EiGBJgEuddVv41EAXSRRIqSSVS+M8li8hZaEWuyZ4f3MYfCI78bQH1/AskwwIyEdy4
	 53oPfWbMQKzy2a6iemIqDkgy+3gTOkc8S9RGk1qKnUYAhEo+EWZcV4atFKTmtcEL/B
	 sj/qdcEkmGGBPv46nsntCsJr70Yx3zAJ8a14/N4kPGuXbbkf01X3wOhTdTaIUL7CBV
	 jH6IAh1QrSepA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ACD640653;
	Mon, 26 Oct 2026 14:29:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B942D35F
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB342400F6
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmVdQd0F98DE for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 14:29:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8013940062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793024985;
 b=R/J4qVQaeCBjHJ4iCgCIwNs+J/m0tf7NjXx7Nrj8sJ05YZ7MfYXkOyuncr8Okb2SPZgu
 Hz9v0ePhR92FoDSB/GFFigh5m6bgiSeuhjUL0hMGr3rMEQdwLptj8VbfX7eMGxH9GcLVq
 0od8YTl/vwBM+THexXq79VyY+4KgzVwaXzEch1n95lVKIPmXZ5j5tMz42SCdPI9FpX2IA
 vtqGeoIprdBjS27J/++u/KHF3hV5pzYEjXgvqyrFADbtyqZktHrz998Ujmdx5T/0nelXS
 fTcpmD61t6ftkfHAlN69cR8mzQ+G11zVyl8IgH5jh1CvEQvITtln5vekLDNs26Zw6Hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793024985;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3Fro0XEqcP/vy5R1olV+hWkQK7mEMA43EQoGO6JP9c0=;
 b=sAeZzxYpXRDyPGeazW4SFKtcn21O2oz15yJ2FcbjHqsYuuCAN+tU02Ysb+tEeCU5BkJA
 FmD2ghYp8amHepwn3w7tWX0s6Pkpa3ZjdOsURPF8TEkxNYi0z8Xf6ylLvRMQivmEfSRyn
 s0Q8YqFUyQcZCbW61XrLNfGDYrq/ra5F9RsyMp3V7a+GxCh2UD8xpXbYzyQ+CIvM7mGVR
 alM9GAjM9eQCsBH5RDdXWY/Nl5JfLKhq3B7HDvDC9sFNzsQCc+Vhs0viVIbzRpAzmp9he
 a8Gg0Toeup4hh/kyxwx77oXMJ1gUNzyjdzATkB9LmLCkFqy4m+GdT99voqMTqPiXLUQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VdJEyB2z; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8013940062
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:29:44 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so1009954f8f.3
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 07:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793024983; x=1793629783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3Fro0XEqcP/vy5R1olV+hWkQK7mEMA43EQoGO6JP9c0=;
 b=LbEt0faTAX7bdmQV9EmYYzJkcqEinm29DILdDpVpDdeR2llBBuU1AiQ1tqrt/jZvhl
 CftoVfSWAPGjJXm+NJZS/fj2K/yzD8M+NS67ppdn0ABF9il9OyTmWbkL8ZGSf/NHiCh3
 SlP9y6+JcSdFueMvbnVY2IPjPcrbgmHLZUFquvD8GpPQVrsYeCYUESETHzPhObeAvfQs
 3kaxMVJztI/gMbzjy8nvyS65qCCWPHaF9g/Be9VtJMKa2BYP5hoRG00WIgcAWnjEARmS
 6gDFgMrivLJJJWdbqI7577uAwfVawwc9uvJWXzaxY5grVZXcR55rTBJ3ypDZG3PM7D+S
 GpJw==
X-Gm-Message-State: AFq9FYKtFBJNz7ZBU67JjEU9+XOsSDskzZnszTYFWD32uP5CW+8gY+iR
 3J6TcIPVFw+dMmak5ZOknRA9W17INxOXjiFYfl+xp0U5Ny3SQrHXtyoEq7cosHRjlqp45Pvu+Xk
 ggY8h
X-Gm-Gg: AYBFou3gL/LLj1jG2LPC4HUAVcySkj6MjyM8faUT3lXdq5nE2JLi1qdISYHOg0G5GUE
 YNdZ+4DoSP7zIhnVwtgx6C8NG0suOrP2Mnwm0XfD+QCYDqb9mlLN4MWoUfeyfS89TUtmd75zJqj
 oZJYpcKVYCJmr4hda79Se1Z01/0lBf7gw7ShvQThLD1qJkDm/VMdCQptsvBiIdJoUUEqb3q3KuD
 EcFyNAPQAAKzVJ9Pq9N8Lyj9c0zQAvfVwAf6aGohQeaSQmbmzC+MWzpnMHDJNBzq20OL2IjG2tK
 4B9P3eJ00agOOUAI4ek4vOB/u6mV9ekoAap1hQdpTL6mhu2BwYbM4BkuVb31vBRIaMCJel7wHbY
 Yx4bcs/h9QXl7PWobn93yBt3UvEf8wCigbjKm7U7U5nAL3yF57QMdH+wkcJcaxmLA++rtx7qV4t
 Jscc/aaLvyPXWxgNlfL+re2O/oFUXAuXvK99imHOd6d4Gxn6YJmxqo9p4yMZHnTNjSBzBXK/epw
 g080UkfE4zPtiktXUK7bq9FdfhGmjlEZSuPtiMP61hvzpR8
X-Received: by 2002:a05:6000:25f2:b0:48e:21d:7265 with SMTP id
 ffacd0b85a97d-48e3eb8d34cmr14380902f8f.34.1793024982806; 
 Mon, 26 Oct 2026 07:29:42 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb9cesm17523814f8f.27.2026.10.26.07.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 07:29:42 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 26 Oct 2026 15:29:41 +0100
Message-ID: <20261026142941.605505-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026142941.605505-1-thomas.perale@mind.be>
References: <20261026142941.605505-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 2/2] package/fluidsynth: upstream
 patch for CVE-2026-61714
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/fluidsynth/0003-CVE-2026-61714.patch | 48 ++++++++++++++++++++
 package/fluidsynth/fluidsynth.mk             |  3 ++
 2 files changed, 51 insertions(+)
 create mode 100644 package/fluidsynth/0003-CVE-2026-61714.patch

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
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
