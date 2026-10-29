Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1B6606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RTXxg5Zx
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C964E60A71;
	Thu, 29 Oct 2026 20:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buoahXfkreoM; Thu, 29 Oct 2026 20:23:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B6A3F60A8B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305413;
	b=seX4Cfzhs545vOgMNrSs1Bm4o3MQ+8CIb47+yuOBBaOYp4SU/2b1JGufe3zM7QPFXpeL
	 FgVrrz42vYVvDcWmRxY4EoObQr/v8ISkcq7AARXBznc517n3ydhEG9PEGkawVP4+6Pw5Q
	 en0toJoH8YSB3mPb2sKcazxHv2jkPy+VLpq/YIYIokxvf6Rg1uN5Pjtq6OqtxUp8ynns7
	 JfHTX5L2U3HpcSpSkBdcxFrlC0eu5LKbhwx2pi7exTNkRnaAe2J0t33snmZRqvMh3Y+NR
	 jcEkHjuarX2c+CjJdSVwuhS78QMkgF8Fzuq2Nckxp0UPKpowWxonIM4zSoHVdnbePcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305413;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H6vIU7rOEVsfnJmgtevZhmypT4UixuBFRZpdUElslhg=;
	b=efG4+mCWIdZBvMST+m1f99uOChFniMhzZ1nXqoDR3ZYLpTVY6sYXG8XmxtQY47zgYUdE
	 IDT7pDQwW6noLfIZJuvct/OJDKsx/P4XLb9vxBeHPBbtEp7AD5eAvUMWnXfah/++UAncE
	 z2Js5ZeHmeYbOxG/uJUTPmgMQL15TssUYSmZPtZPrcuQuUYPsagDIU41zpkhuEf8Dzwrx
	 rRre4Xx2lpl8tS2DCq52X1CckEs6iWzo4ZdS8Ts9sg6rnTXfUJ4omC7W9WzAVCIE0CUqj
	 5RwVsft4bLmNaNaRSQ4+MX3XccWUNuYKH0QuwOTfbUADFh+MVrBaTXB2rqJ52s0P3Uw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305413;
	bh=H6vIU7rOEVsfnJmgtevZhmypT4UixuBFRZpdUElslhg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RTXxg5ZxIY8Gxq5kS3p/YG4uyVEhXg5DyaCqySRDxi+ppVo4+iDo70cXnJ3z5vHr+
	 P/NINd4hcWgVgbnKvp+jxL9Qx6jSeUCURnQO2sHZ70fu1btzudyAt3j+qVLN4RXfmH
	 kHEm0htWCdRecj9SyNq37dz0Dq9oBVTb5cY2+fIJBHdhxr6TonVNubbiEx6pwqPucJ
	 dn+68w1S66istrvewCvFNf2y0IhIGIHzxaAwN8Kag4U7yvoyTLlSxMOakrzAlAufgS
	 B7FyVXU3mdb+QGtLuHZ8PsvqLieUxhwLreyyyQeZ8tWGHsk5qX+wIz3Ii0H68u+ohy
	 20+ZnDZuUW5Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6A3F60A8B;
	Thu, 29 Oct 2026 20:23:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9E1E2E5
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A988C404F1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6HmFLZBlv9p for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8EBC3404F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305400;
 b=OrGfTWjzZno4TfFj+Di3aoAkW4DBHe8lsrAct82PyJTL2LD3zM8RhJ0L8ioP2iUONMnd
 8pZRPOk1lJ4iIO0QltX86/DjkYou9RlAYlOcM//dlkeHdVVk4Y68V25rbZWdv8LuW0FiB
 riuSV6Z8Uiiq4Zg+e3Inb9kxcTcMTQKCnZLzd4PzeiMjCD4Ipm5w75RFHcxRCFcF8Tjwe
 yQM2GzzfOG1T0J31uLVjx4paO4jKjw/L+Lt+b2C2tVU/7nYDSPLtYxSLFA/X0cDkwcfXX
 nzMrEwEQsJVXX550CEzFmZBIlSM6AMM1V/hckYamoVl8CTowQq6TJZOrj57LXKjWV7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305400;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yvtNz7oDdpYrg6uL9stgTXJWLnXY9Zh/k2/SN2R0Nyg=;
 b=FJg+g0HYGVOYqs57EBRylNC9Ygk4V3yZoTMbRe7asVZiKDRPlsYg3iydANLF8+dNsXi5
 dpKm3tna2TpQWR8WDZT7KeYqcarkhJN7UzU/6ePh+7RDWzqa0AQcwB38P+i/pikTpqelI
 +cyk6OYBCbI13Qtc0bJsZu+8N2eKDLKgrmlk026kcvQ1FT/0CU5VGO6C9WieyV9flUCmu
 d8zS6mBsPTkA5GvmEYmAnSErtfTuOqD4gNsj/g1qD+SMpOC/YASZQ2M6oADBX+ERAsJ3x
 v7DfSOKwnvLEVlGGKevyZhfaA+hwEMMGPqVboTO4wlLeDEp2CIIl/Yp8Mx3BLZd7gQg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EBC3404F3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 131749D2C9; Thu, 29 Oct 2026 20:21:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b1b56ec06386720963bb8529d21c701830570ee
X-Git-Newrev: 98cfc2d6ffaab58a868e324e17a5220f67a69126
X-Patchwork-Hint: ignore
Message-Id: <20261029202153.131749D2C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-ffmpegdirect:
 bump version to 22.2.10-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98cfc2d6ffaab58a868e324e17a5220f67a69126
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Update-to-7.1.patch                       | 106 ---------------------
 .../kodi-inputstream-ffmpegdirect.hash             |   2 +-
 .../kodi-inputstream-ffmpegdirect.mk               |   2 +-
 3 files changed, 2 insertions(+), 108 deletions(-)

diff --git a/package/kodi-inputstream-ffmpegdirect/0001-Update-to-7.1.patch b/package/kodi-inputstream-ffmpegdirect/0001-Update-to-7.1.patch
deleted file mode 100644
index a82b9a5ee8..0000000000
--- a/package/kodi-inputstream-ffmpegdirect/0001-Update-to-7.1.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From c7272c63151921bf4b63792cd2c9afc73fe5d666 Mon Sep 17 00:00:00 2001
-From: Stephan Sundermann <stephansundermann@gmail.com>
-Date: Thu, 11 Apr 2024 17:11:32 +0200
-Subject: [PATCH] Update to 7.1
-
-Upstream: https://github.com/xbmc/xbmc/commit/72fe098c8436c96763f677b4c65d32988b931b5b
-
-[Bernd: ported xbmc/cores/VideoPlayer/DVDDemuxers/DVDDemuxFFmpeg.cpp
- fix to kodi-inputstream-ffmpegdirect 21.3.8-Omega]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/stream/FFmpegStream.cpp | 71 ++-----------------------------------
- 1 file changed, 2 insertions(+), 69 deletions(-)
-
-diff --git a/src/stream/FFmpegStream.cpp b/src/stream/FFmpegStream.cpp
-index 8bf474f..649e43e 100644
---- a/src/stream/FFmpegStream.cpp
-+++ b/src/stream/FFmpegStream.cpp
-@@ -1012,74 +1012,7 @@ bool FFmpegStream::OpenWithCURL(const AVInputFormat* iformat)
-   if (iformat == nullptr)
-   {
-     // let ffmpeg decide which demuxer we have to open
--    bool trySPDIFonly = (m_curlInput->GetContent() == "audio/x-spdif-compressed");
--
--    if (!trySPDIFonly)
--      av_probe_input_buffer(m_ioContext, &iformat, strFile.c_str(), NULL, 0, 0);
--
--    // Use the more low-level code in case we have been built against an old
--    // FFmpeg without the above av_probe_input_buffer(), or in case we only
--    // want to probe for spdif (DTS or IEC 61937) compressed audio
--    // specifically, or in case the file is a wav which may contain DTS or
--    // IEC 61937 (e.g. ac3-in-wav) and we want to check for those formats.
--    if (trySPDIFonly || (iformat && strcmp(iformat->name, "wav") == 0))
--    {
--      AVProbeData pd;
--      int probeBufferSize = 32768;
--      std::unique_ptr<uint8_t[]> probe_buffer (new uint8_t[probeBufferSize + AVPROBE_PADDING_SIZE]);
--
--      // init probe data
--      pd.buf = probe_buffer.get();
--      pd.filename = strFile.c_str();
--
--      // read data using avformat's buffers
--      pd.buf_size = avio_read(m_ioContext, pd.buf, probeBufferSize);
--      if (pd.buf_size <= 0)
--      {
--        Log(LOGLEVEL_ERROR, "%s - error reading from input stream, %s", __FUNCTION__, CURL::GetRedacted(strFile).c_str());
--        return false;
--      }
--      memset(pd.buf + pd.buf_size, 0, AVPROBE_PADDING_SIZE);
--
--      // restore position again
--      avio_seek(m_ioContext , 0, SEEK_SET);
--
--      // the advancedsetting is for allowing the user to force outputting the
--      // 44.1 kHz DTS wav file as PCM, so that an A/V receiver can decode
--      // it (this is temporary until we handle 44.1 kHz passthrough properly)
--      if (trySPDIFonly || (iformat && strcmp(iformat->name, "wav") == 0)) // && !CServiceBroker::GetSettingsComponent()->GetAdvancedSettings()->m_VideoPlayerIgnoreDTSinWAV))
--      {
--        // check for spdif and dts
--        // This is used with wav files and audio CDs that may contain
--        // a DTS or AC3 track padded for S/PDIF playback. If neither of those
--        // is present, we assume it is PCM audio.
--        // AC3 is always wrapped in iec61937 (ffmpeg "spdif"), while DTS
--        // may be just padded.
--        const AVInputFormat* iformat2 = av_find_input_format("spdif");
--
--        if (iformat2 && iformat2->read_probe(&pd) > AVPROBE_SCORE_MAX / 4)
--        {
--          iformat = iformat2;
--        }
--        else
--        {
--          // not spdif or no spdif demuxer, try dts
--          iformat2 = av_find_input_format("dts");
--
--          if (iformat2 && iformat2->read_probe(&pd) > AVPROBE_SCORE_MAX / 4)
--          {
--            iformat = iformat2;
--          }
--          else if (trySPDIFonly)
--          {
--            // not dts either, return false in case we were explicitly
--            // requested to only check for S/PDIF padded compressed audio
--            Log(LOGLEVEL_DEBUG, "%s - not spdif or dts file, falling back", __FUNCTION__);
--            return false;
--          }
--        }
--      }
--    }
-+    av_probe_input_buffer(m_ioContext, &iformat, strFile.c_str(), NULL, 0, 0);
- 
-     if (!iformat)
-     {
-@@ -1535,7 +1468,7 @@ bool FFmpegStream::SeekTime(double time, bool backwards, double* startpts)
- 
-     if (ret >= 0)
-     {
--      if (m_pFormatContext->iformat->read_seek)
-+      if (!(m_pFormatContext->iformat->flags & AVFMT_NOTIMESTAMPS))
-         m_seekToKeyFrame = true;
- 
-         m_currentPts = STREAM_NOPTS_VALUE;
--- 
-2.47.3
-
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
index 8059858c4d..ed22d4a27a 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0648c6bbb2143cec0c3f48ad476f2c213f20c809caaf5ac74c8ceb4e53635f4e  kodi-inputstream-ffmpegdirect-21.3.8-Omega.tar.gz
+sha256  f72d027b0aafe9e7734ca83e88e83dd038ea4c9b912dc6c53dfadbcfdb069468  kodi-inputstream-ffmpegdirect-22.2.10-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index 9fb9c95e13..9b050512ce 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 21.3.8-Omega
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 22.2.10-Piers
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
