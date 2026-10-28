Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4240606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VIMcdZli;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=BnFZ1unI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E1580F6E;
	Wed, 28 Oct 2026 22:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysA_5j9gY_ny; Wed, 28 Oct 2026 22:29:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A2BBF80F90
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226587;
	b=e5cXNm1knEk3jhqmLvydKR1gKK9Gsc/GxorNEiLqTJ59YUpBI3g8Vgu/BWK5SgMh3vB7
	 IlMVkHHqAdxo6D21wLqD76L/ysitfbAB9vd4trBHdrilXQ5+f64ME1MrrT3eJ+eEd8CN1
	 AECJ7J9FVnhbxjbKXAy4k6OYEiSpD4m+1fsgBVLq8goEb7NnqNRfHLyj1TZDPCLp69i6r
	 G+kO4i4DgPg3Ehp79Iuovt4iKobnAWizRW1XHXXqaXUtALgvjpzaFCZhw68QfRq6fgcKW
	 X7gAMHjFO3G8Bz85IDDtSv+BBUILRIH92Dw2jgLq1Nnxv4hJapPjP4xhJsqCwrPc2zQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=U4excMcfuzbxbpQMUT/kL+Ly6pX43OX19rjucx+KmpM=;
	b=XIxlaV30vDKq+2I1Ol7FuetjJ6Z+K/HqZV5ZwqKveTSIl/uHVvYPjozUKLVrfzYlb2M8
	 pvP2yB09OI1ExHqjHRmnT2iNhTowZPT+Dqt6xZHZ7HO2vJkEDska4YYCe6FYmedG4NEZ4
	 0jZrD7xUx+TwrkNxx8gihPC6xbF4+rQMSdgYYIucIUOU2TqXnMGF4uQF8oJw/Yp3gCk8z
	 /sFWlSldkd1uaQFf9cJDEJB96zca17a/N50z7DUPFPaoCJoXUlLv3HtDA716UFSKZMgkr
	 qDqwIMNhPEd45rDWE1mh2+ARIpnFlL3vEksh4DD0xe6TtNcGNCzcrvSi/BCArA+/1BQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226587;
	bh=U4excMcfuzbxbpQMUT/kL+Ly6pX43OX19rjucx+KmpM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VIMcdZli0A/KhD4D2470SgiepkZDFAY2vkzthNEYbH+NNRPbqX/ZzPYE+SvO5GDjr
	 DhEFBolFBTZOmc0LHhuuy7biJxWzW17RETa9BeT6+vM3s7L3arllD8P6A6lPKeI6Yy
	 FLlU9/jY34FA+Zqo09fXr97UVMYG1QvFaWvNnJxTAbS3aMOdvKFT0rmA9977o4ePoM
	 6xp/42vUVBO9lceKXgM4kdw5ndKmHdRQHaNMsAXEpCEa2mnJ59Nn0W5SYdL37mi7UY
	 PqpY550oSzBgpzlNg7XT9PisbZ0upsO/mAwcNTYlVQYgJo4y5a0zXfOv0Et6QAHtvk
	 zvx/KeRT48NAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2BBF80F90;
	Wed, 28 Oct 2026 22:29:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E3CA3AF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4026C606E7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40NPoG3FgCN4 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:29:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3292260613
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226585;
 b=obJlOBHp++kKMJvoGmfbVTy2uUayv2zgTQTGUCedGfpSKk73YiK8DK1O92SXP5sGLOnm
 kpOmznPQohQUu8fmm4tMLlZHHxyraWcfOZNGNuV9K5mdeNZ4PKT0xvs0RfTM/YWvMYMVp
 YAX3fIQ40Q8KPa4d+RzqsiOpcSA+dD8/ch6tltcM+ld3cb4Sl21Mq799vLfqlmUwmiT1x
 OthwqADFGpwXsSXBsk3efmMJ+75Yw1g5eFPVork4GqexUisNzOEbJTiSGD7XKdBfiwj10
 EXySO0xSirfvemqvxWLcrxjMgPjoNxGK4SXlOcagNAYcU7NASb7hzEuGcvWsXlpc/tQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226585;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TnLdcoLCpsDlTxhc5d9YE+KgCprm10qE1/6Q3Gf9ngA=;
 b=Itx3xpc22CuuU0LQjgV6lBW5+8EzsS1Va3IezeXroBo/qkcUBabUpPi0JxKAlVGM03iP
 RWMZX4/3d14dP7NFDpUHAPoeuWHKt+9Dd7Ccqfarh0bjCwlkPjgvpCOvtm9GYFSIw+BpI
 X3h+jxjvxxX5+xHGgNt3UEAYrVwq93c9l46wbd1wtgG0VogUwFA5kFTQBSNZQ54qOu5Kc
 VtkBeYWemP2AgBhxosR2JGNeQB2fWd1Ax68nDl7DrWLLfOyfISIpT96u6ZJA19tKUkyS5
 tYSwi+T3zwleX25Caj3dR1pcf9DQhUAEJiOhzXPqs4V57I2jFYTmtcyiS1ZLTD0hCrA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BnFZ1unI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BnFZ1unI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3292260613
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226542;
 bh=TnLdcoLCpsDlTxhc5d9YE+KgCprm10qE1/6Q3Gf9ngA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=BnFZ1unITp6YPaTrM+f9uQ0cOpCHY23rgwf697VH9gYGOSesmkNvTASQkJdCtNiCW
 IUW3P3lkS5jOzUcNZ3Z+PmX+tbxx1vkTNL2pYaol75qEKqCoDp2BK6qhL13rZO+KxS
 crDMGgqL1FJcyAyaRDEOCSjuRTy7o1YvP7GAzECHtwB+9La55M3DiQq/td4kvf3IsV
 s/SJct8ZHfzDkaO1OR/t0KgAhY6dSCGZ2EJes4S3jJmAqDgCO7WohdHihzD3BxPGyy
 SqNOY4ZjDbRjy8brzaBiVYdTw+7IGx15UlRxHSs7n5vlyiiZJ/PDDYbxV8Ss/tJCEo
 0XLO0tubz83lw==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 2myXQ0in9Q8Qrj3/YJ9Keg34qsTpSgi9RrrKVnON0fX1rrxtwk+U1duOUl4mUzDravK7X4ZIYXa
 ipkJ6pv0LOemyC7jh6N3cQ4TOBHl3cJTe4HPf8lKaw20qTTntp4Fny9IKwedZfzoDeLfeuHgd1j
 wB2vaDpkFJz5Bkz6ERRgfkVR5h3NwD71/mfhN1X5in4Gu/0MdAM0z1G66myMYl7YHv2wnkdTGZt
 IC31Y/PfahPOZm+n43dUlasAjjY9p7rMeoA/nBP0e7bAT5GxINsu31Xo6JfmhhksVj5WJbCI6wH
 c9zmvmo9NHPsoXiZZoH88NiJPWN3GDTWA7MFMzrrwEg/cYDP6F1vF2E/WQHRcFuSmjOP+VSxy2A
 Rs24UQyv7DlljI0OrpNWDBgHyCUwj6St6BNhtYLcFkG73mDWZ1YtFhknfjDMKxU6ah4lmwdJFFC
 RRTmqFV9UVaKbhBYqZK+jU7gI3BiK9x7/tHlmbLwdLDwbNp5Fomx8syipb5cOb5jRJEX60mvOw3
 LLCbYzIxTM7/Lpu7kq3JrfqI90prwbv9tUaddzNCnFnUYxXEwO/dvnjp3ebGUv0TOJybMqszBPQ
 Z50M
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33722A4C6FCB
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC88-000000001Tt-34CO
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:07 +0100
Message-ID: <20261028222822.490779-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 06/20] package/kodi-inputstream-ffmpegdirect:
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Update-to-7.1.patch                  | 106 ------------------
 .../kodi-inputstream-ffmpegdirect.hash        |   2 +-
 .../kodi-inputstream-ffmpegdirect.mk          |   2 +-
 3 files changed, 2 insertions(+), 108 deletions(-)
 delete mode 100644 package/kodi-inputstream-ffmpegdirect/0001-Update-to-7.1.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
