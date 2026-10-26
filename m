Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D6B606A31B
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M+geFXiq
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B31280D92;
	Mon, 26 Oct 2026 14:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aVn1cnsmrer; Mon, 26 Oct 2026 14:29:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8A98580DC2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793024989;
	b=hRc9EMjPH82yUzbkwyBo8TFw3xoOLaMrPjpbO+Q4yfZgETy20KO0XlWHsA7ww5vmBZWj
	 MmFeeGGBz9TH94EWUHMrjWfDMtz9gfDVsiuvNltbXkDOfTPJMq+v0GHwQk3QQjSyOYBC8
	 O9trox9q458gTiUebPx5RBUvybyBABKtCjZxzw6DsWJEdh4AsoPvcbvhYWpQw1qHrvCDL
	 d69roKqG8ojIHyD3HUlJZ+uZFev6zdGDbhCIBjGkWxFMDuWDMWA6Jgy0KRDfvmAB7mVDW
	 DH+LUTcfRUmNUVk9MfXrN9hK9282dQqQ+eUXxB476ow1bG4z+zEITSXEUdnA+eNnFtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793024989;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/PhdccLGz8be+sgwseV9Bl70yrHXTiv/pMl7PdtksIw=;
	b=HMdFoV5qTLfdlPcK0GTUIhiWU1YwuCSrOzQr+gIrRoD2+jQbPN7/n0ZIkbJkfk5W98DH
	 cfiMHqPB2mVeWTcNCzn/vJG6+vZgPvZHSCrIMMZTl4+G6i09q073070P7ISW7EuM5yMpE
	 Wfj+SzN9Dly/b3CcS4K2ikNThVFJTHxvAOurEv1/LgcC+q8Jba6/rAsKYJ9+93fVNKuCH
	 m2TcWB6k394c7TMPxsXNEa6pKJZ6pC2caF10x8a3y2k68IimwEHC2kfae7AaAUtImZLGq
	 asbOC7HuyZBq0EKNOQq11VTFMDaTJx1733AwOgDXAWC4JDCr/G5uOEcBK+6irirqg7g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793024989;
	bh=/PhdccLGz8be+sgwseV9Bl70yrHXTiv/pMl7PdtksIw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=M+geFXiqxuM37C4XfUxU2KkjZTW4zd9b/qJWdfFODRrWiA5QFljFcMHkz+EOMsoBN
	 IMp3p0F1tBvi4qiPFSL8lDY0+tAF3uQrzticasUZ7Y5HXPFsTWJIl7QaWnR6uVGtnp
	 V8OjS8WhWIDUKTaG67C9PlhwFiwTcyoWRFS7xRHpvDrz3UKyDZ+5KdZ9EAEXICvDwb
	 jxrzOETwdRG+8ry+VwYDOSool5/nGQhL4gzteDxy0y89nU2ptLV/tKuiraxTB1aFeE
	 S7ueqk5yOpQ/uiS7ch5BnQF5Qg7reFvyTZM6OHFTdQRKbQMcgP3oGM4bJiQZcpmeGF
	 r/LYyVr41BTtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A98580DC2;
	Mon, 26 Oct 2026 14:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C85513D9
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAA234066A
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxQwK71cb8qd for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 14:29:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 50F6840641
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793024985;
 b=ZIMQDNFgfD1xyVrq+2MyBm4pHq+BZMtTGoPlmZtnxEBcZa1U1VdsGVn7RaWdk7IGHSLW
 1t05JzykOsdUv79nRrsVjNn5GjtS82923bfS4gQG4PqDCSQjmzFLI+qjz+oc/d1Wzj5RT
 tUo3aW5vrtYY2QxHKY58zP+H1PvODiNyFjlTOCD6lSnaNt3mOud+/+uBG9NO9kVPdC033
 G2HJLikm5YEGzB0TJtfaaLcdVYG/JorxpRspz01GxadcRRbQJ5z0kxm9SqAbEKP3Hj/6b
 wNcj7Dc08lOLs1EE6+AL6UVJ2acqqiKmJpexmndb3siKjCyv08TPA9mO8J7TqEcDHBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793024985;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Y1yW8GvvQHtZ0gDNa7Jqnid6DNTDYK1JRdnqPySkOAo=;
 b=Za1wk9gu53M79BiVdQryhOhK0xu8yGQTBPc2nGggXZMM8WDzp8ALtg/RtGs8ATwfdXEG
 orcjlt5FIzclL1KiQBDGMA8FkNADL/O+izj5FemVIe0D3KOYJ7XScoQXzptzeDQK6X8ti
 cBphpJh3Xhgm09ZwBGYT0tHyib2yYyV3+u6sFKzX28+3kgwlOemlaH6BkIWW05dJpVUmT
 VxdqRPIK+ou132vRCpFdmMifFLgkr92zPdPJu5WgKEB56mytLBan1s/ZZ3chVo12WXPPb
 LKywjFdFEs56WFxxw5ZtwdTFEu9skDCG9/rpzWkpIUXLv5JqOzYQF+yLW/GHO2OswCQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KtNLg8tU; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50F6840641
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:29:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so19969465e9.2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 07:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793024982; x=1793629782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y1yW8GvvQHtZ0gDNa7Jqnid6DNTDYK1JRdnqPySkOAo=;
 b=Gs59pkx2wV24FQ3zlO04HtpiYEhz2FxWbRLVFi3eWXQa2m/oPUfLz1mahs9KosUV4F
 2GhgqO2G9I/eqgHQfskgmWebeITiuN0EqcNNayK3o52DDKMc9BhPnIjDAXfZnay4Ax7f
 0ONQORAg8+dl6MFOfCCg0T+HhB2sVIs/jA8IEoBsVWJlvQf98shggwdESHktIK0AqGHm
 Ei7qpM7RD2i9evmuCmWpUn+JL621PuXTKjh1R1FKTneTNPkx3pH40gOWgM6PhiI+6cjC
 pZd304CAfFsZnMamgFW4oyh5O8vNgDD5+G88BTe2MM85Gmcs+rPNbd1Wd+jec66iUspQ
 BT9w==
X-Gm-Message-State: AFq9FYLkyToYiQVNXVqPMEaKAXX2X3fP7euYgfkDc6d8KHoSKgr9iZ5K
 HEn8l4eb98K6fvG4xb3zfXxRmgWsOieKtV1f/ZA3JQHKzMMlOctBnzesemA3jdmx+g8Z7J3c9//
 ChRzM
X-Gm-Gg: AYBFou0KzhRk4wtdz/B4mE6DPadDDI6HEuK/UivR0rTbJzemQsCUjJhbtBNhGM3Hzgd
 dv3csDmEaUWnJ7jpe0I76CSfhHUXXlVPCLArseDUqBa+wFdmq4isYlB1kRhVKtR1ofdCn+3fSKP
 sEu4pbFzrLWmFY9Cv1Fx/Vuo+w+gmuJkW0ZJSm9t7HhTJ0ClRKLDLpH2NkIcYtXQ9d4lkP8RV0y
 knFGJ/mATN+Tk/goOgPvW0CfkSJDaQCMWDE8TyWfhD7hwUbVJytYocuLSdiyuRtwBfuDbX8ehVt
 fCSj65guK7sOyAY31S/X9aY9jSOhuf1qFL7BvF3zzmz5hSBiR02mTfLOHhLLiP/UwqWlAXpGfER
 DuYk+VIRPf9vwWJuaHzxpL0KNS8uo/DtJ6pHDO6kWAVugzl9cSUxv7AKgw5W7Fw0Xs4anR5i7Xg
 6fWw6st0hwlXOyL1g57l+AOOh900HXm6dX4u1iAlGbs1GCGIe6VDD91BB4KNUheoneF/HXtP5v4
 D/J122xerya9zQYPBnaAKhtnOBP3ww/OQ0aHur/UiL2JXty
X-Received: by 2002:a05:600c:b86:b0:4a3:5a7b:6002 with SMTP id
 5b1f17b1804b1-4a35acab6damr128125335e9.28.1793024982312; 
 Mon, 26 Oct 2026 07:29:42 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb9cesm17523814f8f.27.2026.10.26.07.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 07:29:41 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 26 Oct 2026 15:29:40 +0100
Message-ID: <20261026142941.605505-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/2] package/fluidsynth: upstream
 patch for CVE-2026-58264
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

- CVE-2026-58264:
    FluidSynth is a software synthesizer based on the SoundFont 2
    specifications. From 1.1.2 until 2.5.6, the FluidSynth command handler
    accepts a pitch_bend_range command whose channel argument is not
    bounds checked before the supplied value is written through the
    selected synth channel. An out-of-range channel can therefore cause an
    out-of-bounds heap write, leading to denial of service or possible
    code execution. The issue is remotely reachable when the TCP server is
    enabled through new_fluid_server() or fluidsynth -s, and it is locally
    reachable through malicious commands delivered to the FluidSynth shell
    on standard input. Applications that do not use the shell, command
    handler, or TCP server are not affected. This issue is fixed in
    version 2.5.6.
    https://www.cve.org/CVERecord?id=CVE-2026-58264

This vulnerability has been fixed on the master branch by the following
package bump [1].

[1] 566bdcb97f package/fluidsynth: security bump to version 2.5.7

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/fluidsynth/0002-CVE-2026-58264.patch | 26 ++++++++++++++++++++
 package/fluidsynth/fluidsynth.mk             |  3 +++
 2 files changed, 29 insertions(+)
 create mode 100644 package/fluidsynth/0002-CVE-2026-58264.patch

diff --git a/package/fluidsynth/0002-CVE-2026-58264.patch b/package/fluidsynth/0002-CVE-2026-58264.patch
new file mode 100644
index 0000000000..753ca02e36
--- /dev/null
+++ b/package/fluidsynth/0002-CVE-2026-58264.patch
@@ -0,0 +1,26 @@
+From 762a3bd39a431cd45abf3bbcce7286c87909d087 Mon Sep 17 00:00:00 2001
+From: derselbst <tom.mbrt@googlemail.com>
+Date: Fri, 19 Jun 2026 20:11:54 +0200
+Subject: [PATCH] Fix a heap-based buffer overrun in pitch_bend_range command
+
+Upstream: https://github.com/FluidSynth/fluidsynth/commit/762a3bd39a431cd45abf3bbcce7286c87909d087
+CVE: CVE-2026-58264
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/bindings/fluid_cmd.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/bindings/fluid_cmd.c b/src/bindings/fluid_cmd.c
+index 19cb78216..76723a2ba 100644
+--- a/src/bindings/fluid_cmd.c
++++ b/src/bindings/fluid_cmd.c
+@@ -795,8 +795,7 @@ fluid_handle_pitch_bend_range(void *data, int ac, char **av, fluid_ostream_t out
+ 
+     channum = atoi(av[0]);
+     value = atoi(av[1]);
+-    fluid_channel_set_pitch_wheel_sensitivity(handler->synth->channel[channum], value);
+-    return FLUID_OK;
++    return fluid_synth_pitch_wheel_sens(handler->synth, channum, value);
+ }
+ 
+ int
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index bde3f416a7..747aa5c1eb 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -15,6 +15,9 @@ FLUIDSYNTH_DEPENDENCIES = libglib2
 # 0001-Fix-a-nullpointer-dereference-during-legato-mode.patch
 FLUIDSYNTH_IGNORE_CVES += CVE-2025-56225
 
+# 0002-CVE-2026-58264.patch
+FLUIDSYNTH_IGNORE_CVES += CVE-2026-58264
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
