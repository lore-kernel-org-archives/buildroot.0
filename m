Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693DBCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41B4140595;
	Sun, 11 Oct 2026 13:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crfQxmgWagTE; Sun, 11 Oct 2026 13:08:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DD4E8405B3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724131;
	b=Lx7nwv0c6IyjNun+XgFihqTAVLdPcJW9vMxswyyoZDVfiWjttQt18v1ZRlk9oxyiclYz
	 XB2BA5Dk0Rq7JrjRDoDRxSOYcvCJ3LE/Es9MD/qaVjqZBQ9qhm04vRNhzxKIVMTztoZ+x
	 zU2ukq2VHmanIQCe0VGcP3ikUN3XDV3ETz/GaWQmKv68ftWIXFnrx3LieC48w9sTOQyBp
	 3JiWaaP7lI64bzqPlGZVeqk63gOAWAZ6h9C8x7rmW8ppiYh/ap4TkcEYchx2CUlRk5+jC
	 64Hz/GkmQLS3GFqOZ7qXwQ2+LbbRxKS9R8Ia1JGvdPRYCtuMfmYqYk1zv2XwyJ+N4KA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724131;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=U4excMcfuzbxbpQMUT/kL+Ly6pX43OX19rjucx+KmpM=;
	b=gGiFMNjOUWDOCa0Mqv4WHhitRy21/zqAF9oYZNUBowDQkQe9m1Ry05zM8LAX7N9HlcGJ
	 99OailTIbn2rlkG0n31/La/sDjrj/Ebwlnl3yijo/hQJGk5AfzYtpTFPq6LPak8vmZP8X
	 EM2z8tdzUBUIacWq8fLe7B5ZiFMRSqSjzkujZCV9/KSL2dD6Idh+D491fnczOipjQeznY
	 h3QcDRWlVDYkmq3GZ6DcARaVvJO7/k9zcungQLDU3/rEBzUFPN3INmrPJBuUQbVIFiO3Q
	 CyBVSqlnZT2aaNynB1ukBBDDRLmkKphTqGDacm5v9SRFFg7FpLJssFOD2jdkHrT8W8w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724131;
	bh=U4excMcfuzbxbpQMUT/kL+Ly6pX43OX19rjucx+KmpM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pT9baQ2IEm+ox2cjbDbOtpUGRjqYKLhVyLIUFOpeLTLHpR6X7fgd469GqGMVJWzbD
	 Rzl34rPXFFGT3Ux69srJlmL/mTo/qgRUsUGAki1cnkemJpAc6wWE1FacN5I1JTdUFC
	 Z7FSqiyCHQP13Nl9q9+7/YOhDazYQ61v5/+7abIx5l2GSIK2NCzyUrRMDKlQeGcmfv
	 bAxiLOQWfqUbLlIViqTPKkmGAZh8331GnMV6MgAxFWexQO+p575tN7T2d6289XpyRr
	 ZSj5SLLFinVTmuhBo0t7Z2r/qkhuw/I9QmbGPQ4ZxE5pZE9F+aP9FihpfIY/DMK9Os
	 /YHkF2z1T/ihw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD4E8405B3;
	Sun, 11 Oct 2026 13:08:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40690194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3207060622
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGScMASdvAsD for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:08:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D83EB605F1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724129;
 b=mumMmZ2eIW0fmFHX3T0nD7HK6oYMRdGBy2pTtGhiuAkbZuJoVXzS2Z1qU16kEE1+61KC
 bFaBSNzEzPlsf1LVdepjx9n8CjbESEre98sJJYWUgo7WwRHB5I0bJMhuFnNOIFB0AgJQq
 DGPOc66kNiimqohG+6CzOZkL/0a3Nah/tWYzrQ1IasiK8eW1THWR9PB+PGLuvwBX9tQzh
 B/p2XSPQFpo0DrImhoEZbyyJngXxZOSD0H9MOvT0F2VbyZDpX/oP1ugdCUgNGrdbk2BWY
 wgU1S/20cVysQElZmpkHP+tgEb+bKOX/EXkmHyB4pcrA43vZRWvKD0hAdKtajaF0fOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724129;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TnLdcoLCpsDlTxhc5d9YE+KgCprm10qE1/6Q3Gf9ngA=;
 b=E5VW8ru6AQYJ4YIr+VRniT733rMnr8ikEoRGec7b8wgVaklvHMWJ9ME9TtOTOH8MXgyG
 atryyAIhmv3EwvBGh8e53WwAdGoxhM09rdoevgvb5pB6tuZdI7OdwtIwvEU3h1jRFvalF
 Vjh/SvZ2xO4ykVmM9hWz8Z041AJs4JjSP+/hLWrRzhFTD2Tp4CoeLDwI20v5DBDHkjHLi
 S0pGwqXt7khkGRBnjHUKAVsqWRo9nxGd3x/viEYl7TbvVOPtNpf5Gf5Amdaket3ClAcUq
 2hgnB/8ZOhbKYFZtYcWp5LSY1zUC0AKR5OqsdGr6T04zROguVfUOEwhtFygg3nB9KIw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="hp0VNlr/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hp0VNlr/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D83EB605F1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723683;
 bh=TnLdcoLCpsDlTxhc5d9YE+KgCprm10qE1/6Q3Gf9ngA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=hp0VNlr/IURKRhMlf9YnqisCYSYZnffbOsCmE0KJee+3TjfzleRMHVnxjBlXkkfhD
 zvPROoyohQSXwTVYgdKxtnaSg90xJ9N+E7Bw/LYa/s+TDqSsI6A2UOS4LbjjITpQ/z
 LRzkss253k9QgwJLijPeWS0IbMiXxZLoabgfdW+FB015qHs5xgbKavlS3Oldf7cW4L
 2Gq/VPhXcFA+BNgEZWJJnFlZzkeUN3H72fTqF/5peA1l08opd+FsiiErUyM9uRM1nz
 PNzPKz5u7N3nlL5BtU+gqxeQ68Ao01qjmdE8MOkuq1kJ9N6BSB1EBd1HFAp9v97IxZ
 Up3LIVqywVZcg==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 DPHiaXX7awhkYqTJeZuU3Aeyrq9i7PAohjXsZN1248Jf79icgy1ECVaKXwYxHJlUrvxNPi7b9Ey
 h25Hk6t1T0MiVZ7M54mZHaOjDumcxInjlrox8boRHnYZVGeO+yTxpVQkEB/L1oKxHzs5LIDjqNQ
 Ua2yPof2ErNhOjBHaj0wl7UGnRtmGEAfNpt9N6RnHW1E8RD/mZ12kdzn5ID9ZUZhOpxfgvM4qvN
 lqRpfyA7gbuZE4mybsQxXW55cLqsfn0ET5CVrbr2c83HH+ydDcHup7jKw3CPBCf7teZkw5Yw4Q7
 yDgeiDPLVr7LofFVtjig9PIN4/nqLuTsT8rXWRX6+YnsW9ttHGh7wlXuwQrl21SJvWtnp29SYq4
 R1YYVFi2JRYNRtDt7noVvowAPLX3mGVY3Z5ps78vXox8J8VS7FQedxLVIgMHzwZvGCsM/PWqHnZ
 BcNl7SuTjRhWkzygsEsesYepAu2Kws1GjVIWBnb29J8cxPqDbE+U5FiH4M3YM2JSyDsCoi9iBXK
 HKfivYhtIgj/J1WlZnMTPzsexRKjIeeFoKOky+Z6xqwR15twTTqCjSytGVlOfkdfCjqtuC0CzoU
 845OAYE=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4369CA4C5837
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAn-000000007Fz-1BB5
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:42 +0200
Message-ID: <20261011130058.3443432-38-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 37/52] package/kodi-inputstream-ffmpegdirect:
 bump version to 22.2.10-Piers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
