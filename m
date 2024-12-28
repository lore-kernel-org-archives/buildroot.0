Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DDCE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 10:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76FE5607CE;
	Sat, 28 Dec 2024 10:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0yShowLqy9U; Sat, 28 Dec 2024 10:29:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E3B8607B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E3B8607B7;
	Sat, 28 Dec 2024 10:29:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EED2757
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45AF6607B7
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QjtmySzjwaY for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 10:29:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 419FC6066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419FC6066A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 419FC6066A
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:29:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D066A60004;
 Sat, 28 Dec 2024 10:29:31 +0000 (UTC)
Message-ID: <6ea06342-8af8-4af7-bf8c-41e4bcaf0f73@korsgaard.com>
Date: Sat, 28 Dec 2024 11:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
References: <20241215105537.1396270-1-bernd@kuhls.net>
 <20241215105537.1396270-2-bernd@kuhls.net>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241215105537.1396270-2-bernd@kuhls.net>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/5] package/webkitgtk: multimedia support
 needs gst1-plugins-bad
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/15/24 11:55, Bernd Kuhls wrote:
> Fixes build error
> 
> --   Package 'gstreamer-webrtc-1.0' not found
> -- Found GStreamer: GSTREAMER_INCLUDE_DIRS;GSTREAMER_LIBRARIES;GSTREAMER_VERSION;GSTREAMER_BASE_INCLUDE_DIRS;GSTREAMER_BASE_LIBRARIES;GSTREAMER_APP_INCLUDE_DIRS;GSTREAMER_APP_LIBRARIES;GSTREAMER_PBUTILS_INCLUDE_DIRS;GSTREAMER_PBUTILS_LIBRARIES;GSTREAMER_VIDEO_INCLUDE_DIRS;GSTREAMER_VIDEO_LIBRARIES;GSTREAMER_MPEGTS_INCLUDE_DIRS;GSTREAMER_MPEGTS_LIBRARIES;GSTREAMER_TAG_INCLUDE_DIRS;GSTREAMER_TAG_LIBRARIES;GSTREAMER_GL_INCLUDE_DIRS;GSTREAMER_GL_LIBRARIES;GSTREAMER_AUDIO_INCLUDE_DIRS;GSTREAMER_AUDIO_LIBRARIES;GSTREAMER_FFT_INCLUDE_DIRS;GSTREAMER_FFT_LIBRARIES;GSTREAMER_TRANSCODER_INCLUDE_DIRS;GSTREAMER_TRANSCODER_LIBRARIES (Required is at least version "1.18.4")
> CMake Error at Source/cmake/GStreamerChecks.cmake:62 (message):
>    GStreamerTranscoder >= 1.20 is needed for USE_GSTREAMER_TRANSCODER.
> Call Stack (most recent call first):
>    Source/cmake/OptionsGTK.cmake:478 (include)
>    Source/cmake/WebKitCommon.cmake:237 (include)
>    CMakeLists.txt:21 (include)
> 
> using this defconfig

Given the quoted text it sounds like we should select 
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC as well to have that plugin 
available at runtime?

Looking a our Config.in, I see we also select a bunch of "good" plugins, 
so maybe we should also add gst1-plugins-good to _DEPENDENCIES?

Anyway, this is no worse than before, so committed to 2024.02.x and 
2024.11.x - But it would be good if someone who knows anything about 
webkitgtk could take a closer look..

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
